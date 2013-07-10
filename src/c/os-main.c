#include "os-uart.h"

int c_entry(void) {
    os_uart_print_uart0("Hello ARM!\n");
    return 0;
}
