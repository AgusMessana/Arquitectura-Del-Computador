#include <stdio.h>
float vector1[5] = { 1.1, 2.2, 3.3, 4.4, 5.5 };
float vector2[5] = { 6.6, 7.7, 8.8, 9.9, 10.0 };
float resultado[5];

void suma_vectores(float vector1[], float vector2[], float resultado[],
                   int longitud) {
  for (int i = 0; i < longitud; i++) {
    resultado[i] = vector1[i] + vector2[i];
  }
}

int main() {
  suma_vectores(vector1, vector2, resultado, 5);
  printf("Resultado de la suma:\n");
  for (int i = 0; i < 5; i++) {
    printf("%.2f ", resultado[i]);
  }
  printf("\n");
  return 0;
}
