BITS 64

extern printf

section .note.GNU-stack

section .data
  fmt_noavx       db    "Ten procesor nie obsługuje AVX :(",10,0
  fmt_avx         db    "Ten procesor obsługuje AVX :D",10,0
  fmt_noavx2      db    "Ten procesor nie obsługuje AVX2 :(",10,0
  fmt_avx2        db    "Ten procesor obsługuje AVX2 :D",10,0
  fmt_noavx512    db    "Ten procesor nie obsługuje AVX-512 :(",10,0
  fmt_avx512      db    "Ten procesor obsługuje AVX-512 :D",10,0

section .bss

section .text
  global main

main:
  push rbp
  mov rbp, rsp

  call cpu_sse
  
the_exit:
  leave
  mov rax, 0x3c
  xor rdi, rdi
  syscall

cpu_sse:
  push rbp
  mov rbp, rsp

  ; AVX
  mov eax, 1
  cpuid
  mov eax, 28   ; testowanie 28 bitu
  bt ecx, eax
  jnc no_avx
  xor rax, rax
  mov rdi, fmt_avx
  call printf

  ; AVX2
  mov eax, 7
  xor ecx, ecx
  cpuid
  mov eax, 5
  bt ebx, eax
  jnc no_avx2
  xor rax, rax
  mov rdi, fmt_avx2
  call printf

  ; AVX-512
  mov eax, 7
  xor ecx, ecx
  cpuid
  mov eax, 16
  bt ebx, eax
  jnc no_avx512
  xor rax, rax
  mov rdi, fmt_avx512
  call printf
  jmp the_exit

no_avx:
  xor rax, rax
  mov rdi, fmt_noavx
  call printf
  jmp the_exit

no_avx2:
  xor rax, rax
  mov rdi, fmt_noavx2
  call printf
  jmp the_exit

no_avx512:
  xor rax, rax
  mov rdi, no_avx512
  call printf
  jmp the_exit
