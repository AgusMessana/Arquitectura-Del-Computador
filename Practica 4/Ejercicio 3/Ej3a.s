.global main
main:
  movb $100, %al
  addb $120, %al
  ret

// Valor final: -36
// Banderas: OF = 1, CF = 0
