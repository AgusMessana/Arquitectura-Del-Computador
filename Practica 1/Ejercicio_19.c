#include <stdio.h>
#include <stdlib.h>

// Algoritmo del campesino ruso. La multiplicación de enteros positivos puede implementarse con sumas, el operador AND y desplazamientos de bits usando las siguientes identidades:
/*
a*b = 
  0 si b = 0
  a si b = 1
  2*a*k si b = 2*k
  2*a*k + a si b = 2*k + 1
*/

unsigned mult(unsigned a, unsigned b) {
  unsigned res = 0;
  while (b > 0) {
    if (b & 1) {                // verificamos paridad. Si el bit menos significativo es 1, es impar. Sino, es par
      res += a;
    }

    a <<= 1;                    // a = 2*a. a <<= 1 <-> a = a << 1
    b >>= 1;
  }

  return res;
}

int main() {
  unsigned a = 100;
  unsigned b = 2;

  unsigned res = mult(a, b);
  printf("El resultado de multiplicar %u con %u es %u\n", a, b, res);

  return 0;
}
