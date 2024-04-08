# NWD makefile
nwd.out: nwd.o
	gcc -ggdb -no-pie -o nwd.out nwd.o
nwd.o: nwd.asm
	nasm -f elf64 -g -F dwarf nwd.asm -l nwd.lst
