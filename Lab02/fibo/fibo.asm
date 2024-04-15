BITS 64

section .data
  printfFmt db "%d",10,0
  scanfFmt db "%d",0

section .bss
  number resq 1

section .text

global main

extern printf
extern scanf

main:
  push rbp
  mov rbp, rsp

  mov rax, 0
  mov rdi, scanfFmt
  mov rsi, number
  call scanf

  push qword [number]
  call _fibo

  mov rsi, rax
  mov rax, 0
  mov rdi, printfFmt
  call printf

  leave
  ret

_fibo:
  push rbp
  mov rbp, rsp
  sub rsp, 8

  xor rbx, rbx
  mov rbx, [rsp + 24]
  cmp rbx, 2
  jl .return_fibo

.recursive_fibo:
  mov rax, rbx
  dec rax
  push rax
  call _fibo
  mov [rbp - 8], rax
  mov rax, qword [rsp]
  dec rax
  mov qword [rsp], rax
  call _fibo
  add rax, [rbp - 8]
  add rsp, 8

.return_fibo:
  leave
  ret

