#include <stdio.h>
#include <stdlib.h>

int suma_cuadrados(int argc, char *argv[]);

int main(int argc, char *argv[]) {
  if (argc <= 1) {
    printf("Ingrese al menos un argumento\n");
    return 0;
  }

  long resultado = suma_cuadrados(argc, argv);

  printf("Cantidad de argumentos ingresados: %d. La suma es %ld.\n", argc - 1,
         resultado);

  return 0;
}
