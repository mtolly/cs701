	.file	"sum.bc"
	.text
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:
	movl	$0, -4(%rsp)
	movl	%edi, -8(%rsp)
	movq	%rsi, -16(%rsp)
	movl	$0, -24(%rsp)
	movl	$0, -20(%rsp)
	jmp	.LBB0_1
	.align	16, 0x90
.LBB0_2:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-20(%rsp), %eax
	imull	%eax, %eax
	addl	%eax, -24(%rsp)
	incl	-20(%rsp)
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	cmpl	$99, -20(%rsp)
	jle	.LBB0_2
# BB#3:
	movl	-24(%rsp), %eax
	ret
.Ltmp0:
	.size	main, .Ltmp0-main
	.cfi_endproc


	.section	".note.GNU-stack","",@progbits
