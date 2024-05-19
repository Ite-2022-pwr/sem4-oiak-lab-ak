fpu.out: fpu.o fpu.c
	gcc -no-pie -ggdb -Wall fpu.o fpu.c
fpu.o: fpu.asm
	nasm -f elf64 -g -F dwarf fpu.asm -l fpu.lst

