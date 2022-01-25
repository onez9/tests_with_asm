runme: main.cpp asm.o
	g++ main.cpp asm.o -o runme

asm.o: asm.nasm
	nasm -f elf64 asm.nasm -o asm.o
