.text
.global fact2
fact2:
  # x se guarda en %rdi por convención
  movq $1, %rax         # acc = 1
loop:
  cmpq $1, %rdi          # while (x > 1)
  jle end
  imulq %rdi, %rax       # acc *= x
  decq %rdi              # x--
  jmp loop
end:
  ret

.text
.global fact1
fact1:
  cmpq $1, %rdi
  jle caso_base

  # Guardar x en el stack para usarlo después
  pushq %rdi

  # x = x - 1
  decq %rdi
  call fact1

  # Recupero el x original
  popq %rdi

  # Multiplicar: %rax = x * %rax
  imulq %rdi, %rax
  ret

caso_base:
  movq $1, %rax       # return x (en %rax está lo que se retorna)
  ret
