.global _Reset

.equ T_MASK, 0x10
	
_Reset:
    ldr sp, =stack_top
    b   _Stack_Manipulation

_Stack_Manipulation:
    mov r0, #0x01
    mov r1, #0x02
    mov r2, #0x03
    stmed sp!, {r0-r2}
    ldmed sp!, {r6-r4}
    bkpt
	
_Masking_CSPR:
    mov r7, #T_MASK
    mrs r8, cpsr
    and r9, r8, #T_MASK
    bkpt

_Pop_Stack:
    mov pc, lr
    bkpt

_Push_Stack:
    mov pc, lr
    bkpt

_LoadStore:
    ldr r5, =0x05
    str r5, [sp]
    ldr r3, [sp]
    bkpt

_Subroutines:
    ldr r3, =0x01
    bl  _Sub_Shift
    mov r8, r7, LSR #1
    bkpt 

_Sub_Shift:
    ldr r5, =0x01
    mov r7, r5, LSL #4
    mov pc, lr

_Test_Mov:
    ldr r5, =0x05 /* r5  = 5 */
    ldr r7, =0x08 /* r7  = 8 */
    mov r7, r5
    bkpt

_Test_Shift:
    ldr r5, =0x01 /* r5  = 5 */
    ldr r7, =0x08 /* r7  = 8 */
    mov r7, r5, LSL #2
    bkpt

_Test_B_Shifter:
    ldr r5, =0x01
    mov r7, r5, LSL #3
    mov r8, r7, LSR #1
    bkpt