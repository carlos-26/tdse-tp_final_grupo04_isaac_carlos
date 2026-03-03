#include "task_sensor.h"
#include "task_sensor_attribute.h"
#include "task_system_interface.h" // Acá definí los eventos globales
#include "task_normal.h"  // <--- PARA normal_set_event
#include "task_set_up.h"  // <--- PARA setup_set_event
#include <stdbool.h>

/********************** Macros ***********************************************/
#define DELAY_DEBOUNCE 20ul // 20ms de debouncing

/********************** Tablas de Configuración ******************************/
const task_sensor_cfg_t task_sensor_cfg_list[] = {
    {ID_BTN_INGRESO,   GPIOA, GPIO_PIN_1, GPIO_PIN_SET, DELAY_DEBOUNCE, EV_ING_UP,  EV_ING_DWN},
    {ID_BTN_EGRESO,    GPIOA, GPIO_PIN_4, GPIO_PIN_SET, DELAY_DEBOUNCE, EV_EGR_UP,  EV_EGR_DWN},
    {ID_BTN_ACTIVAR,   GPIOC, GPIO_PIN_0, GPIO_PIN_SET, DELAY_DEBOUNCE, EV_ACT_UP,  EV_ACT_DWN},
    {ID_SW_BARRERA,    GPIOC, GPIO_PIN_1, GPIO_PIN_SET, DELAY_DEBOUNCE, EV_BAR_FREE, EV_BAR_OCC},
    {ID_SW_DESACTIVAR, GPIOB, GPIO_PIN_0, GPIO_PIN_SET, DELAY_DEBOUNCE, EV_DES_OFF, EV_DES_ON},
    {ID_BTN_NEXT,      GPIOA, GPIO_PIN_8, GPIO_PIN_SET, DELAY_DEBOUNCE, EV_NXT_UP,  EV_NXT_DWN},
    {ID_BTN_ENTER_ESC, GPIOA, GPIO_PIN_9, GPIO_PIN_SET, DELAY_DEBOUNCE, EV_ENT_UP,  EV_ENT_DWN}
};

#define SENSOR_QTY (sizeof(task_sensor_cfg_list)/sizeof(task_sensor_cfg_t))//Cantidad de sensores

// Tabla de estados actuales en RAM
task_sensor_dta_t task_sensor_dta_list[SENSOR_QTY]; //Lista de estructuras task_sensor_dta_t

/********************** Variables Externas ***********************************/
volatile uint32_t g_task_sensor_tick_cnt = 0;

/********************** Implementación ***************************************/

void task_sensor_init(void) {
    for (uint32_t i = 0; i < SENSOR_QTY; i++) {
        task_sensor_dta_list[i].state = ST_BTN_XX_UP; //inicialmente todos en 0
        task_sensor_dta_list[i].tick = 0;
    }
}

