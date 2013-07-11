#include "os-uart.h"

int c_entry(void) {
  os_uart_print_uart0("Starting simple os...\n");
  os_uart_print_uart0("Simple os shutting down.\n");
  return 0;
}
