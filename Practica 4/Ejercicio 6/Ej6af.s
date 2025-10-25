.global main
main:
  # Expresión: -1 & (~(1 << 8))
  movl $-1, %eax
  movl $1, %ebx
  shll $8, %ebx
  notl %ebx
  andl %ebx, %eax
  ret
