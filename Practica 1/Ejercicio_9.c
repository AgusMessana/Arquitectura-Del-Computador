#include <stdio.h>
#include <stdlib.h>

int main() {
  int A = 200, B = 300, C = 500, D = 400;
  long int AA = 200, BB = 300, CC = 500, DD = 400;

  int S = A * B * C * D;
  long int SS = AA * BB * CC * DD;

  printf("El valor de S es %d.\n", S);
  printf("El valor de SS es %ld.\n", SS);

  return 0;
}

// Como vemos, el resultado correcto dbería ser 12 000 000 000. Al usar int, se produce un overflow, lo que ocasiona que se imprima un resultado erroneo. Al usar long int, podemos almacenar el valor completo, y por eso se imprime el correcto. 
