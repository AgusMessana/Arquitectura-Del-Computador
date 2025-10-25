.global main
main:
  movq $0x12345678ABCDEF0, %rax
  movq $0, %rbx # Contador de bits = 0
  movq $64, %rcx # Contador de iteraciones

count_loop:
  rolq $1, %rax # Rota RAX a izquierda, bit más significativo va a CF
  adcq $0, %rbx # RBX = RBX + 0 + CF (suma 1 si CF = 1)
  loop count_loop # Decrementa RCX (siempre decrementa este registro por arquitectura) y salta si no es cero

  ret
