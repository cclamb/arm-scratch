ENTRY(_Reset)
SECTIONS
{
 . = 0x0;
 .text : {
 test.o (INTERRUPT_VECTOR)
 . = 0x10000;
 *(.text)
 }
 .data : { *(.data) }
 .bss : { *(.bss COMMON) }
 . = ALIGN(8);
 . = . + 0x1000; /* 4kB of stack memory */
 stack_top = .;
}
