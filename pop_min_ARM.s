.syntax unified

.text

.align 8
.global pop_min_ARM
.func pop_min_ARM, pop_min_ARM
.type pop_min_ARM, %function

pop_min_ARM:

    @ Save caller's registers on the stack
    push {r4-r11, ip, lr}

    @ R0: list *ls
    @-----------------------
    
    @ Grab the size and the address of sortedList 
    LDR R4, [R0]                @ address
    LDR R5, [R0, #4]            @ size

    @ Check that the list is not empty 
    CMP R5, #0
    MOVEQ R0, #-1
    BEQ emptyList

    @ Grab the first element in the sortedList 
    LDR R6, [R4]                @ls->sortedList[0]

    @ Initialize the index of the for loop 
    MOV R7, #1

loop:  
    
    @ Loop through sortedList
    CMP R7, R5                  @index < size
    BEQ endOfList               @index >= size, branch to end and return minNum

    @ Grab the current and previous element 
    SUB R9, R7, #1              @index - 1
    LDR R10, [R4, R9, LSL #2]   @l s->sortedList[index-1]
    LDR R11, [R4, R7, LSL #2]   @ ls->sortedList[index]
    STR R11, [R4, R9, LSL #2]

    @ Go to next element
    ADD R7, R7, #1
    B loop

endOfList:
    
    @ Adjust size 
    SUB R5, R5, #1
    STR R5, [R0, #4]
    
    @ Assign popped value to R0 for return 
    MOV R0, R6


emptyList:

    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr

.endfunc

.end

