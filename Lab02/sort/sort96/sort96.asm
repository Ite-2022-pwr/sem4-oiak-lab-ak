BITS 64

%define EXIT_NR 60
%define READ_NR 0
%define WRITE_NR 1

%define STDIN 0
%define STDOUT 1
%define EXIT_CODE_SUCCESS 0
  
%define MAX_NUMBERS 1024*1024*16
%define BYTES_PER_NUMBER 12
%define MAX_BYTES MAX_NUMBERS * BYTES_PER_NUMBER

section .bss

  numbers resb MAX_BYTES
  nBytes resq 1
  nNumbers resq 1

section .text

global main

main:
  push rbp
  mov rbp, rsp

  ; read input data
  mov rax, READ_NR
  mov rdi, STDIN
  mov rsi, numbers
  mov rdx, MAX_BYTES
  syscall

  mov [nBytes], rax

  cmp rax, 1
  jl noDataRead

  mov rbx, BYTES_PER_NUMBER
  xor rdx, rdx
  div rbx

  cmp rdx, 0
  jne wrongNumberOfBytes

  mov [nNumbers], rax

  mov rdi, rax
  dec rdi
.sortOuter:
  
  xor rsi, rsi
  .sortInner:
    ; address calculation
    mov rax, rsi
    mov rbx, BYTES_PER_NUMBER
    mul rbx
    mov rcx, rax

    ; little endian
    xor rax, rax
    mov eax, [numbers + 8 + rcx]
    cmp [numbers + BYTES_PER_NUMBER + 8 + rcx], eax
    jg .skipSwap
    jl .swap

    mov eax, [numbers + 4 + rcx]
    cmp [numbers + BYTES_PER_NUMBER + 4 + rcx], eax
    ja .skipSwap
    jb .swap

    mov eax, [numbers + rcx]
    cmp [numbers + BYTES_PER_NUMBER + rcx], eax
    jae .skipSwap

    .swap:
      mov eax, [numbers + rcx]
      xchg [numbers + BYTES_PER_NUMBER + rcx], eax
      mov [numbers + rcx], eax

      mov eax, [numbers + 4 + rcx]
      xchg [numbers + BYTES_PER_NUMBER + 4 + rcx], eax
      mov [numbers + 4 + rcx], eax

      mov eax, [numbers + 8 + rcx]
      xchg [numbers + BYTES_PER_NUMBER + 8 + rcx], eax
      mov [numbers + 8 + rcx], eax

    .skipSwap:
    
    inc rsi
    cmp rsi, rdi
    jb .sortInner

  dec rdi
  cmp rdi, 0
  jg .sortOuter

  mov rax, WRITE_NR
  mov rdi, STDOUT
  mov rsi, numbers
  mov rdx, [nBytes]
  syscall

  leave
  mov rdi, EXIT_CODE_SUCCESS
  jmp endProgram

; ----------------------------------------

noDataRead:
  mov rdi, 1
  jmp endProgram

wrongNumberOfBytes:
  mov rdi, 2
  jmp endProgram

endProgram:
  mov rax, EXIT_NR
  syscall
