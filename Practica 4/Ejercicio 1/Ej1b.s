.global main
main:
  movb $0xFE, %al // carga 0xFE al registro %al
  movb $-1, %bl // carga 0xFF al registro %bl (pues en 8 bits -1 = 255)
  addb %bl, %al // le suma al registro %al el valor de %bl
  incb %bl // incrementa en uno el valor de %bl
  ret
