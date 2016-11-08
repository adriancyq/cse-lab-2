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

    LDR r5, [r0, #4] 
    CMP r5, #0
    BNE elsestmt
      MOV r0, #-1
      B end
    elsestmt:
      
      LDR r4, [r0, #0]
      
      LDR r7, [r4, #0]


      MOV r6, #1

      loop:

      CMP r6, r5

      BGE end
        
        MOV r11, #4

        MUL r8, r6, r11

        LDR r8, [r4, r8]
        
        BLT else

            SUB r8, r6, #1 

            MUL r8, r8, r11

            STR r9, [r4, r8]

        else:
        
        ADD r6, r6, #1

        B loop

        end:

        SUB r5, r5, #1
        
        STR r5, [r0, #4]

    @ put your return value in r0 here:

    @-----------------------

    MOV r0, r7

    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
.endfunc

.end

