CC = nasm -f elf64
LIBS = asmlib/fmt.nasm asmlib/mth.nasm asmlib/str.nasm asmlib/sys.nasm
LIBS_OBJ = asmlib/fmt.o asmlib/mth.o asmlib/str.o asmlib/sys.o
LIB = asmlib/sys.o

 

#.PHONY: default compile build run
default: build run
compile: $(LIBS)
	$(CC) asmlib/fmt.nasm && $(CC) asmlib/mth.nasm && $(CC) asmlib/str.nasm && $(CC) asmlib/sys.nasm
build: main.nasm $(LIBS_OBJ)
	nasm -f elf64 -g -F dwarf main.nasm
	ld -m elf_x86_64 main.o $(LIBS_OBJ) -s -o build

only: main.nasm $(LIB)
	nasm -f elf64 -g -F dwarf main.nasm
	ld -m elf_x86_64 main.o $(LIBS_OBJ) -s -o build

run:
	./build

