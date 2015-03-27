OUTPUT_FORMAT("elf32-littlearm", "elf32-bigarm", "elf32-littlearm")
OUTPUT_ARCH(arm)

top = 0x08B47400;

SECTIONS
{
	. = top;
	.rodata.rop : {
		KEEP(*(.rodata.rop))
	}
	. = top + 228;
	.rodata : {
		KEEP(*(.rodata.init))
		*(.rodata)
		. = 540;
	}
}
