#include "kernel.h"

void kmain(unsigned int magic) {
  if (magic != 0x2BADB002) {
    clear();
    print("Error loading!!", 0x04);
  } else {
    clear();
    print("Halo dunia, Apa kabarnya?", 0x04);
  }
}

void print(char* message, int color) {
  char* mem = (char*)(0xb8000);
  while (*message != 0) {
    *mem = *message;
    mem++;
    message++;
    *mem = color;
    mem++;
  }
}

void clear() {
  char* mem = (char*)(0xb8000);
  while (*mem != 0) {
    *mem = 0;
    mem++;
  }
}
