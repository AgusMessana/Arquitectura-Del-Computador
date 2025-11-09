/*
int func(int a, int b, short c, long d, int *e, float f, double g, int h, int k) {
  return a+b+h+*e+k;
}
*/

func:
  addl %esi, %edi         # Completado
  addl %r9d, %edi         # Completado
  addl (%r8), %edi        # Completado
  addl 16(%rbp), %edi     # Completado
  movl %edi, %eax         # Completado
  ret