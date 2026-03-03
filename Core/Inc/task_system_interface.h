#ifndef INC_TASK_SYSTEM_INTERFACE_H_
#define INC_TASK_SYSTEM_INTERFACE_H_

// Definición de todos los eventos del sistema
typedef enum {
    EV_ING_DWN, EV_ING_UP,
    EV_EGR_DWN, EV_EGR_UP,
    EV_ACT_DWN, EV_ACT_UP,
    EV_BAR_OCC, EV_BAR_FREE,
    EV_DES_ON,  EV_DES_OFF,
    EV_NXT_DWN, EV_NXT_UP,
    EV_ENT_DWN, EV_ENT_UP,
    EV_SYS_NONE // Evento nulo
} system_event_t;

void task_system_put_event(system_event_t ev);

#endif
