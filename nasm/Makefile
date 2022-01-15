CC = nasm -f elf
LIBS = asmlib/fmt.nasm asmlib/mth.nasm asmlib/str.nasm asmlib/sys.nasm
LIBS_OBJ = asmlib/fmt.o asmlib/mth.o asmlib/str.o asmlib/sys.o

 

.PHONY: default compile build run
default: build run
compile: $(LIBS)
	$(CC) asmlib/fmt.nasm && $(CC) asmlib/mth.nasm && $(CC) asmlib/str.nasm && $(CC) asmlib/sys.nasm
build: main.nasm $(LIBS_OBJ)
	nasm -f elf main.nasm
	ld -m elf_i386 main.o $(LIBS_OBJ) -s -o build

run main:
	./build

