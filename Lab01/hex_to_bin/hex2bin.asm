BITS 64

; 2. Pobrać ze standardowego strumienia wejściowego ciąg znaków dowolnej długości, potraktować każdy znak jako zapis cyfry szesnastkowej (np. znak 'A' odpowiada wartości 10 dziesiętnie) i skonstruować liczbę w kodzie naturalnym binarnym lub U2. Wynik wypisać na standardowy strumień wyjściowy. Zakładamy, że wprowadzane są wyłącznie znaki 'A'­'F' i cyfry.

section .data
  new_line db 0xa

section .bss
  ; input resb 256
  ; input_len resd 1

  input_char resb 1

  hex_digit_bin resb 4  ; jedna cyfra szesnastkowa zajmuje 4 bity

section .text

global _start

_start:
  ; prolog funkcji
  push rbp
  mov rbp, rsp

.loop:
  call _get_char
  cmp rax, 1
  jne .exit
  xor rdi, rdi
  mov rdi, [input_char]
  cmp rdi, 65 ; 65 = 'A'
  jge .letter ; jeśli input_char >= 65 to znaczy, że to litera
  jmp .digit  ; w przeciwnym razie jest to cyfra
.letter:
  sub rdi, 55 ; odejmujemy 55 ponieważ A to szesnastkowo 10
  jmp .convert
.digit:
  sub rdi, 48
.convert:
  call _process_hex_digit
  mov rdi, hex_digit_bin
  mov rsi, 4
  call _print
  jmp .loop

;   call _get_input
;   mov [input_len], rax
;
;   mov rdi, input
;   mov rsi, [input_len]
;   call _println
;
;   mov rcx, [input_len]
;   xor rdx, rdx
; .iterate_input:
;   xor rax, rax
;   mov al, [input + rdx]
;   mov rdi, rax
;   cmp rdi, 65
;   jge .is_letter
;   jmp .is_digit
; .is_letter:
;   sub rdi, 55
;   jmp .process
; .is_digit:
;   sub rdi, 48
; .process:
;   call _process_hex_digit
;   mov rdi, hex_digit_bin
;   mov rsi, 4
;   call _print
;   inc rdx
;   loop .iterate_input

  ; epilog funkcji
  mov rbp, rsp
  pop rbp

.exit:
  mov rax, 0x3c
  mov rdi, 0
  syscall

_process_hex_digit:
  push rbp
  mov rbp, rsp
  push rdi
  push rax
  push rbx
  push rcx
  push rdx
  
  call _clear_buffer
  xor rax, rax
  mov rax, rdi
  mov rcx, 4    ; jedna cyfra szesnastkowa zajmuje 4 bity
.loop:
  mov rdx, rax
  and rdx, 0x01 ; sprawdzamy czy ostatni bit liczby to 1 czy 0
  mov rbx, rdx
  add rbx, 48   ; zamieniamy na znak
  mov [hex_digit_bin + rcx - 1], bl ; wpisujemy do bufora "od końca" (od najmniej znaczącej pozycji)
  shr rax, 1    ; przesuwamy bitowo w prawo ucinając sprawdzony bit
  loop .loop

  pop rdx
  pop rcx
  pop rbx
  pop rax
  pop rdi
  leave
  ret

_clear_buffer:
  xor rax, rax
  mov [hex_digit_bin], rax
  ret
; _get_input:
;   push rbp
;   mov rbp, rsp
;   push rdi
;   push rbx
;   push rcx
;   push rdx
;
;   mov rax, 0
;   mov rdi, 0
;   mov rsi, input
;   mov rdx, 256
;   syscall
;
;   pop rdx
;   pop rcx
;   pop rbx
;   pop rdi
;   leave
;   ret

_print:
  push rbp
  mov rbp, rsp
  push rdi
  push rax
  push rbx
  push rcx
  push rdx


  mov rdx, rsi
  mov rsi, rdi
  mov rax, 1
  mov rdi, 1
  syscall

  pop rdx
  pop rcx
  pop rbx
  pop rax
  pop rdi
  leave
  ret

_println:
  push rbp
  mov rbp, rsp
  call _print

  mov rdi, new_line
  mov rsi, 1
  call _print

  leave
  ret

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
