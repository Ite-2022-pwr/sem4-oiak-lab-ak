BITS 64

section .data
section .bss
  buffer resb 256  ; bufor

section .text

global _start

_start:
  ; wczytaj litery z STDIN
  mov rax, 0                ; read
  mov rdi, 0                ; stdin
  mov rsi, buffer
  mov rdx, 256
  syscall
  mov r9, rax               ; ilość wprowadzonych znaków

  mov rcx, 0                ; licznik
.loop:
  cmp rcx, r9               ; jeśli r8 >= r9 to zakończ
  jge .finish

  mov al, [buffer + rcx]    ; przenieś literę z bufora do akumulatora
  cmp rax, 65               ; jeśli znak jest mniejszy od A to zakończ
  jl .finish

  cmp rax, 97               ; jeśli znak jest >= 97 to
  jge .lowercase            ; mała litera
  jmp .uppercase            ; w przeciwnym wypadku wielka litera

.lowercase:
  sub al, 32                ; zamień małą literę na wielką
  jmp .update

.uppercase:
  add al, 32                ; zamień wielką literę na małą

.update:
  mov [buffer + rcx], al    ; przenieś zmienioną literę do pamięci

 inc rcx                    ; zwiększ licznik o 1 i wróć na początek pętli
 jmp .loop

.finish:
  mov rdi, buffer           ; zmodyfikowany bufor
  mov rsi, r9               ; ilość znaków
  call print                ; wypisz zmodyfikowany bufor

  mov rax, 60               ; exit
  mov rdi, 0
  syscall

print:
  mov rdx, rsi              ; długość tekstu
  mov rsi, rdi              ; tekst do wypisania
  mov rax, 1                ; syswrite
  mov rdi, 1                ; stdout
  syscall
  ret
