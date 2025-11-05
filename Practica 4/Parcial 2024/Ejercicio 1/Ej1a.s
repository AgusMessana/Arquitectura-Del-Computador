/*
Completar las líneas de puntos en las instrucciones para que el programa imprima lo siguiente cuando se compile y ejecute de la forma indicada: ./a.out Hola mundo
Estoy en foo!
La cantidad de argumentos es 3
El argumento 0 es ./a.out
El argumento 1 es Hola
El argumento 2 es mundo
*/

.data
str1: .asciz "Estoy en foo!\n"
str2: .asciz "La cantidad de argumentos es %d\n"
str3: .asciz "El argumento %d es %s\n"

.text
.global main
main:
  pushq %rbp
  movq %rsp, %rbp
  subq $16, %rsp
  movq ..., -8(%rbp)         # Completado
  movq ..., -16(%rbp)        # Completado
  call foo
  ...                       # Completado
  ...                       # Completado
  ...                       # Completado
  call printf
  xorl %r12d, %r12d
  movq -16(%rbp), %rbx
bucle:
  incq %r12d
  movq ..., ...             # Completado
  movq ..., ...             # Completado
  movq ..., ...             # Completado
  ...                       # Completado
  call printf
  ...                       # Completado
  ... bucle                 # Completado
  ...                       # Completado
  ...                       # Completado
  xorl %eax, %eax
  ret
foo:
  pushq %rbp
  movq %rsp, %rbp
  ...                       # Completado
  ...                       # Completado
  call printf
  ...                       # Completado
  ...                       # Completado
  xorl %eax, %eax
  ret
