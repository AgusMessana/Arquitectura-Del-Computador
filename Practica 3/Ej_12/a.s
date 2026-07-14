.data
  list: .long 10, 20, 30, 40, 50, 60, 70, 80, 90, 100
  length: .byte 10

.text
.global main
main:
  movzbl length, %ecx # Contador para el loop. Limpio.
  xorq %rbx, %rbx # Limpio registro rbx para guardar la suma.
  xorq %rdx, %rdx # Limpio registro rdx para usarlo como índice.
  xorq %r8, %r8 # Limpio registro r8 para usarlo de auxiliar.
suma:
  movslq list(, %rdx, 4), %r8 # Mueve y extiende con signo.
  addq %r8, %rbx
  incq %rdx
  loop suma
fin:
  ret
