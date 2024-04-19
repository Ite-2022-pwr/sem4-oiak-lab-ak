sort96.out: sort96.o
	gcc -no-pie -ggdb -o sort96.out sort96.o
sort96.o: sort96.asm
	nasm -f elf64 -g -F dwarf sort96.asm -l sort96.lst

