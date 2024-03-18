hello.out: hello.o
	ld -o hello.out hello.o
hello.o: hello.asm
	nasm -f elf64 -g -F dwarf hello.asm -l hello.lst

