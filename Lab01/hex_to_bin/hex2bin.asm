BITS 64

section .data
  new_line db 0xa

section .bss
  ; input resb 256
  ; input_len resd 1

  input_char resb 1

  hex_digit_bin resb 4

section .text

global _start

_start:
  push rbp
  mov rbp, rsp

.loop:
  call _get_char
  cmp rax, 0
  je .exit
  xor rdi, rdi
  mov rdi, [input_char]
  cmp rdi, 65
  jge .letter
  jmp .digit
.letter:
  sub rdi, 55
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
;
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

  mov rax, rdi
  mov rcx, 4
.loop:
  mov rdx, rax
  and rdx, 0x01
  mov rbx, rdx
  add rbx, 48
  mov [hex_digit_bin + rcx - 1], bl
  shr rax, 1
  loop .loop

  pop rdx
  pop rcx
  pop rbx
  pop rax
  pop rdi
  leave
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
