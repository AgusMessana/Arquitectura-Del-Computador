.global main
main:
  movb $-63, %al
  addb $-56, %al
  ret

// Valor final: -119
// Banderas: OF = 0, CF = 1
