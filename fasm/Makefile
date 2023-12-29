CC = fasm
LIBS = lib64lin/fmt.asm lib64lin/mth.asm lib64lin/str.asm lib64lin/sys.asm
LIBS_OBJ = lib64lin/fmt.o lib64lin/mth.o lib64lin/str.o lib64lin/sys.o
LIB = lib64lin/sys.o


#.PHONY: default compile build run
default: compile build run
compile: $(LIBS)
	$(CC) lib64lin/fmt.asm && $(CC) lib64lin/mth.asm && $(CC) lib64lin/str.asm && $(CC) lib64lin/sys.asm

build: main.asm $(LIBS_OBJ)
	fasm main.asm
	ld main.o $(LIBS_OBJ) -o main
run:
	rm main.o
	rm lib64lin/fmt.o
	rm lib64lin/mth.o
	rm lib64lin/str.o
	rm lib64lin/sys.o
	./main
dump: main
	objdump -S -M intel -d main > obj.dump
	cat obj.dump


#qemu-system-arm -M connex -pflash flash.bin -nographic -serial /dev/null
#qemu-system-arm
#dd if=arm.bin of=flash.bin bs=4096 conv=notrunc
#dd if=/dev/zero of=flas.bin bs=4096 count=4096
#arm-none-eabi-objcopy -O binary arm.elf arm.bin
#arm-none-eabi-ld -Ttext=0x0 -o arm.elf arm.o
#arm-none-eabi-as -o arm.o arm.s
