.data
  a: .float 1.0, 2.0, 3.0, 4.0, 5.0
  b: .float 2.0, 4.0, 6.0, 8.0, 10.0
  c: .space 20 @ reservo 20 bytes (5 floats de 4 bytes cada uno)
  msg_1: .asciz "%f\n"
  msg_2: .asciz "La suma de las componentes es: %f\n"

.text
.global main
main:
  push {r4, r5, r6, r7, lr}
  vpush {s16}

  mov r4, #0 @ índice
  mov r3, #0 @ r3 = 0
  vmov s16, r3 @ s16 = 0.0 (suma)
  ldr r5, =a @ r5 apunta a a[0]
  ldr r6, =b @ r6 apunta a b[0]
  ldr r7, =c @ r7 apunta a c[0]

for:
  cmp r4, #5
  bge fin_for
  vldr s0, [r5] @ cargo a s0 el valor en r5
  vldr s1, [r6] @ cargo a s1 el valor en r6
  vadd.f32 s2, s0, s1 @ sumo las componentes
  vstr s2, [r7] @ guardo la suma en la dirección r7 (c[i] = s2)

  vadd.f32 s16, s16, s2 @ (suma = suma + c[i])

  @ Preparamos para el printf. Para imprimir floats se debe hacer así:
  vcvt.f64.f32 d0, s2 @ convierto s2 de float a double, y lo guardo en d0
  vmov r2, r3, d0 @ se guarda en r2 los 32 bites menos significativos de d0 y en r3 los 32 bites más significativos de d0
  ldr r0, =msg_1
  bl printf

  @ Avanzamos el índice y los punteros
  add r4, r4, #1
  add r5, r5, #4
  add r6, r6, #4
  add r7, r7, #4
  b for

fin_for:
  vcvt.f64.f32 d0, s16
  vmov r2, r3, d0
  ldr r0, =msg_2
  bl printf
  mov r0, #0
  vpop {s16}
  pop {r4, r5, r6, r7, pc} @ restauro y retorno en una línea (por pc)
