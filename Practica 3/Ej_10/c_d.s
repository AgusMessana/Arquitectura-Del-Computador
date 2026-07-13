.data
  a: .long 1, 2, 3, 4
  g: .quad 0x1122334455667788
  msg: .asciz "Imprime %c\n"

.text
.global main
main:
  subq $8, %rsp # rsp = 0x7fffffffebc0
  movq $g, %rax # rax = 0x0000000000404038
  movl g+4, %eax # rax = 0x0000000011223344
  movq $3, %rbx # rbx = 0x0000000000000003
  movb a(, %rbx,4), %al # rax = 0x0000000011223304 
  leaq msg, %rdi # rdi = 0x0000000000404040
  movb (%rdi, %rbx, 2), %sil # sil = 0x65
  xorl %eax, %eax # rax = 0x0000000000000000
  call printf # rax = 0x000000000000000A (guarda el total de caracteres impresos)
  addq $8, %rsp # rsp = 0x7fffffffebc8
  ret

# d)
# Lo que se imprimirá en pantalla luego del call printf es "Imprime e" con un salto de línea al final.
# El orden de registros para imprimir es: rdi, rsi, rdx, rcx, r8, r9.
# En rdi ya está el formato (Sería el "Imprime %c\n"). En rsi (más precisamente en el sil) está la 'e'. Siguiendo ese orden, printf SIEMPRE LEE la parte baja del rsi, por lo que se reemplaza el %c con la 'e' y se imprime el mensaje.
