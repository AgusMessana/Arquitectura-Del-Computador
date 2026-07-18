.text
.global potencia
potencia:
  mov r1, #1              @ r1 = 1  (2^0)
  mov r0, r1, lsl r0      @ r0 = 1 << i = 2^i
  bx lr
