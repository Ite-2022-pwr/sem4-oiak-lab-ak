# echo -n "0123456789AABCabcxyz" | ./hexdump.out
hexdump.out: hexdump.o
	gcc -o hexdump.out hexdump.o -ggdb -no-pie
hexdump.o: hexdump.asm
	nasm -f elf64 -g -F dwarf hexdump.asm -l hexdump.lst
