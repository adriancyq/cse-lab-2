.syntax unified

.text

.align 8
.global get_min_ARM
.func get_min_ARM, get_min_ARM
.type get_min_ARM, %function

get_min_ARM:
    @ Save caller's registers on the stack
    push {r4-r11, ip, lr}

    @ YOUR CODE GOES HERE (list *ls is in r0)
    @-----------------------

    LDR r4, [r0, #4] @accesing size from struct
    LDR r5, [r0]     @address that holds the first element
    CMP r4, #0       @ls->size == 0
    BNE notEqual
    MOV r0, #-1     @return -1
    B end

    notEqual: 
        LDR r6, [r5] 
        MOV r0, r6  

    end: 

    @ put your return value in r0 here:  

    mov r0,r0  

    @-----------------------

    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
.endfunc

.end

