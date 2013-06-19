/*
 * I'm being very explicit with setting up the vector table
 * and other properties.  This may not be always needed;
 * should experiment with that later.
 */
.section INTERRUPT_VECTOR, "x"
.global _Reset
_Reset:
    B Move_Test /* Reset - calling the first executing code. */
    B . /* Undefined */
    B . /* SWI */
    B . /* Prefetch Abort */
    B . /* Data Abort */
    B . /* reserved */
    B . /* IRQ */
    B . /* FIQ */
 
/*
Reset_Handler:
    LDR sp, =stack_top
    BL c_entry 
    B .
*/

Move_Test:
    ldr r5, =0x05
    ldr r7, =0x08
    MOV     r7,r5




    
