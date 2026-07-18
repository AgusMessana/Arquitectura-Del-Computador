.text
.global determinante
determinante:
  @ [i  j]
  @ [k  l]

  @ s0 -> i
  @ s1 -> j
  @ s2 -> k
  @ s3 -> l

  vmul.f32 s4, s0, s3 @ s4 = s0 * s3 = i*l
  vmul.f32 s5, s2, s1 @ s5 = s2 * s1 = k*j
  vsub.f32 s0, s4, s5 @ s0 = s4 - s5 = i*l - k*j

  bx lr
