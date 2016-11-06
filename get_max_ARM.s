.syntax unified

.text

.align 8
.global get_max_ARM
.func get_max_ARM, get_max_ARM
.type get_max_ARM, %function

get_max_ARM:
    @ Save caller's registers on the stack
    push {r4-r11, ip, lr}

    @ YOUR CODE GOES HERE (list *ls is in r0)
    @-----------------------

    LDR r4, [r0, #4] @size
    LDR r5, [r0]     @pointer to array

    CMP r4, #0
    BNE notEqual
    MOV r0, #-1      @return -1
    B end

notEqual:
    LSL r4, #2       @multiphy size by 4
    SUB r4, r4, #4   @ls->size -1
    LDR r6, [r5, r4] @ls -> sortedList(ls->size - 1)
    MOV r0, r6      

    @ put your return value in r0 here:    

end:
    MOV r0,r0

    @-----------------------

    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
.endfunc

.end

