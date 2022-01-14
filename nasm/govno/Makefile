CFLAGS= -f elf32
LFLAGS= -m elf_i386

p=$1

all: $(p)

calc: $(p).o
	ld $(LFLAGS) $(p).o -o calc

calc.o: $(p).asm
	nasm $(CFLAGS) $(p).asm -o $(p).o

clean:
	rm -f $(p).o $(p)
        
.INTERMEDIATE: $(p).o



