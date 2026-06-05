#include <stdio.h>
#include <stdlib.h>

int main(void) {
  int A = 200, B = 300, C = 500, D = 400;
  int prod1 = A * B * C * D;

  long int AA = 200, BB = 300, CC = 500, DD = 400;
  long int prod2 = AA * BB * CC * DD;

  printf("Valor del producto con int: %d.\n", prod1);
  printf("Valor del producto con long int: %ld.\n", prod2);

  return 0;
}

/**
 * Con tipo de dato int, el resultado es mucho más grande que el límite máximo de valores. Es decir, hace overflow. Esto es porque el tipo int sosporta 32 bits.
 * Con tipo de dato long int, es posible representar el valor pues soporta 64 bits, por lo que no hace overflow.
 */
