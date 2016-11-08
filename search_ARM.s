.syntax unified

.text

.align 8
.global search_ARM
.func search_ARM, search_ARM
.type search_ARM, %function

search_ARM:

    @ Save caller's registers on the stack
    push {r4-r11, ip, lr}

    @ R0: list *ls
    @ R1: int val
    @-----------------------

    @ Grab the size and address of the sortedList
    LDR R4, [R0, #4]        @ size
    LDR R5, [R0]            @ pointer to array

    @ Assign an index for a for loop
    MOV R6, #0

iterate:

    @ Iterate through every element in the array until we find the element
    @ or reach the end of the sortedList
    CMP R6, R4
    BEQ notInArray          @ Reached end of list 

    @ Grab the element in the array of specified index 
    LDR R7, [R5, R6, LSL #2]

    @ Compare the element with the one we want to find 
    CMP R7, R1

    @ If not equal, then we have not found the element 
    ADDNE R6, R6, #1
    BNE iterate

    @ If equal, we found the element 
    BEQ foundElement



foundElement:

    @ Put the index of the element in R0 for return
    MOV R0, R6
    B end 

notInArray:
    
    @ Return -1 if element is not in list 
    MOV R0, #-1

end:

    @ put your return value in r0 here:

    @-----------------------

    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
.endfunc

.end

