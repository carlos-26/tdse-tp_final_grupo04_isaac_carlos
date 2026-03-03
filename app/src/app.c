/* Project includes. */
#include "main.h"


/* App includes. */
#include <stdlib.h>
#include "app.h"
//#include "logger.h"
#include "task_sensor.h"
#include "task_temperature.h"
#include "task_normal.h"
#include "task_set_up.h"
#include "task_actuator.h"
#include "display.h"


// Variables globales de estado (se comparten entre tareas)
system_mode_t modo_actual = MODO_NORMAL;


/* Application includes. */


/********************** macros and definitions *******************************/

#define TEST_1 (1)
#define TEST_2 (2)

#define TEST_NUMBER TEST_1 //TEST_1, TEST_2

#define DELAY_TICKS (4)
#define STEP (100)
#define PERIOD (65535)

/********************** external data declaration *****************************/
extern TIM_HandleTypeDef htim3;

/********************** external functions definition ************************/

/********************** internal data declaration ****************************/
uint32_t tickstart;
volatile uint32_t wcet_sensor = 0;
volatile uint32_t wcet_temp   = 0;
volatile uint32_t wcet_normal = 0;
volatile uint32_t wcet_setup  = 0;
volatile uint32_t wcet_act    = 0;
volatile uint32_t wcet_total  = 0;

/********************** internal data definition *****************************/

/********************** internal functions definitions ***********************/
void test1_tick();
void test2_tick();

void setPWM(TIM_HandleTypeDef timer,
            uint32_t channel,
            uint16_t period,
            uint16_t pulse);


/********************** internal functions declaration ***********************/



void app_init(void)
{

    // Inicializar cada módulo
    task_sensor_init();
    task_normal_init();
    task_actuator_init();
    task_temperature_init();
    task_set_up_init();
    display_init();

    // Para mediciones de tareas
    // Habilitar contador de ciclos DWT (Específico de Cortex-M3)
    CoreDebug->DEMCR |= CoreDebug_DEMCR_TRCENA_Msk;
    DWT->CYCCNT = 0;
    DWT->CTRL |= DWT_CTRL_CYCCNTENA_Msk;
}

void app_update(void)
{
    uint32_t start, duration;
    uint32_t start_total = DWT->CYCCNT;

	// 1. ESCRUTAR (EPA: E)
    start = DWT->CYCCNT;
    task_sensor_update();			// Lee pulsadores y Dip Switches
    duration = DWT->CYCCNT - start;
    if (duration > wcet_sensor) wcet_sensor = duration;


    start = DWT->CYCCNT;
    task_temperature_update();		// Lee el ADC del LM35 e interno
    duration = DWT->CYCCNT - start;
    if (duration > wcet_temp) wcet_temp = duration;


	// 2. PROCESAR (EPA: P)
	// Lógica de cambio de modo (pulsador Config)
	 // Si estamos en NORMAL, el botón ENTER nos mete al SETUP
    start = DWT->CYCCNT;
	if (modo_actual == MODO_NORMAL) {
		if (sensor_enter_pressed()) {
			modo_actual = MODO_SET_UP;
			display_clear();
			return; // Salimos de este ms para que task_set_up no lea este mismo click
		}
		task_normal_update();
		duration = DWT->CYCCNT - start;
		update_normal_display();
	}
	else if (modo_actual == MODO_SET_UP) {
		// Si estamos en SETUP, delegamos TODA la responsabilidad a esa tarea
		// Incluso la de salir del modo.
		task_set_up_update();
		duration = DWT->CYCCNT - start;
	}

    // Guardamos según el modo
    if (modo_actual == MODO_SET_UP) {
        if (duration > wcet_setup) wcet_setup = duration;
    } else {
        if (duration > wcet_normal) wcet_normal = duration;
    }

	// 3. ACTUAR (EPA: A)
	start = DWT->CYCCNT;
	task_actuator_update(); // Actualiza LEDs (Motor/Baliza) y Buzzer
	duration = DWT->CYCCNT - start;
	if (duration > wcet_act) wcet_act = duration;

	//para medir el ciclo total
    duration = DWT->CYCCNT - start_total;
    if (duration > wcet_total) wcet_total = duration;
}



void setPWM(TIM_HandleTypeDef timer,
            uint32_t channel,
            uint16_t period,
            uint16_t pulse) {
  HAL_TIM_PWM_Stop(&timer, channel);
  TIM_OC_InitTypeDef sConfigOC;
  timer.Init.Period = period;
  HAL_TIM_PWM_Init(&timer);

  sConfigOC.OCMode = TIM_OCMODE_PWM1;
  sConfigOC.Pulse = pulse;
  sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH;
  sConfigOC.OCFastMode = TIM_OCFAST_DISABLE;
  HAL_TIM_PWM_ConfigChannel(&timer, &sConfigOC, channel);

  HAL_TIM_PWM_Start(&timer,channel);
}

config_t sistema_config = {
    .umbral_personas = 3,//5,  // Por defecto 5 personas para velocidad máxima
    .tiempo_espera = 5//10    // Por defecto 10 segundos para frenar
};

/********************** end of file ******************************************/
