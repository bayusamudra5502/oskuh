CC = gcc

# FLAGS
LFLAG = -ffreestanding -O0 -nostdlib -lgcc -m32 -g
CFLAG = -Wall -Wextra -m32 -ffreestanding
SFLAG = -m32
LINKER = ./src/linker.ld

# Location
BINISO_BUILD = ./build/iso

# Compile assembly file
./build/%.o: ./src/%.s
	@mkdir -p $(dir $@)
	@$(CC) $(SFLAG) -c $< -o $@

./build/%.o: ./src/%.c ./src/%.h
	@mkdir -p $(dir $@)
	@$(CC) -g $(CFLAG) -c $< -o $@

./build/%.o: ./src/%.c
	@mkdir -p $(dir $@)
	@$(CC) -g $(CFLAG) -c $< -o $@

./bin/oskuh.bin: ./build/kernel.o ./build/loader.o
	@mkdir -p $(dir $@)
	@$(CC) -T $(LINKER) -o $@ $(LFLAG) $^

clear: 
	@rm -rf build/* bin/*

build: ./bin/oskuh.bin
clean: clear

debug-qemu:
	@qemu-system-i386 -kernel bin/oskuh.bin -s -S

qemu:
	@qemu-system-i386 -kernel bin/oskuh.bin

run: build qemu

build-iso: build
	@mkdir -p dist
	@mkdir -p $(BINISO_BUILD)/boot/grub
	@cp bin/oskuh.bin $(BINISO_BUILD)/boot/oskuh.bin
	@cp src/grub.cfg $(BINISO_BUILD)/boot/grub/grub.cfg
	@grub-mkrescue -o dist/oskuh.iso $(BINISO_BUILD)

.PHONY: clear clean build qemu build-iso debug-qemu run