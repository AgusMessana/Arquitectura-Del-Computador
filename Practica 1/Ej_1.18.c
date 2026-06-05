#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
  if (argc != 3) {
    printf("Cantidad incorrecta de argumentos.\n");
    return 1;
  }

  int codigo = atoi(argv[1]);
  char *cadena_a_codificar = argv[2];

  for (int i = 0; cadena_a_codificar[i] != '\0'; i++) {
    cadena_a_codificar[i] = cadena_a_codificar[i] ^ codigo;
  }
  printf("Cadena codificada: %s.\n", cadena_a_codificar);

  for (int i = 0; cadena_a_codificar[i] != '\0'; i++) {
    cadena_a_codificar[i] = cadena_a_codificar[i] ^ codigo;
  }
  printf("Cadena descodificada: %s.\n", cadena_a_codificar);

  return 0;
}
