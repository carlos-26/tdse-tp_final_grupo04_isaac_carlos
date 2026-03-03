/*Biblioteca para el LCD 16x2 en modo 4 bits.
 *
 * */
#include "display.h"
#include "task_normal.h"
#include "task_temperature.h"
#include <stdio.h>

// Mapeo
#define LCD_PORT_RS GPIOC
#define LCD_PIN_RS  GPIO_PIN_10
#define LCD_PORT_E  GPIOC
#define LCD_PIN_E   GPIO_PIN_11

// Pines de datos (Están desordenados)
#define PORT_D4 GPIOC
#define PIN_D4  GPIO_PIN_9
#define PORT_D5 GPIOC
#define PIN_D5  GPIO_PIN_8
#define PORT_D6 GPIOC
#define PIN_D6  GPIO_PIN_6
#define PORT_D7 GPIOC
#define PIN_D7  GPIO_PIN_5

static void lcd_write_4bit(uint8_t nibble) {
    HAL_GPIO_WritePin(PORT_D4, PIN_D4, (nibble >> 0) & 0x01);
    HAL_GPIO_WritePin(PORT_D5, PIN_D5, (nibble >> 1) & 0x01);
    HAL_GPIO_WritePin(PORT_D6, PIN_D6, (nibble >> 2) & 0x01);
    HAL_GPIO_WritePin(PORT_D7, PIN_D7, (nibble >> 3) & 0x01);
}

static void lcd_send_nibble(uint8_t nibble, uint8_t rs) {
    HAL_GPIO_WritePin(LCD_PORT_RS, LCD_PIN_RS, rs);
    lcd_write_4bit(nibble);

    HAL_GPIO_WritePin(LCD_PORT_E, LCD_PIN_E, GPIO_PIN_SET);
    for(volatile int i=0; i<1000; i++); // Pequeña espera
    HAL_GPIO_WritePin(LCD_PORT_E, LCD_PIN_E, GPIO_PIN_RESET);
    for(volatile int i=0; i<1000; i++);
}

static void lcd_send_byte(uint8_t byte, uint8_t rs) {
    lcd_send_nibble(byte >> 4, rs);   // Parte alta
    lcd_send_nibble(byte & 0x0F, rs); // Parte baja
}

void display_init(void) {
    HAL_Delay(50); // El único delay permitido (en la init)
    lcd_send_nibble(0x03, 0); HAL_Delay(5);
    lcd_send_nibble(0x03, 0); HAL_Delay(1);
    lcd_send_nibble(0x03, 0);
    lcd_send_nibble(0x02, 0); // Modo 4 bits

    lcd_send_byte(0x28, 0); // 2 líneas, 5x8
    lcd_send_byte(0x0C, 0); // Display ON, Cursor OFF
    lcd_send_byte(0x06, 0); // Auto increment
    display_clear();
}

void display_clear(void) {
    lcd_send_byte(0x01, 0);
    HAL_Delay(2);
}

void display_write(char* str, uint8_t row, uint8_t col) {
    uint8_t addr = (row == 0) ? (0x80 + col) : (0xC0 + col);
    lcd_send_byte(addr, 0);
    while (*str) {
        lcd_send_byte(*str++, 1);
    }
}


void update_normal_display(void) {
    static uint32_t last_update = 0;
    if (HAL_GetTick() - last_update < 500) return; // Cada 500ms
    last_update = HAL_GetTick();

    char line1[32];
    char line2[32];

    // Línea 1: Personas y Temperatura ambiente
    sprintf(line1, "P:%02d  Amb:%dC  ", task_normal_get_count(), (int)get_temp_ambiente());

    // Línea 2: Estado del motor y Temp uC
    task_normal_st_t st = task_normal_get_state();
    char* st_str = (st == ST_NORMAL_VEL_MAX) ? "MAX" :
                   (st == ST_NORMAL_VEL_MIN || st == ST_NORMAL_ESPERANDO) ? "MIN" : "OFF";

    sprintf(line2, "Mot:%s  uC:%dC  ", st_str, (int)get_temp_interna());

    display_write(line1, 0, 0);
    display_write(line2, 1, 0);
}
