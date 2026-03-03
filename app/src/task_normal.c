#include "task_normal.h"
#include "task_system_interface.h"
#include "task_sensor.h"
#include "task_actuator.h"
#include "app.h" // Aquí debe estar definida la estructura sistema_config

/********************** Datos Internos ***************************************/
static task_normal_st_t estado_escalera = ST_NORMAL_DESACTIVADO;
static system_event_t evento_actual = EV_SYS_NONE;
static uint16_t personas_actuales = 0;
static uint32_t timer_frenado = 0;

volatile uint32_t g_task_normal_tick_cnt = 0;

/********************** Interfaz de Eventos **********************************/


/********************** Implementación ***************************************/

void task_normal_init(void) {
    estado_escalera = ST_NORMAL_DESACTIVADO;
    personas_actuales = 0;
}

void task_normal_update(void) {
    bool b_time_update = false;

    // Sincronismo con SysTick
    __disable_irq();
    if (g_task_normal_tick_cnt > 0) {
        g_task_normal_tick_cnt--;
        b_time_update = true;
    }
    __enable_irq();

    if (b_time_update) {
        // 1. Procesar eventos globales (Prioridad alta: Desactivar)
        if (evento_actual == EV_DES_ON) {
            estado_escalera = ST_NORMAL_DESACTIVADO;
            personas_actuales = 0;
        }

        // 2. Máquina de Estados de la Escalera
        switch (estado_escalera) {

            case ST_NORMAL_DESACTIVADO:
                if (evento_actual == EV_ACT_DWN && sensor_desactivar_no_pedido()) {
                    estado_escalera = ST_NORMAL_IDLE;
                }
                break;

            case ST_NORMAL_IDLE:
                if (sensor_ingreso_detectado()) {
                    personas_actuales++;
                    estado_escalera = ST_NORMAL_VEL_MIN;
                }
                if(!sensor_barrera_libre())estado_escalera = ST_NORMAL_VEL_MIN;
                break;

            case ST_NORMAL_VEL_MIN:
                // Si entra alguien más
                if (evento_actual == EV_ING_DWN) {
                    personas_actuales++;
                }
                // Si sale alguien
                if (sensor_egreso_detectado() && personas_actuales > 0) {
                    personas_actuales--;
                }

                // Transiciones por carga
                if (personas_actuales >= sistema_config.umbral_personas) {
                    estado_escalera = ST_NORMAL_VEL_MAX;
                } else if (personas_actuales == 0) {
                    timer_frenado = sistema_config.tiempo_espera * 1000; // a ms
                    estado_escalera = ST_NORMAL_ESPERANDO;
                }
                break;

            case ST_NORMAL_VEL_MAX:
                if (sensor_ingreso_detectado()) personas_actuales++;
                if (sensor_egreso_detectado() && personas_actuales > 0) personas_actuales--;

                if (personas_actuales < sistema_config.umbral_personas) {
                    estado_escalera = ST_NORMAL_VEL_MIN;
                }
                break;

            case ST_NORMAL_ESPERANDO:
                if (sensor_ingreso_detectado()) {
                    personas_actuales++;
                    estado_escalera = ST_NORMAL_VEL_MIN;
                    break;
                }

                // Decrementar el timer de frenado
                if (timer_frenado > 0) {
                    timer_frenado--;
                } else {
                    // El tiempo terminó. ¿La barrera está libre?
                    if (sensor_barrera_libre()) {
                        estado_escalera = ST_NORMAL_IDLE;
                    } else {
                        // Si la barrera sigue ocupada, reseteamos el timer (seguridad)
                        timer_frenado = 1000;
                    }
                }
                break;
        }

        // 3. Limpiar evento consumido
        evento_actual = EV_SYS_NONE;
    }
}

void normal_set_event(system_event_t ev) {
    evento_actual = ev; // evento_actual es la variable static que ya tenés
}

// Getters para las otras tareas
task_normal_st_t task_normal_get_state(void) {
    return estado_escalera;
}

uint16_t task_normal_get_count(void) {
    return personas_actuales;
}
