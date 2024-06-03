BITS 64

extern printf

section .note.GNU-stack

section .data
align 32
  
  matrixA     dq    1., 3., 5., 7.
              dq    9., 11., 13., 15.
              dq    17., 19., 21., 23.
              dq    25., 27., 29., 31.

  matrixB     dq    2., 4., 6., 8.
              dq    10., 12., 14., 16.,
              dq    18., 20., 22., 24.,
              dq    26., 28., 30., 32.

section .bss
align 32

  product resq 16

section .text
global main
global multiply_matrix4x4_avx

main:
  push rbp
  mov rbp, rsp

  mov rsi, matrixA
  call print_matrix4x4

  mov rsi, matrixB
  call print_matrix4x4

  mov rdi, matrixA
  mov rsi, matrixB
  mov rdx, product
  call multiply_matrix4x4_avx

  mov rsi, product
  call print_matrix4x4

  leave

  mov rax, 0x3c
  xor rdi, rdi
  syscall

multiply_matrix4x4_avx:
  push rbp
  mov rbp, rsp

  xor rax, rax
  mov rcx, 4
  vzeroall        ; zerowanie rejestrów ymm

.loop:
  vmovapd ymm0, [rsi]

  vbroadcastsd ymm1, [rdi+rax]
  vfmadd231pd ymm12, ymm1, ymm0

  vbroadcastsd ymm1, [rdi + 32 + rax]
  vfmadd231pd ymm13, ymm1, ymm0

  vbroadcastsd ymm1, [rdi+64+rax]
  vfmadd231pd ymm14, ymm1, ymm0

  vbroadcastsd ymm1, [rdi+96+rax]
  vfmadd231pd ymm15, ymm1, ymm0

  add rax, 8    ; jeden element ma 8 bajtów
  add rsi, 32   ; każdy wiersz ma 32 bajty

  loop .loop

  vmovapd [rdx], ymm12
  vmovapd [rdx+32], ymm13
  vmovapd [rdx+64], ymm14
  vmovapd [rdx+96], ymm15
  xor rax, rax

  leave
  ret

print_matrix4x4:
section .data
  .fmt db "%f",9,"%f",9,"%f",9,"%f",10,0
section .text
  push rbp
  mov rbp, rsp

  push rbx
  push r15

  mov rdi, .fmt
  mov rcx, 4
  xor rbx, rbx

.loop:
  movsd xmm0, [rsi+rbx]
  movsd xmm1, [rsi+rbx+8]
  movsd xmm2, [rsi+rbx+16]
  movsd xmm3, [rsi+rbx+24]
  mov rax, 4

  push rcx
  push rsi
  push rdi

  ; wyrównanie stosu w razie potrzeby
  xor r15, r15
  test rsp, 0xf
  setnz r15b
  shl r15, 3
  sub rsp, r15

  call printf
  add rsp, r15    ; przywracanie stosu

  pop rdi
  pop rsi
  pop rcx

  add rbx, 32     ; kolejny wiersz
  loop .loop

  pop r15
  pop rbx
  leave
  ret
