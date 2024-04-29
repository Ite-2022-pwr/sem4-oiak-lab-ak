# wykorzystanie zmiennych z asemblera w C
vars.out: vars.o vars.c
	gcc -no-pie -ggdb -o vars.out vars.c vars.o
vars.o: vars.asm
	nasm -f elf64 -g -F dwarf vars.asm -l vars.lst
