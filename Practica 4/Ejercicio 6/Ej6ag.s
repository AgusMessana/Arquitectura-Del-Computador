.global main
main:
  # Expresión: 0 | -1
  movl $0, %eax
  orl $-1, %eax
  ret
