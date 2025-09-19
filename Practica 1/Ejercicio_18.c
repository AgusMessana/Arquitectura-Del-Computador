#include <stdio.h>
#include <stdlib.h>

// Escriba en lenguaje C un programa que tome la entrada estándar, la codifique e imprima el resultado en salida estándar. La codificación deberá ser hecha carácter a carácter utilizando el operador XOR y un código que se pase al programa como argumento de línea de comando. El código adicional para el operador XOR también se debe pasar como argumento de línea de comandos al programa.

int main(int argc, char *argv[]) {
  if (argc != 3) {
    printf("Uso: %s <código> <cadena>\n", argv[0]);
    return 1;
  }

  int code = atoi(argv[1]);
  char *str = argv[2];

  for (int i = 0; str[i] != '\0'; i++) {
    char char_codificado = str[i] ^ code;
    printf("%c", char_codificado);
  }
  printf("\n");

  return 0;
}

// Para decodificar, aplicamos el programa de nuevo con el mismo código pero con el mensaje que obtuvimos con la primera codificación.
// Codificar más de una vez no genera nada ya que el operador XOR es reversible e idempotente, por lo que coficiar con el mismo código es redundante. Cambiando el código si se obtiene más seguridad.
