BITS 64

; * 3. To samo, co w punkcie 2, ale należy dodać kod wykrywający niepoprawne znaki we wczytanym ciągu.

section .data
  new_line db 0xa
  err_msg db 10, "Niedozwolony znak: "
  err_msg_len equ $-err_msg

section .bss
  input_char resb 1

  hex_digit_bin resb 4 ; jedna cyfra szesnastkowa zajmuje 4 bity

section .text

global _start

_start:
  ; prolog funkcji
  push rbp
  mov rbp, rsp

.loop:
  call _get_char
  cmp rax, 0
  je .exit
  xor rdi, rdi
  mov rdi, [input_char]

  cmp rdi, 70
  jg _on_error  ; jeśli wprowadzony znak jest większy od 'F', to oznacza niepoprawną cyfrę szesnastkową
  cmp rdi, 48
  jl _on_error  ; jeśli wprowadzony znak jest mniejszy od '0', to oznacza niepoprawną cyfrę szesnastkową

  cmp rdi, 65
  jge .letter   ; wprowadzony znak to litera
  jmp .digit    ; wprowadzony znak to cyfra
.letter:
  sub rdi, 55
  jmp .convert
.digit:
  cmp rdi, 57
  jg _on_error  ; jeśli wprowadzony znak jest większy od '9' (jest pomiędzy '9' a 'A'), to oznacza niepoprawną cyfrę szesnastkową
  sub rdi, 48
.convert:
  call _process_hex_digit
  mov rdi, hex_digit_bin
  mov rsi, 4
  call _print
  jmp .loop

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
  mov rcx, 4 ; jedna cyfra szesnastkowa zajmuje 4 bity
.loop:
  mov rdx, rax
  and rdx, 0x01 ; sprawdzamy czy ostatni bit to 1 czy 0
  mov rbx, rdx
  add rbx, 48   ; zamieniamy na znak
  mov [hex_digit_bin + rcx - 1], bl ; zapisujemy "od końca" (od najmniej znaczącego bitu)
  shr rax, 1    ; przesuwamy liczbę bitowo w prawo o 1 pozbywając się sprawdzonego już bitu
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

_on_error:
  push rbp
  mov rsp, rbp

  mov rdi, err_msg
  mov rsi, err_msg_len
  call _print

  mov rdi, input_char
  mov rsi, 1
  call _println

  leave
  
  mov rax, 0x3c
  mov rdi, 1
  syscall
