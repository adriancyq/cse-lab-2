.syntax unified

.text

.align 8
.global get_max_ARM
.func get_max_ARM, get_max_ARM
.type get_max_ARM, %function

get_max_ARM:

    @ Save caller's registers on the stack
    push {r4-r11, ip, lr}

    @ Parameters:
    @ R0: list *ls
    @-----------------------

    @ Grab the size and the address of the sortedList
    LDR R4, [R0, #4]                        @ size
    LDR R5, [R0]                            @ pointer to array

    @ Check if the list is empty
    CMP R4, #0
    BNE notEqual

    @ Return -1 if empty
    MOV R0, #-1
    B end

notEqual:
    
    @ Grab the index of the last element 
    SUB R4, R4, #1


    @ Grab the max element and put in R0 for return
    LDR R6, [R5, R4, LSL #2]                @ls -> sortedList(ls->size - 1)
    MOV R0, R6       

end:

    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
.endfunc

.end

