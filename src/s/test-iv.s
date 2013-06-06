.global _Reset
_Reset:
    b   _Subroutines

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

_Subroutines:
    ldr r3, =0x01
    bl _Sub_Shift
    mov r8, r7, LSR #1
    bkpt 

_Sub_Shift:
    ldr r5, =0x01
    mov r7, r5, LSL #4
    mov pc, lr