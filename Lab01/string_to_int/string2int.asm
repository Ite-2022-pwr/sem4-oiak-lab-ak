BITS 64

section .data
  number_fmt db "%d", 10, 0

section .bss
  buffer resb 256
  buffer_len resq 1
  number resq 1

section .text
extern printf

global main

main:
  push rbp
  mov rbp, rsp

  call _get_input
  mov [buffer_len], rax

  mov rcx, [buffer_len]
  mov rbx, 10
.loop:
  mov rax, [number]
  mul rbx
  mov r8, [buffer_len]
  sub r8, rcx
  xor rdx, rdx
  mov dl, [buffer + r8]
  mov r9, rdx
  sub r9, 48
  add rax, r9
  mov [number], rax
  loop .loop

  mov rax, 0
  mov rdi, number_fmt
  mov rsi, [number]
  call printf

  leave
  mov rax, 0x3c
  mov rax, 0
  syscall

_get_input:
  push rbp
  mov rbp, rsp

  mov rax, 0
  mov rdi, 0
  mov rsi, buffer
  mov rdx, 256
  syscall

  leave
  ret

