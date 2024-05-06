	.file	"main_optimized.c"
	.intel_syntax noprefix
	.text
	.type	rdtsc, @function
rdtsc:
.LFB6:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
#APP
# 10 "main_optimized.c" 1
	rdtsc
# 0 "" 2
#NO_APP
	mov	DWORD PTR -4[rbp], eax
	mov	DWORD PTR -8[rbp], edx
	mov	eax, DWORD PTR -8[rbp]
	sal	rax, 32
	mov	rdx, rax
	mov	eax, DWORD PTR -4[rbp]
	or	rax, rdx
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	rdtsc, .-rdtsc
	.globl	findMinInMatrix
	.type	findMinInMatrix, @function
findMinInMatrix:
.LFB7:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	r12
	push	rbx
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	mov	rdx, rdi
	mov	eax, esi
	mov	rcx, QWORD PTR [rdx]
	mov	ecx, DWORD PTR [rcx]
	mov	DWORD PTR -20[rbp], ecx
	mov	ebx, 0
	jmp	.L4
.L7:
	mov	r12d, 0
	jmp	.L5
.L6:
	movsx	rcx, ebx
	sal	rcx, 3
	add	rcx, rdx
	mov	rcx, QWORD PTR [rcx]
	movsx	rsi, r12d
	sal	rsi, 2
	add	rcx, rsi
	mov	ecx, DWORD PTR [rcx]
	mov	esi, DWORD PTR -20[rbp]
	cmp	esi, ecx
	cmovle	ecx, esi
	mov	DWORD PTR -20[rbp], ecx
	add	r12d, 1
.L5:
	cmp	r12d, eax
	jl	.L6
	add	ebx, 1
.L4:
	cmp	ebx, eax
	jl	.L7
	mov	eax, DWORD PTR -20[rbp]
	pop	rbx
	pop	r12
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	findMinInMatrix, .-findMinInMatrix
	.globl	findMaxInMatrix
	.type	findMaxInMatrix, @function
findMaxInMatrix:
.LFB8:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	r12
	push	rbx
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	mov	rdx, rdi
	mov	eax, esi
	mov	rcx, QWORD PTR [rdx]
	mov	ecx, DWORD PTR [rcx]
	mov	DWORD PTR -20[rbp], ecx
	mov	ebx, 0
	jmp	.L10
.L13:
	mov	r12d, 0
	jmp	.L11
.L12:
	movsx	rcx, ebx
	sal	rcx, 3
	add	rcx, rdx
	mov	rcx, QWORD PTR [rcx]
	movsx	rsi, r12d
	sal	rsi, 2
	add	rcx, rsi
	mov	ecx, DWORD PTR [rcx]
	mov	esi, DWORD PTR -20[rbp]
	cmp	esi, ecx
	cmovge	ecx, esi
	mov	DWORD PTR -20[rbp], ecx
	add	r12d, 1
.L11:
	cmp	r12d, eax
	jl	.L12
	add	ebx, 1
.L10:
	cmp	ebx, eax
	jl	.L13
	mov	eax, DWORD PTR -20[rbp]
	pop	rbx
	pop	r12
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	findMaxInMatrix, .-findMaxInMatrix
	.globl	fillMatrix
	.type	fillMatrix, @function
fillMatrix:
.LFB9:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp, 8
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	mov	r14, rdi
	mov	r13d, esi
	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	mov	ebx, 0
	jmp	.L16
.L19:
	mov	r12d, 0
	jmp	.L17
.L18:
	movsx	rax, ebx
	sal	rax, 3
	add	rax, r14
	mov	rax, QWORD PTR [rax]
	movsx	rdx, r12d
	sal	rdx, 2
	lea	r15, [rax+rdx]
	call	rand@PLT
	mov	DWORD PTR [r15], eax
	add	r12d, 1
.L17:
	cmp	r12d, r13d
	jl	.L18
	add	ebx, 1
.L16:
	cmp	ebx, r13d
	jl	.L19
	nop
	nop
	add	rsp, 8
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	fillMatrix, .-fillMatrix
	.globl	allocMatrix
	.type	allocMatrix, @function
