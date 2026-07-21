.data
  str: .asciz "El resultado es: %f\n"
  num_a: .float 4095.0
  num_b: .float 80.0
  num_c: .float 3.0

.text
.global promedio
.global main

promedio:
  @ a -> s0
  @ b -> s1
  @ c -> s2
  push {fp, lr}
  add fp, sp, #4

  vadd.f32 s0, s0, s1 @ s0 = s0 + s1 = a + b
  vadd.f32 s0, s0, s2 @ s0 = s0 + s2 = (a + b) + c

  ldr r0, =num_c
  vldr s1, [r0] @ s1 = 3.0
  vdiv.f32 s0, s0, s1 @ s0 = s0 / s1 = (a + b + c) / 3

  sub sp, fp, #4
  pop {fp, pc}

main:
  push {fp, lr}
  add fp, sp, #4

  ldr r0, =num_a
  vldr s0, [r0] @ s0 = num_a
  ldr r0, =num_b
  vldr s1, [r0] @ s1 = num_b
  vmul.f32 s2, s0, s1 @ s2 = s0 * s1 = a * b
  bl promedio
  @ Resultado en s0

  vcvt.f64.f32 d0, s0 @ d0 = s0 coo double
  ldr r0, =str
  vmov r2, r3, d0

  bl printf

  mov r0, #0
  sub sp, fp, #4
  pop {fp, pc}
