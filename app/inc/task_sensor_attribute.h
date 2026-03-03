#ifndef INC_TASK_SENSOR_ATTRIBUTE_H_
#define INC_TASK_SENSOR_ATTRIBUTE_H_

#include "main.h"

// IDs únicos para cada sensor
typedef enum {
    ID_BTN_INGRESO,
    ID_BTN_EGRESO,
    ID_BTN_ACTIVAR,
    ID_SW_BARRERA,
    ID_SW_DESACTIVAR,
    ID_BTN_NEXT,
    ID_BTN_ENTER_ESC
} task_sensor_id_t;

// Estados de la máquina de debouncing
typedef enum {
    ST_BTN_XX_UP,
    ST_BTN_XX_FALLING,
    ST_BTN_XX_DOWN,
    ST_BTN_XX_RISING
} task_sensor_st_t;

// Eventos internos de nivel físico
typedef enum {
    EV_BTN_XX_UP,
    EV_BTN_XX_DOWN
} task_sensor_ev_t;

// Estructura de configuración (Constante, vive en Flash)
typedef struct {
    task_sensor_id_t id;
    GPIO_TypeDef* gpio_port;
    uint16_t pin;
    GPIO_PinState pressed_level; // GPIO_PIN_SET o RESET
    uint32_t debounce_ticks;
    uint16_t signal_up;   // Evento a disparar al soltar
    uint16_t signal_down; // Evento a disparar al presionar
} task_sensor_cfg_t;

// Estructura de datos (Dinámica, vive en RAM)
typedef struct {
    uint32_t tick;
    task_sensor_st_t state;
    task_sensor_ev_t event;
} task_sensor_dta_t;

#endif
