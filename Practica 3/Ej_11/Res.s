.data
  arr: .byte 1, 2, 3, 4, 5
  len: .byte 5

.text
.global main
main:
  xorq %rcx, %rcx # Limpiamos basura del registro rcx.
  movb len, %cl # Contador del loop.
  xorq %rbx, %rbx # Limpiamos basura del registro rbx.

apilar:
  movzbl arr(, %rbx, 1), %eax # eax = arr[rbx], sin basura
  pushq %rax # Apilamos los 8 bytes.
  incq %rbx # Pasamos al siguiente elemento del arreglo.
  loop apilar
  
  xorq %rcx, %rcx
  movb len, %cl
  xorq %rbx, %rbx
  
desapilar:
  popq %rax
  movb %al, arr(, %rbx, 1)
  incq %rbx
  loop desapilar
fin:
  ret
