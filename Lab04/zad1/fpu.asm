BITS 64

section .note.GNU-stack

section .text

global get_fpu
global set_fpu
global set_fpu_precision
global set_fpu_rounding
global set_fpu_exceptions

get_fpu:
  push rbp
  mov rbp, rsp

  fstcw [rbp-8]
  mov ax, word [rbp-8]

  leave
  ret

set_fpu:
  push rbp
  mov rbp, rsp

  mov [rbp-16], rdi
  fldcw [rbp-16]

  leave
  ret

set_fpu_precision:
  push rbp
  mov rbp, rsp

  fstcw [rbp-16]
  mov rbx, [rbp-16]
  and rbx, 0xf3ff
  or rbx, rdi
  mov [rbp-16], rbx
  fldcw [rbp-16]

  leave
  ret

set_fpu_rounding:
  push rbp
  mov rbp, rsp

  fstcw [rbp-16]
  mov rbx, [rbp-16]
  and rbx, 0xfcff
  or rbx, rdi
  mov [rbp-16], rbx
  fldcw [rbp-16]

  leave
  ret

set_fpu_exceptions:
  push rbp
  mov rbp, rsp

  fstcw [rbp-16]
  mov rbx, [rbp-16]
  and rbx, 0xffe0
  or rbx, rdi
  mov [rbp-16], rbx
  fldcw [rbp-16]

  leave
  ret
