OUTPUT_FORMAT("elf32-littlearm", "elf32-bigarm", "elf32-littlearm")
OUTPUT_ARCH(arm)

SECTIONS
{
	. = 0x08B47400;
	.rodata : {
		KEEP(*(.rodata.rop))
		. = 228;
		KEEP(*(.rodata.init))
		*(.rodata)
		. = 768;
	}
}
