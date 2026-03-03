/*Manejo del ADC para el LM35 y el sensor interno.*/
//Por ahora es un dummy

#include "main.h"
#include "task_temperature.h"
#include <stdbool.h>

extern ADC_HandleTypeDef hadc1;
volatile uint32_t g_task_temperature_tick_cnt = 0;

static float temp_ambiente = 0;
static float temp_interna = 0;

void task_temperature_init(void) {
    HAL_ADCEx_Calibration_Start(&hadc1);
}
/*
void task_temperature_update(void) {
    static uint32_t timer_adc = 0;
    bool b_time_update = false;
    ADC_ChannelConfTypeDef sConfig = {0};

    __disable_irq();
    if (g_task_temperature_tick_cnt > 0) {
        g_task_temperature_tick_cnt--;
        b_time_update = true;
    }
    __enable_irq();

    if (b_time_update) {
        if (++timer_adc >= 1000) { // Medimos cada 1 segundo
            timer_adc = 0;

            // --- PASO 1: CONFIGURAR Y LEER LM35 (Canal 0) ---
		   sConfig.Channel = ADC_CHANNEL_0;
		   sConfig.Rank = ADC_REGULAR_RANK_1;
		   sConfig.SamplingTime = ADC_SAMPLETIME_239CYCLES_5; // Más tiempo = más estable
		   HAL_ADC_ConfigChannel(&hadc1, &sConfig);

		   HAL_ADC_Start(&hadc1);
		   if (HAL_ADC_PollForConversion(&hadc1, 10) == HAL_OK) {
			   uint32_t raw = HAL_ADC_GetValue(&hadc1);
			   temp_ambiente = (raw * 330.0f) / 4095.0f;
		   }
		   HAL_ADC_Stop(&hadc1); // Importante parar antes de reconfigurar

		   // --- PASO 2: CONFIGURAR Y LEER SENSOR INTERNO ---
		   sConfig.Channel = ADC_CHANNEL_TEMPSENSOR;
		   sConfig.Rank = ADC_REGULAR_RANK_1; // Sigue siendo Rank 1 porque ahora es el único
		   HAL_ADC_ConfigChannel(&hadc1, &sConfig);

		   HAL_ADC_Start(&hadc1);
		   if (HAL_ADC_PollForConversion(&hadc1, 10) == HAL_OK) {
			   uint32_t raw = HAL_ADC_GetValue(&hadc1);
			   // Fórmula para STM32F103
			   float v_sense = (raw * 3.3f) / 4095.0f;
			   temp_interna = ((1.43f - v_sense) / 0.0043f) + 25.0f;
		   }
		   HAL_ADC_Stop(&hadc1);
        }
    }
}
*/

void task_temperature_update(void) {
    static uint32_t timer_adc = 1000;
    bool b_time_update = false;
    ADC_ChannelConfTypeDef sConfig = {0};

    __disable_irq();
        if (g_task_temperature_tick_cnt > 0) {
            g_task_temperature_tick_cnt--;
            b_time_update = true;
        }
	__enable_irq();

	if(b_time_update){

    if (g_task_temperature_tick_cnt > 0) {
        g_task_temperature_tick_cnt--;

        if (++timer_adc >= 1000) {
            timer_adc = 0;

            // --- PASO 1: LEER LM35 (Canal 0) ---
			sConfig.Channel = ADC_CHANNEL_0;
			sConfig.Rank = 1;
			sConfig.SamplingTime = ADC_SAMPLETIME_239CYCLES_5; // Máximo tiempo para estabilidad
			HAL_ADC_ConfigChannel(&hadc1, &sConfig);

			  HAL_ADC_Start(&hadc1);
			// Hacemos una lectura de descarte para limpiar el capacitor
			HAL_ADC_PollForConversion(&hadc1, 10);
			HAL_ADC_GetValue(&hadc1);

			// Ahora si, la lectura real
			HAL_ADC_Start(&hadc1);
            if (HAL_ADC_PollForConversion(&hadc1, 10) == HAL_OK) {
                uint32_t raw = HAL_ADC_GetValue(&hadc1);
                temp_ambiente = ((raw * 330.0f) / (4095.0f))-22.0f;// el -22 es para corregir error inducido por el cableado
            }
            HAL_ADC_Stop(&hadc1); // Importante parar antes de reconfigurar

            // --- PASO 2: CONFIGURAR Y LEER SENSOR INTERNO ---
            sConfig.Channel = ADC_CHANNEL_TEMPSENSOR;
            sConfig.Rank = 1; // Sigue siendo Rank 1 porque ahora es el único
            HAL_ADC_ConfigChannel(&hadc1, &sConfig);

            HAL_ADC_Start(&hadc1);
            if (HAL_ADC_PollForConversion(&hadc1, 10) == HAL_OK) {
                uint32_t raw = HAL_ADC_GetValue(&hadc1);
                // La fórmula del F103 es: Temp = ((V25 - Vsense) / Avg_Slope) + 25
                // V25 es aprox 1.43V y Avg_Slope es 0.0043V/C
                float v_sense = (raw * 3.3f) / 4095.0f;
                temp_interna = ((1.43f - v_sense) / 0.0043f) + 25.0f;
            }
            HAL_ADC_Stop(&hadc1);
        }
    }
    }
}

float get_temp_ambiente(void) { return temp_ambiente; }
float get_temp_interna(void) { return temp_interna; }
