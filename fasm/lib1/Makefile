CC = nasm -f elf
#LIBS = asmlib/fmt.nasm asmlib/mth.nasm asmlib/str.nasm asmlib/sys.nasm
#LIBS_OBJ = asmlib/fmt.o asmlib/mth.o asmlib/str.o asmlib/sys.o


.PHONY: default compile build run
default: 32 run
#compile: $(LIBS)
#	$(CC) asmlib/fmt.nasm && $(CC) asmlib/mth.nasm && $(CC) asmlib/str.nasm && $(CC) asmlib/sys.nasm
#compile:

64: main.nasm
	nasm -f elf64 $(source).nasm
	ld -m elf_x86_64 $(source).o -s -o build
	rm *.o
	./build

32: main.nasm 
	nasm -f elf $(source).nasm
	ld -m elf_i386 $(source).o -s -o build
	rm *.o
	./build

run main:
	./build

