/*Control de los LEDs (Motor), Baliza (Leds titilando) y Buzzer.
 *
 * */
#include "task_actuator.h"
#include "task_normal.h"
#include <stdbool.h>

/********************** Macros de Pines **************************************/
// Según lo que definimos en el .ioc
#define MOTOR_MAX_PORT    GPIOA
#define MOTOR_MAX_PIN     GPIO_PIN_6
#define MOTOR_MIN_PORT    GPIOA
#define MOTOR_MIN_PIN     GPIO_PIN_7

#define BEACON_ACT_PORT   GPIOB
#define BEACON_ACT_PIN    GPIO_PIN_4  // LED Titilando (Activo)
#define BEACON_DES_PORT   GPIOB
#define BEACON_DES_PIN    GPIO_PIN_5  // LED Fijo (Desactivado)

#define BUZZER_PORT       GPIOB
#define BUZZER_PIN        GPIO_PIN_6

/********************** Datos Internos ***************************************/
volatile uint32_t g_task_actuator_tick_cnt = 0;
static uint32_t timer_blink = 0;
static uint32_t timer_siren = 0;

void task_actuator_init(void) {
    // Apagar todo al inicio
    HAL_GPIO_WritePin(MOTOR_MAX_PORT, MOTOR_MAX_PIN, GPIO_PIN_RESET);
    HAL_GPIO_WritePin(MOTOR_MIN_PORT, MOTOR_MIN_PIN, GPIO_PIN_RESET);
    HAL_GPIO_WritePin(BEACON_ACT_PORT, BEACON_ACT_PIN, GPIO_PIN_RESET);
    HAL_GPIO_WritePin(BEACON_DES_PORT, BEACON_DES_PIN, GPIO_PIN_RESET);
    HAL_GPIO_WritePin(BUZZER_PORT, BUZZER_PIN, GPIO_PIN_RESET);
}

void task_actuator_update(void) {
    bool b_time_update = false;

    __disable_irq();
    if (g_task_actuator_tick_cnt > 0) {
        g_task_actuator_tick_cnt--;
        b_time_update = true;
    }
    __enable_irq();

    if (b_time_update) {
        task_normal_st_t estado = task_normal_get_state();

        // 1. Lógica de la Baliza y Sirena
        if (estado == ST_NORMAL_DESACTIVADO) {
            // Sistema desactivado: LED fijo ON, el resto OFF
            HAL_GPIO_WritePin(BEACON_DES_PORT, BEACON_DES_PIN, GPIO_PIN_SET);
            HAL_GPIO_WritePin(BEACON_ACT_PORT, BEACON_ACT_PIN, GPIO_PIN_RESET);
            HAL_GPIO_WritePin(BUZZER_PORT, BUZZER_PIN, GPIO_PIN_RESET);
        } else {
            // Sistema Activado (Normal o Waiting): LED Titilando
            HAL_GPIO_WritePin(BEACON_DES_PORT, BEACON_DES_PIN, GPIO_PIN_RESET);

            if (++timer_blink >= 500) { // Cada 500ms
                HAL_GPIO_TogglePin(BEACON_ACT_PORT, BEACON_ACT_PIN);
                timer_blink = 0;
            }

            // Sirena ululando (solo si la escalera se detuvo pero el sistema está activo)
            if (estado == ST_NORMAL_IDLE) {
                if (++timer_siren >= 200) { // Beep rápido cada 200ms
                    HAL_GPIO_TogglePin(BUZZER_PORT, BUZZER_PIN);
                    timer_siren = 0;
                }
            } else {
                HAL_GPIO_WritePin(BUZZER_PORT, BUZZER_PIN, GPIO_PIN_RESET);
            }
        }

        // 2. Lógica de los LEDs del Motor
        switch (estado) {
            case ST_NORMAL_VEL_MAX:
                HAL_GPIO_WritePin(MOTOR_MAX_PORT, MOTOR_MAX_PIN, GPIO_PIN_SET);
                HAL_GPIO_WritePin(MOTOR_MIN_PORT, MOTOR_MIN_PIN, GPIO_PIN_RESET);
                break;
            case ST_NORMAL_VEL_MIN:
            case ST_NORMAL_ESPERANDO:
                HAL_GPIO_WritePin(MOTOR_MAX_PORT, MOTOR_MAX_PIN, GPIO_PIN_RESET);
                HAL_GPIO_WritePin(MOTOR_MIN_PORT, MOTOR_MIN_PIN, GPIO_PIN_SET);
                break;
            default: // IDLE o DESACTIVADO
                HAL_GPIO_WritePin(MOTOR_MAX_PORT, MOTOR_MAX_PIN, GPIO_PIN_RESET);
                HAL_GPIO_WritePin(MOTOR_MIN_PORT, MOTOR_MIN_PIN, GPIO_PIN_RESET);
                break;
        }
    }
}
