BITS 64

section .text

global mulInt
global addFloat
global sumFloat

mulInt:
  push rbp
  mov rbp, rsp

  mov rax, rdi
  mul rsi

  leave
  ret

addFloat:
  push rbp
  mov rbp, rsp

  addss xmm0, xmm1

  leave
  ret

sumFloat:
  push rbp
  mov rbp, rsp

  mov rcx, rsi
  xorps xmm0, xmm0
.loop:
  mov rax, rsi
  sub rax, rcx
  movss xmm1, [rdi + rax * 4]
  addss xmm0, xmm1
  loop .loop

  leave
  ret
