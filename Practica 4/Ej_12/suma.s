.data
  a: .word 1, 2, 3, 4 @ int a[] = { 1, 2, 3, 4}
  b: .word 2, 3, 4, 5 @ int b[] = { 2, 3, 4, 5}
  msg: .asciz "La suma es: %d\n"

.text
.global suma
.global main

suma:
  @ r0 -> a
  @ r1 -> b
  @ r2 -> L
  @ r3 -> i
  @ r4 -> result
  push {r4, r5}
  mov r3, #0
  mov r4, #0

for:
  cmp r3, r2
  bge fin_for

  @ r5 -> array[i]
  ldr r5, [r0, r3, lsl #2] @ r5 = a[i]
  add r4, r4, r5 @ r4 = r4 + r5 = r4 + a[i]
  ldr r5, [r1, r3, lsl #2] @ r5 = b[i]
  add r4, r4, r5 @ r4 = r4 + r5 = r4 + a[i] + b[i]

  add r3, r3, #1
  b for

fin_for:
  mov r0, r4
  pop {r4, r5}
  bx lr

main:
  push {lr} @ Los llamados a función pisan lr, por eso hay que preservarlo.

  ldr r0, =a @ Cargo el arreglo a en r0.
  ldr r1, =b @ Cargo el arreglo b en r1.
  mov r2, #4 @ Muevo la longitud a r2.
  bl suma @ Llamo a suma. El resultado vuelve en r0.

  mov r1, r0 @ Muevo el resultado de suma a r1
  ldr r0, =msg @ Cargo el string en r0.
  bl printf

  mov r0, #0
  pop {lr}
  bx lr
