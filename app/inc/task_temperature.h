/* En task_temperature.h */
#ifndef INC_TASK_TEMPERATURE_H_
#define INC_TASK_TEMPERATURE_H_

#include "main.h"

void task_temperature_init(void);
void task_temperature_update(void);
float get_temp_ambiente(void);
float get_temp_interna(void);

#endif
