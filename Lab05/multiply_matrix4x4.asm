BITS 64

extern printf

section .note.GNU-stack

section .data
align 32
  
  matrixA     dq    1., 3., 5., 7.
              dq    9., 11., 13., 15.
              dq    17., 19., 21., 23.
              dq    25., 27., 29., 31.

  matrixB     dq    2., 4., 6., 8.
              dq    10., 12., 14., 16.
              dq    18., 20., 22., 24.
              dq    26., 28., 30., 32.

section .bss
align 32

  product resq 16

section .text
global main
global multiply_matrix4x4

main:
  push rbp
  mov rbp, rsp

  mov rsi, matrixA
  call print_matrix4x4

  mov rsi, matrixB
  call print_matrix4x4

  mov rdi, matrixA
  mov rsi, matrixB
  mov rdx, product
  call multiply_matrix4x4

  mov rsi, product
  call print_matrix4x4

  leave

  mov rax, 0x3c
  xor rdi, rdi
  syscall

multiply_matrix4x4:
  push rbp
  mov rbp, rsp

  mov r8, 0 ; numer wiersza macierzy A (i)

.loop_rows:
  cmp r8, 4
  jge .done

  mov r9, 0 ; numer kolumny macierzy B (j)

.loop_cols:
  cmp r9, 4
  jge .next_row

  pxor xmm0, xmm0

  mov r10, 0 ; element (A[i])[k] i B[k][j]

.loop_elements:
  cmp r10, 4
  jge .store_result

  ; A[i][k]
  mov rax, rdi
  mov r11, r8
  imul r11, 32 ; r11 = i * 32 (4 elementy wiersza * 8 bajtów każdy)
  add rax, r11
  mov r11, r10
  shl r11, 3 ; r11 = k * 8 (rozmiar elementu)
  add rax, r11
  movsd xmm1, qword [rax]

  ; B[k][j]
  mov rbx, rsi
  mov r11, r10
  imul r11, 32 ; r11 = k * 32 (4 elementy kolumny * 8 bajtów każdy)
  add rbx, r11
  mov r11, r9
  shl r11, 3 ; r11 = j * 8 (rozmiar elementu)
  add rbx, r11
  movsd xmm2, qword [rbx]

  mulsd xmm1, xmm2
  addsd xmm0, xmm1

  inc r10
  jmp .loop_elements

.store_result:
  mov rcx, rdx
  mov r11, r8
  imul r11, 32 ; r11 = i * 32 (4 elementy wiersza * 8 bajtów każdy)
  add rcx, r11
  mov r11, r9
  shl r11, 3 ; r11 = j * 8 (rozmiar elementu)
  add rcx, r11
  movsd qword [rcx], xmm0

  inc r9
  jmp .loop_cols

.next_row:
  inc r8
  jmp .loop_rows

.done:
  leave
  ret

print_matrix4x4:
section .data
  .fmt db "%f",9,"%f",9,"%f",9,"%f",10,0
section .text
  push rbp
  mov rbp, rsp

  push rbx
  push r15

  mov rdi, .fmt
  mov rcx, 4
  xor rbx, rbx

.loop:
  movsd xmm0, [rsi+rbx]
  movsd xmm1, [rsi+rbx+8]
  movsd xmm2, [rsi+rbx+16]
  movsd xmm3, [rsi+rbx+24]
  mov rax, 4

  push rcx
  push rsi
  push rdi

  ; wyrównanie stosu w razie potrzeby
  xor r15, r15
  test rsp, 0xf
  setnz r15b
  shl r15, 3
  sub rsp, r15

  call printf
  add rsp, r15    ; przywracanie stosu

  pop rdi
  pop rsi
  pop rcx

  add rbx, 32     ; kolejny wiersz
  loop .loop

  pop r15
  pop rbx
  leave
  ret
