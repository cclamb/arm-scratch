// The UART address associated with QEMU.
// The unsigned int type forces 32-bit reads and writes.
volatile unsigned int* const UART0DR = (unsigned int*) 0x101f1000;

void static print_uart0(const char* s) {
    while (*s != '\0') {
        *UART0DR = (unsigned int)(*s);
        s++;
    }
}

void c_entry(void) {
    print_uart0("Hello ARM!\n");
}


