letters.out: letters.o
	ld -o letters.out letters.o
letters.o: letters.asm
	nasm -f elf64 -g -F dwarf letters.asm -l letters.lst

