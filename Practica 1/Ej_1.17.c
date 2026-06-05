#include <stdio.h>
#include <stdlib.h>

void intercambiar(long *a, long *b, long *c) {
  *a = *a ^ *b;
  *b = *a ^ *b;
  *a = *a ^ *b;
  // Ahora 'a' tiene el valor de 'b', y 'b' tiene el valor de 'a'.

  // Falta que el valor de 'a' pase a 'c' y el de 'c' a 'a'.
  *a = *a ^ *c;
  *c = *a ^ *c;
  *a = *a ^ *c;
}

int main(void) {
  long a, b, c;
  printf("Ingrese un valor para a: ");
  scanf("%ld", &a);
  printf("Ingrese un valor para b: ");
  scanf("%ld", &b);
  printf("Ingrese un valor para c: ");
  scanf("%ld", &c);

  printf("Valores originales: a = %ld, b = %ld, c = %ld\n", a, b, c);
  intercambiar(&a, &b, &c);
  printf("Valores intercambiados: a = %ld, b = %ld, c = %ld\n", a, b, c);

  return 0;
}
