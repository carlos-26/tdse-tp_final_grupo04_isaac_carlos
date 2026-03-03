#ifndef INC_TASK_NORMAL_H_
#define INC_TASK_NORMAL_H_

#include "main.h"
#include "task_system_interface.h"

// Estados de la Escalera
typedef enum {
    ST_NORMAL_DESACTIVADO,
    ST_NORMAL_IDLE,        // Sistema activo, escalera quieta
    ST_NORMAL_VEL_MIN,     // Escalera moviéndose lento
    ST_NORMAL_VEL_MAX,     // Escalera moviéndose rápido
    ST_NORMAL_ESPERANDO    // Nadie en la escalera, contando para frenar
} task_normal_st_t;

void task_normal_init(void);
void task_normal_update(void);
task_normal_st_t task_normal_get_state(void);
uint16_t task_normal_get_count(void);
void normal_set_event(system_event_t ev);

// Variable para que el SysTick la bombee (como en task_sensor)
extern volatile uint32_t g_task_normal_tick_cnt;

#endif
