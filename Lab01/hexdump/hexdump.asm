BITS 64

; 4. Pobrać ze standardowego strumienia wejściowego ciąg bajtów o zadanej długości i wyprowadzić na standardowy strumień wyjściowy ciąg znaków reprezentujący szesnastkowy zapis wartości tej liczby.

section .data
  hex_fmt db "0x%02X ", 0 ; tekst formatujący, który wypisze liczbę szesnastkowo

section .bss
  input_char resb 1       ; miejsce na wprowadzany pojedynczy znak z STDIN

section .text
extern printf             ; zewnętrzna funkcja printf
extern fflush             ; zewnętrzna funkcja fflush (wymuszenie wypisania bufora na STDOUT)

global main

main:
  ; prolog funkcji
  push rbp
  mov rbp, rsp

.loop:
  call _get_char
  cmp rax, 1
  jne .exit

  mov rdi, hex_fmt
  xor rsi, rsi
  xor rax, rax
  mov al, [input_char]
  mov rsi, rax
  mov rax, 0
  call printf
  xor rdi, rdi
  call fflush
  jmp .loop
 
.exit:
  leave

  mov rax, 0x3c
  mov rdi, 0
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
