ENTRY(loader)
SECTIONS {

	. = 1M;
	.text : 
  {
    *(.multiboot)
		*(.text)
	}
	.rodata ALIGN (0x1000):{
		*(.data)
	}
	.bss : {
		sbss = .;
		*(COMMON)
		*(.bss)
		ebss = .;
	}
}
