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

    @ TODO If list struct address is 0, return -1
    CMP R0, #0
    BEQ nullList

    @ Store list struct address
    MOV R11, R0 

    @ Get the size (R4), capacity (R5) and sortedlist address (R6)
    LDR R4, [R0, #4]
    LDR R5, [R0, #8]
    LDR R6, [R0]

    @ TODO If the list is full, double the size 
    CMP R4, R5

    @ Store doubled list capacity in R1 and sortedList pointer in R0 for realloc
    MOV R0, R6
    LSL R4, R4, #2
    MOV R1, R4

    @ Double the size of the list, address should be in R0
    BL realloc

    @ Check that reallocation was successful
    CMP R0, #0
    BEQ nullList

    @ Update capacity and sortedList pointer (now at R6)
    STR R4, [R11, #8]
    STR R0, [R11]
    MOV R6, R0 
    
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
    STR R9, [R6, R4, LSL #2]
    STR R7, [R6, R8, LSL #2]

    @ Update index
    SUB R4, R4, #1

    @ Restart the loop
    B forloop

nullList:
    
    @ Create -1 in two's complement to return
    MVN R4, #0
    ADD R4, R4, #1

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

