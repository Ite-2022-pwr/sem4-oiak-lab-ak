BITS 64

section .data
  msg db "Hello, World!", 10, 0
  msg_len equ $-msg

section .bss
section .text

global _start

_start:
  mov rax, 1      ; syswrite
  mov rdi, 1      ; stdout
  mov rsi, msg
  mov rdx, msg_len
  syscall

  mov rax, 0x3c   ; exit
  mov rdi, 0
  syscall

