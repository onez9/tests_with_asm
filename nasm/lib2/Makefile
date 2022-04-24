CC = nasm -f elf64
LIBS = asmlib/fmt.nasm asmlib/mth.nasm asmlib/str.nasm asmlib/sys.nasm
LIBS_OBJ = asmlib/fmt.o asmlib/mth.o asmlib/str.o asmlib/sys.o
LIB = asmlib/sys.o

 

#.PHONY: default compile build run
default: main run
compile: $(LIBS)
	$(CC) asmlib/fmt.nasm && $(CC) asmlib/mth.nasm && $(CC) asmlib/str.nasm && $(CC) asmlib/sys.nasm

main: main.nasm $(LIBS_OBJ)
	nasm -f elf64 -g -F dwarf main.nasm
	ld -m elf_x86_64 main.o $(LIBS_OBJ) -s -o build

64: main.nasm $(LIB)
	nasm -f elf64 -g -F dwarf main.nasm
	ld -m elf_x86_64 main.o $(LIBS_OBJ) -s -o build

32:
	nasm -f elf main.nasm
	ld -m elf_i386 -s -o build main.o

bin:
	nasm loader.nasm -f bin -o loader.bin
	dd if=loader.bin bs=512 of=fd0
	qemu-system-x86_64 -vga std fd0

listing: 
	nasm -f elf64 -g -F dwarf main.nasm -l listing.lst

run:
	./build

#qemu-system-arm -M connex -pflash flash.bin -nographic -serial /dev/null
#qemu-system-arm
#dd if=arm.bin of=flash.bin bs=4096 conv=notrunc
#dd if=/dev/zero of=flas.bin bs=4096 count=4096
#arm-none-eabi-objcopy -O binary arm.elf arm.bin
#arm-none-eabi-ld -Ttext=0x0 -o arm.elf arm.o
#arm-none-eabi-as -o arm.o arm.s
