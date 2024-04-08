BITS 64

section .data
  scanfNumFmt db "%d",0
  printfNumFmt db "%d",10,0

section .bss
  first resq 1
  second resq 1

section .text
extern scanf
extern printf

global main

main:

push rbp
mov rbp, rsp

mov rax, 0
mov rdi, scanfNumFmt
mov rsi, first
call scanf

mov rax, 0
mov rdi, scanfNumFmt
mov rsi, second
call scanf

push qword [first]
push qword [second]

call _nwd

mov rbx, rax

mov rax, 0
mov rdi, printfNumFmt
mov rsi, rbx
call printf

leave

mov rax, 0x3c
mov rdi, 0
syscall

_nwd:

push rbp
mov rbp, rsp

mov r8, [rbp+16]
mov r9, [rbp+24]

.while_start:
cmp r9, 0
jz .while_end

xor rdx, rdx
mov rax, r8
mov rcx, r9
div rcx
mov r8, r9
mov r9, rdx
jmp .while_start

.while_end:
mov rax, r8

mov rsp, rbp
pop rbp
ret
