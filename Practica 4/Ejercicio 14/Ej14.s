.text
.global suma_cuadrados
suma_cuadrados:  
  pushq %rbx          # rbx guardará la suma total
  pushq %r12          # r12 guardará el contador i
  pushq %r13          # r13 guardará el puntero "argv"
  pushq %r14          # r14 guardará "argc"

  movq %rdi, %r14
  movq %rsi, %r13

  xorq %rbx, %rbx     # rbx = 0 (suma total)
  movq $1, %r12       # r12 = 1 (contador i, empezamos en 1)
  # Comenzamos desde i = 1 pues en i = 0 está el nombre del programa

loop_start:
  # Comprobar si i < argc
  cmpq %r14, %r12     # Compara i con argc
  jge loop_end

  # Apuntamos al primer valor que vamos a sumar y lo llevamos a %rdi, donde lo espera atoi.
  # Lo hacemos mediante r13 + (r12 * 8) pues %r13 contiene la dirección del comienzo de argv (argv[0]). %r12 contiene el índice al que vamos a ir. 8 pues argv es arreglo de punteros, y un puntero ocupa 8 bytes
  movq (%r13, %r12, 8), %rdi

  # Ahora llamamos a atoi. Esto destruye algunos registros, por eso elegimos guardar los datos en los nombrados arriba.
  call atoi

  # atoi devuelve el número (int) en %eax. Lo extendemos a 64 bits
  movslq %eax, %rax

  # Calculamos el cuadrado
  imulq %rax, %rax

  # Sumamos al total
  addq %rax, %rbx

  # Incrementar contador y repetir
  incq %r12
  jmp loop_start

loop_end:
  movq %rbx, %rax
  popq %r14
  popq %r13
  popq %r12
  popq %rbx

  ret
