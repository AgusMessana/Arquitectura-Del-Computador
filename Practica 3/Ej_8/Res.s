.global main
main:
  movl $-1, %eax # Solo para este tamaño el mov pone en 0 la parte alta del registro.
  movl $2, %ecx
  imull %ecx

  # completar para que el resultado correcto como signed quede en rax
  cltq

  xorq %rax, %rax
  movw $-1, %ax
  movw $2, %cx
  mulw %cx

  # completar para que el resultado correcto como unsigned int quede en eax
  movzwl %dx, %edx # Limpiamos la parte alta de %edx
  shll $16, %edx # Desplazamos %edx 16 bits a la izquierda.
  movzwl %ax, %eax # Limpiamos la parte alta de %eax.
  orl %edx, %eax # Combinamos resultados.
  # Esto lo hacemos pues el resultado requiere 17 bits y %ax sólo guarda 16. Por ende, un bit de %dx es necesario para el resultado final. Debemos juntar ese bit junto con los 16 de %ax para obtener el resultado.

  ret
