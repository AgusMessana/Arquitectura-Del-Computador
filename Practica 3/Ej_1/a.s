.global main
main:
  movb $0xFF, %al
  ret

# El programa mueve el valor 0xFF (255) a la parte baja del registro principal %rax. Luego, retorna. Por ende, el programa termina con código de ejecución 255.
