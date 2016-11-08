.syntax unified

.data
mystr : .asciz"%d " @stores the strings into the registers

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

    LDR r11, [r0, #4] @size
    LDR r10, [r0]     @sortedList
    MOV r9, #0        @set index to 0
    SUB r11, r11, #1   @size - 1

    CMP r0, r9       @null  check
    BNE else
    B end

    else: LSL r7,r9, #2  @else loop 
    LDR r1, [r10, r7]    
    LDR r0, =mystr
    BL printf            @calling printf

    ADD r9, r9, #1       @increment index
    CMP r9, r11          @compare size to index
    BLE else
    BGE return

    @ put your return value in r0 here:

    @-----------------------

    end: MVN r0, #0     @print negative one if list is null
    return: 

    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
.endfunc

.end

