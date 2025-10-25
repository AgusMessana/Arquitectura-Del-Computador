.global main
main:
  movb $-63, %al
  addb $-91, %al
  ret

// Valor final: 102
// Banderas: OF = 1, CF = 1
