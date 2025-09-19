#include <stdio.h>
#include <stdlib.h>

// Toma tres parámetros a, b y c y rota los valores de las variables de manera que al finalizar la función el valor de a se encuentre en b, el valor de b en c y el de c en a. Evitar utilizar variables auxiliares.

/* 
Paso 1: x = x⊕y
  Ahora x contiene el "resultado XOR" de los originales.
Paso 2: y = x⊕y
  y = (x⊕y)⊕y = x⊕(y⊕y) = x⊕0 = x
  Ahora y tiene el valor original de x
Paso 3: x = x⊕y
  x = (x⊕y)⊕x = (x⊕x)⊕y = 0⊕y = y
  Ahora x tiene el valor original de y 
*/

void invertir_val(long *a, long *b, long *c) {
  // a == a, b == b, c == c
  *a = *a ^ *b;
  *b = *a ^ *b;
  *a = *a ^ *b;

  // a == b, ✓b == a, c == c
  *a = *a ^ *c;
  *c = *a ^ *c;
  *a = *a ^ *c;

  // ✓a == c, ✓b == a, ✓c == (a == b) -> c == b
  return;
}

int main() {
  long a = 10, b = -208, c = 73;
  printf("a = %ld, b = %ld, c = %ld\n", a, b, c);
  invertir_val(&a, &b, &c);
  printf("Valores cambiados:\n");
  printf("a = %ld, b = %ld, c = %ld\n", a, b, c);

  return 0;
}
