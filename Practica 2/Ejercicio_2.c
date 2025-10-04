#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

// Estructura IEEE 754 de 32 bits (float):
// Bit 31: Signo (1 bit)
// Bits 30-23: Exponente (8 bits)
// Bits 22-0: Fracción/Mantisa (23 bits)

// Función para extraer la fracción (mantisa)
uint32_t extraer_fraccion(float f) {
  // Interpretar float como un entero de 32 bits
  uint32_t bits = *(uint32_t *) & f;
  // Máscara para los 23 bits de la fracción: 0x007FFFFF
  return bits & 0x007FFFFF;
}

// Función para extraer el exponente
int32_t extraer_exponente(float f) {
  // Interpretar float como un entero de 32 bits
  uint32_t bits = *(uint32_t *) & f;

  // Corriemiento a la derecha para alinear exponente
  // Máscara 0x7F800000 para aislar bits 30-23
  uint32_t exp_bits = (bits & 0x7F800000) >> 23;

  // Restamos el sesgo (127 para float de 32 bits)
  return (int32_t) exp_bits;
}

// Como macros
#define GET_EXPONENT(f) (((*(uint32_t*)&(f)) & 0x7F800000) >> 23)
#define GET_FRACTION(f) ((*(uint32_t*)&(f)) & 0x007FFFFF)

int main() {
  float num = 5.75f;

  printf("Numero: %f\n", num);
  printf("Exponente: %u\n", GET_EXPONENT(num));
  printf("Fraccion: 0x%X\n", GET_FRACTION(num));

  return 0;
}
