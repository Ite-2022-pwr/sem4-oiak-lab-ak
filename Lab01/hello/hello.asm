BITS 64

; 1. Proszę przepisać i skompilować kod zamieszczony we wzorcowym sprawozdaniu.

section .data
  msg db "Hello, World!", 10, 0 ; tekst do wypisania
  msg_len equ $-msg             ; długość tekstu do wypisania

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

