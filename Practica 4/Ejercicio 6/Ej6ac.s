.global main
main:
  # Expresión: -1 & ~0xFF
  movl $-1, %eax
  movl $0xFF, %ebx
  notl %ebx
  andl %ebx, %eax
  ret
