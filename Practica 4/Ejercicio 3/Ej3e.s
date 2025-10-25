.global main
main:
  movb $-91, %al
  subb $120, %al
  ret

// Valor final: 45
// Banderas: OF = 1, CF = 0
