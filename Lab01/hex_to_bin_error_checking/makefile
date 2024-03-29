# echo -n "1A5F" | ./hex2bin.out
# echo -n "1A;F" | ./hex2bin.out
hex2bin.out: hex2bin.o
	ld -o hex2bin.out hex2bin.o
hex2bin.o: hex2bin.asm
	nasm -f elf64 -g -F dwarf hex2bin.asm -l hex2bin.lst

