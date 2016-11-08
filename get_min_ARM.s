.syntax unified

.text

.align 8
.global get_min_ARM
.func get_min_ARM, get_min_ARM
.type get_min_ARM, %function

get_min_ARM:

    @ Save caller's registers on the stack
    push {r4-r11, ip, lr}

    @ Parameters:
    @ R0: list *ls
    @-----------------------

    @ Grab the size and address of sortedList
    LDR R4, [R0, #4]            @ Size
    LDR R5, [R0]                @ address of sortedList 

    @ Check if the sortedList is empty
    CMP R4, #0                  @ls->size == 0
    BNE notEmpty

    @ Return -1 if empty 
    MOV R0, #-1                 @return -1
    B end

notEmpty:
    
    @ Load the first element in the sortedList
    LDR R6, [R5] 
    MOV R0, R6  

end: 

    @-----------------------
    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
    
.endfunc

.end

