CFLAGS= -f elf32
LFLAGS= -m elf_i386

all: calc

calc: calc.o
	ld $(LFLAGS) calc.o -o calc

calc.o: calc.asm
	nasm $(CFLAGS) calc.asm -o calc.o

clean:
	rm -f calc.o calc
        
.INTERMEDIATE: calc.o
