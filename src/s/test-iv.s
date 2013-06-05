.global _Reset
_Reset:
    b   _Test_Shift

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

_Square:
    mul r1, r0, r0
    mov r0, r1
    mov pc, lr
