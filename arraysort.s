	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 12
	.globl	_createlist
	.align	4, 0x90
_createlist:                            ## @createlist
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp0:
	.cfi_def_cfa_offset 16
Ltmp1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp2:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	$16, %eax
	movl	%eax, %ecx
	movl	%edi, -4(%rbp)
	movq	%rcx, %rdi
	callq	_malloc
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	$0, 8(%rax)
	movl	-4(%rbp), %edx
	movq	-16(%rbp), %rax
	movl	%edx, 12(%rax)
	movslq	-4(%rbp), %rax
	shlq	$2, %rax
	movq	%rax, %rdi
	callq	_malloc
	movq	-16(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-16(%rbp), %rax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_insert
	.align	4, 0x90
_insert:                                ## @insert
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp3:
	.cfi_def_cfa_offset 16
Ltmp4:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp5:
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -16(%rbp)
	movl	%esi, -20(%rbp)
	cmpq	$0, -16(%rbp)
	jne	LBB1_2
## BB#1:
	movl	$-1, -4(%rbp)
	jmp	LBB1_19
LBB1_2:
	movq	-16(%rbp), %rax
	movl	8(%rax), %ecx
	movq	-16(%rbp), %rax
	cmpl	12(%rax), %ecx
	jne	LBB1_7
## BB#3:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rcx
	movl	12(%rcx), %edx
	shll	$1, %edx
	movslq	%edx, %rcx
	shlq	$2, %rcx
	movq	%rax, %rdi
	movq	%rcx, %rsi
	callq	_realloc
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	LBB1_5
## BB#4:
	movl	$-1, -4(%rbp)
	jmp	LBB1_19
LBB1_5:
	movq	-32(%rbp), %rax
	movq	-16(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-16(%rbp), %rax
	movl	12(%rax), %edx
	shll	$1, %edx
	movq	-16(%rbp), %rax
	movl	%edx, 12(%rax)
## BB#6:
	jmp	LBB1_7
LBB1_7:
	movl	-20(%rbp), %eax
	movq	-16(%rbp), %rcx
	movslq	8(%rcx), %rcx
	movq	-16(%rbp), %rdx
	movq	(%rdx), %rdx
	movl	%eax, (%rdx,%rcx,4)
	movq	-16(%rbp), %rcx
	movl	8(%rcx), %eax
	addl	$1, %eax
	movl	%eax, 8(%rcx)
	movq	-16(%rbp), %rcx
	cmpl	$1, 8(%rcx)
	jne	LBB1_9
## BB#8:
	movl	$0, -4(%rbp)
	jmp	LBB1_19
LBB1_9:
	movq	-16(%rbp), %rax
	movl	8(%rax), %ecx
	subl	$1, %ecx
	movl	%ecx, -40(%rbp)
LBB1_10:                                ## =>This Inner Loop Header: Depth=1
	cmpl	$1, -40(%rbp)
	jl	LBB1_18
## BB#11:                               ##   in Loop: Header=BB1_10 Depth=1
	movslq	-40(%rbp), %rax
	movq	-16(%rbp), %rcx
	movq	(%rcx), %rcx
	movl	(%rcx,%rax,4), %edx
	movl	-40(%rbp), %esi
	subl	$1, %esi
	movslq	%esi, %rax
	movq	-16(%rbp), %rcx
	movq	(%rcx), %rcx
	cmpl	(%rcx,%rax,4), %edx
	jge	LBB1_13
## BB#12:                               ##   in Loop: Header=BB1_10 Depth=1
	movl	-40(%rbp), %eax
	subl	$1, %eax
	movslq	%eax, %rcx
	movq	-16(%rbp), %rdx
	movq	(%rdx), %rdx
	movl	(%rdx,%rcx,4), %eax
	movl	%eax, -36(%rbp)
	movslq	-40(%rbp), %rcx
	movq	-16(%rbp), %rdx
	movq	(%rdx), %rdx
	movl	(%rdx,%rcx,4), %eax
	movl	-40(%rbp), %esi
	subl	$1, %esi
	movslq	%esi, %rcx
	movq	-16(%rbp), %rdx
	movq	(%rdx), %rdx
	movl	%eax, (%rdx,%rcx,4)
	movl	-36(%rbp), %eax
	movslq	-40(%rbp), %rcx
	movq	-16(%rbp), %rdx
	movq	(%rdx), %rdx
	movl	%eax, (%rdx,%rcx,4)
	jmp	LBB1_16
LBB1_13:                                ##   in Loop: Header=BB1_10 Depth=1
	movslq	-40(%rbp), %rax
	movq	-16(%rbp), %rcx
	movq	(%rcx), %rcx
	movl	(%rcx,%rax,4), %edx
	movl	-40(%rbp), %esi
	subl	$1, %esi
	movslq	%esi, %rax
	movq	-16(%rbp), %rcx
	movq	(%rcx), %rcx
	cmpl	(%rcx,%rax,4), %edx
	jl	LBB1_15
## BB#14:
	jmp	LBB1_18
LBB1_15:                                ##   in Loop: Header=BB1_10 Depth=1
	jmp	LBB1_16
LBB1_16:                                ##   in Loop: Header=BB1_10 Depth=1
	jmp	LBB1_17
LBB1_17:                                ##   in Loop: Header=BB1_10 Depth=1
	movl	-40(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, -40(%rbp)
	jmp	LBB1_10
LBB1_18:
	movl	-40(%rbp), %eax
	movl	%eax, -4(%rbp)
LBB1_19:
	movl	-4(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_remove_val
	.align	4, 0x90
_remove_val:                            ## @remove_val
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp6:
	.cfi_def_cfa_offset 16
Ltmp7:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp8:
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	$0, -16(%rbp)
	movl	$0, -28(%rbp)
LBB2_1:                                 ## =>This Inner Loop Header: Depth=1
	movl	-28(%rbp), %eax
	movq	-8(%rbp), %rcx
	cmpl	8(%rcx), %eax
	jge	LBB2_6
## BB#2:                                ##   in Loop: Header=BB2_1 Depth=1
	movslq	-28(%rbp), %rax
	movq	-8(%rbp), %rcx
	movq	(%rcx), %rcx
	movl	(%rcx,%rax,4), %edx
	cmpl	-12(%rbp), %edx
	jne	LBB2_4
## BB#3:                                ##   in Loop: Header=BB2_1 Depth=1
	movl	-28(%rbp), %eax
	movl	%eax, -20(%rbp)
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -16(%rbp)
LBB2_4:                                 ##   in Loop: Header=BB2_1 Depth=1
	jmp	LBB2_5
LBB2_5:                                 ##   in Loop: Header=BB2_1 Depth=1
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -28(%rbp)
	jmp	LBB2_1
LBB2_6:
	movl	-20(%rbp), %eax
	addl	-16(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -24(%rbp)
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -28(%rbp)
LBB2_7:                                 ## =>This Inner Loop Header: Depth=1
	movl	-28(%rbp), %eax
	movq	-8(%rbp), %rcx
	cmpl	8(%rcx), %eax
	jge	LBB2_10
## BB#8:                                ##   in Loop: Header=BB2_7 Depth=1
	movslq	-28(%rbp), %rax
	movq	-8(%rbp), %rcx
	movq	(%rcx), %rcx
	movl	(%rcx,%rax,4), %edx
	movl	-28(%rbp), %esi
	subl	-16(%rbp), %esi
	movslq	%esi, %rax
	movq	-8(%rbp), %rcx
	movq	(%rcx), %rcx
	movl	%edx, (%rcx,%rax,4)
## BB#9:                                ##   in Loop: Header=BB2_7 Depth=1
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -28(%rbp)
	jmp	LBB2_7
LBB2_10:
	movq	-8(%rbp), %rax
	movl	8(%rax), %ecx
	subl	-16(%rbp), %ecx
	movq	-8(%rbp), %rax
	movl	%ecx, 8(%rax)
	movl	-16(%rbp), %eax
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_get_max_value
	.align	4, 0x90
_get_max_value:                         ## @get_max_value
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp9:
	.cfi_def_cfa_offset 16
Ltmp10:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp11:
	.cfi_def_cfa_register %rbp
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rdi
	cmpl	$0, 8(%rdi)
	jne	LBB3_2
## BB#1:
	movl	$-1, -4(%rbp)
	jmp	LBB3_3
LBB3_2:
	movq	-16(%rbp), %rax
	movl	8(%rax), %ecx
	subl	$1, %ecx
	movslq	%ecx, %rax
	movq	-16(%rbp), %rdx
	movq	(%rdx), %rdx
	movl	(%rdx,%rax,4), %ecx
	movl	%ecx, -4(%rbp)
LBB3_3:
	movl	-4(%rbp), %eax
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_get_min_value
	.align	4, 0x90
_get_min_value:                         ## @get_min_value
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp12:
	.cfi_def_cfa_offset 16
Ltmp13:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp14:
	.cfi_def_cfa_register %rbp
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rdi
	cmpl	$0, 8(%rdi)
	jne	LBB4_2
## BB#1:
	movl	$-1, -4(%rbp)
	jmp	LBB4_3
LBB4_2:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movl	(%rax), %ecx
	movl	%ecx, -4(%rbp)
LBB4_3:
	movl	-4(%rbp), %eax
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_search
	.align	4, 0x90
_search:                                ## @search
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp15:
	.cfi_def_cfa_offset 16
Ltmp16:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp17:
	.cfi_def_cfa_register %rbp
	movq	%rdi, -16(%rbp)
	movl	%esi, -20(%rbp)
	movl	$0, -24(%rbp)
LBB5_1:                                 ## =>This Inner Loop Header: Depth=1
	movl	-24(%rbp), %eax
	movq	-16(%rbp), %rcx
	cmpl	12(%rcx), %eax
	jge	LBB5_6
## BB#2:                                ##   in Loop: Header=BB5_1 Depth=1
	movslq	-24(%rbp), %rax
	movq	-16(%rbp), %rcx
	movq	(%rcx), %rcx
	movl	(%rcx,%rax,4), %edx
	cmpl	-20(%rbp), %edx
	jne	LBB5_4
## BB#3:
	movl	-24(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	LBB5_7
LBB5_4:                                 ##   in Loop: Header=BB5_1 Depth=1
	jmp	LBB5_5
LBB5_5:                                 ##   in Loop: Header=BB5_1 Depth=1
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	jmp	LBB5_1
LBB5_6:
	movl	$-1, -4(%rbp)
LBB5_7:
	movl	-4(%rbp), %eax
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_pop_min
	.align	4, 0x90
_pop_min:                               ## @pop_min
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp18:
	.cfi_def_cfa_offset 16
Ltmp19:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp20:
	.cfi_def_cfa_register %rbp
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rdi
	cmpl	$0, 8(%rdi)
	jne	LBB6_2
## BB#1:
	movl	$-1, -4(%rbp)
	jmp	LBB6_7
LBB6_2:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movl	(%rax), %ecx
	movl	%ecx, -20(%rbp)
	movq	-16(%rbp), %rax
	movl	8(%rax), %ecx
	addl	$-1, %ecx
	movl	%ecx, 8(%rax)
	movl	$1, -24(%rbp)
LBB6_3:                                 ## =>This Inner Loop Header: Depth=1
	movl	-24(%rbp), %eax
	movq	-16(%rbp), %rcx
	cmpl	8(%rcx), %eax
	jge	LBB6_6
## BB#4:                                ##   in Loop: Header=BB6_3 Depth=1
	movl	-24(%rbp), %eax
	subl	$1, %eax
	movslq	%eax, %rcx
	movq	-16(%rbp), %rdx
	movq	(%rdx), %rdx
	movl	(%rdx,%rcx,4), %eax
	movslq	-24(%rbp), %rcx
	movq	-16(%rbp), %rdx
	movq	(%rdx), %rdx
	movl	%eax, (%rdx,%rcx,4)
## BB#5:                                ##   in Loop: Header=BB6_3 Depth=1
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	jmp	LBB6_3
LBB6_6:
	movl	-20(%rbp), %eax
	movl	%eax, -4(%rbp)
LBB6_7:
	movl	-4(%rbp), %eax
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_print
	.align	4, 0x90
_print:                                 ## @print
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp21:
	.cfi_def_cfa_offset 16
Ltmp22:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp23:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	$0, -12(%rbp)
LBB7_1:                                 ## =>This Inner Loop Header: Depth=1
	movl	-12(%rbp), %eax
	movq	-8(%rbp), %rcx
	cmpl	8(%rcx), %eax
	jge	LBB7_4
## BB#2:                                ##   in Loop: Header=BB7_1 Depth=1
	leaq	L_.str(%rip), %rdi
	movslq	-12(%rbp), %rax
	movq	-8(%rbp), %rcx
	movq	(%rcx), %rcx
	movl	(%rcx,%rax,4), %esi
	movb	$0, %al
	callq	_printf
	movl	%eax, -16(%rbp)         ## 4-byte Spill
## BB#3:                                ##   in Loop: Header=BB7_1 Depth=1
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	LBB7_1
LBB7_4:
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"%d "


.subsections_via_symbols
