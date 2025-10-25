.global main
main:
  # Expresión: (1 << 15) | (1 << 31)
  movl $1, %eax
  shll $31, %eax
  movl $1, %ebx
  shll $15, %ebx
  orl %ebx, %eax
  ret
