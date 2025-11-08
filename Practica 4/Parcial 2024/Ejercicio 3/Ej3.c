#include <stdio.h>

// El prototipo de la función que está en Assembly
int calcular_suma_y_promedio(double *arreglo, long int cantidad);

int main(void) {
  // Definimos el arreglo de prueba
  double mi_arreglo[] = { 10.5, 20.0, 30.5, 40.0 };

  // Calculamos la cantidad de elementos
  // (Tamaño total en bytes) / (Tamaño de un double)
  long int cantidad = sizeof(mi_arreglo) / sizeof(double);

  printf("--- Llamando a la funcion de Assembly ---\n");

  // Llamamos a la función
  calcular_suma_y_promedio(mi_arreglo, cantidad);

  printf("-----------------------------------------\n");
  printf("Calculo esperado:\n");
  printf("Suma: 101.0\n");
  printf("Promedio: 25.25\n");

  return 0;
}
