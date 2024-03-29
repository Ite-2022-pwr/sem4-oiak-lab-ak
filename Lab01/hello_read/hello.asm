BITS 64

; 2. Proszę modyfikować kod do postaci pozwalającej wykorzystać funkcję systemową read.

section .data
  msg db "Hello, "
  msg_len equ $-msg

section .bss
  buffer resb 20

section .text

global _start

_start:
  mov rax, 0      ; read
  mov rdi, 0      ; stdin
  mov rsi, buffer
  mov rdx, 16
  syscall
  mov r9, rax     ; input length

  mov rdi, msg
  mov rsi, msg_len
  call print

  mov rdi, buffer
  mov rsi, r9
  call print

  mov rax, 0x3c   ; exit
  mov rdi, 0
  syscall

print:
  mov rdx, rsi
  mov rsi, rdi
  mov rax, 1      ; syswrite
  mov rdi, 1      ; stdout
  syscall
  ret

