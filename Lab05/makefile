all: check_avx.out multiply_matrix4x4_avx.out multiply_matrix4x4.out

check_avx.out: check_avx.o
	gcc -ggdb -no-pie check_avx.o -o check_avx.out
check_avx.o: check_avx.asm
	nasm -f elf64 -g -F dwarf check_avx.asm

multiply_matrix4x4_avx.out:	multiply_matrix4x4_avx.o
	gcc -ggdb -no-pie multiply_matrix4x4_avx.o -o multiply_matrix4x4_avx.out
multiply_matrix4x4_avx.o: multiply_matrix4x4_avx.asm
	nasm -f elf64 -g -F dwarf multiply_matrix4x4_avx.asm

multiply_matrix4x4.out:	multiply_matrix4x4.o
	gcc -ggdb -no-pie multiply_matrix4x4.o -o multiply_matrix4x4.out
multiply_matrix4x4.o: multiply_matrix4x4.asm
	nasm -f elf64 -g -F dwarf multiply_matrix4x4.asm
