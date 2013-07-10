#ifndef OS_VECTOR_TABLE_H
#define OS_VECTOR_TABLE_H

#define UART0_BASE_ADDR 0x101f1000
#define UART0_DR (*((volatile uint32_t *)(UART0_BASE_ADDR + 0X000)))
#define UART0_IMSC (*((volatile uint32_t *)(UART0_BASE_ADDR + 0x038)))
#define VIC_BASE_ADDR 0X10140000
#define VIC_INTENABLE (*((volatile uint32_t *)(VIC_BASE_ADDR + 0X010)))

// Handler functions exported
void __attribute__ ((interrupt)) os_vector_table_irq_handler(void);
void __attribute__ ((interrupt)) os_vector_table_undef_handler(void);
void __attribute__ ((interrupt)) os_vector_table_swi_handler(void);
void __attribute__ ((interrupt)) os_vector_table_prefetch_abort_handler(void);
void __attribute__ ((interrupt)) os_vector_table_data_abort_handler(void);
void __attribute__ ((interrupt)) os_vector_table_fiq_handler(void);

void os_vector_table_copy_vectors(void);

#endif
