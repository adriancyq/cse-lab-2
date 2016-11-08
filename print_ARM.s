.syntax unified

.data

@ stores the strings into the data section to be used later
mystr : .asciz"%d "

.text

.align 8
.global print_ARM
.func print_ARM, print_ARM
.type print_ARM, %function

print_ARM:

    @ Save caller's registers on the stack
    push {r4-r11, ip, lr}

    @ Parameters: 
    @ R0: list *ls
    @-----------------------

    @ Check that we have a valid address for our List struct 
    CMP R0, #0
    BEQ return

    @ Grab the size and the address of sortedList
    LDR R11, [R0, #4]                       @ size
    LDR R10, [R0]                           @ sortedList

    @ Initialize the index to 0 for the for loop
    MOV R9, #0

loop:
    
    @ Loop through each element in the array
    CMP R9, R11                             @ Compare index and size
    BEQ return 

    @ Grab the element at the specified index 
    LDR R1, [R10, R9, LSL #2]   

    @ Put that element in R0 for printing 
    LDR R0, =mystr
    BL printf                               @calling printf

    @ Go to the next element in the array
    ADD R9, R9, #1
    B loop 

@ Nothing gets returned for print_ARM
return: 

    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
.endfunc

.end

