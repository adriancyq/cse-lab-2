.syntax unified

.data
mystr : .asciz"%d " @store string into registers

.text

.align 8
.global print_ARM
.func print_ARM, print_ARM
.type print_ARM, %function


print_ARM:
    @ Save caller's registers on the stack
    push {r4-r11, ip, lr}

    @ YOUR CODE GOES HERE (list *ls is in r0)
    @-----------------------

    LDR r5, [r0, #4] @size
    LDR r6, [r0]     @sortedList
    MOV r7, #0
    SUB r5, r5, #1   @size - 1

    CMP r0, r7       @null  check
    BNE else
    B end

    @else have loop from i to size-1
    @arithmetic, get sortedList[i] into
    @and call printF to print out list

    else: LSL r8,r7, #2
    LDR r1, [r6, r8] 
    LDR r0, =mystr
    BL printF

    ADD r7, r7, #1
    CMP r7, r5
    BLE else
    BGE return

    @ put your return value in r0 here:

    @-----------------------

    end: MVN r0, #0     @if null print -1
    return: 

    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
.endfunc

.end

