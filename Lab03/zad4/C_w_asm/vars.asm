BITS 64

section .data

extern array

section .rodata

extern arrayLen
extern digitFmt

section .text

extern printf

global main

main:
  push rbp
  mov rbp, rsp

  mov eax, dword [arrayLen]
  mov r8, rax
  mov rcx, r8
.loop:
  mov rbx, r8
  sub rbx, rcx
  push rcx
  push r8
  xor rax, rax
  mov rdi, digitFmt
  mov esi, dword [array + rbx * 4]
  call printf
  pop r8
  pop rcx
  loop .loop

  leave
  ret

