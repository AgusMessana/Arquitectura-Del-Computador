.global main
main:
  # Expresión: 0x80000000 + 0x80000000
  movl $0x80000000, %eax
  movl $0x80000000, %ebx
  addl %ebx, %eax
  ret
