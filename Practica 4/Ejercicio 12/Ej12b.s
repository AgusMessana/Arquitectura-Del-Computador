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
  jge saltear_max           # Salta si max_actual >= list[i]
  movl %r8d, %ebx           # Si no saltó, hay nuevo máx. Lo piso
saltear_max:

  # Actualizar mínimo
  cmpl %r8d, %edi           # Compara el min_actual con list[i]
  jle saltear_min           # Salta si min_actual >= list[i]
  movl %r8d, %edi           # Si no saltó, hay nuevo min. Lo piso
saltear_min:

  # Avanzar al siguiente elemento
  addq $4, %rsi
  loop loop_calculos

  # Calculamos el promedio
  movq %r9, %rcx            # Restauramos la longitud
  cdq                       # cdq extiende EAX a EDX:EAX. Como EAX es positivo, EDX se vuelve 0
  idivl %ecx                # (EDX:EAX) / ECX (0:550) / 10

  ret
