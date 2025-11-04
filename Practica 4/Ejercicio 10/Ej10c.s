.data
a: .long 1, 2, 3, 4
g: .quad 0x1122334455667788
msg: .asciz "Imprime %c\n"

.text
.global main
main:                         # rsp = 0x7fffffffebc8
  subq $8, %rsp               # rsp = 0x7fffffffebc0
  movq $g, %rax               # rax = 0x0000000000404038 (por tener el $, guardo la dirección la que comienza g)
  movl g+4, %eax              # rax = 0x0000000011223344 (por no tener el $, guardo el valor que hay contando 4 bytes a partir de g+4. Sería 0x44332211, pero por estar en little-endian, lo correcto es 0x11223344)
  movq $3, %rbx               # rbx = 0x0000000000000003
  movb a(, %rbx,4), %al       # rax = 0x0000000011223304 (a + (%rbx * 4) = 0x404028 + (3 * 4))
  leaq msg, %rdi              # rdi = 0x0000000000404040 (calcula la dirección de msg y la guarda en %rdi)
  movb ( %rdi, %rbx, 2), %sil # sil = 0x65 (%rdi + (%rbx * 2) = 0x404040 + (3 * 2). Se pone sólo 0x65 pues es un registro de 1 bytes. 0x65 en código ASCII es 'e')
  xorl %eax, %eax             # rax = 0x0000000000000000
  call printf                 # rax = 0x000000000000000a (*)
  addq $8, %rsp               # rsp = 0x7fffffffebc8
ret

/*
*: En x86-64, los argumentos se pasan a través de registros específicos:
Argumento 1 (el puntero al formato) se pasa en el registro %rdi.
Argumento 2 (el primer valor) se pasa en el registro %rsi.
Argumento 3 (el segundo valor) se pasa en el registro %rdx. Y así sucesivamente.
Antes del call printf tenemos:
-En %rdi, 0x0x0000000000404040
-En %sil (byte bajo de %rsi), 0x65 ('e')
El printf mira el argumento 1 (dirección en %rdi) y empieza a leer la cadena que encuentra allí ("Imprime %c\n").
Cuando llega a %c, que es un indicador de formato, imprime lo que haya en %rsi. Como sólo necesita un caracter (%c) le alcanza con el byte bajo, %sil. Reemplaza %c con 'e' y termina de imprimir la cadena original.
El valor de retorno de %rax es ese ya que la cadena tiene (10)10 = (a)16 caracteres
*/