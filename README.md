PROYECTO: Sistema de Control de Escalera Mecánica (PMV)
MATERIA: TA134 - Taller de Sistemas Embebidos (FIUBA)
GRUPO: 04

RESUMEN:
Este proyecto implementa un sistema de control inteligente para una escalera mecánica utilizando una placa STM32 Nucleo-F103RB. El sistema optimiza el uso de energía variando la velocidad según la carga de personas y garantiza la seguridad mediante una barrera infrarroja.

REQUISITOS DE HARDWARE:
- Nucleo-F103RB
- LCD 16x2 (Modo 4 bits)
- Sensor LM35
- Buzzer Activo
- 4 LEDs de señalización
- 5 Pulsadores y 2 Dip Switches

ARQUITECTURA:
- Bare Metal (sin SO).
- Ejecutor Cíclico con tick de 1ms.
- Modelo EPA (Escrutar, Procesar, Actuar).
- Código no bloqueante basado en eventos y máquinas de estado.

INSTRUCCIONES DE COMPILACIÓN:
1. Importar el proyecto en STM32CubeIDE.
2. Realizar un 'Clean' del proyecto.
3. Compilar (Build) y cargar a la placa mediante el ST-Link integrado.

CONEXIONES RELEVANTES:
- LCD: RS(PC10), E(PC11), D4-D7(PC9, PC8, PC6, PC5).
- Sensores: Ingreso(PA1), Egreso(PA4), Activar(PC0), Barrera(PC1), Desactivar(PB0), Enter(PA9), Next(PA8).
- Motor: Max(PA6), Min(PA7).
- Alerta: Baliza(PB4), Desactivado(PB5), Buzzer(PB6).
- Temperatura: LM35(PA0).

Librerías adicionales: Driver de LCD personalizado (display.c/h).

CÓMO COMPILAR:
El proyecto está desarrollado en STM32CubeIDE. Importar la carpeta raíz, realizar un 'Clean' y 'Build'. El firmware se carga automáticamente mediante el puerto USB ST-Link integrado.
