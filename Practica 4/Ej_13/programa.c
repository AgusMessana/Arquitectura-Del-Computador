#include <stdio.h>
float a[5] = { 1.0, 2.0, 3.0, 4.0, 5.0 };
float b[5] = { 2.0, 4.0, 6.0, 8.0, 10.0 };
float c[5];

int main() {
  float suma = 0;
  for (int i = 0; i < 5; i++) {
    printf("%f\n", c[i] = a[i] + b[i]);
    suma = suma + c[i];
  }
  printf("La suma de las componentes es: %f\n", suma);
  return 0;
}
