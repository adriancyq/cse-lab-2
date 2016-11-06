.syntax unified

.text

.align 8
.global search_ARM
.func search_ARM, search_ARM
.type search_ARM, %function

search_ARM:
    @ Save caller's registers on the stack
    push {r4-r11, ip, lr}

    @ YOUR CODE GOES HERE (list *ls is in r0, int val is in r1)
    @-----------------------

    CMP r0, #0
    MOVEQ r0, #-1
    BEQ null
    LDRNE r2, [r0, #4]
    CMPNE r2, #0
    MOVEQ r0, #-1
    BEQ null
    LDR r3, [r0]
    MOV r4, #0
loop:
    LDR r3, [r3, r4, LSL #2]
    CMP r3, r1
    BEQ end
    ADD r4, r4, #1
    CMP r4, r2
    BLT end
    B loop

    @ put your return value in r0 here:

end:
    MOV r0, r4

null:

    @-----------------------

    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
.endfunc

.end

