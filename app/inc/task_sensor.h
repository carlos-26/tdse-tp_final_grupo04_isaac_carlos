#ifndef INC_TASK_SENSOR_H_
#define INC_TASK_SENSOR_H_

#include "main.h"
#include "task_system_interface.h"
#include <stdbool.h>

// Inicialización y Update
void task_sensor_init(void);
void task_sensor_update(void);

// El Repartidor de eventos
void task_system_put_event(system_event_t ev);

// Getters de estado
bool sensor_ingreso_detectado(void);
bool sensor_egreso_detectado(void);
bool sensor_barrera_libre(void);
bool sensor_desactivar_no_pedido(void);
bool sensor_enter_pressed(void);
bool sensor_next_pressed(void);

extern volatile uint32_t g_task_sensor_tick_cnt;

// Contador de ticks para la tarea (se incrementa en el SysTick)
extern volatile uint32_t g_task_sensor_tick_cnt;

#endif
