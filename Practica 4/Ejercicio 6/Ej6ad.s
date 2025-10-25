.global main
main:
  # Expresión: 0xAA | (0xAA << 24)
  movl $0xAA, %eax
  movl $0xAA, %ebx
  shll $24, %ebx
  orl %ebx, %eax
  ret
