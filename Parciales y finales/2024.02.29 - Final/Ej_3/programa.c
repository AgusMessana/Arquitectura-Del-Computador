#include <stdio.h>

float promedio(float a, float b, float c) {
  return (a + b + c) / 3;
}

int main() {
  float a = 4095, b = 80, c;
  c = a * b;
  printf("El resultado es: %f\n", promedio(a, b, c));
  return 0;
}
