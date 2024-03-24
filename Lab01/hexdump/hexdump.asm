BITS 64

section .data
  hex_fmt db "0x%02X ", 0

section .bss
  buffer resb 256
  buffer_len resd 1

section .text
extern printf
extern fflush

global main

main:
  push rbp
  mov rbp, rsp

  call _get_input
  mov [buffer_len], rax
  
  mov rcx,  [buffer_len]
.loop:
  mov r8, [buffer_len]
  sub r8, rcx
  mov r14, rcx

  mov rdi, hex_fmt
  xor rsi, rsi
  xor rax, rax
  mov al, [buffer + r8]
  mov rsi, rax
  mov rax, 0
  call printf
  xor rdi, rdi
  call fflush
  mov rcx, r14 
  loop .loop

.exit:
  leave

  mov rax, 0x3c
  mov rdi, 0
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

