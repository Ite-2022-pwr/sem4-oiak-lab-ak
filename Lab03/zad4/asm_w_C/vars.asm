BITS 64

section .data

global byteArray
global integer

  byteArray db "ABCDEF", 0
  integer dd 69

section .rodata

global PI

  PI dd 3.14
