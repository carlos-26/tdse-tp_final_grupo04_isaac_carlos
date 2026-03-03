#ifndef INC_DISPLAY_H_
#define INC_DISPLAY_H_

#include "main.h"

void display_init(void);
void display_clear(void);
void display_write(char* str, uint8_t row, uint8_t col);
void update_normal_display(void);

#endif
