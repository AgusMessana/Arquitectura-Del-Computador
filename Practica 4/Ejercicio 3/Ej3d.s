.global main
main:
  movb $120, %al
  subb $-56, %al
  ret

// Valor final: 176
// Banderas: OF = 1, CF = 1
