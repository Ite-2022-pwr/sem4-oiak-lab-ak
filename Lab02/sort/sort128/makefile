sort128.out: sort128.o
	gcc -no-pie -ggdb -o sort128.out sort128.o
sort128.o: sort128.asm
	nasm -f elf64 -g -F dwarf sort128.asm -l sort128.lst

