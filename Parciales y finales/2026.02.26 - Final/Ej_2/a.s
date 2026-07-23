.data
  e: .word 7
  h: .word 8
  g: .float 6.0
  str1: .asciz "Calcualndo...\n"
  str2: .asciz "Resultado: %d\n"

.text
.global main
.global imprimir
.global calculo

imprimir:
  push {r7, lr}
  ldr r0, =str1
  bl printf
  pop {r7, pc}

calculo:
  @ a -> r0
  @ b -> r1
  @ c -> r2
  @ d -> r3
  @ e -> pila
  @ f -> d0 (s1, s0)
  @ g -> s2
  @ h -> pila
  push {r4, r5, r6, r7, r8, r9, lr}
  vpush {s16}
  vpush {d9}

  mov r4, r0 @ a
  mov r5, r1 @ b
  mov r6, r2 @ c
  mov r7, r3 @ d
  ldr r8, [sp, #40] @ e
  ldr r9, [sp, #44] @ h
  vmov.f32 s16, s2 @ g
  vmov.f64 d9, d0 @ f
  bl imprimir

  add r4, r4, r5
  add r4, r4, r6
  add r4, r4, r7
  add r4, r4, r8
  add r4, r4, r9

  vmov s0, r4
  vcvt.f64.s32 d0, s0

  vcvt.f64.f32 d1, s16
  vadd.f64 d0, d0, d1
  vadd.f64 d0, d0, d9

  vcvt.s32.f64 s0, d0
  vmov r0, s0

  vpop {d9}
  vpop {s16}
  pop {r4, r5, r6, r7, r8, r9, pc}

main:
  push {r4, r5, r7, lr}

  mov r0, #1 @ a
  mov r1, #2 @ b
  mov r2, #3 @ c
  mov r3, #4 @ d
  vmov.f64 d0, #5.0 @ f
  ldr r4, =g
  vldr s2, [r4] @ g

  @ Apilado
  ldr  r4, =e
  ldr  r4, [r4]        @ e
  ldr  r5, =h
  ldr  r5, [r5]        @ h

  sub  sp, sp, #8      @ reservo 8 bytes en la pila
  str  r4, [sp, #0]    @ e en la posición más baja
  str  r5, [sp, #4]    @ h arriba de e

  bl calculo
  add sp, sp, #8
  
  mov r1, r0
  ldr r0, =str2
  bl printf

  mov r0, #0
  pop {r4, r5, r7, pc}
