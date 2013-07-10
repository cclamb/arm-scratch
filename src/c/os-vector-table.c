#include "os-vector-table.h"
#include <stdint.h>

void __attribute__ ((interrupt)) os_vector_table_irq_handler(void) {
    // echo the char + 1
    UART0_DR = UART0_DR + 1;
}

void __attribute__((interrupt)) os_vector_table_undef_handler(void) { for(;;); }
void __attribute__((interrupt)) os_vector_table_swi_handler(void) { for(;;); }
void __attribute__((interrupt)) os_vector_table_prefetch_abort_handler(void) { for(;;); }
void __attribute__((interrupt)) os_vector_table_data_abort_handler(void) { for(;;); }
void __attribute__((interrupt)) os_vector_table_fiq_handler(void) { for(;;); }

void os_vector_table_copy_vectors(void) {
  extern uint32_t vectors_start;
  extern uint32_t vectors_end;
  uint32_t *vectors_src = &vectors_start;
  uint32_t *vectors_dst = (uint32_t *) 0;
  while (vectors_src < &vectors_end) {
    *vectors_dst++ = *vectors_src++;
  }
}
