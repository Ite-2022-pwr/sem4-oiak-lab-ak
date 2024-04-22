c_w_asm.out: c_w_asm.o lib.o
	gcc -no-pie -ggdb -o c_w_asm.out c_w_asm.o lib.o
c_w_asm.o: c_w_asm.asm
	nasm -f elf64 -g -F dwarf c_w_asm.asm -l c_w_asm.lst
lib.o: lib.c
	gcc -ggdb -c -o lib.o lib.c

