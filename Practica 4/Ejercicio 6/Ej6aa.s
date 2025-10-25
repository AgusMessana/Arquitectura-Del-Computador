.global main
main:
  # Expresión: 1<<31
  movl $1, %eax # Cargar 1 en EAX (32 bits)
  shll $31, %eax # Shift left lógico de 31 posicioes
  ret
