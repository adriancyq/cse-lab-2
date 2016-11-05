.syntax unified

.text

.align 8
.global insert_ARM
.func insert_ARM, insert_ARM
.type insert_ARM, %function

insert_ARM:
    @ Save caller's registers on the stack
    push {r4-r11, ip, lr}

    @ list *ls is in r0, int val in r1
    @-----------------------

    @ TODO If list address is 0, return -1

    @ Get the size (R4), capacity (R5) and sortedlist address (R6)
    LDR R4, [R0, #4]
    LDR R5, [R0, #8]
    LDR R6, [R0]

    @ TODO If the list is full, return -1 

    @ Insert the value into the next available position
    STR R1, [R6, R4, LSL #2]

    @ Update the size of the list
    ADD R4, R4, #1
    STR R4, [R0, #4]

    @ Get the index of the last element in the list 
    SUB R4, R4, #1

forloop: 
    
    @ Compare index (R4) with 1, continue until index is less than 1
    CMP R4, #1
    BLT endfor 

    @ Grab the element at index (R7), and the one before (R9)
    LDR R7, [R6, R4, LSL #2]
    SUB R8, R4, #1
    LDR R9, [R6, R8, LSL #2]

    @ Compare the element at index (R7), and the one before (R9)
    CMP R7, R9 

    @ If the current one is less than the one before, switch them
    BGE endif 

    @ Swap one before with current 
    STR R9, [R6, R4]
    STR R7, [R6, R8]

    @ Update index
    SUB R4, R4, #1

    @ Restart the loop
    B forloop

endfor:
endif:  

    @ put your return value in r0 here:
    MOV R0, R4
    @-----------------------

    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
.endfunc

.end

