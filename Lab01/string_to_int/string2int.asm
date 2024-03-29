BITS 64

; 5a. Pobrać ze standardowego strumienia wejściowego ciąg znaków o dowolnej długości, potraktować ten ciąg jako zapis dziesiętny pewnej liczby i zapisać wartość tej liczby binarnie w pamięci.

; 5b. Binarną reprezentację liczby z zadania 5 wypisać na standardowy strumień wyjściowy w postaci ciągu znaków reprezentujących wartość dziesiętną.

section .data
  number_fmt db "%d", 10, 0

section .bss
  ; buffer resb 256
  ; buffer_len resq 1
  number resq 1
  input_char resb 1

section .text
extern printf

global main

main:
  push rbp
  mov rbp, rsp

  mov rbx, 10
.loop:
  call _get_char
  cmp rax, 1
  jne .print

  xor rax, rax
  mov rax, [number]
  mul rbx
  xor rdx, rdx 
  mov dl, [input_char]
  mov r9, rdx
  sub r9, 48
  add rax, r9
  mov [number], rax

  jmp .loop

.print
  mov rax, 0
  mov rdi, number_fmt
  mov rsi, [number]
  call printf

  leave
  mov rax, 0x3c
  mov rax, 0
  syscall

_get_char:
  push rbp
  mov rbp, rsp
  push rdi
  push rbx
  push rcx
  push rdx
  
  xor rax, rax
  mov [input_char], rax

  mov rax, 0
  mov rdi, 0
  mov rsi, input_char
  mov rdx, 1
  syscall

  pop rdx
  pop rcx
  pop rbx
  pop rdi
  leave
  ret
