.text
.global campesino_ruso
@ i -> r0
@ j -> r1
@ res -> r2
campesino_ruso:
    mov   r2, #0
bucle:
    cmp   r1, #1
    bls   fin
    tst   r1, #1
    addne r2, r2, r0
    subne r1, r1, #1
    lsleq r0, r0, #1
    lsreq r1, r1, #1
    b     bucle
fin:
    add   r0, r2, r0
    bx    lr
@ Con esta solución, el caso borde de j <= 1 ingresado de entrada no falla, pero hay más de un salto.

campesino_ruso_1:
  mov r2, #0

bucle_1:
  tst r1, #1
  addne r2, r2, r0
  subne r1, r1, #1
  lsleq r0, r0, #1
  lsreq r1, r1, #1

  @ Comparo j con 1.
  cmp r1, #1

  @ Si j > 1, repito el bucle.
  bhi bucle_1

  @ Si j <= 1, sigo fuera del bucle.
  add r0, r2, r0
  bx lr
@ Con esta solución, el caso borde de j <= 1 ingresado de entrada falla, pero solo hay un salto.
