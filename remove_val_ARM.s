.syntax unified

.text

.align 8
.global remove_val_ARM
.func remove_val_ARM, remove_val_ARM
.type remove_val_ARM, %function

remove_val_ARM:

    @ Save caller's registers on the stack
    push {r4-r11, ip, lr}

    @ Parameters:
    @ R0: list *ls
    @ R1: int val
    @-----------------------

    @ Get the size and address of the sortedList
    LDR R4, [R0, #4]                        @ size
    LDR R8, [R0]                            @ address

    @ Initialize counter for the number of elements to remove
    MOV R5, #0

    @ Initialize index for the for loop to find how many elements we need
    @ to remove 
    MOV R6, #0

@ Loop through entire sortedList
findNumElementsToDelete:
    
    @ Compare index with size 
    CMP R6, R4
    BEQ foundNumElementsToDelete        @ Went through entire sortedList

    @ Grab the element in the sortedList with specified index 
    LDR R7, [R8, R6, LSL #2]

    @ Compare element with value we are trying to delete 
    CMP R7, R1

    @ If equal, increment counter for number of elements to remove and 
    @ store the index of the last element to remove 
    ADDEQ R5, R5, #1 
    MOVEQ R9, R6

    @ Go to next element 
    ADD R6, R6, #1
    B findNumElementsToDelete

@ Begin deleting the elements
foundNumElementsToDelete:
    
    @ Determine the index of the first element to shift 
    ADD R10, R9, #1

deleteElements:

    @ Iterate from first element to shift until last element in sortedList
    CMP R10, R4
    BEQ end 

    @ Grab the element to shift 
    LDR R2, [R8, R10, LSL #2]

    @ Shift element left by (numElementsToDelete) 
    SUB R11, R10, R5 
    STR R2, [R8, R11, LSL #2]

    @ Go to the next element 
    ADD R10, R10, #1 
    B deleteElements 

end:
    
    @ Update size 
    SUB R4, R4, R5
    STR R4, [R0, #4]

    @-----------------------
    @ Return value in R0
    MOV R0, R5 

    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr

.endfunc

.end

