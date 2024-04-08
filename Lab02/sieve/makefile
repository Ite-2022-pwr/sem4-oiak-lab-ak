# Sito Eratostenesa makefile
sieve.out: sieve.o
	gcc -ggdb -no-pie -o sieve.out sieve.o
sieve.o: sieve.asm
	nasm -f elf64 -g -F dwarf sieve.asm -l sieve.lst
