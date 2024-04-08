BITS 64

%define SIEVE_ARRAY_LENGTH 4096

section .data
  printfNumFmt db "%d",10,0
  scanfNumFmt db "%d",0

section .bss
  sieveArray resb SIEVE_ARRAY_LENGTH
  n resq 1
  prime resq 1

section .text

extern scanf
extern printf

global main

main:

push rbp
mov rbp, rsp

xor rax, rax
mov rdi, scanfNumFmt
mov rsi, n
call scanf

xor rax, rax
mov rax, [n]
cmp rax, SIEVE_ARRAY_LENGTH
jg .bad

call _sieve
call _print_array
jmp .good

.bad:
mov rax, 60
mov rdi, 1
syscall

.good:
leave
mov rax, 60
xor rdi, rdi
syscall

_sieve:
  push rbp
  mov rbp, rsp
  push rax
  push rdi
  push rsi
  push rdx
  push rcx

  mov rcx, 2
.outerloop:
  mov rax, [n]
  cmp rcx, rax
  jg .endOuter

  mov rbx, rcx
.innerloop:
  add rbx, rcx
  cmp rbx, [n]
  jg .endInner

  xor rax, rax
  mov al, byte [sieveArray + rbx]
  cmp rax, 0
  jne .innerloop

  mov rax, 1
  mov [sieveArray + rbx], al

  jmp .innerloop

.endInner:

  inc rcx
  jmp .outerloop

.endOuter:

  pop rcx
  pop rdx
  pop rsi
  pop rdi
  pop rax
  leave
  ret

_print_array:
  push rbp
  mov rbp, rsp

  mov rcx, 2
.loop:
  xor rax, rax
  mov rax, [n]
  cmp rcx, rax
  jg .endLoop
  
  xor rax, rax
  mov al, byte [sieveArray + rcx]
  cmp rax, 0
  jne .false

  mov rax, 0
  mov rdi, printfNumFmt
  mov rsi, rcx
  push rcx
  call printf
  pop rcx

.false:
  inc rcx
  jmp .loop
.endLoop

  leave
  ret
