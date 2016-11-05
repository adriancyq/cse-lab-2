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

    @ TODO Sort the list 


    @ put your return value in r0 here:

    @-----------------------

    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
.endfunc

.end

