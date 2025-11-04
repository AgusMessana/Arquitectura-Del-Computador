.data
list: .long 10, 20, 30, 40, 50, 60, 70, 80, 90, 100
length: .byte 10

.text
.global main
main:
  movzbq length, %rcx       # Guardamos la longitud para el loop
  movq %rcx, %r9            # Guardamos la dirección para el promedio
  leaq list, %rsi           # rsi = puntero a list[0]
  xorl %eax, %eax           # rax = 0 (suma total)
  movl $0x80000000, %ebx    # ebx = -2.147.483.648 (valor más chico)
  movl $0x7FFFFFFF, %edi    # edi = 2.147.483.648 (valor más grande)
  xorl %r8d, %r8d           # r8d = 0 (guardará list[i])

loop_calculos:
  movl (%rsi), %r8d
  addl %r8d, %eax

  # Actualizar el máximo
  cmpl %r8d, %ebx           # Compara el max_actual con list[i]
  cmovl %r8d, %ebx          # Si ebx < r8d (nuevo max), actualiza ebx

  # Actualizar mínimo
  cmpl %r8d, %edi           # Compara el min_actual con list[i]
  cmovg   %r8d, %edi        # Si edi > r8d (nuevo min), actualiza edi

  # Avanzar al siguiente elemento
  addq $4, %rsi
  loop loop_calculos

  # Calculamos el promedio
  movq %r9, %rcx            # Restauramos la longitud
  cdq                       # cdq extiende EAX a EDX:EAX. Como EAX es positivo, EDX se vuelve 0
  idivl %ecx                # (EDX:EAX) / ECX (0:550) / 10

  ret
