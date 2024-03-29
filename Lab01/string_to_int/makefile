# echo -n "1234567" | ./string2int.out
string2int.out: string2int.o
	gcc -no-pie -ggdb -o string2int.out string2int.o
string2int.o: string2int.asm
	nasm -f elf64 -g -F dwarf string2int.asm -l string2int.lst

