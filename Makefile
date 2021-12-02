CC = gcc

# FLAGS
LFLAG = -ffreestanding -O0 -nostdlib -lgcc -m32 -g
CFLAG = -Wall -Wextra -m32 -ffreestanding
SFLAG = -m32
LINKER = ./src/linker.ld

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

qemu:
	@qemu-system-i386 -kernel bin/oskuh.bin -s -S

.PHONY: clear clean build qemu