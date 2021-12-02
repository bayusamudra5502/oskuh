/* Hasil Terjemahan kernel ke ATT */
.set MODULEALIGN, 1<<0
.set MEMINFO, 1<<1
.set FLAGS, MODULEALIGN | MEMINFO
.set MAGIC, 0x1badb002
.set CHECKSUM, -(MAGIC + FLAGS)

.section .multiboot
.align 4
  .long MAGIC
  .long FLAGS
  .long CHECKSUM

.section .bss
  .align 16

  stack_bawah:
    .skip 32786 # 32 KB

  stack_atas:

.section .text

.global loader
.type loader, @function

loader:
  movl $stack_atas, %esp
  pushl %eax
  
  call kmain
  
  cli

hang:
  hlt
  jmp hang
