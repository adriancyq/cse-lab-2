.syntax unified

.text

.align 8
.global get_min_ARM
.func get_min_ARM, get_min_ARM
.type get_min_ARM, %function

get_min_ARM:
    @ Save caller's registers on the stack
    push {r4-r11, ip, lr}

    @ R0 list *ls
    @-----------------------

    @ Grab the size and address of sortedList
    LDR r4, [r0, #4]            @accesing size from struct
    LDR r5, [r0]                @address that holds the first element

    @ Check if the sortedList is empty
    CMP r4, #0                  @ls->size == 0
    BNE notEqual

    @ Return -1 if empty 
    MOV r0, #-1                 @return -1
    B end

notEqual:
    
    @ Load the first element in the sortedList
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

