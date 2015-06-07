	.file	"vars.bc"
	.text
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:
	movl	$12, -4(%rsp)
	movl	$34, -8(%rsp)
	movl	$67, -12(%rsp)
	xorl	%eax, %eax
	ret
.Ltmp0:
	.size	main, .Ltmp0-main
	.cfi_endproc


	.section	".note.GNU-stack","",@progbits
