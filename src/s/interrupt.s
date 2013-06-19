.text
    .code 32
    .global vectors_start
    .global vectors_end
    .global reset_handler

vectors_start:
    ldr pc, reset_handler_addr
    b . 
    b .
    b .
    b .
    b .
    b .
    b .

reset_handler_addr: .word reset_handler

vectors_end:

reset_handler:
    ldr sp, =stack_top      @ set up supervisor stack
    bl  copy_vectors        @ copy vector table to addr 0x0
    mrs r0, cpsr            @ get cpsr
    bic r1, r0, #0x1F
    orr r1, r1, #0x12
    msr cpsr, r1
    ldr sp, =irq_stack_top  @ set IRQ stack
    bic r0, r0, #0x80       @ enable IRQs
    msr cpsr, r0            @ pop back into supervisor mode
    ldr r5, =0x05           @ some flags to test if we've come this far
    ldr r7, =0x08
    mov  r5, r7  
    bl  main                @ jump to main and go!
    b   .  

.end
