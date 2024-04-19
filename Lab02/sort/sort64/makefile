sort64.out: sort64.o
	gcc -no-pie -ggdb -o sort64.out sort64.o
sort64.o: sort64.asm
	nasm -f elf64 -g -F dwarf sort64.asm -l sort64.lst