allocMatrix:
.LFB10:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	rbx
	sub	rsp, 40
	.cfi_offset 3, -24
	mov	DWORD PTR -36[rbp], edi
	mov	eax, DWORD PTR -36[rbp]
	cdqe
	sal	rax, 3
	mov	rdi, rax
	call	malloc@PLT
	mov	QWORD PTR -32[rbp], rax
	mov	DWORD PTR -20[rbp], 0
	jmp	.L21
.L22:
	mov	eax, DWORD PTR -36[rbp]
	cdqe
	sal	rax, 2
	mov	edx, DWORD PTR -20[rbp]
	movsx	rdx, edx
	lea	rcx, 0[0+rdx*8]
	mov	rdx, QWORD PTR -32[rbp]
	lea	rbx, [rcx+rdx]
	mov	rdi, rax
	call	malloc@PLT
	mov	QWORD PTR [rbx], rax
	add	DWORD PTR -20[rbp], 1
.L21:
	mov	eax, DWORD PTR -20[rbp]
	cmp	eax, DWORD PTR -36[rbp]
	jl	.L22
	mov	rax, QWORD PTR -32[rbp]
	mov	rbx, QWORD PTR -8[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	allocMatrix, .-allocMatrix
	.globl	freeMatrix
	.type	freeMatrix, @function
freeMatrix:
.LFB11:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -28[rbp], esi
	mov	DWORD PTR -4[rbp], 0
	jmp	.L25
.L26:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	free@PLT
	add	DWORD PTR -4[rbp], 1
.L25:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -28[rbp]
	jl	.L26
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	free@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	freeMatrix, .-freeMatrix
	.section	.rodata
	.align 8
.LC0:
	.string	"allocating memory for matrix..."
.LC1:
	.string	" ok (%lu cycles)\n"
	.align 8
.LC2:
	.string	"filling matrix with random values..."
.LC3:
	.string	"finding min value..."
.LC4:
	.string	"min value: %d (%lu cycles)\n"
.LC5:
	.string	"finding max value..."
.LC6:
	.string	"max value: %d (%lu cycles)\n"
.LC7:
	.string	"freeing memory..."
	.text
	.globl	main
	.type	main, @function
main:
.LFB12:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 48
	mov	DWORD PTR -36[rbp], edi
	mov	QWORD PTR -48[rbp], rsi
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR stdout[rip]
	mov	rdi, rax
	call	fflush@PLT
	mov	eax, 0
	call	rdtsc
	mov	QWORD PTR -8[rbp], rax
	mov	edi, 10240
	call	allocMatrix
	mov	QWORD PTR -16[rbp], rax
	mov	eax, 0
	call	rdtsc
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	sub	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR stdout[rip]
	mov	rdi, rax
	call	fflush@PLT
	mov	eax, 0
	call	rdtsc
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	mov	esi, 10240
	mov	rdi, rax
	call	fillMatrix
	mov	eax, 0
	call	rdtsc
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	sub	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	lea	rax, .LC3[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 0
	call	rdtsc
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	mov	esi, 10240
	mov	rdi, rax
	call	findMinInMatrix
	mov	DWORD PTR -28[rbp], eax
	mov	eax, 0
	call	rdtsc
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	sub	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	mov	eax, DWORD PTR -28[rbp]
	mov	esi, eax
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	lea	rax, .LC5[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 0
	call	rdtsc
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	mov	esi, 10240
	mov	rdi, rax
	call	findMaxInMatrix
	mov	DWORD PTR -32[rbp], eax
	mov	eax, 0
	call	rdtsc
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	sub	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	mov	eax, DWORD PTR -32[rbp]
	mov	esi, eax
	lea	rax, .LC6[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	lea	rax, .LC7[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR stdout[rip]
	mov	rdi, rax
	call	fflush@PLT
	mov	eax, 0
	call	rdtsc
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	mov	esi, 10240
	mov	rdi, rax
	call	freeMatrix
	mov	eax, 0
	call	rdtsc
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	sub	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	main, .-main
	.ident	"GCC: (Debian 13.2.0-13) 13.2.0"
	.section	.note.GNU-stack,"",@progbits
