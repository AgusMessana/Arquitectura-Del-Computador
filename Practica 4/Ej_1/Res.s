.data
array: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 @ 10 palabras (índices 0..9)
       .word 0                             @ espacio extra (ver nota)

.text
.global main
main:
  ldr r2, =array @ r2 = dirección base del arreglo
  mov r1, #100 @ y = 100 (valor de prueba)

  @ x = array[7] + y
  ldr r3, [r2, #28] @ r3 = array[7]
  add r0, r3, r1 @ x = array[7] + y

  @ array[10] = array[8] + y
  ldr r5, [r2, #32] @ r5 = array[8]
  add r5, r5, r1 @ r5 = array[8] + y
  str r5, [r2, #40] @ array[10] = r5

  bx lr @ retorna a main
