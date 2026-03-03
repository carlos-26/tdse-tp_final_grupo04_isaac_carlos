#ifndef APP_INC_APP_H_
#define APP_INC_APP_H_

/********************** CPP guard ********************************************/
#ifdef __cplusplus
extern "C" {
#endif

/********************** inclusions *******************************************/
#include "main.h"
#include <stdbool.h>
/********************** typedef **********************************************/

// Definiciones de estados del sistema
typedef enum {
    MODO_DESACTIVADO,
    MODO_NORMAL,
    MODO_SET_UP
} system_mode_t;

// Estructura de configuración pedida por el TPF
typedef struct {
    uint16_t umbral_personas; // Cantidad de personas para pasar a Vel. Máxima
    uint16_t tiempo_espera;   // Segundos para detener la escalera (IDLE)
} config_t;

/********************** external data declaration ****************************/
extern system_mode_t modo_actual;
extern config_t sistema_config;
extern uint16_t contador_personas;

/********************** external functions declaration ***********************/

void app_init(void);
void app_update(void);

/********************** End of CPP guard *************************************/
#ifdef __cplusplus
}
#endif

#endif /* APP_INC_APP_H_ */

/********************** end of file ******************************************/
