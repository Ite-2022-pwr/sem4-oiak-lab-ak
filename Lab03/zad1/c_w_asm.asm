BITS 64

%define EXIT_NR 60

section .data
  printfIntFmt db "%d",10,0
  printfFloatFmt db "%.3f",10,0

  arr dd 4, 3, 10, 2, 7, 5
  arrLen dd 6

  ai dd 4
  bi dd 6

  af dd 3.14
  bf dd 4.2

section .bss
  mulFloatRes resd 1

section .text

extern printf
extern findMin
extern addInt
extern mulFloat

global main

main:
  push rbp
  mov rbp, rsp

  xor rax, rax
  mov rdi, arr
  mov rsi, [arrLen]
  call findMin

  mov rsi, rax
  mov rdi, printfIntFmt
  xor rax, rax
  call printf

  xor rax, rax
  mov rdi, [ai]
  mov rsi, [bi]
  call addInt
  
  mov rsi, rax
  mov rdi, printfIntFmt
  xor rax, rax
  call printf

  movsd xmm0, [af]
  movsd xmm1, [bf]
  mov rax, 2
  call mulFloat

  cvtps2pd xmm0, xmm0 
  mov rdi, printfFloatFmt
  mov rax, 1
  call printf

  leave
  mov rax, EXIT_NR
  xor rdi, rdi
  syscall

