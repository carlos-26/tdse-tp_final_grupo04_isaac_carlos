/*Lógica de configuración de parámetros (Máquina de estados Modo Set Up).
 *
 * */
#include "display.h"
#include "task_set_up.h"
#include "task_sensor.h"
#include "task_normal.h"
#include "task_temperature.h"
#include "task_system_interface.h"
#include "app.h"
#include <stdio.h>

/********************** Estados del Menú *************************************/
typedef enum {
	ST_SET_UP_INICIO,
    ST_SET_UP_UMBRAL,
    ST_SET_UP_TIEMPO,
	ST_SET_UP_SALIR
} setup_state_t;

static setup_state_t sub_estado = ST_SET_UP_UMBRAL;
static system_event_t local_event = EV_SYS_NONE;

volatile uint32_t g_task_set_up_tick_cnt = 0;

/********************** Interfaz de Eventos **********************************/
void setup_set_event(system_event_t ev) {
    local_event = ev;
}

/********************** Lógica Principal *************************************/
void task_set_up_init(void) {
    // Ponemos el menú en la primera opción al arrancar
    sub_estado = ST_SET_UP_INICIO;
    local_event = EV_SYS_NONE;
}

void task_set_up_update(void) {
    static uint32_t last_lcd_update = 0;
    char buf[32]; //buffer para los caracteres

    // Solo procesamos si el sistema está en modo SET UP
    if (modo_actual != MODO_SET_UP) return;

    // Sincronismo de Ticks
    bool b_time_update = false;
    __disable_irq();
    if (g_task_set_up_tick_cnt > 0) {
        g_task_set_up_tick_cnt--;
        b_time_update = true;
    }
    __enable_irq();

    // PARA INCREMENTAR VALORES, USAMOS EL EVENTO, NO EL GETTER
	// El evento EV_ENT_DWN se genera en task_sensor.c y llega por setup_set_event

if (b_time_update) {
        // --- PROCESAR EVENTOS DEL MENÚ ---
        switch (sub_estado) {
        	case ST_SET_UP_INICIO:
        		if(sensor_next_pressed()){
        			sub_estado = ST_SET_UP_UMBRAL;
        			display_clear();
        		}
        		break;


            case ST_SET_UP_UMBRAL:
            	if (sensor_next_pressed()) {
					sub_estado = ST_SET_UP_TIEMPO;
					display_clear();
				}
				if (local_event == EV_ENT_DWN){
				sistema_config.umbral_personas++;
				if (sistema_config.umbral_personas > 10) sistema_config.umbral_personas = 1;
				}
                break;

            case ST_SET_UP_TIEMPO:
            	if (sensor_next_pressed()) {
					sub_estado = ST_SET_UP_SALIR;
					display_clear();
				}
				if (local_event == EV_ENT_DWN){
				sistema_config.tiempo_espera += 5;
				if (sistema_config.tiempo_espera > 60) sistema_config.tiempo_espera = 5;
				}
                break;

            case ST_SET_UP_SALIR: // PANTALLA DE SALIDA
			   if (sensor_next_pressed()) {
				   sub_estado = ST_SET_UP_INICIO; // Volvemos al inicio del menú
				   display_clear();
			   }
			   if (sensor_enter_pressed()) {
				   sub_estado = ST_SET_UP_INICIO; //Dejamos en estado de inicio para el próximo ingreso
				   modo_actual = MODO_NORMAL; // ACÁ RECIÉN SALIMOS
				   display_clear();
			   }
			   break;
        }

        local_event = EV_SYS_NONE; // Consumimos el evento

        // --- ACTUALIZAR LCD (Cada 200ms para evitar parpadeo) ---
        if (HAL_GetTick() - last_lcd_update >= 200) {
            last_lcd_update = HAL_GetTick();

            display_write("--- SET UP ---", 0, 0);
            if (sub_estado == ST_SET_UP_INICIO){
            	display_write("NEXT FOR SET UP", 1, 0);
            }else if (sub_estado == ST_SET_UP_UMBRAL) {
                sprintf(buf, "Umbral Pers: %d ", sistema_config.umbral_personas);
            } else if (sub_estado == ST_SET_UP_TIEMPO) {
                sprintf(buf, "T. Espera: %ds  ", sistema_config.tiempo_espera);
            } else {
                display_write("CLICK FOR END", 1, 0);
                return; // Evitamos el sprintf de abajo
			}
            display_write(buf, 1, 0);
        }
    }
}
