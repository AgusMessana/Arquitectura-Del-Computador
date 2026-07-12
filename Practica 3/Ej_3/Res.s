.global main
main:
  movb $100, %al
  movb $120, %bl
  movb $-63, %cl
  movb $-56, %dl
  movb $-91, %sil

  // a) S1 = N1 + N2
  movb %al, %r8b
  addb %bl, %r8b

  // b) S2 = N3 + N4
  movb %cl, %r9b
  addb %dl, %r9b

  // c) N3 + N5
  movb %cl, %r10b
  addb %sil, %r10b

  // d) N2 - N4
  movb %bl, %r11b
  subb %dl, %r11b

  // e) S5 = N5 - N2
  movb %sil, %r12b
  subb %bl, %r12b

  ret

// S1 = 0xdc / Banderas: OF, SF
// S2 = 0x89 / Banderas: CF, SF
// S3 = 0x66 / Banderas: CF, OF
// S4 = 0xb0 / Banderas: CF, SF, OF
// S5 = 0x2d / Banderas: OF
