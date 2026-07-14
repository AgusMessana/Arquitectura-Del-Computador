.text
.global fact1
.global fact2

fact1:
  pushq %rbp
  movq %rsp, %rbp

  movq %rdi, %rax
  cmpq $1, %rdi
  jle fin_1

  pushq %rdi
  decq %rdi
  call fact1

  popq %rdi
  mulq %rdi

fin_1:
  popq %rbp
  ret

fact2:
  pushq %rbp
  movq %rsp, %rbp

  movq $1, %rax
  cmpq $1, %rdi
  jbe fin_2

ciclo:
  mulq %rdi
  decq %rdi
  cmpq $1, %rdi
  ja ciclo

fin_2:
  popq %rbp
  ret
