.global main
main:
  # Expresión: 5 << 8
  movl $5, %eax
  shll $8, %eax
  ret
