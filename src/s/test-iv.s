.global _Reset
_Reset:
    b   _Test_Mov

_Test_Mov:
    ldr r5, =0x05 /* r5  = 5 */
    ldr r7, =0x08 /* r7  = 8 */
    mov r7,r5
    bkpt
