/*
 * SPDX-FileCopyrightText: ukoOS Contributors
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

ENTRY(_start)
OUTPUT_FORMAT(elf64-littleaarch64)

PHDRS
{
	rx PT_LOAD;
	ro PT_LOAD;
	rw PT_LOAD;
}

SECTIONS
{
	. = 0xffff000000000000;

	PROVIDE(_kernel_start = .);

	.text ALIGN(0x1000) :
	{
		PROVIDE(_kernel_start_text = .);
		*(.text .text.*)
		PROVIDE(_kernel_end_text = .);
	} :rx

	/**
	 * Unlike some linker scripts, we separate .text from .rodata. This is
	 * only a very weak mitigation against code reuse attacks, but it seems
	 * better to not have the possibility of reusing constants as code.
	 */
	.rodata ALIGN(0x1000) :
	{
		PROVIDE(_kernel_start_rodata = .);
		*(.rodata .rodata.*)
		PROVIDE(_kernel_end_rodata = .);
	} :ro
	.rodata.selftests :
	{
		PROVIDE(_kernel_start_selftests = .);
		KEEP(*(.selftests))
		PROVIDE(_kernel_end_selftests = .);
	} :ro

	.data ALIGN(0x1000) :
	{
		PROVIDE(_kernel_start_data = .);
		*(.data .data.*)
		PROVIDE(_kernel_end_data = .);
	} :rw
	.data.initializers :
	{
		PROVIDE(_kernel_start_initializers = .);
		KEEP(*(.initializers))
		PROVIDE(_kernel_end_initializers = .);
	} :rw
	.bss :
	{
		PROVIDE(_kernel_start_bss = .);
		*(.bss .bss.*)
		PROVIDE(_kernel_end_bss = .);
	} :rw

	PROVIDE(_kernel_end = .);
}
