.global main
main:
  # a)
  movq $0x1122334455667788, %rax
  rorq $32, %rax

  # b)
  movq $0x1122334455667788, %rbx # Valor (26 1's)
  movq $64, %rcx # Contador
  movq $0, %rdx # Acumulador
  etiqueta:
    rolq $1, %rbx
    adcq $0, %rdx
    loop etiqueta
  fin:
    ret
