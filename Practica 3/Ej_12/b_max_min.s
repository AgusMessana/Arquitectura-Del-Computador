.data
  list: .long 10, 20, 30, 40, 50, 60, 70, 80, 90, 100
  length: .byte 10

.text
.global main
main:
  movzbl length, %ecx # Contador para el loop. Limpio.
  xorq %r8, %r8 # Limpio registro r8 para usarlo para guardar el mínimo.
  movslq list, %r8 # Pongo el primer elemento como candidato mínimo.
  movq %r8, %r9 # Pongo el primer elemento como candidato máximo.
  xorq %rbx, %rbx # Limpio registro rbx para usarlo como auxiliar.
  xorq %rdx, %rdx # Limpio registro rdx para usarlo como índice.

comparacion:
  movslq list(, %rdx, 4), %rbx
  cmp %r8, %rbx
  jge no_actualizar_min
  movq %rbx, %r8
no_actualizar_min:
  cmp %r9, %rbx
  jle no_actualizar
  movq %rbx, %r9
no_actualizar:
  incq %rdx
  loop comparacion

fin:
  ret
