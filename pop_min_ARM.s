.syntax unified

.text

.align 8
.global pop_min_ARM
.func pop_min_ARM, pop_min_ARM
.type pop_min_ARM, %function

pop_min_ARM:
    @ Save caller's registers on the stack
    push {r4-r11, ip, lr}

    @ YOUR CODE GOES HERE (list *ls is in r0)
    @-----------------------

      LDR r5, [r0, #4]       @ls->size
      CMP r5, #0             @ls->size == 0
      BNE else               @branch to else
      MOV r0, #-1          @return -1
      B end                @branch to end

else: LDR r4, [r0]         @ls->sortedList[0]
      LDR r7, [r4]         @loading minNum = sortedList[0] in r7
      SUB r5,r5, #1        @ls-.size--;

      MOV r6, #1           @index = 1

loop:  CMP r6, r5           @index < size
      BGE end              @index >= size, branch to end and return minNum
      MOV r8, r6           @putting index in r9
      SUB r8, r8, #1       @index - 1
      LDR r9, [r0, r8, LSL #2]     @ls->sortedList[index-1]
      STR r9, [r0, r6, LSL #2]     @storing value in r9 
      B loop

    @ put your return value in r0 here:

    @-----------------------

end: MOV r0, r7

    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
.endfunc

.end

