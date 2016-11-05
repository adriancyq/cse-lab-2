.syntax unified

.text

.align 8
.global remove_val_ARM
.func remove_val_ARM, remove_val_ARM
.type remove_val_ARM, %function

remove_val_ARM:
    @ Save caller's registers on the stack
    push {r4-r11, ip, lr}

    @ YOUR CODE GOES HERE (list *ls is in r0, int val is in r1)
    @-----------------------

    @ Get the size (R4)
    LDR r4, [r0, #4]

    @numRemoved = 0
    MOV r5, #0

    @index = 0
    MOV r6, #0

    @for (index = 0; index < ls->size; index++)
    loop1 : CMP r6, r4            @index < ls->size
           BGE end                @end loop
           LSR r6, #2             @multiply index by 4
           LDR r9, [r0, r6]        @in r9 sortedList[index]
           CMP r9 , r1            @ls->sortedList[index]==val
           MOV r7, r6             @firstRemoveIndex is r7 = index
           ADD r5, r5, #1         @numRemoved++ 
           ADD r6, r6, #1         @index++
           B loop1                @finish first for loop

    ADD r8, r7, r5    @r8 is lastRemoveIndex = firstRemoveIndex +numRemoved
    SUB r8, r8, #1    @lastRemoveIndex = lastRemoveIndex - 1

    ADD r6, r8, #1    @index = lastRemoveIndex + 1

    @for (index = lastRemoveIndex + 1; index < ls->size; index++)
    MOV r6, #0            @reset index to 0
    loop2: CMP r6, r4     @index < ls->size
           BGE end        @end loop
           LSR r6, #2             @multiply index by 4
           SUB r9, r6, r5         @in r9 sortedList[index - numRemoved]
           LDR r10, [r0, r6]       @in r10 sortedList[index]
           CMP r9, r10            @ls->sortedList[index - numRemoved] = ls->sortedList[index];  
           B loop2
    SUB r4, r4, r5          @ls->size = ls->size - numRemoved;

    @ put your return value in r0 here:

    end : MOV r0, r5     @return numRemoved

    @-----------------------

    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
.endfunc

.end