void task_sensor_update(void) {
    bool b_time_update_required = false;

    // Protección de recurso compartido (tick counter)
    __disable_irq();
    if (g_task_sensor_tick_cnt > 0) {
        g_task_sensor_tick_cnt--;
        b_time_update_required = true;
    }
    __enable_irq();

    while (b_time_update_required) {
        for (uint32_t i = 0; i < SENSOR_QTY; i++) {
            const task_sensor_cfg_t *cfg = &task_sensor_cfg_list[i];
            task_sensor_dta_t *dta = &task_sensor_dta_list[i];

            // Leer nivel físico actual
            if (HAL_GPIO_ReadPin(cfg->gpio_port, cfg->pin) == cfg->pressed_level) {
                dta->event = EV_BTN_XX_DOWN;
            } else {
                dta->event = EV_BTN_XX_UP;
            }

            // Máquina de Estados de 4 pasos
            switch (dta->state) {
                case ST_BTN_XX_UP:
                    if (dta->event == EV_BTN_XX_DOWN) {
                        dta->tick = cfg->debounce_ticks;
                        dta->state = ST_BTN_XX_FALLING;
                    }
                    break;

                case ST_BTN_XX_FALLING:
                    if (dta->tick > 0) dta->tick--;
                    if (dta->tick == 0) {
                        if (dta->event == EV_BTN_XX_DOWN) {
                            task_system_put_event(cfg->signal_down); // DISPARA EVENTO
                            dta->state = ST_BTN_XX_DOWN;
                        } else {
                            dta->state = ST_BTN_XX_UP;
                        }
                    }
                    break;

                case ST_BTN_XX_DOWN:
                    if (dta->event == EV_BTN_XX_UP) {
                        dta->tick = cfg->debounce_ticks;
                        dta->state = ST_BTN_XX_RISING;
                    }
                    break;

                case ST_BTN_XX_RISING:
                    if (dta->tick > 0) dta->tick--;
                    if (dta->tick == 0) {
                        if (dta->event == EV_BTN_XX_UP) {
                            task_system_put_event(cfg->signal_up); // DISPARA EVENTO
                            dta->state = ST_BTN_XX_UP;
                        } else {
                            dta->state = ST_BTN_XX_DOWN;
                        }
                    }
                    break;
            }
        }

        // Ver si hay más ticks pendientes
        __disable_irq();
        if (g_task_sensor_tick_cnt > 0) {
            g_task_sensor_tick_cnt--;
            b_time_update_required = true;
        } else {
            b_time_update_required = false;
        }
        __enable_irq();
    }
}

bool sensor_ingreso_detectado(void) {
    static bool procesado = false;
    // Índice 0: ID_BTN_INGRESO
    if (task_sensor_dta_list[0].state == ST_BTN_XX_DOWN) {
        if (!procesado) {
            procesado = true;
            return true;
        }
    } else {
        procesado = false;
    }
    return false;
}

bool sensor_egreso_detectado(void) {
    static bool procesado = false;
    // Índice 1: ID_BTN_EGRESO
    if (task_sensor_dta_list[1].state == ST_BTN_XX_DOWN) {
        if (!procesado) {
            procesado = true;
            return true;
        }
    } else {
        procesado = false;
    }
    return false;
}

/**
 * Retorna true solo una vez cuando se detecta el botón ENTER presionado.
 * Índice 6: ID_BTN_ENTER_ESC
 */
bool sensor_enter_pressed(void) {
    static bool procesado = false;

    if (task_sensor_dta_list[6].state == ST_BTN_XX_DOWN) {
        if (!procesado) {
            procesado = true;
            return true; // Dispara el evento una sola vez
        }
    } else {
        procesado = false;
    }
    return false;
}

/********************** El Repartidor de Eventos ******************************/
/**
 * @brief Envía el evento detectado a todas las tareas interesadas.
 */
void task_system_put_event(system_event_t ev) {
    // Estas funciones deben estar declaradas en task_normal.h y task_set_up.h
    normal_set_event(ev); // Avisa a la lógica de la escalera
    setup_set_event(ev);  // Avisa a la lógica del menú
}

/********************** Getters de Estado (Informantes) ***********************/

/**
 * @brief Retorna true si el Dip Switch de la barrera IR está en UP (Libre).
 * Índice 3: ID_SW_BARRERA
 */
bool sensor_barrera_libre(void) {
    // Si el estado es UP, significa que no hay nadie obstruyendo
    return (task_sensor_dta_list[3].state == ST_BTN_XX_UP);
}

/**
 * @brief Retorna true si el Dip Switch de desactivar está en UP (No pedido).
 * Índice 4: ID_SW_DESACTIVAR
 */
bool sensor_desactivar_no_pedido(void) {
    return (task_sensor_dta_list[4].state == ST_BTN_XX_UP);
}

/**
 * Retorna true solo una vez cuando se detecta el botón NEXT presionado.
 * Índice 5: ID_BTN_NEXT
 */
bool sensor_next_pressed(void) {
    static bool procesado = false;

    if (task_sensor_dta_list[5].state == ST_BTN_XX_DOWN) {
        if (!procesado) {
            procesado = true;
            return true;
        }
    } else {
        procesado = false;
    }
    return false;
}
