.syntax unified

.text

.align 8
.global createlist_ARM
.func createlist_ARM, createlist_ARM
.type createlist_ARM, %function

createlist_ARM:

    @ Save caller's registers on the stack
    push {r4-r11, ip, lr}

    @ Parameter:
    @ R0: int maxElements
    @-----------------------
    
    @ Store maxElements in another register
    MOV R11, R0 

    @ Allocate three 4-byte blocks for List struct, address should be in R0
    MOV R0, #12
    BL malloc 

    @ Initialize size and capacity 
    MOV R4, #0
    STR R4, [R0, #4]
    STR R11, [R0, #8]

    @ Store address of List struct 
    MOV R10, R0 

    @ Determine number of bytes needed for sorted list 
    LSL R11, R11, #2

    @ Allocate (maxElements) 4-byte blocks for sortedlist, address should be
    @ in R0
    MOV R0, R11
    BL malloc 

    @ Store address of sortedlist into List struct 
    STR R0, [R10]

    @-----------------------
    @ Return address of List struct in R0
    MOV R0, R10

    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
.endfunc

.end

