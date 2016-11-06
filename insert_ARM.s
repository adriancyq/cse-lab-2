.syntax unified

.text

.align 8
.global insert_ARM
.func insert_ARM, insert_ARM
.type insert_ARM, %function

insert_ARM:
    @ Save caller's registers on the stack
    push {r4-r11, ip, lr}

    @ Parameters:
    @ R0: list *ls
    @ R1: int val
    @
    @ Dictionary of registers:
    @ R4 address of sortedList 
    @ R5 size 
    @ R6 capacity
    @ R7 current index 
    @ R8 index before current 
    @ R9 stored list *ls 
    @ R10 element at current index 
    @ R11 element at index before current 


    @-----------------------

    @ Null check for list struct pointer, return -1
    CMP R0, #0
    SUBEQ R0, R0, #1
    BEQ end



    @ Store the address of our list struct in another register 
    MOV R9, R0 

    @ Grab sortedList address, size, and capacity 
    LDR R4, [R9]
    LDR R5, [R9, #4]
    LDR R6, [R9, #8]

    @ Current size is current index 
    MOV R7, R5 



    @ Check if the list is full
    CMP R5, R6
    BNE listNotEmpty

    @ List is full, so we need to double space and convert to bytes
    LSL R5, R5, #1
    LSL R5, R5, #2

    @ Fill parameters of realloc, address of memory location and size
    MOV R0, R5 
    MOV R1, R5 
    BL realloc 

    @ Check that reallocation was successful
    CMP R0, #0
    SUBEQ R0, R0, #1
    BEQ end 

    @ Update address of sortedList in register
    MOV R4, R0 

    @ Update new list properties: sortedList address and size
    STR R4, [R9]
    STR R5, [R9, #4]



listNotEmpty:
    
    @ Insert the element into the list 
    STR R1, [R4, R7, LSL #2]

    @ Increment the list size 
    ADD R5, R5, #1 
    STR R5, [R9, #4]



sortLoop: 
    
    @ Iterate through list backward, stop at second element 
    CMP R7, #1
    ADDLT R0, R7, #1
    BLT end 

    @ Grab the current element and the one before it 
    LDR R10, [R4, R7, LSL #2]
    SUB R8, R7, #1
    LDR R11, [R4, R8, LSL #2]

    @ Compare the element at current index to the one before 
    CMP R10, R11 
    BGE end 

    @ Switch the two elements
    STR R10, [R4, R8, LSL #2]
    STR R11, [R4, R7, LSL #2]

    @ Update the index and go back to beginning 
    SUB R7, R7, #1 
    B sortLoop 


end:

    @ put your return value in r0 here:
    MOV R0, R7
    @-----------------------

    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
.endfunc

.end

