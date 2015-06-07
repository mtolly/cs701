	.file	"sed.bc"
	.text
	.globl	gnu_dev_major
	.align	16, 0x90
	.type	gnu_dev_major,@function
gnu_dev_major:                          # @gnu_dev_major
	.cfi_startproc
# BB#0:
	movq	%rdi, -8(%rsp)
	movq	%rdi, %rax
	shrq	$32, %rax
	andl	$-4096, %eax            # imm = 0xFFFFFFFFFFFFF000
	shrl	$8, %edi
	andl	$4095, %edi             # imm = 0xFFF
	orl	%eax, %edi
	movl	%edi, %eax
	ret
.Ltmp0:
	.size	gnu_dev_major, .Ltmp0-gnu_dev_major
	.cfi_endproc

	.globl	gnu_dev_minor
	.align	16, 0x90
	.type	gnu_dev_minor,@function
gnu_dev_minor:                          # @gnu_dev_minor
	.cfi_startproc
# BB#0:
	movq	%rdi, -8(%rsp)
	movq	%rdi, %rcx
	shrq	$12, %rcx
	andl	$-256, %ecx
	movzbl	%dil, %eax
	orl	%ecx, %eax
	ret
.Ltmp1:
	.size	gnu_dev_minor, .Ltmp1-gnu_dev_minor
	.cfi_endproc

	.globl	gnu_dev_makedev
	.align	16, 0x90
	.type	gnu_dev_makedev,@function
gnu_dev_makedev:                        # @gnu_dev_makedev
	.cfi_startproc
# BB#0:
	movl	%edi, -4(%rsp)
	movl	%esi, -8(%rsp)
	movl	-4(%rsp), %eax
	movl	%eax, %esi
	andl	$4095, %esi             # imm = 0xFFF
	shll	$8, %esi
	movl	-8(%rsp), %ecx
	movzbl	%cl, %edx
	orl	%esi, %edx
	andl	$-256, %ecx
	shlq	$12, %rcx
	orq	%rdx, %rcx
	andl	$-4096, %eax            # imm = 0xFFFFFFFFFFFFF000
	shlq	$32, %rax
	orq	%rcx, %rax
	ret
.Ltmp2:
	.size	gnu_dev_makedev, .Ltmp2-gnu_dev_makedev
	.cfi_endproc

	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:
	pushq	%r14
.Ltmp6:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp7:
	.cfi_def_cfa_offset 24
	subq	$56, %rsp
.Ltmp8:
	.cfi_def_cfa_offset 80
.Ltmp9:
	.cfi_offset %rbx, -24
.Ltmp10:
	.cfi_offset %r14, -16
	movl	$0, 52(%rsp)
	movl	%edi, 48(%rsp)
	movq	%rsi, 40(%rsp)
	movq	$0, 24(%rsp)
	movl	$0, 20(%rsp)
	movl	$66246, %edi            # imm = 0x102C6
	callq	re_set_syntax
	movq	$.L.str1, myname(%rip)
	jmp	.LBB3_1
	.align	16, 0x90
.LBB3_14:                               #   in Loop: Header=BB3_1 Depth=1
	movl	$4, %edi
	callq	usage
	.align	16, 0x90
.LBB3_1:                                # =>This Inner Loop Header: Depth=1
	movq	40(%rsp), %rsi
	movl	48(%rsp), %edi
	movl	$.L.str2, %edx
	movl	$longopts, %ecx
	xorl	%r8d, %r8d
	callq	getopt_long
	movl	%eax, 36(%rsp)
	cmpl	$-1, %eax
	je	.LBB3_15
# BB#2:                                 #   in Loop: Header=BB3_1 Depth=1
	movl	36(%rsp), %eax
	cmpl	$100, %eax
	jg	.LBB3_5
# BB#3:                                 #   in Loop: Header=BB3_1 Depth=1
	cmpl	$86, %eax
	jne	.LBB3_14
	jmp	.LBB3_4
.LBB3_5:                                #   in Loop: Header=BB3_1 Depth=1
	addl	$-101, %eax
	cmpl	$9, %eax
	ja	.LBB3_14
# BB#6:                                 #   in Loop: Header=BB3_1 Depth=1
	jmpq	*.LJTI3_0(,%rax,8)
.LBB3_8:                                #   in Loop: Header=BB3_1 Depth=1
	cmpq	$0, 24(%rsp)
	jne	.LBB3_10
# BB#9:                                 #   in Loop: Header=BB3_1 Depth=1
	movq	optarg(%rip), %rdi
	callq	strlen
	leal	2(%rax), %edi
	callq	ck_malloc
	movq	%rax, 24(%rsp)
	movq	optarg(%rip), %rsi
	movq	%rax, %rdi
	callq	strcpy
	jmp	.LBB3_11
.LBB3_12:                               #   in Loop: Header=BB3_1 Depth=1
	movq	optarg(%rip), %rdi
	callq	compile_file
	movl	$1, 20(%rsp)
	jmp	.LBB3_1
.LBB3_13:                               #   in Loop: Header=BB3_1 Depth=1
	xorl	%edi, %edi
	callq	usage
	jmp	.LBB3_1
.LBB3_7:                                #   in Loop: Header=BB3_1 Depth=1
	movl	$1, no_default_output(%rip)
	jmp	.LBB3_1
.LBB3_10:                               #   in Loop: Header=BB3_1 Depth=1
	movq	24(%rsp), %rbx
	movq	%rbx, %rdi
	callq	strlen
	movq	%rax, %r14
	movq	optarg(%rip), %rdi
	callq	strlen
	leal	2(%r14,%rax), %esi
	movq	%rbx, %rdi
	callq	ck_realloc
	movq	%rax, 24(%rsp)
	movq	optarg(%rip), %rsi
	movq	%rax, %rdi
	callq	strcat
.LBB3_11:                               #   in Loop: Header=BB3_1 Depth=1
	movq	24(%rsp), %rdi
	movl	$.L.str3, %esi
	callq	strcat
	movl	$1, 20(%rsp)
	jmp	.LBB3_1
.LBB3_15:
	cmpq	$0, 24(%rsp)
	je	.LBB3_17
# BB#16:
	movq	24(%rsp), %rdi
	callq	compile_string
	movq	24(%rsp), %rdi
	callq	free
.LBB3_17:
	cmpl	$0, 20(%rsp)
	jne	.LBB3_21
# BB#18:
	movl	optind(%rip), %eax
	cmpl	48(%rsp), %eax
	jne	.LBB3_20
# BB#19:
	movl	$4, %edi
	callq	usage
.LBB3_20:
	movslq	optind(%rip), %rax
	leal	1(%rax), %ecx
	movl	%ecx, optind(%rip)
	movq	40(%rsp), %rcx
	movq	(%rcx,%rax,8), %rdi
	callq	compile_string
.LBB3_21:
	movq	jumps(%rip), %rax
	jmp	.LBB3_22
	.align	16, 0x90
.LBB3_30:                               #   in Loop: Header=BB3_22 Depth=1
	movq	8(%rsp), %rcx
	movq	(%rcx), %rax
	movq	(%rax), %rax
	movslq	8(%rcx), %rcx
	leaq	(%rcx,%rcx,2), %rcx
	shlq	$5, %rcx
	movq	(%rsp), %rdx
	movq	%rdx, 56(%rax,%rcx)
	movq	8(%rsp), %rax
	movq	24(%rax), %rax
.LBB3_22:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_24 Depth 2
	movq	%rax, 8(%rsp)
	cmpq	$0, 8(%rsp)
	je	.LBB3_31
# BB#23:                                #   in Loop: Header=BB3_22 Depth=1
	movq	labels(%rip), %rax
	jmp	.LBB3_24
	.align	16, 0x90
.LBB3_26:                               #   in Loop: Header=BB3_24 Depth=2
	movq	(%rsp), %rax
	movq	24(%rax), %rax
.LBB3_24:                               #   Parent Loop BB3_22 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%rax, (%rsp)
	cmpq	$0, (%rsp)
	je	.LBB3_27
# BB#25:                                #   in Loop: Header=BB3_24 Depth=2
	movq	8(%rsp), %rax
	movq	16(%rax), %rsi
	movq	(%rsp), %rax
	movq	16(%rax), %rdi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB3_26
.LBB3_27:                               #   in Loop: Header=BB3_22 Depth=1
	movq	8(%rsp), %rax
	movq	16(%rax), %rax
	movsbl	(%rax), %eax
	testl	%eax, %eax
	je	.LBB3_30
# BB#28:                                #   in Loop: Header=BB3_22 Depth=1
	cmpq	$0, (%rsp)
	jne	.LBB3_30
# BB#29:                                #   in Loop: Header=BB3_22 Depth=1
	movq	8(%rsp), %rax
	movq	16(%rax), %rsi
	movl	$.L.str5, %edi
	xorb	%al, %al
	callq	panic
	jmp	.LBB3_30
.LBB3_31:
	movl	$0, line+8(%rip)
	movl	$50, line+12(%rip)
	movl	$50, %edi
	callq	ck_malloc
	movq	%rax, line(%rip)
	movl	$0, append+8(%rip)
	movl	$50, append+12(%rip)
	movl	$50, %edi
	callq	ck_malloc
	movq	%rax, append(%rip)
	movl	$1, hold+8(%rip)
	movl	$50, hold+12(%rip)
	movl	$50, %edi
	callq	ck_malloc
	movq	%rax, hold(%rip)
	movb	$10, (%rax)
	movl	48(%rsp), %eax
	cmpl	optind(%rip), %eax
	jle	.LBB3_32
	.align	16, 0x90
.LBB3_33:                               # =>This Inner Loop Header: Depth=1
	movl	optind(%rip), %eax
	cmpl	48(%rsp), %eax
	jge	.LBB3_37
# BB#34:                                #   in Loop: Header=BB3_33 Depth=1
	movl	48(%rsp), %eax
	decl	%eax
	cmpl	%eax, optind(%rip)
	jne	.LBB3_36
# BB#35:                                #   in Loop: Header=BB3_33 Depth=1
	incl	last_input_file(%rip)
.LBB3_36:                               #   in Loop: Header=BB3_33 Depth=1
	movslq	optind(%rip), %rax
	movq	40(%rsp), %rcx
	movq	(%rcx,%rax,8), %rdi
	callq	read_file
	incl	optind(%rip)
	cmpl	$0, quit_cmd(%rip)
	je	.LBB3_33
	jmp	.LBB3_37
.LBB3_4:
	movq	version_string(%rip), %rdx
	movq	stdout(%rip), %rdi
	movl	$.L.str4, %esi
	xorb	%al, %al
	callq	fprintf
	xorl	%edi, %edi
	callq	exit
.LBB3_32:
	incl	last_input_file(%rip)
	movl	$.L.str6, %edi
	callq	read_file
.LBB3_37:
	callq	close_files
	cmpl	$0, bad_input(%rip)
	je	.LBB3_39
# BB#38:
	movl	$2, %edi
	callq	exit
.LBB3_39:
	xorl	%edi, %edi
	callq	exit
.Ltmp11:
	.size	main, .Ltmp11-main
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.align	8
.LJTI3_0:
	.quad	.LBB3_8
	.quad	.LBB3_12
	.quad	.LBB3_14
	.quad	.LBB3_13
	.quad	.LBB3_14
	.quad	.LBB3_14
	.quad	.LBB3_14
	.quad	.LBB3_14
	.quad	.LBB3_14
	.quad	.LBB3_7

	.text
	.globl	re_set_syntax
	.align	16, 0x90
	.type	re_set_syntax,@function
re_set_syntax:                          # @re_set_syntax
	.cfi_startproc
# BB#0:
	movl	%edi, -4(%rsp)
	movl	re_syntax_options(%rip), %eax
	movl	%eax, -8(%rsp)
	movl	-4(%rsp), %eax
	movl	%eax, re_syntax_options(%rip)
	movl	-8(%rsp), %eax
	ret
.Ltmp12:
	.size	re_set_syntax, .Ltmp12-re_set_syntax
	.cfi_endproc

	.globl	ck_malloc
	.align	16, 0x90
	.type	ck_malloc,@function
ck_malloc:                              # @ck_malloc
	.cfi_startproc
# BB#0:
	subq	$24, %rsp
.Ltmp14:
	.cfi_def_cfa_offset 32
	movl	%edi, 20(%rsp)
	testl	%edi, %edi
	jne	.LBB5_2
# BB#1:
	incl	20(%rsp)
.LBB5_2:
	movslq	20(%rsp), %rdi
	callq	malloc
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	jne	.LBB5_4
# BB#3:
	movl	$.L.str48, %edi
	xorb	%al, %al
	callq	panic
.LBB5_4:
	movq	8(%rsp), %rax
	addq	$24, %rsp
	ret
.Ltmp15:
	.size	ck_malloc, .Ltmp15-ck_malloc
	.cfi_endproc

	.globl	ck_realloc
	.align	16, 0x90
	.type	ck_realloc,@function
ck_realloc:                             # @ck_realloc
	.cfi_startproc
# BB#0:
	subq	$24, %rsp
.Ltmp17:
	.cfi_def_cfa_offset 32
	movq	%rdi, 16(%rsp)
	movl	%esi, 12(%rsp)
	movslq	12(%rsp), %rsi
	movq	16(%rsp), %rdi
	callq	realloc
	movq	%rax, (%rsp)
	testq	%rax, %rax
	jne	.LBB6_2
# BB#1:
	movl	$.L.str49, %edi
	xorb	%al, %al
	callq	panic
.LBB6_2:
	movq	(%rsp), %rax
	addq	$24, %rsp
	ret
.Ltmp18:
	.size	ck_realloc, .Ltmp18-ck_realloc
	.cfi_endproc

	.globl	compile_file
	.align	16, 0x90
	.type	compile_file,@function
compile_file:                           # @compile_file
	.cfi_startproc
# BB#0:
	subq	$24, %rsp
.Ltmp20:
	.cfi_def_cfa_offset 32
	movq	%rdi, 16(%rsp)
	movq	$0, prog_end(%rip)
	movq	$0, prog_cur(%rip)
	movq	$0, prog_start(%rip)
	movq	16(%rsp), %rax
	movq	%rax, prog_name(%rip)
	movl	$1, prog_line(%rip)
	movq	16(%rsp), %rax
	movsbl	(%rax), %eax
	cmpl	$45, %eax
	jne	.LBB7_3
# BB#1:
	movq	16(%rsp), %rax
	movsbl	1(%rax), %eax
	testl	%eax, %eax
	je	.LBB7_2
.LBB7_3:
	movq	16(%rsp), %rdi
	movl	$.L.str7, %esi
	callq	ck_fopen
	jmp	.LBB7_4
.LBB7_2:
	movq	stdin(%rip), %rax
.LBB7_4:
	movq	%rax, prog_file(%rip)
	movq	prog_file(%rip), %rdi
	callq	_IO_getc
	movl	%eax, 12(%rsp)
	cmpl	$35, %eax
	jne	.LBB7_12
# BB#5:
	movq	prog_file(%rip), %rdi
	callq	_IO_getc
	movl	%eax, 12(%rsp)
	cmpl	$110, %eax
	jne	.LBB7_7
# BB#6:
	incl	no_default_output(%rip)
	jmp	.LBB7_7
	.align	16, 0x90
.LBB7_10:                               #   in Loop: Header=BB7_7 Depth=1
	movq	prog_file(%rip), %rdi
	callq	_IO_getc
	movl	%eax, 12(%rsp)
.LBB7_7:                                # =>This Inner Loop Header: Depth=1
	xorb	%al, %al
	cmpl	$-1, 12(%rsp)
	je	.LBB7_9
# BB#8:                                 #   in Loop: Header=BB7_7 Depth=1
	cmpl	$10, 12(%rsp)
	setne	%al
.LBB7_9:                                #   in Loop: Header=BB7_7 Depth=1
	cmpb	$1, %al
	je	.LBB7_10
# BB#11:
	incl	prog_line(%rip)
	jmp	.LBB7_14
.LBB7_12:
	cmpl	$-1, 12(%rsp)
	je	.LBB7_14
# BB#13:
	movq	prog_file(%rip), %rsi
	movl	12(%rsp), %edi
	callq	ungetc
.LBB7_14:
	movl	prog_line(%rip), %esi
	movq	the_program(%rip), %rdi
	callq	compile_program
	movq	%rax, the_program(%rip)
	addq	$24, %rsp
	ret
.Ltmp21:
	.size	compile_file, .Ltmp21-compile_file
	.cfi_endproc

	.globl	usage
	.align	16, 0x90
	.type	usage,@function
usage:                                  # @usage
	.cfi_startproc
# BB#0:
	pushq	%rax
.Ltmp23:
	.cfi_def_cfa_offset 16
	movl	%edi, 4(%rsp)
	testl	%edi, %edi
	movq	stdout(%rip), %rdi
	movq	myname(%rip), %rdx
	movl	$.L.str41, %esi
	xorb	%al, %al
	callq	fprintf
	movl	4(%rsp), %edi
	callq	exit
.Ltmp24:
	.size	usage, .Ltmp24-usage
	.cfi_endproc

	.globl	compile_string
	.align	16, 0x90
	.type	compile_string,@function
compile_string:                         # @compile_string
	.cfi_startproc
# BB#0:
	pushq	%rbx
.Ltmp27:
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
.Ltmp28:
	.cfi_def_cfa_offset 32
.Ltmp29:
	.cfi_offset %rbx, -16
	movq	%rdi, 8(%rsp)
	movq	$0, prog_file(%rip)
	movl	$0, prog_line(%rip)
	movq	8(%rsp), %rax
	movq	%rax, prog_cur(%rip)
	movq	%rax, prog_start(%rip)
	movq	8(%rsp), %rbx
	movq	%rbx, %rdi
	callq	strlen
	addq	%rbx, %rax
	movq	%rax, prog_end(%rip)
	movl	prog_line(%rip), %esi
	movq	the_program(%rip), %rdi
	callq	compile_program
	movq	%rax, the_program(%rip)
	addq	$16, %rsp
	popq	%rbx
	ret
.Ltmp30:
	.size	compile_string, .Ltmp30-compile_string
	.cfi_endproc

	.globl	panic
	.align	16, 0x90
	.type	panic,@function
panic:                                  # @panic
	.cfi_startproc
# BB#0:
	subq	$216, %rsp
.Ltmp32:
	.cfi_def_cfa_offset 224
	testb	%al, %al
	je	.LBB10_2
# BB#1:
	movaps	%xmm0, 48(%rsp)
	movaps	%xmm1, 64(%rsp)
	movaps	%xmm2, 80(%rsp)
	movaps	%xmm3, 96(%rsp)
	movaps	%xmm4, 112(%rsp)
	movaps	%xmm5, 128(%rsp)
	movaps	%xmm6, 144(%rsp)
	movaps	%xmm7, 160(%rsp)
.LBB10_2:
	movq	%r9, 40(%rsp)
	movq	%r8, 32(%rsp)
	movq	%rcx, 24(%rsp)
	movq	%rdx, 16(%rsp)
	movq	%rsi, 8(%rsp)
	movq	%rdi, 208(%rsp)
	movq	myname(%rip), %rdx
	movq	stdout(%rip), %rdi
	movl	$.L.str42, %esi
	xorb	%al, %al
	callq	fprintf
	leaq	(%rsp), %rax
	movq	%rax, 192(%rsp)
	leaq	224(%rsp), %rax
	movq	%rax, 184(%rsp)
	movl	$48, 180(%rsp)
	movl	$8, 176(%rsp)
	leaq	176(%rsp), %rdx
	movq	208(%rsp), %rsi
	movq	stdout(%rip), %rdi
	callq	vfprintf
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	callq	_IO_putc
	movl	$4, %edi
	callq	exit
.Ltmp33:
	.size	panic, .Ltmp33-panic
	.cfi_endproc

	.globl	read_file
	.align	16, 0x90
	.type	read_file,@function
read_file:                              # @read_file
	.cfi_startproc
# BB#0:
	subq	$24, %rsp
.Ltmp35:
	.cfi_def_cfa_offset 32
	movq	%rdi, 16(%rsp)
	movsbl	(%rdi), %eax
	cmpl	$45, %eax
	jne	.LBB11_10
# BB#1:
	movq	16(%rsp), %rax
	movsbl	1(%rax), %eax
	testl	%eax, %eax
	je	.LBB11_2
.LBB11_10:
	movq	16(%rsp), %rdi
	movl	$.L.str7, %esi
	callq	fopen
	movq	%rax, input_file(%rip)
	testq	%rax, %rax
	jne	.LBB11_3
# BB#11:
	callq	__errno_location
	movl	(%rax), %edi
	callq	strerror
	movq	%rax, 8(%rsp)
	incl	bad_input(%rip)
	movq	8(%rsp), %r8
	movq	16(%rsp), %rcx
	movq	myname(%rip), %rdx
	movq	stdout(%rip), %rdi
	movl	$.L.str27, %esi
	xorb	%al, %al
	callq	fprintf
	addq	$24, %rsp
	ret
.LBB11_2:
	movq	stdin(%rip), %rax
	movq	%rax, input_file(%rip)
	.align	16, 0x90
.LBB11_3:                               # =>This Inner Loop Header: Depth=1
	callq	read_pattern_space
	testl	%eax, %eax
	je	.LBB11_9
# BB#4:                                 #   in Loop: Header=BB11_3 Depth=1
	movq	the_program(%rip), %rdi
	callq	execute_program
	cmpl	$0, no_default_output(%rip)
	jne	.LBB11_6
# BB#5:                                 #   in Loop: Header=BB11_3 Depth=1
	movq	stdout(%rip), %rcx
	movl	line+8(%rip), %edx
	movq	line(%rip), %rdi
	movl	$1, %esi
	callq	ck_fwrite
.LBB11_6:                               #   in Loop: Header=BB11_3 Depth=1
	cmpl	$0, append+8(%rip)
	je	.LBB11_8
# BB#7:                                 #   in Loop: Header=BB11_3 Depth=1
	movq	stdout(%rip), %rcx
	movl	append+8(%rip), %edx
	movq	append(%rip), %rdi
	movl	$1, %esi
	callq	ck_fwrite
	movl	$0, append+8(%rip)
.LBB11_8:                               #   in Loop: Header=BB11_3 Depth=1
	cmpl	$0, quit_cmd(%rip)
	je	.LBB11_3
.LBB11_9:
	movq	input_file(%rip), %rdi
	callq	ck_fclose
	addq	$24, %rsp
	ret
.Ltmp36:
	.size	read_file, .Ltmp36-read_file
	.cfi_endproc

	.globl	close_files
	.align	16, 0x90
	.type	close_files,@function
close_files:                            # @close_files
	.cfi_startproc
# BB#0:
	pushq	%rax
.Ltmp38:
	.cfi_def_cfa_offset 16
	movl	$0, 4(%rsp)
	jmp	.LBB12_1
	.align	16, 0x90
.LBB12_4:                               #   in Loop: Header=BB12_1 Depth=1
	incl	4(%rsp)
.LBB12_1:                               # =>This Inner Loop Header: Depth=1
	cmpl	$31, 4(%rsp)
	jg	.LBB12_5
# BB#2:                                 #   in Loop: Header=BB12_1 Depth=1
	movslq	4(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	cmpq	$0, file_ptrs(,%rax,8)
	je	.LBB12_4
# BB#3:                                 #   in Loop: Header=BB12_1 Depth=1
	movslq	4(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movq	file_ptrs(,%rax,8), %rdi
	callq	fclose
	jmp	.LBB12_4
.LBB12_5:
	popq	%rax
	ret
.Ltmp39:
	.size	close_files, .Ltmp39-close_files
	.cfi_endproc

	.globl	compile_program
	.align	16, 0x90
	.type	compile_program,@function
compile_program:                        # @compile_program
	.cfi_startproc
# BB#0:
	pushq	%rbx
.Ltmp42:
	.cfi_def_cfa_offset 16
	subq	$80, %rsp
.Ltmp43:
	.cfi_def_cfa_offset 96
.Ltmp44:
	.cfi_offset %rbx, -16
	movq	%rdi, 64(%rsp)
	movl	%esi, 60(%rsp)
	movl	$0, 40(%rsp)
	cmpq	$0, 64(%rsp)
	jne	.LBB13_2
# BB#1:
	movl	$32, %edi
	callq	ck_malloc
	movq	%rax, 64(%rsp)
	movl	$3840, %edi             # imm = 0xF00
	callq	ck_malloc
	movq	64(%rsp), %rcx
	movq	%rax, (%rcx)
	movq	64(%rsp), %rax
	movl	$40, 12(%rax)
	movq	64(%rsp), %rax
	movl	$0, 8(%rax)
	movq	64(%rsp), %rax
	movq	$0, 16(%rax)
	movq	64(%rsp), %rax
	movl	$0, 24(%rax)
	jmp	.LBB13_2
	.align	16, 0x90
.LBB13_165:                             #   in Loop: Header=BB13_2 Depth=1
	movl	$.L.str19, %edi
	callq	bad_prog
	.align	16, 0x90
.LBB13_2:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB13_114 Depth 2
                                        #       Child Loop BB13_139 Depth 3
                                        #     Child Loop BB13_97 Depth 2
                                        #     Child Loop BB13_27 Depth 2
                                        #       Child Loop BB13_58 Depth 3
                                        #     Child Loop BB13_15 Depth 2
                                        #     Child Loop BB13_32 Depth 2
                                        #     Child Loop BB13_68 Depth 2
                                        #     Child Loop BB13_155 Depth 2
                                        #     Child Loop BB13_150 Depth 2
                                        #     Child Loop BB13_147 Depth 2
                                        #     Child Loop BB13_44 Depth 2
	movl	40(%rsp), %eax
	movl	%eax, 44(%rsp)
	callq	inchar
	movl	%eax, 40(%rsp)
	cmpl	$92, 44(%rsp)
	jne	.LBB13_5
# BB#3:                                 #   in Loop: Header=BB13_2 Depth=1
	cmpl	$10, 40(%rsp)
	jne	.LBB13_5
# BB#4:                                 #   in Loop: Header=BB13_2 Depth=1
	callq	inchar
	movl	%eax, 40(%rsp)
.LBB13_5:                               #   in Loop: Header=BB13_2 Depth=1
	xorb	%al, %al
	cmpl	$-1, 40(%rsp)
	je	.LBB13_9
# BB#6:                                 #   in Loop: Header=BB13_2 Depth=1
	movslq	40(%rsp), %rbx
	callq	__ctype_b_loc
	movq	(%rax), %rax
	movzwl	(%rax,%rbx,2), %ecx
	movb	$1, %al
	testb	$1, %cl
	jne	.LBB13_9
# BB#7:                                 #   in Loop: Header=BB13_2 Depth=1
	movb	$1, %al
	cmpl	$10, 40(%rsp)
	je	.LBB13_9
# BB#8:                                 #   in Loop: Header=BB13_2 Depth=1
	cmpl	$59, 40(%rsp)
	sete	%al
.LBB13_9:                               #   in Loop: Header=BB13_2 Depth=1
	testb	%al, %al
	jne	.LBB13_2
# BB#10:                                #   in Loop: Header=BB13_2 Depth=1
	cmpl	$-1, 40(%rsp)
	je	.LBB13_166
# BB#11:                                #   in Loop: Header=BB13_2 Depth=1
	movl	40(%rsp), %edi
	callq	savchar
	movq	64(%rsp), %rax
	movl	8(%rax), %ecx
	cmpl	12(%rax), %ecx
	jne	.LBB13_13
# BB#12:                                #   in Loop: Header=BB13_2 Depth=1
	movq	64(%rsp), %rax
	movq	(%rax), %rdi
	imull	$96, 8(%rax), %esi
	addl	$3840, %esi             # imm = 0xF00
	callq	ck_realloc
	movq	64(%rsp), %rcx
	movq	%rax, (%rcx)
	movq	64(%rsp), %rax
	addl	$40, 12(%rax)
.LBB13_13:                              #   in Loop: Header=BB13_2 Depth=1
	movq	64(%rsp), %rax
	movslq	8(%rax), %rcx
	leaq	(%rcx,%rcx,2), %rcx
	shlq	$5, %rcx
	addq	(%rax), %rcx
	movq	%rcx, 48(%rsp)
	movq	64(%rsp), %rax
	incl	8(%rax)
	movq	48(%rsp), %rax
	movl	$0, (%rax)
	movq	48(%rsp), %rax
	movl	$0, 24(%rax)
	movq	48(%rsp), %rax
	movl	$0, 48(%rax)
	movq	48(%rsp), %rax
	movb	$0, 52(%rax)
	movq	48(%rsp), %rdi
	callq	compile_address
	testl	%eax, %eax
	je	.LBB13_21
# BB#14:                                #   in Loop: Header=BB13_2 Depth=1
	callq	inchar
	movl	%eax, 40(%rsp)
	cmpl	$44, %eax
	je	.LBB13_15
# BB#20:                                #   in Loop: Header=BB13_2 Depth=1
	movl	40(%rsp), %edi
	callq	savchar
	jmp	.LBB13_21
	.align	16, 0x90
.LBB13_15:                              #   Parent Loop BB13_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	callq	inchar
	movl	%eax, 40(%rsp)
	xorb	%al, %al
	cmpl	$-1, 40(%rsp)
	je	.LBB13_17
# BB#16:                                #   in Loop: Header=BB13_15 Depth=2
	movslq	40(%rsp), %rbx
	callq	__ctype_b_loc
	movq	(%rax), %rax
	movb	(%rax,%rbx,2), %al
	andb	$1, %al
.LBB13_17:                              #   in Loop: Header=BB13_15 Depth=2
	testb	%al, %al
	jne	.LBB13_15
# BB#18:                                #   in Loop: Header=BB13_2 Depth=1
	movl	40(%rsp), %edi
	callq	savchar
	movq	48(%rsp), %rdi
	addq	$24, %rdi
	callq	compile_address
	testl	%eax, %eax
	jne	.LBB13_21
# BB#19:                                #   in Loop: Header=BB13_2 Depth=1
	movl	$.L.str8, %edi
	callq	bad_prog
.LBB13_21:                              #   in Loop: Header=BB13_2 Depth=1
	movq	48(%rsp), %rax
	cmpl	$1, (%rax)
	jne	.LBB13_25
# BB#22:                                #   in Loop: Header=BB13_2 Depth=1
	movq	48(%rsp), %rax
	cmpl	$1, 24(%rax)
	jne	.LBB13_25
# BB#23:                                #   in Loop: Header=BB13_2 Depth=1
	movq	48(%rsp), %rax
	movl	40(%rax), %ecx
	cmpl	16(%rax), %ecx
	jge	.LBB13_25
# BB#24:                                #   in Loop: Header=BB13_2 Depth=1
	movq	48(%rsp), %rax
	movl	16(%rax), %ecx
	movl	%ecx, 40(%rax)
.LBB13_25:                              #   in Loop: Header=BB13_2 Depth=1
	callq	inchar
	movl	%eax, 40(%rsp)
	cmpl	$-1, %eax
	jne	.LBB13_27
	.align	16, 0x90
.LBB13_26:                              #   in Loop: Header=BB13_2 Depth=1
	movl	$NO_COMMAND, %edi
	callq	bad_prog
	.align	16, 0x90
.LBB13_27:                              #   Parent Loop BB13_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB13_58 Depth 3
	movl	40(%rsp), %eax
	cmpl	$57, %eax
	jg	.LBB13_36
# BB#28:                                #   in Loop: Header=BB13_27 Depth=2
	cmpl	$33, %eax
	jne	.LBB13_29
# BB#55:                                #   in Loop: Header=BB13_27 Depth=2
	movq	48(%rsp), %rax
	testb	$2, 48(%rax)
	je	.LBB13_57
# BB#56:                                #   in Loop: Header=BB13_27 Depth=2
	movl	$.L.str9, %edi
	callq	bad_prog
.LBB13_57:                              #   in Loop: Header=BB13_27 Depth=2
	movq	48(%rsp), %rax
	orl	$2, 48(%rax)
	.align	16, 0x90
.LBB13_58:                              #   Parent Loop BB13_2 Depth=1
                                        #     Parent Loop BB13_27 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	callq	inchar
	movl	%eax, 40(%rsp)
	xorb	%al, %al
	cmpl	$-1, 40(%rsp)
	je	.LBB13_60
# BB#59:                                #   in Loop: Header=BB13_58 Depth=3
	movslq	40(%rsp), %rbx
	callq	__ctype_b_loc
	movq	(%rax), %rax
	movb	(%rax,%rbx,2), %al
	andb	$1, %al
.LBB13_60:                              #   in Loop: Header=BB13_58 Depth=3
	testb	%al, %al
	jne	.LBB13_58
# BB#61:                                #   in Loop: Header=BB13_27 Depth=2
	cmpl	$-1, 40(%rsp)
	je	.LBB13_26
	jmp	.LBB13_27
.LBB13_36:                              #   in Loop: Header=BB13_2 Depth=1
	cmpl	$96, %eax
	jg	.LBB13_53
# BB#37:                                #   in Loop: Header=BB13_2 Depth=1
	addl	$-58, %eax
	cmpl	$22, %eax
	ja	.LBB13_165
# BB#38:                                #   in Loop: Header=BB13_2 Depth=1
	movl	$5268480, %ecx          # imm = 0x506400
	btl	%eax, %ecx
	jb	.LBB13_43
# BB#39:                                #   in Loop: Header=BB13_2 Depth=1
	testl	%eax, %eax
	je	.LBB13_89
# BB#40:                                #   in Loop: Header=BB13_2 Depth=1
	cmpl	$3, %eax
	jne	.LBB13_165
	jmp	.LBB13_41
.LBB13_29:                              #   in Loop: Header=BB13_2 Depth=1
	cmpl	$35, %eax
	jne	.LBB13_165
# BB#30:                                #   in Loop: Header=BB13_2 Depth=1
	movq	48(%rsp), %rax
	cmpl	$0, (%rax)
	je	.LBB13_32
# BB#31:                                #   in Loop: Header=BB13_2 Depth=1
	movl	$NO_ADDR, %edi
	callq	bad_prog
	.align	16, 0x90
.LBB13_32:                              #   Parent Loop BB13_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	callq	inchar
	movl	%eax, 40(%rsp)
	xorb	%al, %al
	cmpl	$-1, 40(%rsp)
	je	.LBB13_34
# BB#33:                                #   in Loop: Header=BB13_32 Depth=2
	cmpl	$10, 40(%rsp)
	setne	%al
.LBB13_34:                              #   in Loop: Header=BB13_32 Depth=2
	testb	%al, %al
	jne	.LBB13_32
# BB#35:                                #   in Loop: Header=BB13_2 Depth=1
	movq	64(%rsp), %rax
	decl	8(%rax)
	jmp	.LBB13_2
.LBB13_53:                              #   in Loop: Header=BB13_2 Depth=1
	addl	$-97, %eax
	cmpl	$28, %eax
	ja	.LBB13_165
# BB#54:                                #   in Loop: Header=BB13_2 Depth=1
	jmpq	*.LJTI13_0(,%rax,8)
.LBB13_62:                              #   in Loop: Header=BB13_2 Depth=1
	movq	48(%rsp), %rax
	cmpl	$0, 24(%rax)
	je	.LBB13_64
# BB#63:                                #   in Loop: Header=BB13_2 Depth=1
	movl	$ONE_ADDR, %edi
	callq	bad_prog
.LBB13_64:                              #   in Loop: Header=BB13_2 Depth=1
	movq	48(%rsp), %rax
	movb	40(%rsp), %cl
	movb	%cl, 52(%rax)
	callq	inchar
	cmpl	$92, %eax
	jne	.LBB13_66
# BB#65:                                #   in Loop: Header=BB13_2 Depth=1
	callq	inchar
	cmpl	$10, %eax
	je	.LBB13_67
.LBB13_66:                              #   in Loop: Header=BB13_2 Depth=1
	movl	$LINE_JUNK, %edi
	callq	bad_prog
.LBB13_67:                              #   in Loop: Header=BB13_2 Depth=1
	callq	init_buffer
	movq	%rax, 24(%rsp)
	jmp	.LBB13_68
	.align	16, 0x90
.LBB13_73:                              #   in Loop: Header=BB13_68 Depth=2
	movl	40(%rsp), %esi
	movq	24(%rsp), %rdi
	callq	add1_buffer
.LBB13_68:                              #   Parent Loop BB13_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	callq	inchar
	movl	%eax, 40(%rsp)
	xorb	%cl, %cl
	cmpl	$-1, %eax
	je	.LBB13_70
# BB#69:                                #   in Loop: Header=BB13_68 Depth=2
	cmpl	$10, 40(%rsp)
	setne	%cl
.LBB13_70:                              #   in Loop: Header=BB13_68 Depth=2
	cmpb	$1, %cl
	jne	.LBB13_74
# BB#71:                                #   in Loop: Header=BB13_68 Depth=2
	cmpl	$92, 40(%rsp)
	jne	.LBB13_73
# BB#72:                                #   in Loop: Header=BB13_68 Depth=2
	callq	inchar
	movl	%eax, 40(%rsp)
	jmp	.LBB13_73
.LBB13_41:                              #   in Loop: Header=BB13_2 Depth=1
	movq	48(%rsp), %rax
	cmpl	$0, 24(%rax)
	je	.LBB13_43
# BB#42:                                #   in Loop: Header=BB13_2 Depth=1
	movl	$ONE_ADDR, %edi
	callq	bad_prog
.LBB13_43:                              #   in Loop: Header=BB13_2 Depth=1
	movq	48(%rsp), %rax
	movb	40(%rsp), %cl
	movb	%cl, 52(%rax)
	.align	16, 0x90
.LBB13_44:                              #   Parent Loop BB13_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	callq	inchar
	movl	%eax, 40(%rsp)
	xorb	%al, %al
	cmpl	$-1, 40(%rsp)
	je	.LBB13_48
# BB#45:                                #   in Loop: Header=BB13_44 Depth=2
	movslq	40(%rsp), %rbx
	callq	__ctype_b_loc
	movq	(%rax), %rcx
	xorb	%al, %al
	testb	$1, (%rcx,%rbx,2)
	je	.LBB13_48
# BB#46:                                #   in Loop: Header=BB13_44 Depth=2
	xorb	%al, %al
	cmpl	$10, 40(%rsp)
	je	.LBB13_48
# BB#47:                                #   in Loop: Header=BB13_44 Depth=2
	cmpl	$59, 40(%rsp)
	setne	%al
.LBB13_48:                              #   in Loop: Header=BB13_44 Depth=2
	testb	%al, %al
	jne	.LBB13_44
# BB#49:                                #   in Loop: Header=BB13_2 Depth=1
	cmpl	$10, 40(%rsp)
	je	.LBB13_2
# BB#50:                                #   in Loop: Header=BB13_2 Depth=1
	cmpl	$59, 40(%rsp)
	je	.LBB13_2
# BB#51:                                #   in Loop: Header=BB13_2 Depth=1
	cmpl	$-1, 40(%rsp)
	je	.LBB13_2
	jmp	.LBB13_52
.LBB13_74:                              #   in Loop: Header=BB13_2 Depth=1
	cmpl	$-1, 40(%rsp)
	je	.LBB13_76
# BB#75:                                #   in Loop: Header=BB13_2 Depth=1
	movl	40(%rsp), %esi
	movq	24(%rsp), %rdi
	callq	add1_buffer
.LBB13_76:                              #   in Loop: Header=BB13_2 Depth=1
	movq	24(%rsp), %rdi
	callq	size_buffer
	movl	%eax, 12(%rsp)
	movl	%eax, %edi
	callq	ck_malloc
	movq	%rax, 16(%rsp)
	movq	24(%rsp), %rdi
	callq	get_buffer
	movslq	12(%rsp), %rdx
	movq	16(%rsp), %rsi
	movq	%rax, %rdi
	callq	bcopy
	movq	24(%rsp), %rdi
	callq	flush_buffer
	movq	48(%rsp), %rax
	movl	12(%rsp), %ecx
	movl	%ecx, 64(%rax)
	movq	48(%rsp), %rax
	movq	16(%rsp), %rcx
	movq	%rcx, 56(%rax)
	jmp	.LBB13_2
.LBB13_92:                              #   in Loop: Header=BB13_2 Depth=1
	movq	48(%rsp), %rax
	movb	40(%rsp), %cl
	movb	%cl, 52(%rax)
	movq	64(%rsp), %rdx
	movq	48(%rsp), %rsi
	movq	jumps(%rip), %rdi
	callq	setup_jump
	movq	%rax, jumps(%rip)
	jmp	.LBB13_2
.LBB13_93:                              #   in Loop: Header=BB13_2 Depth=1
	movq	48(%rsp), %rax
	cmpl	$0, 24(%rax)
	je	.LBB13_95
# BB#94:                                #   in Loop: Header=BB13_2 Depth=1
	movl	$ONE_ADDR, %edi
	callq	bad_prog
.LBB13_95:                              #   in Loop: Header=BB13_2 Depth=1
	movq	48(%rsp), %rax
	movb	40(%rsp), %cl
	movb	%cl, 52(%rax)
	cmpl	$114, 40(%rsp)
	sete	%al
	movzbl	%al, %edi
	callq	compile_filename
	movq	48(%rsp), %rcx
	movq	%rax, 56(%rcx)
	jmp	.LBB13_2
.LBB13_96:                              #   in Loop: Header=BB13_2 Depth=1
	movq	48(%rsp), %rax
	movb	40(%rsp), %cl
	movb	%cl, 52(%rax)
	callq	inchar
	movl	%eax, 36(%rsp)
	movl	%eax, %edi
	callq	compile_regex
	movq	48(%rsp), %rax
	movq	last_regex(%rip), %rcx
	movq	%rcx, 56(%rax)
	callq	init_buffer
	movq	%rax, 24(%rsp)
	jmp	.LBB13_97
	.align	16, 0x90
.LBB13_106:                             #   in Loop: Header=BB13_97 Depth=2
	movq	24(%rsp), %rdi
	callq	add1_buffer
	.align	16, 0x90
.LBB13_97:                              #   Parent Loop BB13_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	callq	inchar
	movl	%eax, 40(%rsp)
	xorb	%cl, %cl
	cmpl	$-1, %eax
	je	.LBB13_100
# BB#98:                                #   in Loop: Header=BB13_97 Depth=2
	xorb	%cl, %cl
	movl	40(%rsp), %eax
	cmpl	36(%rsp), %eax
	je	.LBB13_100
# BB#99:                                #   in Loop: Header=BB13_97 Depth=2
	cmpl	$10, 40(%rsp)
	setne	%cl
.LBB13_100:                             #   in Loop: Header=BB13_97 Depth=2
	cmpb	$1, %cl
	jne	.LBB13_108
# BB#101:                               #   in Loop: Header=BB13_97 Depth=2
	cmpl	$92, 40(%rsp)
	jne	.LBB13_107
# BB#102:                               #   in Loop: Header=BB13_97 Depth=2
	callq	inchar
	movl	%eax, 8(%rsp)
	cmpl	$-1, %eax
	je	.LBB13_97
# BB#103:                               #   in Loop: Header=BB13_97 Depth=2
	cmpl	$10, 8(%rsp)
	je	.LBB13_105
# BB#104:                               #   in Loop: Header=BB13_97 Depth=2
	movl	40(%rsp), %esi
	movq	24(%rsp), %rdi
	callq	add1_buffer
.LBB13_105:                             #   in Loop: Header=BB13_97 Depth=2
	movl	8(%rsp), %esi
	jmp	.LBB13_106
.LBB13_107:                             #   in Loop: Header=BB13_97 Depth=2
	movl	40(%rsp), %esi
	jmp	.LBB13_106
.LBB13_146:                             #   in Loop: Header=BB13_2 Depth=1
	movq	48(%rsp), %rax
	movb	40(%rsp), %cl
	movb	%cl, 52(%rax)
	movl	$256, %edi              # imm = 0x100
	callq	ck_malloc
	movq	%rax, 16(%rsp)
	movl	$0, 12(%rsp)
	jmp	.LBB13_147
	.align	16, 0x90
.LBB13_148:                             #   in Loop: Header=BB13_147 Depth=2
	movslq	12(%rsp), %rax
	movq	16(%rsp), %rcx
	movb	%al, (%rcx,%rax)
	incl	12(%rsp)
.LBB13_147:                             #   Parent Loop BB13_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$255, 12(%rsp)
	jle	.LBB13_148
# BB#149:                               #   in Loop: Header=BB13_2 Depth=1
	callq	init_buffer
	movq	%rax, 24(%rsp)
	callq	inchar
	movl	%eax, 36(%rsp)
	jmp	.LBB13_150
	.align	16, 0x90
.LBB13_153:                             #   in Loop: Header=BB13_150 Depth=2
	movl	40(%rsp), %esi
	movq	24(%rsp), %rdi
	callq	add1_buffer
.LBB13_150:                             #   Parent Loop BB13_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	callq	inchar
	movl	%eax, 40(%rsp)
	xorb	%cl, %cl
	cmpl	$-1, %eax
	je	.LBB13_152
# BB#151:                               #   in Loop: Header=BB13_150 Depth=2
	movl	40(%rsp), %eax
	cmpl	36(%rsp), %eax
	setne	%cl
.LBB13_152:                             #   in Loop: Header=BB13_150 Depth=2
	cmpb	$1, %cl
	je	.LBB13_153
# BB#154:                               #   in Loop: Header=BB13_2 Depth=1
	movq	48(%rsp), %rax
	movq	16(%rsp), %rcx
	movq	%rcx, 56(%rax)
	movq	24(%rsp), %rdi
	callq	get_buffer
	movq	%rax, 16(%rsp)
	movq	24(%rsp), %rdi
	callq	size_buffer
	movl	%eax, 12(%rsp)
	jmp	.LBB13_155
	.align	16, 0x90
.LBB13_160:                             #   in Loop: Header=BB13_155 Depth=2
	movq	16(%rsp), %rcx
	leaq	1(%rcx), %rdx
	movb	40(%rsp), %al
	movq	%rdx, 16(%rsp)
	movzbl	(%rcx), %ecx
	movq	48(%rsp), %rdx
	movq	56(%rdx), %rdx
	movb	%al, (%rdx,%rcx)
	decl	12(%rsp)
.LBB13_155:                             #   Parent Loop BB13_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$0, 12(%rsp)
	je	.LBB13_161
# BB#156:                               #   in Loop: Header=BB13_155 Depth=2
	callq	inchar
	movl	%eax, 40(%rsp)
	cmpl	$-1, %eax
	jne	.LBB13_158
# BB#157:                               #   in Loop: Header=BB13_155 Depth=2
	movl	$BAD_EOF, %edi
	callq	bad_prog
.LBB13_158:                             #   in Loop: Header=BB13_155 Depth=2
	movl	40(%rsp), %eax
	cmpl	36(%rsp), %eax
	jne	.LBB13_160
# BB#159:                               #   in Loop: Header=BB13_155 Depth=2
	movl	$.L.str18, %edi
	callq	bad_prog
	jmp	.LBB13_160
.LBB13_77:                              #   in Loop: Header=BB13_2 Depth=1
	movq	48(%rsp), %rax
	movb	40(%rsp), %cl
	movb	%cl, 52(%rax)
	incl	program_depth(%rip)
	movl	prog_line(%rip), %esi
	xorl	%edi, %edi
	xorb	%al, %al
	callq	compile_program
	movq	48(%rsp), %rcx
	movq	%rax, 56(%rcx)
	movq	48(%rsp), %rax
	movq	56(%rax), %rax
	movq	64(%rsp), %rcx
	movq	%rcx, 16(%rax)
	movq	48(%rsp), %rax
	movq	56(%rax), %rax
	movq	64(%rsp), %rcx
	movl	8(%rcx), %ecx
	decl	%ecx
	movl	%ecx, 24(%rax)
	jmp	.LBB13_2
.LBB13_108:                             #   in Loop: Header=BB13_2 Depth=1
	movl	40(%rsp), %eax
	cmpl	36(%rsp), %eax
	je	.LBB13_113
# BB#109:                               #   in Loop: Header=BB13_2 Depth=1
	cmpl	$10, 40(%rsp)
	jne	.LBB13_112
# BB#110:                               #   in Loop: Header=BB13_2 Depth=1
	cmpl	$2, prog_line(%rip)
	jl	.LBB13_112
# BB#111:                               #   in Loop: Header=BB13_2 Depth=1
	decl	prog_line(%rip)
.LBB13_112:                             #   in Loop: Header=BB13_2 Depth=1
	movl	$.L.str13, %edi
	callq	bad_prog
.LBB13_113:                             #   in Loop: Header=BB13_2 Depth=1
	movq	24(%rsp), %rdi
	callq	size_buffer
	movq	48(%rsp), %rcx
	movl	%eax, 72(%rcx)
	movq	48(%rsp), %rax
	movl	72(%rax), %edi
	callq	ck_malloc
	movq	48(%rsp), %rcx
	movq	%rax, 64(%rcx)
	movq	24(%rsp), %rdi
	callq	get_buffer
	movq	48(%rsp), %rcx
	movslq	72(%rcx), %rdx
	movq	64(%rcx), %rsi
	movq	%rax, %rdi
	callq	bcopy
	movq	24(%rsp), %rdi
	callq	flush_buffer
	movq	48(%rsp), %rax
	movl	$0, 76(%rax)
	movq	48(%rsp), %rax
	movl	$0, 80(%rax)
	cmpl	$-1, 40(%rsp)
	je	.LBB13_2
	.align	16, 0x90
.LBB13_114:                             #   Parent Loop BB13_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB13_139 Depth 3
	callq	inchar
	movl	%eax, 40(%rsp)
	cmpl	$9, %eax
	jg	.LBB13_116
# BB#115:                               #   in Loop: Header=BB13_114 Depth=2
	cmpl	$-1, %eax
	jne	.LBB13_121
	jmp	.LBB13_142
.LBB13_116:                             #   in Loop: Header=BB13_114 Depth=2
	cmpl	$47, %eax
	jg	.LBB13_118
# BB#117:                               #   in Loop: Header=BB13_114 Depth=2
	cmpl	$10, %eax
	jne	.LBB13_121
	jmp	.LBB13_142
.LBB13_118:                             #   in Loop: Header=BB13_114 Depth=2
	cmpl	$102, %eax
	jg	.LBB13_122
# BB#119:                               #   in Loop: Header=BB13_114 Depth=2
	leal	-48(%rax), %ecx
	cmpl	$10, %ecx
	jae	.LBB13_120
# BB#134:                               #   in Loop: Header=BB13_114 Depth=2
	movq	48(%rsp), %rax
	testb	$8, 76(%rax)
	je	.LBB13_136
# BB#135:                               #   in Loop: Header=BB13_114 Depth=2
	movl	$.L.str16, %edi
	callq	bad_prog
.LBB13_136:                             #   in Loop: Header=BB13_114 Depth=2
	movq	48(%rsp), %rax
	testb	$1, 76(%rax)
	jne	.LBB13_138
# BB#137:                               #   in Loop: Header=BB13_114 Depth=2
	movq	48(%rsp), %rax
	orl	$8, 76(%rax)
.LBB13_138:                             #   in Loop: Header=BB13_114 Depth=2
	movl	$0, 12(%rsp)
	jmp	.LBB13_139
	.align	16, 0x90
.LBB13_140:                             #   in Loop: Header=BB13_139 Depth=3
	movl	40(%rsp), %eax
	imull	$10, 12(%rsp), %ecx
	leal	-48(%rcx,%rax), %eax
	movl	%eax, 12(%rsp)
	callq	inchar
	movl	%eax, 40(%rsp)
.LBB13_139:                             #   Parent Loop BB13_2 Depth=1
                                        #     Parent Loop BB13_114 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movslq	40(%rsp), %rbx
	callq	__ctype_b_loc
	movq	(%rax), %rax
	testb	$8, 1(%rax,%rbx,2)
	jne	.LBB13_140
# BB#141:                               #   in Loop: Header=BB13_114 Depth=2
	movl	40(%rsp), %edi
	callq	savchar
	movq	48(%rsp), %rax
	movl	12(%rsp), %ecx
	movl	%ecx, 80(%rax)
	jmp	.LBB13_142
.LBB13_122:                             #   in Loop: Header=BB13_114 Depth=2
	cmpl	$103, %eax
	jne	.LBB13_123
# BB#128:                               #   in Loop: Header=BB13_114 Depth=2
	movq	48(%rsp), %rax
	testb	$8, 76(%rax)
	je	.LBB13_130
# BB#129:                               #   in Loop: Header=BB13_114 Depth=2
	movq	48(%rsp), %rax
	andl	$-9, 76(%rax)
.LBB13_130:                             #   in Loop: Header=BB13_114 Depth=2
	movq	48(%rsp), %rax
	testb	$1, 76(%rax)
	je	.LBB13_132
# BB#131:                               #   in Loop: Header=BB13_114 Depth=2
	movl	$.L.str15, %edi
	callq	bad_prog
.LBB13_132:                             #   in Loop: Header=BB13_114 Depth=2
	movq	48(%rsp), %rax
	orl	$1, 76(%rax)
	jmp	.LBB13_142
.LBB13_120:                             #   in Loop: Header=BB13_114 Depth=2
	cmpl	$59, %eax
	je	.LBB13_142
	jmp	.LBB13_121
.LBB13_123:                             #   in Loop: Header=BB13_114 Depth=2
	cmpl	$119, %eax
	jne	.LBB13_124
# BB#133:                               #   in Loop: Header=BB13_114 Depth=2
	movq	48(%rsp), %rax
	orl	$4, 76(%rax)
	xorl	%edi, %edi
	callq	compile_filename
	movq	48(%rsp), %rcx
	movq	%rax, 88(%rcx)
	movl	$10, 40(%rsp)
	jmp	.LBB13_142
.LBB13_124:                             #   in Loop: Header=BB13_114 Depth=2
	cmpl	$112, %eax
	jne	.LBB13_121
# BB#125:                               #   in Loop: Header=BB13_114 Depth=2
	movq	48(%rsp), %rax
	testb	$2, 76(%rax)
	je	.LBB13_127
# BB#126:                               #   in Loop: Header=BB13_114 Depth=2
	movl	$.L.str14, %edi
	callq	bad_prog
.LBB13_127:                             #   in Loop: Header=BB13_114 Depth=2
	movq	48(%rsp), %rax
	orl	$2, 76(%rax)
	jmp	.LBB13_142
.LBB13_121:                             #   in Loop: Header=BB13_114 Depth=2
	movl	$.L.str17, %edi
	callq	bad_prog
.LBB13_142:                             #   in Loop: Header=BB13_114 Depth=2
	xorb	%al, %al
	cmpl	$-1, 40(%rsp)
	je	.LBB13_145
# BB#143:                               #   in Loop: Header=BB13_114 Depth=2
	xorb	%al, %al
	cmpl	$10, 40(%rsp)
	je	.LBB13_145
# BB#144:                               #   in Loop: Header=BB13_114 Depth=2
	cmpl	$59, 40(%rsp)
	setne	%al
.LBB13_145:                             #   in Loop: Header=BB13_114 Depth=2
	testb	%al, %al
	je	.LBB13_2
	jmp	.LBB13_114
.LBB13_161:                             #   in Loop: Header=BB13_2 Depth=1
	movq	24(%rsp), %rdi
	callq	flush_buffer
	callq	inchar
	cmpl	36(%rsp), %eax
	jne	.LBB13_52
# BB#162:                               #   in Loop: Header=BB13_2 Depth=1
	callq	inchar
	movl	%eax, 40(%rsp)
	cmpl	$-1, %eax
	je	.LBB13_2
# BB#163:                               #   in Loop: Header=BB13_2 Depth=1
	cmpl	$10, 40(%rsp)
	je	.LBB13_2
# BB#164:                               #   in Loop: Header=BB13_2 Depth=1
	cmpl	$59, 40(%rsp)
	je	.LBB13_2
.LBB13_52:                              #   in Loop: Header=BB13_2 Depth=1
	movl	$LINE_JUNK, %edi
	callq	bad_prog
	jmp	.LBB13_2
.LBB13_89:                              #   in Loop: Header=BB13_2 Depth=1
	movq	48(%rsp), %rax
	movb	40(%rsp), %cl
	movb	%cl, 52(%rax)
	movq	48(%rsp), %rax
	cmpl	$0, (%rax)
	je	.LBB13_91
# BB#90:                                #   in Loop: Header=BB13_2 Depth=1
	movl	$.L.str12, %edi
	callq	bad_prog
.LBB13_91:                              #   in Loop: Header=BB13_2 Depth=1
	movq	64(%rsp), %rdx
	movq	48(%rsp), %rsi
	movq	labels(%rip), %rdi
	callq	setup_jump
	movq	%rax, labels(%rip)
	jmp	.LBB13_2
.LBB13_166:
	cmpl	$0, program_depth(%rip)
	je	.LBB13_168
# BB#167:
	movl	60(%rsp), %eax
	movl	%eax, prog_line(%rip)
	movl	$.L.str20, %edi
	callq	bad_prog
	jmp	.LBB13_168
.LBB13_78:
	cmpl	$0, program_depth(%rip)
	jne	.LBB13_80
# BB#79:
	movl	$.L.str10, %edi
	callq	bad_prog
.LBB13_80:
	decl	program_depth(%rip)
	movq	48(%rsp), %rax
	movb	40(%rsp), %cl
	movb	%cl, 52(%rax)
	movq	48(%rsp), %rax
	cmpl	$0, (%rax)
	je	.LBB13_83
# BB#81:
	movl	$.L.str11, %edi
	.align	16, 0x90
.LBB13_82:
	callq	bad_prog
	.align	16, 0x90
.LBB13_83:                              # =>This Inner Loop Header: Depth=1
	callq	inchar
	movl	%eax, 40(%rsp)
	xorb	%cl, %cl
	cmpl	$-1, %eax
	je	.LBB13_86
# BB#84:                                #   in Loop: Header=BB13_83 Depth=1
	xorb	%cl, %cl
	cmpl	$10, 40(%rsp)
	je	.LBB13_86
# BB#85:                                #   in Loop: Header=BB13_83 Depth=1
	cmpl	$59, 40(%rsp)
	setne	%cl
.LBB13_86:                              #   in Loop: Header=BB13_83 Depth=1
	cmpb	$1, %cl
	jne	.LBB13_168
# BB#87:                                #   in Loop: Header=BB13_83 Depth=1
	movslq	40(%rsp), %rbx
	callq	__ctype_b_loc
	movq	(%rax), %rax
	movzwl	(%rax,%rbx,2), %eax
	testb	$1, %al
	jne	.LBB13_83
# BB#88:
	movl	$LINE_JUNK, %edi
	jmp	.LBB13_82
.LBB13_168:
	movq	64(%rsp), %rax
	movq	%rax, 72(%rsp)
	movq	72(%rsp), %rax
	addq	$80, %rsp
	popq	%rbx
	ret
.Ltmp45:
	.size	compile_program, .Ltmp45-compile_program
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.align	8
.LJTI13_0:
	.quad	.LBB13_62
	.quad	.LBB13_92
	.quad	.LBB13_64
	.quad	.LBB13_43
	.quad	.LBB13_165
	.quad	.LBB13_165
	.quad	.LBB13_43
	.quad	.LBB13_43
	.quad	.LBB13_62
	.quad	.LBB13_165
	.quad	.LBB13_165
	.quad	.LBB13_43
	.quad	.LBB13_165
	.quad	.LBB13_43
	.quad	.LBB13_165
	.quad	.LBB13_43
	.quad	.LBB13_41
	.quad	.LBB13_93
	.quad	.LBB13_96
	.quad	.LBB13_92
	.quad	.LBB13_165
	.quad	.LBB13_165
	.quad	.LBB13_95
	.quad	.LBB13_43
	.quad	.LBB13_146
	.quad	.LBB13_165
	.quad	.LBB13_77
	.quad	.LBB13_165
	.quad	.LBB13_78

	.text
	.globl	ck_fopen
	.align	16, 0x90
	.type	ck_fopen,@function
ck_fopen:                               # @ck_fopen
	.cfi_startproc
# BB#0:
	subq	$40, %rsp
.Ltmp47:
	.cfi_def_cfa_offset 48
	movq	%rdi, 32(%rsp)
	movq	%rsi, 24(%rsp)
	movq	32(%rsp), %rdi
	callq	fopen
	movq	%rax, 16(%rsp)
	testq	%rax, %rax
	jne	.LBB14_2
# BB#1:
	movq	32(%rsp), %rsi
	movl	$.L.str44, %edi
	xorb	%al, %al
	callq	panic
.LBB14_2:
	movl	$0, 12(%rsp)
	jmp	.LBB14_3
	.align	16, 0x90
.LBB14_15:                              #   in Loop: Header=BB14_3 Depth=1
	incl	12(%rsp)
.LBB14_3:                               # =>This Inner Loop Header: Depth=1
	cmpl	$31, 12(%rsp)
	jg	.LBB14_6
# BB#4:                                 #   in Loop: Header=BB14_3 Depth=1
	movslq	12(%rsp), %rax
	shlq	$4, %rax
	movq	16(%rsp), %rcx
	cmpq	__id_s(%rax), %rcx
	jne	.LBB14_15
# BB#5:
	movslq	12(%rsp), %rax
	shlq	$4, %rax
	movq	__id_s+8(%rax), %rdi
	callq	free
	movq	32(%rsp), %rdi
	callq	strlen
	leal	1(%rax), %edi
	callq	ck_malloc
	movslq	12(%rsp), %rcx
	shlq	$4, %rcx
	movq	%rax, __id_s+8(%rcx)
	movslq	12(%rsp), %rax
	shlq	$4, %rax
	movq	__id_s+8(%rax), %rdi
	movq	32(%rsp), %rsi
	callq	strcpy
.LBB14_6:
	cmpl	$32, 12(%rsp)
	jne	.LBB14_14
# BB#7:
	movl	$0, 12(%rsp)
	jmp	.LBB14_8
	.align	16, 0x90
.LBB14_10:                              #   in Loop: Header=BB14_8 Depth=1
	incl	12(%rsp)
.LBB14_8:                               # =>This Inner Loop Header: Depth=1
	cmpl	$31, 12(%rsp)
	jg	.LBB14_11
# BB#9:                                 #   in Loop: Header=BB14_8 Depth=1
	movslq	12(%rsp), %rax
	shlq	$4, %rax
	cmpq	$0, __id_s(%rax)
	jne	.LBB14_10
.LBB14_11:
	cmpl	$32, 12(%rsp)
	jne	.LBB14_13
# BB#12:
	movl	$.L.str45, %edi
	xorb	%al, %al
	callq	panic
.LBB14_13:
	movslq	12(%rsp), %rax
	shlq	$4, %rax
	movq	16(%rsp), %rcx
	movq	%rcx, __id_s(%rax)
	movq	32(%rsp), %rdi
	callq	strlen
	leal	1(%rax), %edi
	callq	ck_malloc
	movslq	12(%rsp), %rcx
	shlq	$4, %rcx
	movq	%rax, __id_s+8(%rcx)
	movslq	12(%rsp), %rax
	shlq	$4, %rax
	movq	__id_s+8(%rax), %rdi
	movq	32(%rsp), %rsi
	callq	strcpy
.LBB14_14:
	movq	16(%rsp), %rax
	addq	$40, %rsp
	ret
.Ltmp48:
	.size	ck_fopen, .Ltmp48-ck_fopen
	.cfi_endproc

	.globl	inchar
	.align	16, 0x90
	.type	inchar,@function
inchar:                                 # @inchar
	.cfi_startproc
# BB#0:
	pushq	%rax
.Ltmp50:
	.cfi_def_cfa_offset 16
	cmpq	$0, prog_file(%rip)
	je	.LBB15_4
# BB#1:
	movq	prog_file(%rip), %rdi
	callq	feof
	testl	%eax, %eax
	je	.LBB15_3
# BB#2:
	movl	$-1, 4(%rsp)
	jmp	.LBB15_14
.LBB15_4:
	cmpq	$0, prog_cur(%rip)
	je	.LBB15_5
# BB#6:
	movq	prog_cur(%rip), %rax
	cmpq	prog_end(%rip), %rax
	je	.LBB15_7
# BB#8:
	movq	prog_cur(%rip), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, prog_cur(%rip)
	movzbl	(%rax), %eax
	jmp	.LBB15_9
.LBB15_3:
	movq	prog_file(%rip), %rdi
	callq	_IO_getc
.LBB15_9:
	movl	%eax, (%rsp)
	jmp	.LBB15_10
.LBB15_5:
	movl	$-1, 4(%rsp)
	jmp	.LBB15_14
.LBB15_7:
	movl	$-1, (%rsp)
	movq	$0, prog_cur(%rip)
.LBB15_10:
	cmpl	$10, (%rsp)
	jne	.LBB15_13
# BB#11:
	cmpl	$0, prog_line(%rip)
	je	.LBB15_13
# BB#12:
	incl	prog_line(%rip)
.LBB15_13:
	movl	(%rsp), %eax
	movl	%eax, 4(%rsp)
.LBB15_14:
	movl	4(%rsp), %eax
	popq	%rdx
	ret
.Ltmp51:
	.size	inchar, .Ltmp51-inchar
	.cfi_endproc

	.globl	savchar
	.align	16, 0x90
	.type	savchar,@function
savchar:                                # @savchar
	.cfi_startproc
# BB#0:
	pushq	%rax
.Ltmp53:
	.cfi_def_cfa_offset 16
	movl	%edi, 4(%rsp)
	cmpl	$-1, %edi
	je	.LBB16_7
# BB#1:
	cmpl	$10, 4(%rsp)
	jne	.LBB16_4
# BB#2:
	cmpl	$2, prog_line(%rip)
	jl	.LBB16_4
# BB#3:
	decl	prog_line(%rip)
.LBB16_4:
	cmpq	$0, prog_file(%rip)
	je	.LBB16_6
# BB#5:
	movq	prog_file(%rip), %rsi
	movl	4(%rsp), %edi
	callq	ungetc
	popq	%rax
	ret
.LBB16_6:
	movq	prog_cur(%rip), %rax
	leaq	-1(%rax), %rcx
	movb	4(%rsp), %dl
	movq	%rcx, prog_cur(%rip)
	movb	%dl, -1(%rax)
.LBB16_7:
	popq	%rax
	ret
.Ltmp54:
	.size	savchar, .Ltmp54-savchar
	.cfi_endproc

	.globl	compile_address
	.align	16, 0x90
	.type	compile_address,@function
compile_address:                        # @compile_address
	.cfi_startproc
# BB#0:
	pushq	%rbx
.Ltmp57:
	.cfi_def_cfa_offset 16
	subq	$32, %rsp
.Ltmp58:
	.cfi_def_cfa_offset 48
.Ltmp59:
	.cfi_offset %rbx, -16
	movq	%rdi, 16(%rsp)
	callq	inchar
	movl	%eax, 12(%rsp)
	movslq	12(%rsp), %rbx
	callq	__ctype_b_loc
	movq	(%rax), %rax
	testb	$8, 1(%rax,%rbx,2)
	je	.LBB17_11
# BB#1:
	movl	12(%rsp), %eax
	addl	$-48, %eax
	jmp	.LBB17_2
	.align	16, 0x90
.LBB17_5:                               #   in Loop: Header=BB17_2 Depth=1
	movl	12(%rsp), %eax
	imull	$10, 8(%rsp), %ecx
	leal	-48(%rcx,%rax), %eax
.LBB17_2:                               # =>This Inner Loop Header: Depth=1
	movl	%eax, 8(%rsp)
	callq	inchar
	movl	%eax, 12(%rsp)
	xorb	%cl, %cl
	cmpl	$-1, %eax
	je	.LBB17_4
# BB#3:                                 #   in Loop: Header=BB17_2 Depth=1
	movslq	12(%rsp), %rbx
	callq	__ctype_b_loc
	movq	(%rax), %rax
	movb	1(%rax,%rbx,2), %cl
	andb	$8, %cl
	shrb	$3, %cl
.LBB17_4:                               #   in Loop: Header=BB17_2 Depth=1
	cmpb	$1, %cl
	jne	.LBB17_6
	jmp	.LBB17_5
	.align	16, 0x90
.LBB17_9:                               #   in Loop: Header=BB17_6 Depth=1
	callq	inchar
	movl	%eax, 12(%rsp)
.LBB17_6:                               # =>This Inner Loop Header: Depth=1
	xorb	%al, %al
	cmpl	$-1, 12(%rsp)
	je	.LBB17_8
# BB#7:                                 #   in Loop: Header=BB17_6 Depth=1
	movslq	12(%rsp), %rbx
	callq	__ctype_b_loc
	movq	(%rax), %rax
	movb	(%rax,%rbx,2), %al
	andb	$1, %al
.LBB17_8:                               #   in Loop: Header=BB17_6 Depth=1
	cmpb	$1, %al
	je	.LBB17_9
# BB#10:
	movl	12(%rsp), %edi
	xorb	%al, %al
	callq	savchar
	movq	16(%rsp), %rax
	movl	$1, (%rax)
	movq	16(%rsp), %rax
	movl	8(%rsp), %ecx
	movl	%ecx, 16(%rax)
	movl	$1, 28(%rsp)
	jmp	.LBB17_26
.LBB17_11:
	cmpl	$47, 12(%rsp)
	je	.LBB17_13
# BB#12:
	cmpl	$92, 12(%rsp)
	jne	.LBB17_20
.LBB17_13:
	movq	16(%rsp), %rax
	movl	$2, (%rax)
	cmpl	$92, 12(%rsp)
	jne	.LBB17_15
# BB#14:
	callq	inchar
	movl	%eax, 12(%rsp)
.LBB17_15:
	movl	12(%rsp), %edi
	callq	compile_regex
	movq	16(%rsp), %rax
	movq	last_regex(%rip), %rcx
	movq	%rcx, 8(%rax)
	.align	16, 0x90
.LBB17_16:                              # =>This Inner Loop Header: Depth=1
	callq	inchar
	movl	%eax, 12(%rsp)
	xorb	%al, %al
	cmpl	$-1, 12(%rsp)
	je	.LBB17_18
# BB#17:                                #   in Loop: Header=BB17_16 Depth=1
	movslq	12(%rsp), %rbx
	callq	__ctype_b_loc
	movq	(%rax), %rax
	movb	(%rax,%rbx,2), %al
	andb	$1, %al
.LBB17_18:                              #   in Loop: Header=BB17_16 Depth=1
	testb	%al, %al
	jne	.LBB17_16
	jmp	.LBB17_19
.LBB17_20:
	cmpl	$36, 12(%rsp)
	jne	.LBB17_25
# BB#21:
	movq	16(%rsp), %rax
	movl	$3, (%rax)
	.align	16, 0x90
.LBB17_22:                              # =>This Inner Loop Header: Depth=1
	callq	inchar
	movl	%eax, 12(%rsp)
	xorb	%al, %al
	cmpl	$-1, 12(%rsp)
	je	.LBB17_24
# BB#23:                                #   in Loop: Header=BB17_22 Depth=1
	movslq	12(%rsp), %rbx
	callq	__ctype_b_loc
	movq	(%rax), %rax
	movb	(%rax,%rbx,2), %al
	andb	$1, %al
.LBB17_24:                              #   in Loop: Header=BB17_22 Depth=1
	testb	%al, %al
	jne	.LBB17_22
.LBB17_19:
	movl	12(%rsp), %edi
	xorb	%al, %al
	callq	savchar
	movl	$1, 28(%rsp)
	.align	16, 0x90
.LBB17_26:
	movl	28(%rsp), %eax
	addq	$32, %rsp
	popq	%rbx
	ret
.LBB17_25:
	movl	12(%rsp), %edi
	xorb	%al, %al
	callq	savchar
	movl	$0, 28(%rsp)
	jmp	.LBB17_26
.Ltmp60:
	.size	compile_address, .Ltmp60-compile_address
	.cfi_endproc

	.globl	bad_prog
	.align	16, 0x90
	.type	bad_prog,@function
bad_prog:                               # @bad_prog
	.cfi_startproc
# BB#0:
	pushq	%rax
.Ltmp62:
	.cfi_def_cfa_offset 16
	movq	%rdi, (%rsp)
	cmpl	$0, prog_line(%rip)
	jle	.LBB18_2
# BB#1:
	movq	(%rsp), %r9
	movl	prog_line(%rip), %r8d
	movq	prog_name(%rip), %rcx
	movq	myname(%rip), %rdx
	movq	stdout(%rip), %rdi
	movl	$.L.str21, %esi
	xorb	%al, %al
	callq	fprintf
	movl	$1, %edi
	callq	exit
.LBB18_2:
	movq	(%rsp), %rcx
	movq	myname(%rip), %rdx
	movq	stdout(%rip), %rdi
	movl	$.L.str22, %esi
	xorb	%al, %al
	callq	fprintf
	movl	$1, %edi
	callq	exit
.Ltmp63:
	.size	bad_prog, .Ltmp63-bad_prog
	.cfi_endproc

	.globl	init_buffer
	.align	16, 0x90
	.type	init_buffer,@function
init_buffer:                            # @init_buffer
	.cfi_startproc
# BB#0:
	pushq	%rax
.Ltmp65:
	.cfi_def_cfa_offset 16
	movl	$16, %edi
	xorb	%al, %al
	callq	ck_malloc
	movq	%rax, (%rsp)
	movl	$50, (%rax)
	movl	$50, %edi
	xorb	%al, %al
	callq	ck_malloc
	movq	(%rsp), %rcx
	movq	%rax, 8(%rcx)
	movq	(%rsp), %rax
	movl	$0, 4(%rax)
	movq	(%rsp), %rax
	popq	%rdx
	ret
.Ltmp66:
	.size	init_buffer, .Ltmp66-init_buffer
	.cfi_endproc

	.globl	add1_buffer
	.align	16, 0x90
	.type	add1_buffer,@function
add1_buffer:                            # @add1_buffer
	.cfi_startproc
# BB#0:
	subq	$24, %rsp
.Ltmp68:
	.cfi_def_cfa_offset 32
	movq	%rdi, 16(%rsp)
	movl	%esi, 12(%rsp)
	movq	16(%rsp), %rax
	movq	%rax, (%rsp)
	movl	4(%rax), %ecx
	incl	%ecx
	cmpl	(%rax), %ecx
	jle	.LBB20_2
# BB#1:
	movq	(%rsp), %rax
	shll	(%rax)
	movq	(%rsp), %rax
	movl	(%rax), %esi
	movq	8(%rax), %rdi
	xorb	%al, %al
	callq	ck_realloc
	movq	(%rsp), %rcx
	movq	%rax, 8(%rcx)
.LBB20_2:
	movq	(%rsp), %rcx
	movq	8(%rcx), %rax
	movslq	4(%rcx), %rcx
	movb	12(%rsp), %dl
	movb	%dl, (%rax,%rcx)
	movq	(%rsp), %rax
	incl	4(%rax)
	addq	$24, %rsp
	ret
.Ltmp69:
	.size	add1_buffer, .Ltmp69-add1_buffer
	.cfi_endproc

	.globl	size_buffer
	.align	16, 0x90
	.type	size_buffer,@function
size_buffer:                            # @size_buffer
	.cfi_startproc
# BB#0:
	movq	%rdi, -8(%rsp)
	movq	%rdi, -16(%rsp)
	movl	4(%rdi), %eax
	ret
.Ltmp70:
	.size	size_buffer, .Ltmp70-size_buffer
	.cfi_endproc

	.globl	get_buffer
	.align	16, 0x90
	.type	get_buffer,@function
get_buffer:                             # @get_buffer
	.cfi_startproc
# BB#0:
	movq	%rdi, -8(%rsp)
	movq	%rdi, -16(%rsp)
	movq	8(%rdi), %rax
	ret
.Ltmp71:
	.size	get_buffer, .Ltmp71-get_buffer
	.cfi_endproc

	.globl	flush_buffer
	.align	16, 0x90
	.type	flush_buffer,@function
flush_buffer:                           # @flush_buffer
	.cfi_startproc
# BB#0:
	subq	$24, %rsp
.Ltmp73:
	.cfi_def_cfa_offset 32
	movq	%rdi, 16(%rsp)
	movq	%rdi, 8(%rsp)
	movq	8(%rdi), %rdi
	callq	free
	movq	8(%rsp), %rax
	movq	$0, 8(%rax)
	movq	8(%rsp), %rax
	movl	$0, (%rax)
	movq	8(%rsp), %rax
	movl	$0, 4(%rax)
	movq	8(%rsp), %rdi
	callq	free
	addq	$24, %rsp
	ret
.Ltmp74:
	.size	flush_buffer, .Ltmp74-flush_buffer
	.cfi_endproc

	.globl	setup_jump
	.align	16, 0x90
	.type	setup_jump,@function
setup_jump:                             # @setup_jump
	.cfi_startproc
# BB#0:
	pushq	%rbx
.Ltmp77:
	.cfi_def_cfa_offset 16
	subq	$48, %rsp
.Ltmp78:
	.cfi_def_cfa_offset 64
.Ltmp79:
	.cfi_offset %rbx, -16
	movq	%rdi, 40(%rsp)
	movq	%rsi, 32(%rsp)
	movq	%rdx, 24(%rsp)
	callq	init_buffer
	movq	%rax, 8(%rsp)
	.align	16, 0x90
.LBB24_1:                               # =>This Inner Loop Header: Depth=1
	callq	inchar
	movl	%eax, 4(%rsp)
	xorb	%cl, %cl
	cmpl	$-1, %eax
	je	.LBB24_3
# BB#2:                                 #   in Loop: Header=BB24_1 Depth=1
	movslq	4(%rsp), %rbx
	callq	__ctype_b_loc
	movq	(%rax), %rax
	movb	(%rax,%rbx,2), %cl
	andb	$1, %cl
.LBB24_3:                               #   in Loop: Header=BB24_1 Depth=1
	testb	%cl, %cl
	jne	.LBB24_1
	jmp	.LBB24_4
	.align	16, 0x90
.LBB24_10:                              #   in Loop: Header=BB24_4 Depth=1
	movl	4(%rsp), %esi
	movq	8(%rsp), %rdi
	callq	add1_buffer
	callq	inchar
	movl	%eax, 4(%rsp)
.LBB24_4:                               # =>This Inner Loop Header: Depth=1
	xorb	%al, %al
	cmpl	$-1, 4(%rsp)
	je	.LBB24_9
# BB#5:                                 #   in Loop: Header=BB24_4 Depth=1
	xorb	%al, %al
	cmpl	$10, 4(%rsp)
	je	.LBB24_9
# BB#6:                                 #   in Loop: Header=BB24_4 Depth=1
	movslq	4(%rsp), %rbx
	callq	__ctype_b_loc
	movq	(%rax), %rax
	movzwl	(%rax,%rbx,2), %ecx
	xorb	%al, %al
	testb	$1, %cl
	jne	.LBB24_9
# BB#7:                                 #   in Loop: Header=BB24_4 Depth=1
	xorb	%al, %al
	cmpl	$59, 4(%rsp)
	je	.LBB24_9
# BB#8:                                 #   in Loop: Header=BB24_4 Depth=1
	cmpl	$125, 4(%rsp)
	setne	%al
.LBB24_9:                               #   in Loop: Header=BB24_4 Depth=1
	cmpb	$1, %al
	je	.LBB24_10
# BB#11:
	movl	4(%rsp), %edi
	xorb	%al, %al
	callq	savchar
	movq	8(%rsp), %rdi
	xorl	%esi, %esi
	callq	add1_buffer
	movl	$32, %edi
	callq	ck_malloc
	movq	%rax, 16(%rsp)
	movq	24(%rsp), %rcx
	movq	%rcx, (%rax)
	movq	24(%rsp), %rcx
	movq	32(%rsp), %rax
	subq	(%rcx), %rax
	shrq	$5, %rax
	imull	$-1431655765, %eax, %eax # imm = 0xFFFFFFFFAAAAAAAB
	movq	16(%rsp), %rcx
	movl	%eax, 8(%rcx)
	movq	8(%rsp), %rdi
	callq	get_buffer
	movq	%rax, %rdi
	callq	ck_strdup
	movq	16(%rsp), %rcx
	movq	%rax, 16(%rcx)
	movq	16(%rsp), %rax
	movq	40(%rsp), %rcx
	movq	%rcx, 24(%rax)
	movq	8(%rsp), %rdi
	callq	flush_buffer
	movq	16(%rsp), %rax
	addq	$48, %rsp
	popq	%rbx
	ret
.Ltmp80:
	.size	setup_jump, .Ltmp80-setup_jump
	.cfi_endproc

	.globl	compile_filename
	.align	16, 0x90
	.type	compile_filename,@function
compile_filename:                       # @compile_filename
	.cfi_startproc
# BB#0:
	subq	$56, %rsp
.Ltmp82:
	.cfi_def_cfa_offset 64
	movl	%edi, 44(%rsp)
	callq	inchar
	cmpl	$32, %eax
	je	.LBB25_2
# BB#1:
	movl	$.L.str23, %edi
	xorb	%al, %al
	callq	bad_prog
.LBB25_2:
	callq	init_buffer
	movq	%rax, 16(%rsp)
	jmp	.LBB25_3
	.align	16, 0x90
.LBB25_6:                               #   in Loop: Header=BB25_3 Depth=1
	movl	12(%rsp), %esi
	movq	16(%rsp), %rdi
	callq	add1_buffer
.LBB25_3:                               # =>This Inner Loop Header: Depth=1
	callq	inchar
	movl	%eax, 12(%rsp)
	xorb	%cl, %cl
	cmpl	$-1, %eax
	je	.LBB25_5
# BB#4:                                 #   in Loop: Header=BB25_3 Depth=1
	cmpl	$10, 12(%rsp)
	setne	%cl
.LBB25_5:                               #   in Loop: Header=BB25_3 Depth=1
	cmpb	$1, %cl
	je	.LBB25_6
# BB#7:
	movq	16(%rsp), %rdi
	xorl	%esi, %esi
	callq	add1_buffer
	movq	16(%rsp), %rdi
	callq	get_buffer
	movq	%rax, 32(%rsp)
	movl	$0, 28(%rsp)
	jmp	.LBB25_8
	.align	16, 0x90
.LBB25_14:                              #   in Loop: Header=BB25_8 Depth=1
	incl	28(%rsp)
.LBB25_8:                               # =>This Inner Loop Header: Depth=1
	cmpl	$31, 28(%rsp)
	jg	.LBB25_15
# BB#9:                                 #   in Loop: Header=BB25_8 Depth=1
	movslq	28(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	cmpq	$0, file_ptrs+8(,%rax,8)
	je	.LBB25_15
# BB#10:                                #   in Loop: Header=BB25_8 Depth=1
	movslq	28(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movq	file_ptrs+8(,%rax,8), %rdi
	movq	32(%rsp), %rsi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB25_14
# BB#11:
	movslq	28(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movl	file_ptrs+16(,%rax,8), %eax
	cmpl	44(%rsp), %eax
	je	.LBB25_13
# BB#12:
	movl	$.L.str24, %edi
	xorb	%al, %al
	callq	bad_prog
	jmp	.LBB25_13
.LBB25_15:
	cmpl	$31, 28(%rsp)
	jg	.LBB25_20
# BB#16:
	movq	32(%rsp), %rdi
	callq	ck_strdup
	movslq	28(%rsp), %rcx
	leaq	(%rcx,%rcx,2), %rcx
	movq	%rax, file_ptrs+8(,%rcx,8)
	movslq	28(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movl	44(%rsp), %ecx
	movl	%ecx, file_ptrs+16(,%rax,8)
	cmpl	$0, 44(%rsp)
	je	.LBB25_17
# BB#18:
	movq	32(%rsp), %rdi
	movl	$.L.str7, %esi
	jmp	.LBB25_19
.LBB25_20:
	movl	$.L.str26, %edi
	xorb	%al, %al
	callq	bad_prog
	movq	$0, 48(%rsp)
	jmp	.LBB25_21
.LBB25_17:
	movq	32(%rsp), %rdi
	movl	$.L.str25, %esi
.LBB25_19:
	callq	ck_fopen
	movslq	28(%rsp), %rcx
	leaq	(%rcx,%rcx,2), %rcx
	movq	%rax, file_ptrs(,%rcx,8)
.LBB25_13:
	movq	16(%rsp), %rdi
	callq	flush_buffer
	movslq	28(%rsp), %rax
	leaq	(%rax,%rax,2), %rax
	movq	file_ptrs(,%rax,8), %rax
	movq	%rax, 48(%rsp)
.LBB25_21:
	movq	48(%rsp), %rax
	addq	$56, %rsp
	ret
.Ltmp83:
	.size	compile_filename, .Ltmp83-compile_filename
	.cfi_endproc

	.globl	compile_regex
	.align	16, 0x90
	.type	compile_regex,@function
compile_regex:                          # @compile_regex
	.cfi_startproc
# BB#0:
	pushq	%rbx
.Ltmp86:
	.cfi_def_cfa_offset 16
	subq	$48, %rsp
.Ltmp87:
	.cfi_def_cfa_offset 64
.Ltmp88:
	.cfi_offset %rbx, -16
	movl	%edi, 44(%rsp)
	movl	$-1, 24(%rsp)
	callq	init_buffer
	movq	%rax, 32(%rsp)
	jmp	.LBB26_1
	.align	16, 0x90
.LBB26_27:                              #   in Loop: Header=BB26_1 Depth=1
	movl	28(%rsp), %esi
	movq	32(%rsp), %rdi
	callq	add1_buffer
	.align	16, 0x90
.LBB26_1:                               # =>This Inner Loop Header: Depth=1
	callq	inchar
	movl	%eax, 28(%rsp)
	cmpl	$-1, %eax
	movb	$0, %al
	je	.LBB26_4
# BB#2:                                 #   in Loop: Header=BB26_1 Depth=1
	movb	$1, %al
	movl	28(%rsp), %ecx
	cmpl	44(%rsp), %ecx
	jne	.LBB26_4
# BB#3:                                 #   in Loop: Header=BB26_1 Depth=1
	cmpl	$0, 24(%rsp)
	setns	%al
.LBB26_4:                               #   in Loop: Header=BB26_1 Depth=1
	cmpb	$1, %al
	jne	.LBB26_28
# BB#5:                                 #   in Loop: Header=BB26_1 Depth=1
	cmpl	$94, 28(%rsp)
	jne	.LBB26_8
# BB#6:                                 #   in Loop: Header=BB26_1 Depth=1
	movq	32(%rsp), %rdi
	callq	size_buffer
	testl	%eax, %eax
	jne	.LBB26_27
# BB#7:                                 #   in Loop: Header=BB26_1 Depth=1
	movq	32(%rsp), %rdi
	movl	$92, %esi
	callq	add1_buffer
	movq	32(%rsp), %rdi
	movl	$96, %esi
	callq	add1_buffer
	jmp	.LBB26_1
.LBB26_8:                               #   in Loop: Header=BB26_1 Depth=1
	cmpl	$36, 28(%rsp)
	jne	.LBB26_12
# BB#9:                                 #   in Loop: Header=BB26_1 Depth=1
	callq	inchar
	movl	%eax, 28(%rsp)
	movl	%eax, %edi
	xorb	%al, %al
	callq	savchar
	movl	28(%rsp), %eax
	cmpl	44(%rsp), %eax
	jne	.LBB26_11
# BB#10:                                #   in Loop: Header=BB26_1 Depth=1
	movq	32(%rsp), %rdi
	movl	$92, %esi
	callq	add1_buffer
	movq	32(%rsp), %rdi
	movl	$39, %esi
	callq	add1_buffer
	jmp	.LBB26_1
.LBB26_12:                              #   in Loop: Header=BB26_1 Depth=1
	cmpl	$91, 28(%rsp)
	jne	.LBB26_15
# BB#13:                                #   in Loop: Header=BB26_1 Depth=1
	cmpl	$0, 24(%rsp)
	jns	.LBB26_27
# BB#14:                                #   in Loop: Header=BB26_1 Depth=1
	movq	32(%rsp), %rdi
	callq	size_buffer
	movl	%eax, 24(%rsp)
	jmp	.LBB26_27
.LBB26_11:                              #   in Loop: Header=BB26_1 Depth=1
	movq	32(%rsp), %rdi
	movl	$36, %esi
	callq	add1_buffer
	jmp	.LBB26_1
.LBB26_15:                              #   in Loop: Header=BB26_1 Depth=1
	cmpl	$93, 28(%rsp)
	jne	.LBB26_21
# BB#16:                                #   in Loop: Header=BB26_1 Depth=1
	movl	28(%rsp), %esi
	movq	32(%rsp), %rdi
	callq	add1_buffer
	movq	32(%rsp), %rdi
	callq	get_buffer
	movq	%rax, 16(%rsp)
	movq	32(%rsp), %rdi
	callq	size_buffer
	decl	%eax
	movl	%eax, 12(%rsp)
	cmpl	$0, 24(%rsp)
	js	.LBB26_20
# BB#17:                                #   in Loop: Header=BB26_1 Depth=1
	movl	24(%rsp), %eax
	incl	%eax
	cmpl	%eax, 12(%rsp)
	je	.LBB26_1
# BB#18:                                #   in Loop: Header=BB26_1 Depth=1
	movl	24(%rsp), %eax
	addl	$2, %eax
	cmpl	%eax, 12(%rsp)
	jne	.LBB26_20
# BB#19:                                #   in Loop: Header=BB26_1 Depth=1
	movl	24(%rsp), %eax
	incl	%eax
	movslq	%eax, %rax
	movq	16(%rsp), %rcx
	movsbl	(%rcx,%rax), %eax
	cmpl	$94, %eax
	je	.LBB26_1
.LBB26_20:                              #   in Loop: Header=BB26_1 Depth=1
	movl	$-1, 24(%rsp)
	jmp	.LBB26_1
.LBB26_21:                              #   in Loop: Header=BB26_1 Depth=1
	cmpl	$92, 28(%rsp)
	jne	.LBB26_27
# BB#22:                                #   in Loop: Header=BB26_1 Depth=1
	cmpl	$0, 24(%rsp)
	jns	.LBB26_27
# BB#23:                                #   in Loop: Header=BB26_1 Depth=1
	callq	inchar
	movl	%eax, 28(%rsp)
	cmpl	$-1, %eax
	je	.LBB26_1
# BB#24:                                #   in Loop: Header=BB26_1 Depth=1
	cmpl	$110, %eax
	jne	.LBB26_26
# BB#25:                                #   in Loop: Header=BB26_1 Depth=1
	movq	32(%rsp), %rdi
	movl	$10, %esi
	callq	add1_buffer
	jmp	.LBB26_1
.LBB26_26:                              #   in Loop: Header=BB26_1 Depth=1
	movq	32(%rsp), %rdi
	movl	$92, %esi
	callq	add1_buffer
	jmp	.LBB26_27
.LBB26_28:
	cmpl	$-1, 28(%rsp)
	jne	.LBB26_30
# BB#29:
	movl	$BAD_EOF, %edi
	xorb	%al, %al
	callq	bad_prog
.LBB26_30:
	movq	32(%rsp), %rdi
	callq	size_buffer
	testl	%eax, %eax
	je	.LBB26_32
# BB#31:
	movl	$64, %edi
	callq	ck_malloc
	movq	%rax, last_regex(%rip)
	movq	32(%rsp), %rdi
	callq	size_buffer
	addl	$10, %eax
	movslq	%eax, %rax
	movq	last_regex(%rip), %rcx
	movq	%rax, 8(%rcx)
	movq	last_regex(%rip), %rax
	movl	8(%rax), %edi
	callq	ck_malloc
	movq	last_regex(%rip), %rcx
	movq	%rax, (%rcx)
	movl	$256, %edi              # imm = 0x100
	callq	ck_malloc
	movq	last_regex(%rip), %rcx
	movq	%rax, 32(%rcx)
	movq	last_regex(%rip), %rax
	movq	$0, 40(%rax)
	movq	32(%rsp), %rdi
	callq	get_buffer
	movq	%rax, %rbx
	movq	32(%rsp), %rdi
	callq	size_buffer
	movq	last_regex(%rip), %rdx
	movq	%rbx, %rdi
	movl	%eax, %esi
	callq	re_compile_pattern
	jmp	.LBB26_34
.LBB26_32:
	cmpq	$0, last_regex(%rip)
	jne	.LBB26_34
# BB#33:
	movl	$NO_REGEX, %edi
	xorb	%al, %al
	callq	bad_prog
.LBB26_34:
	movq	32(%rsp), %rdi
	callq	flush_buffer
	addq	$48, %rsp
	popq	%rbx
	ret
.Ltmp89:
	.size	compile_regex, .Ltmp89-compile_regex
	.cfi_endproc

	.globl	re_compile_pattern
	.align	16, 0x90
	.type	re_compile_pattern,@function
re_compile_pattern:                     # @re_compile_pattern
	.cfi_startproc
# BB#0:
	subq	$40, %rsp
.Ltmp91:
	.cfi_def_cfa_offset 48
	movq	%rdi, 32(%rsp)
	movl	%esi, 28(%rsp)
	movq	%rdx, 16(%rsp)
	andb	$-7, 56(%rdx)
	movq	16(%rsp), %rax
	andl	$-17, 56(%rax)
	movq	16(%rsp), %rax
	orl	$128, 56(%rax)
	movq	16(%rsp), %rcx
	movl	re_syntax_options(%rip), %edx
	movl	28(%rsp), %esi
	movq	32(%rsp), %rdi
	xorb	%al, %al
	callq	regex_compile
	movl	%eax, 12(%rsp)
	movslq	12(%rsp), %rax
	movq	re_error_msg(,%rax,8), %rax
	addq	$40, %rsp
	ret
.Ltmp92:
	.size	re_compile_pattern, .Ltmp92-re_compile_pattern
	.cfi_endproc

	.globl	ck_strdup
	.align	16, 0x90
	.type	ck_strdup,@function
ck_strdup:                              # @ck_strdup
	.cfi_startproc
# BB#0:
	subq	$24, %rsp
.Ltmp94:
	.cfi_def_cfa_offset 32
	movq	%rdi, 16(%rsp)
	callq	strlen
	leal	2(%rax), %edi
	xorb	%al, %al
	callq	ck_malloc
	movq	%rax, 8(%rsp)
	movq	16(%rsp), %rsi
	movq	%rax, %rdi
	callq	strcpy
	movq	8(%rsp), %rax
	addq	$24, %rsp
	ret
.Ltmp95:
	.size	ck_strdup, .Ltmp95-ck_strdup
	.cfi_endproc

	.globl	read_pattern_space
	.align	16, 0x90
	.type	read_pattern_space,@function
read_pattern_space:                     # @read_pattern_space
	.cfi_startproc
# BB#0:
	subq	$24, %rsp
.Ltmp97:
	.cfi_def_cfa_offset 32
	movq	line(%rip), %rax
	movq	%rax, 8(%rsp)
	movl	line+12(%rip), %eax
	movl	%eax, 16(%rsp)
	movq	input_file(%rip), %rdi
	callq	feof
	testl	%eax, %eax
	je	.LBB29_2
# BB#1:
	movl	$0, 20(%rsp)
	jmp	.LBB29_15
.LBB29_2:
	incl	input_line_number(%rip)
	movl	$0, replaced(%rip)
	.align	16, 0x90
.LBB29_3:                               # =>This Inner Loop Header: Depth=1
	cmpl	$0, 16(%rsp)
	jne	.LBB29_5
# BB#4:                                 #   in Loop: Header=BB29_3 Depth=1
	movq	line(%rip), %rdi
	movl	line+12(%rip), %esi
	addl	%esi, %esi
	callq	ck_realloc
	movq	%rax, line(%rip)
	movslq	line+12(%rip), %rcx
	addq	%rax, %rcx
	movq	%rcx, 8(%rsp)
	movl	line+12(%rip), %eax
	movl	%eax, 16(%rsp)
	shll	line+12(%rip)
.LBB29_5:                               #   in Loop: Header=BB29_3 Depth=1
	movq	input_file(%rip), %rdi
	callq	_IO_getc
	movl	%eax, 4(%rsp)
	cmpl	$-1, %eax
	je	.LBB29_6
# BB#8:                                 #   in Loop: Header=BB29_3 Depth=1
	movq	8(%rsp), %rax
	leaq	1(%rax), %rcx
	movb	4(%rsp), %dl
	movq	%rcx, 8(%rsp)
	movb	%dl, (%rax)
	decl	16(%rsp)
	cmpl	$10, 4(%rsp)
	jne	.LBB29_3
# BB#9:
	movl	line+12(%rip), %eax
	subl	16(%rsp), %eax
	movl	%eax, line+8(%rip)
	movq	input_file(%rip), %rdi
	callq	_IO_getc
	movl	%eax, 4(%rsp)
	cmpl	$-1, %eax
	je	.LBB29_12
# BB#10:
	movq	input_file(%rip), %rsi
	movl	4(%rsp), %edi
	callq	ungetc
	jmp	.LBB29_14
.LBB29_6:
	movl	16(%rsp), %eax
	cmpl	line+12(%rip), %eax
	jne	.LBB29_11
# BB#7:
	movl	$0, 20(%rsp)
	jmp	.LBB29_15
.LBB29_11:
	movl	line+12(%rip), %eax
	subl	16(%rsp), %eax
	movl	%eax, line+8(%rip)
.LBB29_12:
	cmpl	$0, last_input_file(%rip)
	je	.LBB29_14
# BB#13:
	incl	input_EOF(%rip)
.LBB29_14:
	movl	$1, 20(%rsp)
.LBB29_15:
	movl	20(%rsp), %eax
	addq	$24, %rsp
	ret
.Ltmp98:
	.size	read_pattern_space, .Ltmp98-read_pattern_space
	.cfi_endproc

	.globl	execute_program
	.align	16, 0x90
	.type	execute_program,@function
execute_program:                        # @execute_program
	.cfi_startproc
# BB#0:
	pushq	%rbx
.Ltmp101:
	.cfi_def_cfa_offset 16
	subq	$208, %rsp
.Ltmp102:
	.cfi_def_cfa_offset 224
.Ltmp103:
	.cfi_offset %rbx, -16
	movq	%rdi, 200(%rsp)
	movq	%rdi, 104(%rsp)
	jmp	.LBB30_1
	.align	16, 0x90
.LBB30_22:                              #   in Loop: Header=BB30_1 Depth=1
	movl	84(%rsp), %edx
	movq	line(%rip), %rdi
	movq	88(%rsp), %rsi
	incq	%rsi
	xorb	%al, %al
	callq	chr_copy
	movl	84(%rsp), %eax
	movl	%eax, line+8(%rip)
.LBB30_1:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB30_2 Depth 2
                                        #       Child Loop BB30_3 Depth 3
                                        #       Child Loop BB30_94 Depth 3
                                        #         Child Loop BB30_106 Depth 4
                                        #       Child Loop BB30_30 Depth 3
                                        #       Child Loop BB30_47 Depth 3
                                        #       Child Loop BB30_86 Depth 3
                                        #       Child Loop BB30_142 Depth 3
	movq	104(%rsp), %rax
	movq	%rax, 200(%rsp)
	movl	$0, 116(%rsp)
	movl	$0, execute_program.end_cycle(%rip)
	movq	200(%rsp), %rax
	movq	(%rax), %rax
	movq	%rax, 192(%rsp)
	movq	200(%rsp), %rax
	movl	8(%rax), %eax
	movl	%eax, 188(%rsp)
	jmp	.LBB30_2
	.align	16, 0x90
.LBB30_146:                             #   in Loop: Header=BB30_2 Depth=2
	addq	$96, 192(%rsp)
	decl	188(%rsp)
.LBB30_2:                               #   Parent Loop BB30_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB30_3 Depth 3
                                        #       Child Loop BB30_94 Depth 3
                                        #         Child Loop BB30_106 Depth 4
                                        #       Child Loop BB30_30 Depth 3
                                        #       Child Loop BB30_47 Depth 3
                                        #       Child Loop BB30_86 Depth 3
                                        #       Child Loop BB30_142 Depth 3
	cmpl	$0, 188(%rsp)
	je	.LBB30_147
	jmp	.LBB30_3
	.align	16, 0x90
.LBB30_36:                              #   in Loop: Header=BB30_3 Depth=3
	movq	(%rcx), %rax
	movslq	8(%rcx), %rcx
	leaq	(%rcx,%rcx,2), %rcx
	shlq	$5, %rcx
	addq	(%rax), %rcx
	movq	%rcx, 192(%rsp)
	.align	16, 0x90
.LBB30_3:                               #   Parent Loop BB30_1 Depth=1
                                        #     Parent Loop BB30_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	$0, 184(%rsp)
	movq	192(%rsp), %rax
	testb	$1, 48(%rax)
	je	.LBB30_6
# BB#4:                                 #   in Loop: Header=BB30_3 Depth=3
	movl	$1, 184(%rsp)
	movq	192(%rsp), %rdi
	addq	$24, %rdi
	callq	match_address
	testl	%eax, %eax
	je	.LBB30_11
# BB#5:                                 #   in Loop: Header=BB30_3 Depth=3
	movq	192(%rsp), %rax
	andl	$-2, 48(%rax)
	jmp	.LBB30_11
.LBB30_6:                               #   in Loop: Header=BB30_3 Depth=3
	movq	192(%rsp), %rdi
	callq	match_address
	testl	%eax, %eax
	je	.LBB30_11
# BB#7:                                 #   in Loop: Header=BB30_3 Depth=3
	movl	$1, 184(%rsp)
	movq	192(%rsp), %rax
	cmpl	$0, 24(%rax)
	je	.LBB30_11
# BB#8:                                 #   in Loop: Header=BB30_3 Depth=3
	movq	192(%rsp), %rax
	cmpl	$2, 24(%rax)
	je	.LBB30_10
# BB#9:                                 #   in Loop: Header=BB30_3 Depth=3
	movq	192(%rsp), %rdi
	addq	$24, %rdi
	callq	match_address
	testl	%eax, %eax
	jne	.LBB30_11
.LBB30_10:                              #   in Loop: Header=BB30_3 Depth=3
	movq	192(%rsp), %rax
	orl	$1, 48(%rax)
.LBB30_11:                              #   in Loop: Header=BB30_3 Depth=3
	movq	192(%rsp), %rax
	testb	$2, 48(%rax)
	je	.LBB30_13
# BB#12:                                #   in Loop: Header=BB30_3 Depth=3
	cmpl	$0, 184(%rsp)
	sete	%al
	movzbl	%al, %eax
	movl	%eax, 184(%rsp)
.LBB30_13:                              #   in Loop: Header=BB30_3 Depth=3
	cmpl	$0, 184(%rsp)
	je	.LBB30_146
# BB#14:                                #   in Loop: Header=BB30_3 Depth=3
	movq	192(%rsp), %rax
	movsbl	52(%rax), %eax
	cmpl	$96, %eax
	jle	.LBB30_15
# BB#25:                                #   in Loop: Header=BB30_3 Depth=3
	addl	$-97, %eax
	cmpl	$28, %eax
	ja	.LBB30_144
# BB#26:                                #   in Loop: Header=BB30_3 Depth=3
	jmpq	*.LJTI30_0(,%rax,8)
.LBB30_33:                              #   in Loop: Header=BB30_3 Depth=3
	movq	192(%rsp), %rax
	cmpq	$0, 56(%rax)
	je	.LBB30_34
# BB#35:                                #   in Loop: Header=BB30_3 Depth=3
	movq	192(%rsp), %rax
	movq	56(%rax), %rax
	movq	%rax, 96(%rsp)
	movq	(%rax), %rcx
	movl	8(%rcx), %ecx
	subl	8(%rax), %ecx
	movl	%ecx, 188(%rsp)
	movq	96(%rsp), %rcx
	jmp	.LBB30_36
.LBB30_134:                             #   in Loop: Header=BB30_3 Depth=3
	cmpl	$0, replaced(%rip)
	je	.LBB30_145
# BB#135:                               #   in Loop: Header=BB30_3 Depth=3
	movl	$0, replaced(%rip)
	movq	192(%rsp), %rax
	cmpq	$0, 56(%rax)
	je	.LBB30_136
# BB#137:                               #   in Loop: Header=BB30_3 Depth=3
	movq	192(%rsp), %rax
	movq	56(%rax), %rax
	movq	%rax, 32(%rsp)
	movq	(%rax), %rcx
	movl	8(%rcx), %ecx
	subl	8(%rax), %ecx
	movl	%ecx, 188(%rsp)
	movq	32(%rsp), %rcx
	jmp	.LBB30_36
.LBB30_27:                              #   in Loop: Header=BB30_3 Depth=3
	movq	192(%rsp), %rax
	movq	56(%rax), %rax
	cmpl	$0, 8(%rax)
	je	.LBB30_145
# BB#28:                                #   in Loop: Header=BB30_3 Depth=3
	movq	192(%rsp), %rax
	movq	56(%rax), %rax
	movq	%rax, 200(%rsp)
	movq	(%rax), %rax
	movq	%rax, 192(%rsp)
	movq	200(%rsp), %rax
	movl	8(%rax), %eax
	movl	%eax, 188(%rsp)
	jmp	.LBB30_3
.LBB30_15:                              #   in Loop: Header=BB30_2 Depth=2
	cmpl	$67, %eax
	jg	.LBB30_19
# BB#16:                                #   in Loop: Header=BB30_2 Depth=2
	cmpl	$58, %eax
	je	.LBB30_145
# BB#17:                                #   in Loop: Header=BB30_2 Depth=2
	cmpl	$61, %eax
	jne	.LBB30_144
# BB#18:                                #   in Loop: Header=BB30_2 Depth=2
	movl	input_line_number(%rip), %esi
	movl	$.L.str28, %edi
	xorb	%al, %al
	callq	printf
	jmp	.LBB30_145
.LBB30_19:                              #   in Loop: Header=BB30_2 Depth=2
	cmpl	$70, %eax
	jg	.LBB30_23
# BB#20:                                #   in Loop: Header=BB30_2 Depth=2
	cmpl	$68, %eax
	jne	.LBB30_144
# BB#21:                                #   in Loop: Header=BB30_2 Depth=2
	movl	line+8(%rip), %esi
	movq	line(%rip), %rdi
	xorb	%al, %al
	callq	eol_pos
	movq	%rax, 88(%rsp)
	subl	line(%rip), %eax
	movl	line+8(%rip), %ecx
	subl	%eax, %ecx
	decl	%ecx
	movl	%ecx, 84(%rsp)
	jne	.LBB30_22
.LBB30_40:                              #   in Loop: Header=BB30_2 Depth=2
	movl	$0, line+8(%rip)
	incl	execute_program.end_cycle(%rip)
	jmp	.LBB30_145
.LBB30_23:                              #   in Loop: Header=BB30_2 Depth=2
	addl	$-71, %eax
	cmpl	$9, %eax
	ja	.LBB30_144
# BB#24:                                #   in Loop: Header=BB30_2 Depth=2
	jmpq	*.LJTI30_1(,%rax,8)
.LBB30_42:                              #   in Loop: Header=BB30_2 Depth=2
	movl	$hold, %edi
	movl	$line, %esi
	callq	line_append
	jmp	.LBB30_145
.LBB30_144:                             #   in Loop: Header=BB30_2 Depth=2
	movq	192(%rsp), %rax
	movsbl	52(%rax), %esi
	movl	$.L.str39, %edi
	xorb	%al, %al
	callq	panic
	.align	16, 0x90
.LBB30_145:                             #   in Loop: Header=BB30_2 Depth=2
	cmpl	$0, execute_program.end_cycle(%rip)
	jne	.LBB30_147
	jmp	.LBB30_146
	.align	16, 0x90
.LBB30_31:                              #   in Loop: Header=BB30_30 Depth=3
	movl	append+12(%rip), %esi
	addl	%esi, %esi
	movl	%esi, append+12(%rip)
	movq	append(%rip), %rdi
	callq	ck_realloc
	movq	%rax, append(%rip)
.LBB30_30:                              #   Parent Loop BB30_1 Depth=1
                                        #     Parent Loop BB30_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	append+12(%rip), %eax
	subl	append+8(%rip), %eax
	movq	192(%rsp), %rcx
	cmpl	64(%rcx), %eax
	jl	.LBB30_31
# BB#32:                                #   in Loop: Header=BB30_2 Depth=2
	movq	192(%rsp), %rax
	movslq	64(%rax), %rdx
	movslq	append+8(%rip), %rsi
	addq	append(%rip), %rsi
	movq	56(%rax), %rdi
	callq	bcopy
	movq	192(%rsp), %rax
	movl	64(%rax), %eax
	addl	%eax, append+8(%rip)
	jmp	.LBB30_145
.LBB30_44:                              #   in Loop: Header=BB30_2 Depth=2
	movl	$line, %edi
	movl	$hold, %esi
	callq	line_append
	jmp	.LBB30_145
.LBB30_73:                              #   in Loop: Header=BB30_2 Depth=2
	movq	input_file(%rip), %rdi
	callq	feof
	testl	%eax, %eax
	je	.LBB30_76
# BB#74:                                #   in Loop: Header=BB30_2 Depth=2
	movl	$0, line+8(%rip)
	.align	16, 0x90
.LBB30_75:                              #   in Loop: Header=BB30_2 Depth=2
	incl	quit_cmd(%rip)
	incl	execute_program.end_cycle(%rip)
	jmp	.LBB30_145
.LBB30_80:                              #   in Loop: Header=BB30_2 Depth=2
	movl	line+8(%rip), %esi
	movq	line(%rip), %rdi
	xorb	%al, %al
	callq	eol_pos
	movq	%rax, 56(%rsp)
	movq	line(%rip), %rdi
	testq	%rax, %rax
	je	.LBB30_82
# BB#81:                                #   in Loop: Header=BB30_2 Depth=2
	movq	56(%rsp), %rdx
	subq	line(%rip), %rdx
	incq	%rdx
	jmp	.LBB30_83
.LBB30_76:                              #   in Loop: Header=BB30_2 Depth=2
	callq	append_pattern_space
	jmp	.LBB30_145
.LBB30_82:                              #   in Loop: Header=BB30_2 Depth=2
	movslq	line+8(%rip), %rdx
.LBB30_83:                              #   in Loop: Header=BB30_2 Depth=2
	movq	stdout(%rip), %rcx
	movl	$1, %esi
                                        # kill: EDX<def> EDX<kill> RDX<kill>
	callq	ck_fwrite
	jmp	.LBB30_145
.LBB30_34:                              #   in Loop: Header=BB30_2 Depth=2
	incl	execute_program.end_cycle(%rip)
	jmp	.LBB30_145
.LBB30_136:                             #   in Loop: Header=BB30_2 Depth=2
	incl	execute_program.end_cycle(%rip)
	jmp	.LBB30_145
.LBB30_37:                              #   in Loop: Header=BB30_2 Depth=2
	movl	$0, line+8(%rip)
	movq	192(%rsp), %rax
	testb	$1, 48(%rax)
	jne	.LBB30_39
# BB#38:                                #   in Loop: Header=BB30_2 Depth=2
	movq	192(%rsp), %rax
	movl	64(%rax), %edx
	movq	56(%rax), %rdi
	movq	stdout(%rip), %rcx
	movl	$1, %esi
	callq	ck_fwrite
.LBB30_39:                              #   in Loop: Header=BB30_2 Depth=2
	incl	execute_program.end_cycle(%rip)
	jmp	.LBB30_145
.LBB30_41:                              #   in Loop: Header=BB30_2 Depth=2
	movl	$hold, %edi
	movl	$line, %esi
	callq	line_copy
	jmp	.LBB30_145
.LBB30_43:                              #   in Loop: Header=BB30_2 Depth=2
	movl	$line, %edi
	movl	$hold, %esi
	callq	line_copy
	jmp	.LBB30_145
.LBB30_45:                              #   in Loop: Header=BB30_2 Depth=2
	movq	192(%rsp), %rax
	movl	64(%rax), %edx
	movq	56(%rax), %rdi
	movq	stdout(%rip), %rcx
	jmp	.LBB30_79
.LBB30_46:                              #   in Loop: Header=BB30_2 Depth=2
	movl	$0, 64(%rsp)
	movl	line+8(%rip), %eax
	movl	%eax, 68(%rsp)
	movq	line(%rip), %rax
	movq	%rax, 72(%rsp)
	jmp	.LBB30_47
	.align	16, 0x90
.LBB30_55:                              #   in Loop: Header=BB30_47 Depth=3
	addl	$2, 64(%rsp)
	incq	72(%rsp)
	.align	16, 0x90
.LBB30_47:                              #   Parent Loop BB30_1 Depth=1
                                        #     Parent Loop BB30_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	68(%rsp), %eax
	leal	-1(%rax), %ecx
	movl	%ecx, 68(%rsp)
	testl	%eax, %eax
	je	.LBB30_68
# BB#48:                                #   in Loop: Header=BB30_47 Depth=3
	cmpl	$0, 68(%rsp)
	jne	.LBB30_50
# BB#49:                                #   in Loop: Header=BB30_47 Depth=3
	movq	72(%rsp), %rax
	movsbl	(%rax), %eax
	cmpl	$10, %eax
	je	.LBB30_68
.LBB30_50:                              #   in Loop: Header=BB30_47 Depth=3
	cmpl	$78, 64(%rsp)
	jl	.LBB30_52
# BB#51:                                #   in Loop: Header=BB30_47 Depth=3
	movl	$0, 64(%rsp)
	movl	$10, %edi
	callq	putchar
.LBB30_52:                              #   in Loop: Header=BB30_47 Depth=3
	movq	72(%rsp), %rax
	movsbl	(%rax), %eax
	cmpl	$92, %eax
	jne	.LBB30_56
# BB#53:                                #   in Loop: Header=BB30_47 Depth=3
	movl	$.L.str29, %edi
	.align	16, 0x90
.LBB30_54:                              #   in Loop: Header=BB30_47 Depth=3
	xorb	%al, %al
	callq	printf
	jmp	.LBB30_55
.LBB30_56:                              #   in Loop: Header=BB30_47 Depth=3
	movq	72(%rsp), %rax
	movsbq	(%rax), %rbx
	callq	__ctype_b_loc
	movq	(%rax), %rax
	testb	$64, 1(%rax,%rbx,2)
	je	.LBB30_58
# BB#57:                                #   in Loop: Header=BB30_47 Depth=3
	movq	72(%rsp), %rax
	movsbl	(%rax), %edi
	callq	putchar
	incl	64(%rsp)
	incq	72(%rsp)
	jmp	.LBB30_47
.LBB30_58:                              #   in Loop: Header=BB30_47 Depth=3
	movq	72(%rsp), %rax
	movsbl	(%rax), %eax
	addl	$-7, %eax
	cmpl	$6, %eax
	jbe	.LBB30_59
# BB#67:                                #   in Loop: Header=BB30_47 Depth=3
	movq	72(%rsp), %rax
	movzbl	(%rax), %esi
	movl	$.L.str37, %edi
	xorb	%al, %al
	callq	printf
	jmp	.LBB30_55
.LBB30_59:                              #   in Loop: Header=BB30_47 Depth=3
	jmpq	*.LJTI30_2(,%rax,8)
.LBB30_60:                              #   in Loop: Header=BB30_47 Depth=3
	movl	$.L.str30, %edi
	jmp	.LBB30_54
.LBB30_61:                              #   in Loop: Header=BB30_47 Depth=3
	movl	$.L.str31, %edi
	jmp	.LBB30_54
.LBB30_65:                              #   in Loop: Header=BB30_47 Depth=3
	movl	$.L.str35, %edi
	jmp	.LBB30_54
.LBB30_63:                              #   in Loop: Header=BB30_47 Depth=3
	movl	$.L.str33, %edi
	jmp	.LBB30_54
.LBB30_66:                              #   in Loop: Header=BB30_47 Depth=3
	movl	$.L.str36, %edi
	jmp	.LBB30_54
.LBB30_62:                              #   in Loop: Header=BB30_47 Depth=3
	movl	$.L.str32, %edi
	jmp	.LBB30_54
.LBB30_64:                              #   in Loop: Header=BB30_47 Depth=3
	movl	$.L.str34, %edi
	jmp	.LBB30_54
.LBB30_69:                              #   in Loop: Header=BB30_2 Depth=2
	movq	input_file(%rip), %rdi
	callq	feof
	testl	%eax, %eax
	jne	.LBB30_75
# BB#70:                                #   in Loop: Header=BB30_2 Depth=2
	cmpl	$0, no_default_output(%rip)
	jne	.LBB30_72
# BB#71:                                #   in Loop: Header=BB30_2 Depth=2
	movq	stdout(%rip), %rcx
	movl	line+8(%rip), %edx
	movq	line(%rip), %rdi
	movl	$1, %esi
	callq	ck_fwrite
.LBB30_72:                              #   in Loop: Header=BB30_2 Depth=2
	callq	read_pattern_space
	jmp	.LBB30_145
.LBB30_84:                              #   in Loop: Header=BB30_2 Depth=2
	movl	$0, 52(%rsp)
	movq	192(%rsp), %rax
	cmpq	$0, 56(%rax)
	je	.LBB30_145
# BB#85:                                #   in Loop: Header=BB30_2 Depth=2
	movq	192(%rsp), %rax
	movq	56(%rax), %rdi
	callq	rewind
	.align	16, 0x90
.LBB30_86:                              #   Parent Loop BB30_1 Depth=1
                                        #     Parent Loop BB30_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	append+8(%rip), %eax
	addl	52(%rsp), %eax
	movl	%eax, append+8(%rip)
	cmpl	append+12(%rip), %eax
	jne	.LBB30_88
# BB#87:                                #   in Loop: Header=BB30_86 Depth=3
	movl	append+12(%rip), %esi
	addl	%esi, %esi
	movl	%esi, append+12(%rip)
	movq	append(%rip), %rdi
	callq	ck_realloc
	movq	%rax, append(%rip)
.LBB30_88:                              #   in Loop: Header=BB30_86 Depth=3
	movslq	append+8(%rip), %rdi
	movl	append+12(%rip), %eax
	subl	%edi, %eax
	movslq	%eax, %rdx
	movq	192(%rsp), %rax
	movq	56(%rax), %rcx
	addq	append(%rip), %rdi
	movl	$1, %esi
	callq	fread
	movl	%eax, 52(%rsp)
	cmpl	$0, 52(%rsp)
	jg	.LBB30_86
# BB#89:                                #   in Loop: Header=BB30_2 Depth=2
	movq	192(%rsp), %rax
	movq	56(%rax), %rdi
	callq	ferror
	testl	%eax, %eax
	je	.LBB30_145
# BB#90:                                #   in Loop: Header=BB30_2 Depth=2
	movl	$.L.str38, %edi
	xorb	%al, %al
	callq	panic
	jmp	.LBB30_145
.LBB30_91:                              #   in Loop: Header=BB30_2 Depth=2
	movl	line+8(%rip), %eax
	decl	%eax
	movslq	%eax, %rax
	movq	line(%rip), %rcx
	movsbl	(%rcx,%rax), %eax
	cmpl	$10, %eax
	sete	%al
	movzbl	%al, %eax
	movl	%eax, 48(%rsp)
	cmpl	$0, execute_program.tmp+12(%rip)
	jne	.LBB30_93
# BB#92:                                #   in Loop: Header=BB30_2 Depth=2
	movl	$50, execute_program.tmp+12(%rip)
	movl	$50, %edi
	callq	ck_malloc
	movq	%rax, execute_program.tmp(%rip)
.LBB30_93:                              #   in Loop: Header=BB30_2 Depth=2
	movl	$0, 116(%rsp)
	movl	$0, 180(%rsp)
	movl	line+8(%rip), %eax
	subl	48(%rsp), %eax
	movl	%eax, 176(%rsp)
	movl	$0, execute_program.tmp+8(%rip)
	movq	192(%rsp), %rax
	movq	64(%rax), %rax
	movq	%rax, 144(%rsp)
	movq	192(%rsp), %rcx
	movslq	72(%rcx), %rcx
	addq	%rax, %rcx
	movq	%rcx, 136(%rsp)
	jmp	.LBB30_94
	.align	16, 0x90
.LBB30_104:                             #   in Loop: Header=BB30_94 Depth=3
	movl	%eax, 180(%rsp)
	movl	line+8(%rip), %ecx
	subl	48(%rsp), %ecx
	subl	%eax, %ecx
	movl	%ecx, 176(%rsp)
	.align	16, 0x90
.LBB30_94:                              #   Parent Loop BB30_1 Depth=1
                                        #     Parent Loop BB30_2 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB30_106 Depth 4
	movl	line+8(%rip), %edx
	subl	48(%rsp), %edx
	movq	192(%rsp), %rax
	movq	56(%rax), %rdi
	movl	176(%rsp), %r8d
	movl	180(%rsp), %ecx
	movq	line(%rip), %rsi
	movl	$regs, %r9d
	callq	re_search
	movl	%eax, 172(%rsp)
	testl	%eax, %eax
	js	.LBB30_129
# BB#95:                                #   in Loop: Header=BB30_94 Depth=3
	incl	116(%rsp)
	movl	172(%rsp), %eax
	subl	180(%rsp), %eax
	je	.LBB30_97
# BB#96:                                #   in Loop: Header=BB30_94 Depth=3
	movslq	180(%rsp), %rsi
	movl	172(%rsp), %edx
	subl	%esi, %edx
	addq	line(%rip), %rsi
	movl	$execute_program.tmp, %edi
	callq	str_append
.LBB30_97:                              #   in Loop: Header=BB30_94 Depth=3
	movq	192(%rsp), %rax
	testb	$8, 76(%rax)
	je	.LBB30_105
# BB#98:                                #   in Loop: Header=BB30_94 Depth=3
	movq	192(%rsp), %rax
	movl	116(%rsp), %ecx
	cmpl	80(%rax), %ecx
	je	.LBB30_105
# BB#99:                                #   in Loop: Header=BB30_94 Depth=3
	movq	regs+16(%rip), %rax
	movl	(%rax), %eax
	movq	regs+8(%rip), %rcx
	subl	(%rcx), %eax
	movl	%eax, 44(%rsp)
	testl	%eax, %eax
	jne	.LBB30_101
# BB#100:                               #   in Loop: Header=BB30_94 Depth=3
	movl	$1, 44(%rsp)
.LBB30_101:                             #   in Loop: Header=BB30_94 Depth=3
	movq	regs+8(%rip), %rax
	movslq	(%rax), %rsi
	addq	line(%rip), %rsi
	movl	44(%rsp), %edx
	movl	$execute_program.tmp, %edi
	callq	str_append
	movq	regs+16(%rip), %rax
	movl	172(%rsp), %ecx
	cmpl	(%rax), %ecx
	jne	.LBB30_103
# BB#102:                               #   in Loop: Header=BB30_94 Depth=3
	movl	172(%rsp), %eax
	incl	%eax
	jmp	.LBB30_104
.LBB30_105:                             #   in Loop: Header=BB30_94 Depth=3
	movq	144(%rsp), %rax
	movq	%rax, 120(%rsp)
	movq	%rax, 128(%rsp)
	jmp	.LBB30_106
	.align	16, 0x90
.LBB30_122:                             #   in Loop: Header=BB30_106 Depth=4
	incq	128(%rsp)
.LBB30_106:                             #   Parent Loop BB30_1 Depth=1
                                        #     Parent Loop BB30_2 Depth=2
                                        #       Parent Loop BB30_94 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movq	128(%rsp), %rax
	cmpq	136(%rsp), %rax
	jae	.LBB30_123
# BB#107:                               #   in Loop: Header=BB30_106 Depth=4
	movq	128(%rsp), %rax
	movsbl	(%rax), %eax
	cmpl	$38, %eax
	jne	.LBB30_112
# BB#108:                               #   in Loop: Header=BB30_106 Depth=4
	movq	128(%rsp), %rax
	subq	120(%rsp), %rax
	je	.LBB30_110
# BB#109:                               #   in Loop: Header=BB30_106 Depth=4
	movq	120(%rsp), %rsi
	movl	128(%rsp), %edx
	subl	%esi, %edx
	movl	$execute_program.tmp, %edi
	callq	str_append
.LBB30_110:                             #   in Loop: Header=BB30_106 Depth=4
	movq	regs+16(%rip), %rax
	movl	(%rax), %edx
	movq	regs+8(%rip), %rax
	movslq	(%rax), %rsi
	.align	16, 0x90
.LBB30_111:                             #   in Loop: Header=BB30_106 Depth=4
	subl	%esi, %edx
	addq	line(%rip), %rsi
	movl	$execute_program.tmp, %edi
	.align	16, 0x90
.LBB30_120:                             #   in Loop: Header=BB30_106 Depth=4
	callq	str_append
	jmp	.LBB30_121
.LBB30_112:                             #   in Loop: Header=BB30_106 Depth=4
	movq	128(%rsp), %rax
	movsbl	(%rax), %eax
	cmpl	$92, %eax
	jne	.LBB30_122
# BB#113:                               #   in Loop: Header=BB30_106 Depth=4
	movq	128(%rsp), %rax
	subq	120(%rsp), %rax
	je	.LBB30_115
# BB#114:                               #   in Loop: Header=BB30_106 Depth=4
	movq	120(%rsp), %rsi
	movl	128(%rsp), %edx
	subl	%esi, %edx
	movl	$execute_program.tmp, %edi
	callq	str_append
.LBB30_115:                             #   in Loop: Header=BB30_106 Depth=4
	movq	128(%rsp), %rax
	incq	%rax
	movq	%rax, 128(%rsp)
	cmpq	136(%rsp), %rax
	je	.LBB30_121
# BB#116:                               #   in Loop: Header=BB30_106 Depth=4
	movq	128(%rsp), %rax
	movsbl	(%rax), %eax
	cmpl	$48, %eax
	jl	.LBB30_119
# BB#117:                               #   in Loop: Header=BB30_106 Depth=4
	movq	128(%rsp), %rax
	movsbl	(%rax), %eax
	cmpl	$57, %eax
	jg	.LBB30_119
# BB#118:                               #   in Loop: Header=BB30_106 Depth=4
	movq	128(%rsp), %rax
	movsbl	(%rax), %eax
	addl	$-48, %eax
	movl	%eax, 40(%rsp)
	movslq	40(%rsp), %rax
	movq	regs+16(%rip), %rcx
	movl	(%rcx,%rax,4), %edx
	movq	regs+8(%rip), %rcx
	movslq	(%rcx,%rax,4), %rsi
	jmp	.LBB30_111
.LBB30_121:                             #   in Loop: Header=BB30_106 Depth=4
	movq	128(%rsp), %rax
	incq	%rax
	movq	%rax, 120(%rsp)
	jmp	.LBB30_122
.LBB30_119:                             #   in Loop: Header=BB30_106 Depth=4
	movq	128(%rsp), %rsi
	movl	$execute_program.tmp, %edi
	movl	$1, %edx
	jmp	.LBB30_120
.LBB30_123:                             #   in Loop: Header=BB30_94 Depth=3
	movq	128(%rsp), %rax
	subq	120(%rsp), %rax
	je	.LBB30_125
# BB#124:                               #   in Loop: Header=BB30_94 Depth=3
	movq	120(%rsp), %rsi
	movl	128(%rsp), %edx
	subl	%esi, %edx
	movl	$execute_program.tmp, %edi
	callq	str_append
.LBB30_125:                             #   in Loop: Header=BB30_94 Depth=3
	movq	regs+16(%rip), %rax
	movl	172(%rsp), %ecx
	cmpl	(%rax), %ecx
	jne	.LBB30_127
# BB#126:                               #   in Loop: Header=BB30_94 Depth=3
	movslq	172(%rsp), %rsi
	addq	line(%rip), %rsi
	movl	$execute_program.tmp, %edi
	movl	$1, %edx
	callq	str_append
	movq	regs+16(%rip), %rax
	incl	(%rax)
.LBB30_127:                             #   in Loop: Header=BB30_94 Depth=3
	movq	regs+16(%rip), %rax
	movl	(%rax), %eax
	movl	%eax, 180(%rsp)
	movl	line+8(%rip), %ecx
	subl	48(%rsp), %ecx
	subl	%eax, %ecx
	movl	%ecx, 176(%rsp)
	testl	%ecx, %ecx
	js	.LBB30_129
# BB#128:                               #   in Loop: Header=BB30_94 Depth=3
	movq	192(%rsp), %rax
	testb	$1, 76(%rax)
	jne	.LBB30_94
	jmp	.LBB30_129
.LBB30_103:                             #   in Loop: Header=BB30_94 Depth=3
	movq	regs+16(%rip), %rax
	movl	(%rax), %eax
	jmp	.LBB30_104
.LBB30_138:                             #   in Loop: Header=BB30_2 Depth=2
	movq	192(%rsp), %rax
	cmpq	$0, 56(%rax)
	je	.LBB30_145
# BB#139:                               #   in Loop: Header=BB30_2 Depth=2
	movq	192(%rsp), %rax
	movq	56(%rax), %rcx
	jmp	.LBB30_78
.LBB30_140:                             #   in Loop: Header=BB30_2 Depth=2
	movq	line+8(%rip), %rax
	movq	%rax, 24(%rsp)
	movq	line(%rip), %rax
	movq	%rax, 16(%rsp)
	movq	hold+8(%rip), %rax
	movq	%rax, line+8(%rip)
	movq	hold(%rip), %rax
	movq	%rax, line(%rip)
	movq	16(%rsp), %rax
	movq	24(%rsp), %rcx
	movq	%rcx, hold+8(%rip)
	movq	%rax, hold(%rip)
	jmp	.LBB30_145
.LBB30_141:                             #   in Loop: Header=BB30_2 Depth=2
	movq	line(%rip), %rax
	movq	%rax, 8(%rsp)
	movslq	line+8(%rip), %rcx
	addq	%rax, %rcx
	movq	%rcx, (%rsp)
	jmp	.LBB30_142
	.align	16, 0x90
.LBB30_143:                             #   in Loop: Header=BB30_142 Depth=3
	movq	8(%rsp), %rax
	movzbl	(%rax), %ecx
	movq	192(%rsp), %rdx
	movq	56(%rdx), %rdx
	movb	(%rdx,%rcx), %cl
	movb	%cl, (%rax)
	incq	8(%rsp)
.LBB30_142:                             #   Parent Loop BB30_1 Depth=1
                                        #     Parent Loop BB30_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	8(%rsp), %rax
	cmpq	(%rsp), %rax
	jae	.LBB30_145
	jmp	.LBB30_143
.LBB30_29:                              #   in Loop: Header=BB30_2 Depth=2
	movq	200(%rsp), %rcx
	movq	16(%rcx), %rax
	movslq	24(%rcx), %rcx
	leaq	(%rcx,%rcx,2), %rcx
	shlq	$5, %rcx
	addq	(%rax), %rcx
	movq	%rcx, 192(%rsp)
	movq	200(%rsp), %rax
	movq	16(%rax), %rcx
	movl	8(%rcx), %ecx
	subl	24(%rax), %ecx
	movl	%ecx, 188(%rsp)
	movq	200(%rsp), %rax
	movq	16(%rax), %rax
	movq	%rax, 200(%rsp)
	jmp	.LBB30_145
.LBB30_129:                             #   in Loop: Header=BB30_2 Depth=2
	cmpl	$0, 116(%rsp)
	je	.LBB30_145
# BB#130:                               #   in Loop: Header=BB30_2 Depth=2
	movl	$1, replaced(%rip)
	movl	176(%rsp), %edx
	addl	48(%rsp), %edx
	movslq	180(%rsp), %rsi
	addq	line(%rip), %rsi
	movl	$execute_program.tmp, %edi
	callq	str_append
	movq	line(%rip), %rax
	movq	%rax, 152(%rsp)
	movl	line+8(%rip), %eax
	movl	%eax, 160(%rsp)
	movl	line+12(%rip), %eax
	movl	%eax, 164(%rsp)
	movq	execute_program.tmp(%rip), %rax
	movq	%rax, line(%rip)
	movl	execute_program.tmp+8(%rip), %eax
	movl	%eax, line+8(%rip)
	movl	execute_program.tmp+12(%rip), %eax
	movl	%eax, line+12(%rip)
	movq	152(%rsp), %rax
	movq	%rax, execute_program.tmp(%rip)
	movl	160(%rsp), %eax
	movl	%eax, execute_program.tmp+8(%rip)
	movl	164(%rsp), %eax
	movl	%eax, execute_program.tmp+12(%rip)
	movq	192(%rsp), %rax
	testb	$4, 76(%rax)
	je	.LBB30_133
# BB#131:                               #   in Loop: Header=BB30_2 Depth=2
	movq	192(%rsp), %rax
	cmpq	$0, 88(%rax)
	je	.LBB30_133
# BB#132:                               #   in Loop: Header=BB30_2 Depth=2
	movq	192(%rsp), %rax
	movq	88(%rax), %rcx
	movl	line+8(%rip), %edx
	movq	line(%rip), %rdi
	movl	$1, %esi
	callq	ck_fwrite
.LBB30_133:                             #   in Loop: Header=BB30_2 Depth=2
	movq	192(%rsp), %rax
	testb	$2, 76(%rax)
	je	.LBB30_145
.LBB30_77:                              #   in Loop: Header=BB30_2 Depth=2
	movq	stdout(%rip), %rcx
.LBB30_78:                              #   in Loop: Header=BB30_2 Depth=2
	movl	line+8(%rip), %edx
	movq	line(%rip), %rdi
.LBB30_79:                              #   in Loop: Header=BB30_2 Depth=2
	movl	$1, %esi
	callq	ck_fwrite
	jmp	.LBB30_145
.LBB30_68:                              #   in Loop: Header=BB30_2 Depth=2
	movl	$10, %edi
	callq	putchar
	jmp	.LBB30_145
.LBB30_147:
	addq	$208, %rsp
	popq	%rbx
	ret
.Ltmp104:
	.size	execute_program, .Ltmp104-execute_program
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.align	8
.LJTI30_0:
	.quad	.LBB30_30
	.quad	.LBB30_33
	.quad	.LBB30_37
	.quad	.LBB30_40
	.quad	.LBB30_144
	.quad	.LBB30_144
	.quad	.LBB30_41
	.quad	.LBB30_43
	.quad	.LBB30_45
	.quad	.LBB30_144
	.quad	.LBB30_144
	.quad	.LBB30_46
	.quad	.LBB30_144
	.quad	.LBB30_69
	.quad	.LBB30_144
	.quad	.LBB30_77
	.quad	.LBB30_75
	.quad	.LBB30_84
	.quad	.LBB30_91
	.quad	.LBB30_134
	.quad	.LBB30_144
	.quad	.LBB30_144
	.quad	.LBB30_138
	.quad	.LBB30_140
	.quad	.LBB30_141
	.quad	.LBB30_144
	.quad	.LBB30_27
	.quad	.LBB30_144
	.quad	.LBB30_29
.LJTI30_1:
	.quad	.LBB30_42
	.quad	.LBB30_44
	.quad	.LBB30_144
	.quad	.LBB30_144
	.quad	.LBB30_144
	.quad	.LBB30_144
	.quad	.LBB30_144
	.quad	.LBB30_73
	.quad	.LBB30_144
	.quad	.LBB30_80
.LJTI30_2:
	.quad	.LBB30_60
	.quad	.LBB30_61
	.quad	.LBB30_65
	.quad	.LBB30_63
	.quad	.LBB30_66
	.quad	.LBB30_62
	.quad	.LBB30_64

	.text
	.globl	ck_fwrite
	.align	16, 0x90
	.type	ck_fwrite,@function
ck_fwrite:                              # @ck_fwrite
	.cfi_startproc
# BB#0:
	pushq	%rbx
.Ltmp107:
	.cfi_def_cfa_offset 16
	subq	$32, %rsp
.Ltmp108:
	.cfi_def_cfa_offset 48
.Ltmp109:
	.cfi_offset %rbx, -16
	movq	%rdi, 24(%rsp)
	movl	%esi, 20(%rsp)
	movl	%edx, 16(%rsp)
	movq	%rcx, 8(%rsp)
	movslq	16(%rsp), %rdx
	movslq	20(%rsp), %rsi
	movq	24(%rsp), %rdi
	callq	fwrite
	movslq	16(%rsp), %rcx
	cmpq	%rcx, %rax
	je	.LBB31_2
# BB#1:
	movl	16(%rsp), %ebx
	movq	8(%rsp), %rdi
	xorb	%al, %al
	callq	__fp_name
	movl	$.L.str46, %edi
	movl	%ebx, %esi
	movq	%rax, %rdx
	xorb	%al, %al
	callq	panic
.LBB31_2:
	addq	$32, %rsp
	popq	%rbx
	ret
.Ltmp110:
	.size	ck_fwrite, .Ltmp110-ck_fwrite
	.cfi_endproc

	.globl	ck_fclose
	.align	16, 0x90
	.type	ck_fclose,@function
ck_fclose:                              # @ck_fclose
	.cfi_startproc
# BB#0:
	pushq	%rax
.Ltmp112:
	.cfi_def_cfa_offset 16
	movq	%rdi, (%rsp)
	callq	fclose
	cmpl	$-1, %eax
	jne	.LBB32_2
# BB#1:
	movq	(%rsp), %rdi
	xorb	%al, %al
	callq	__fp_name
	movl	$.L.str47, %edi
	movq	%rax, %rsi
	xorb	%al, %al
	callq	panic
.LBB32_2:
	popq	%rax
	ret
.Ltmp113:
	.size	ck_fclose, .Ltmp113-ck_fclose
	.cfi_endproc

	.globl	match_address
	.align	16, 0x90
	.type	match_address,@function
match_address:                          # @match_address
	.cfi_startproc
# BB#0:
	subq	$24, %rsp
.Ltmp115:
	.cfi_def_cfa_offset 32
	movq	%rdi, 8(%rsp)
	movl	(%rdi), %eax
	cmpq	$3, %rax
	jbe	.LBB33_1
# BB#7:
	movl	$.L.str40, %edi
	xorb	%al, %al
	callq	panic
	movl	$-1, 20(%rsp)
	jmp	.LBB33_8
.LBB33_1:
	jmpq	*.LJTI33_0(,%rax,8)
.LBB33_2:
	movl	$1, 20(%rsp)
	jmp	.LBB33_8
.LBB33_3:
	movq	8(%rsp), %rax
	movl	input_line_number(%rip), %ecx
	cmpl	16(%rax), %ecx
	sete	%al
	jmp	.LBB33_6
.LBB33_4:
	movl	line+8(%rip), %eax
	decl	%eax
	movslq	%eax, %rax
	movq	line(%rip), %rcx
	movsbl	(%rcx,%rax), %eax
	cmpl	$10, %eax
	sete	%al
	movzbl	%al, %eax
	movl	%eax, 4(%rsp)
	movl	line+8(%rip), %r8d
	subl	%eax, %r8d
	movq	8(%rsp), %rax
	movq	8(%rax), %rdi
	movq	line(%rip), %rsi
	movl	%r8d, %edx
	xorl	%ecx, %ecx
	xorl	%r9d, %r9d
	callq	re_search
	testl	%eax, %eax
	setns	%al
	jmp	.LBB33_6
.LBB33_5:
	cmpl	$0, input_EOF(%rip)
	setne	%al
.LBB33_6:
	movzbl	%al, %eax
	movl	%eax, 20(%rsp)
.LBB33_8:
	movl	20(%rsp), %eax
	addq	$24, %rsp
	ret
.Ltmp116:
	.size	match_address, .Ltmp116-match_address
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.align	8
.LJTI33_0:
	.quad	.LBB33_2
	.quad	.LBB33_3
	.quad	.LBB33_4
	.quad	.LBB33_5

	.text
	.align	16, 0x90
	.type	eol_pos,@function
eol_pos:                                # @eol_pos
	.cfi_startproc
# BB#0:
	movq	%rdi, -16(%rsp)
	movl	%esi, -20(%rsp)
	.align	16, 0x90
.LBB34_1:                               # =>This Inner Loop Header: Depth=1
	movl	-20(%rsp), %eax
	leal	-1(%rax), %ecx
	movl	%ecx, -20(%rsp)
	testl	%eax, %eax
	je	.LBB34_3
# BB#2:                                 #   in Loop: Header=BB34_1 Depth=1
	movq	-16(%rsp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, -16(%rsp)
	movsbl	(%rax), %eax
	cmpl	$10, %eax
	jne	.LBB34_1
.LBB34_3:
	movq	-16(%rsp), %rax
	decq	%rax
	movq	%rax, -16(%rsp)
	movq	%rax, -8(%rsp)
	movq	-8(%rsp), %rax
	ret
.Ltmp117:
	.size	eol_pos, .Ltmp117-eol_pos
	.cfi_endproc

	.align	16, 0x90
	.type	chr_copy,@function
chr_copy:                               # @chr_copy
	.cfi_startproc
# BB#0:
	movq	%rdi, -8(%rsp)
	movq	%rsi, -16(%rsp)
	movl	%edx, -20(%rsp)
	jmp	.LBB35_1
	.align	16, 0x90
.LBB35_2:                               #   in Loop: Header=BB35_1 Depth=1
	movq	-16(%rsp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, -16(%rsp)
	movb	(%rax), %al
	movq	-8(%rsp), %rcx
	leaq	1(%rcx), %rdx
	movq	%rdx, -8(%rsp)
	movb	%al, (%rcx)
.LBB35_1:                               # =>This Inner Loop Header: Depth=1
	movl	-20(%rsp), %eax
	leal	-1(%rax), %ecx
	movl	%ecx, -20(%rsp)
	testl	%eax, %eax
	jne	.LBB35_2
# BB#3:
	ret
.Ltmp118:
	.size	chr_copy, .Ltmp118-chr_copy
	.cfi_endproc

	.globl	line_copy
	.align	16, 0x90
	.type	line_copy,@function
line_copy:                              # @line_copy
	.cfi_startproc
# BB#0:
	subq	$24, %rsp
.Ltmp120:
	.cfi_def_cfa_offset 32
	movq	%rdi, 16(%rsp)
	movq	%rsi, 8(%rsp)
	movq	16(%rsp), %rax
	movl	8(%rax), %eax
	cmpl	12(%rsi), %eax
	jle	.LBB36_2
# BB#1:
	movq	16(%rsp), %rax
	movl	8(%rax), %eax
	movq	8(%rsp), %rcx
	movl	%eax, 12(%rcx)
	movq	8(%rsp), %rax
	movl	12(%rax), %esi
	movq	(%rax), %rdi
	callq	ck_realloc
	movq	8(%rsp), %rcx
	movq	%rax, (%rcx)
.LBB36_2:
	movq	16(%rsp), %rax
	movslq	8(%rax), %rdx
	movq	8(%rsp), %rcx
	movq	(%rcx), %rsi
	movq	(%rax), %rdi
	callq	bcopy
	movq	16(%rsp), %rax
	movl	8(%rax), %eax
	movq	8(%rsp), %rcx
	movl	%eax, 8(%rcx)
	addq	$24, %rsp
	ret
.Ltmp121:
	.size	line_copy, .Ltmp121-line_copy
	.cfi_endproc

	.globl	line_append
	.align	16, 0x90
	.type	line_append,@function
line_append:                            # @line_append
	.cfi_startproc
# BB#0:
	subq	$24, %rsp
.Ltmp123:
	.cfi_def_cfa_offset 32
	movq	%rdi, 16(%rsp)
	movq	%rsi, 8(%rsp)
	movl	12(%rsi), %eax
	subl	8(%rsi), %eax
	movq	16(%rsp), %rcx
	cmpl	%eax, 8(%rcx)
	jle	.LBB37_2
# BB#1:
	movq	16(%rsp), %rax
	movl	8(%rax), %eax
	movq	8(%rsp), %rcx
	addl	%eax, 12(%rcx)
	movq	8(%rsp), %rax
	movl	12(%rax), %esi
	movq	(%rax), %rdi
	callq	ck_realloc
	movq	8(%rsp), %rcx
	movq	%rax, (%rcx)
.LBB37_2:
	movq	8(%rsp), %rax
	movslq	8(%rax), %rsi
	addq	(%rax), %rsi
	movq	16(%rsp), %rax
	movslq	8(%rax), %rdx
	movq	(%rax), %rdi
	callq	bcopy
	movq	16(%rsp), %rax
	movl	8(%rax), %eax
	movq	8(%rsp), %rcx
	addl	%eax, 8(%rcx)
	addq	$24, %rsp
	ret
.Ltmp124:
	.size	line_append, .Ltmp124-line_append
	.cfi_endproc

	.globl	append_pattern_space
	.align	16, 0x90
	.type	append_pattern_space,@function
append_pattern_space:                   # @append_pattern_space
	.cfi_startproc
# BB#0:
	subq	$24, %rsp
.Ltmp126:
	.cfi_def_cfa_offset 32
	movslq	line+8(%rip), %rax
	addq	line(%rip), %rax
	movq	%rax, 16(%rsp)
	movl	line+12(%rip), %eax
	subl	line+8(%rip), %eax
	movl	%eax, 12(%rsp)
	incl	input_line_number(%rip)
	movl	$0, replaced(%rip)
	.align	16, 0x90
.LBB38_1:                               # =>This Inner Loop Header: Depth=1
	movq	input_file(%rip), %rdi
	callq	_IO_getc
	movl	%eax, 8(%rsp)
	cmpl	$-1, %eax
	je	.LBB38_2
# BB#6:                                 #   in Loop: Header=BB38_1 Depth=1
	cmpl	$0, 12(%rsp)
	jne	.LBB38_8
# BB#7:                                 #   in Loop: Header=BB38_1 Depth=1
	movq	line(%rip), %rdi
	movl	line+12(%rip), %esi
	addl	%esi, %esi
	callq	ck_realloc
	movq	%rax, line(%rip)
	movslq	line+12(%rip), %rcx
	addq	%rax, %rcx
	movq	%rcx, 16(%rsp)
	movl	line+12(%rip), %eax
	movl	%eax, 12(%rsp)
	shll	line+12(%rip)
.LBB38_8:                               #   in Loop: Header=BB38_1 Depth=1
	movq	16(%rsp), %rax
	leaq	1(%rax), %rcx
	movb	8(%rsp), %dl
	movq	%rcx, 16(%rsp)
	movb	%dl, (%rax)
	decl	12(%rsp)
	cmpl	$10, 8(%rsp)
	jne	.LBB38_1
# BB#9:
	movl	line+12(%rip), %eax
	subl	12(%rsp), %eax
	movl	%eax, line+8(%rip)
	movq	input_file(%rip), %rdi
	callq	_IO_getc
	movl	%eax, 8(%rsp)
	cmpl	$-1, %eax
	je	.LBB38_4
# BB#10:
	movq	input_file(%rip), %rsi
	movl	8(%rsp), %edi
	callq	ungetc
	jmp	.LBB38_11
.LBB38_2:
	movl	12(%rsp), %eax
	cmpl	line+12(%rip), %eax
	je	.LBB38_11
# BB#3:
	movl	line+12(%rip), %eax
	subl	12(%rsp), %eax
	movl	%eax, line+8(%rip)
.LBB38_4:
	cmpl	$0, last_input_file(%rip)
	je	.LBB38_11
# BB#5:
	incl	input_EOF(%rip)
	addq	$24, %rsp
	ret
.LBB38_11:
	addq	$24, %rsp
	ret
.Ltmp127:
	.size	append_pattern_space, .Ltmp127-append_pattern_space
	.cfi_endproc

	.globl	re_search
	.align	16, 0x90
	.type	re_search,@function
re_search:                              # @re_search
	.cfi_startproc
# BB#0:
	subq	$72, %rsp
.Ltmp129:
	.cfi_def_cfa_offset 80
	movq	%rdi, 64(%rsp)
	movq	%rsi, 56(%rsp)
	movl	%edx, 52(%rsp)
	movl	%ecx, 48(%rsp)
	movl	%r8d, 44(%rsp)
	movq	%r9, 32(%rsp)
	movl	48(%rsp), %eax
	movq	56(%rsp), %rcx
	movq	64(%rsp), %rdi
	movl	44(%rsp), %edx
	movl	52(%rsp), %r8d
	movl	%r8d, 16(%rsp)
	movq	%r9, 8(%rsp)
	movl	%edx, (%rsp)
	movl	$0, %esi
	xorl	%edx, %edx
	movl	%eax, %r9d
	callq	re_search_2
	addq	$72, %rsp
	ret
.Ltmp130:
	.size	re_search, .Ltmp130-re_search
	.cfi_endproc

	.globl	str_append
	.align	16, 0x90
	.type	str_append,@function
str_append:                             # @str_append
	.cfi_startproc
# BB#0:
	subq	$24, %rsp
.Ltmp132:
	.cfi_def_cfa_offset 32
	movq	%rdi, 16(%rsp)
	movq	%rsi, 8(%rsp)
	movl	%edx, 4(%rsp)
	movq	16(%rsp), %rax
	movl	12(%rax), %ecx
	subl	8(%rax), %ecx
	cmpl	%ecx, %edx
	jle	.LBB40_2
# BB#1:
	movq	16(%rsp), %rax
	movl	4(%rsp), %ecx
	addl	%ecx, 12(%rax)
	movq	16(%rsp), %rax
	movl	12(%rax), %esi
	movq	(%rax), %rdi
	callq	ck_realloc
	movq	16(%rsp), %rcx
	movq	%rax, (%rcx)
.LBB40_2:
	movq	16(%rsp), %rax
	movslq	8(%rax), %rsi
	addq	(%rax), %rsi
	movslq	4(%rsp), %rdx
	movq	8(%rsp), %rdi
	callq	bcopy
	movq	16(%rsp), %rax
	movl	4(%rsp), %ecx
	addl	%ecx, 8(%rax)
	addq	$24, %rsp
	ret
.Ltmp133:
	.size	str_append, .Ltmp133-str_append
	.cfi_endproc

	.globl	__fp_name
	.align	16, 0x90
	.type	__fp_name,@function
__fp_name:                              # @__fp_name
	.cfi_startproc
# BB#0:
	movq	%rdi, -16(%rsp)
	movl	$0, -20(%rsp)
	jmp	.LBB41_1
	.align	16, 0x90
.LBB41_4:                               #   in Loop: Header=BB41_1 Depth=1
	incl	-20(%rsp)
.LBB41_1:                               # =>This Inner Loop Header: Depth=1
	cmpl	$31, -20(%rsp)
	jg	.LBB41_5
# BB#2:                                 #   in Loop: Header=BB41_1 Depth=1
	movslq	-20(%rsp), %rax
	shlq	$4, %rax
	movq	__id_s(%rax), %rax
	cmpq	-16(%rsp), %rax
	jne	.LBB41_4
# BB#3:
	movslq	-20(%rsp), %rax
	shlq	$4, %rax
	movq	__id_s+8(%rax), %rax
	movq	%rax, -8(%rsp)
	movq	-8(%rsp), %rax
	ret
.LBB41_5:
	movq	$.L.str43, -8(%rsp)
	movq	-8(%rsp), %rax
	ret
.Ltmp134:
	.size	__fp_name, .Ltmp134-__fp_name
	.cfi_endproc

	.globl	xmalloc
	.align	16, 0x90
	.type	xmalloc,@function
xmalloc:                                # @xmalloc
	.cfi_startproc
# BB#0:
	pushq	%rax
.Ltmp136:
	.cfi_def_cfa_offset 16
	movl	%edi, 4(%rsp)
	xorb	%al, %al
	callq	ck_malloc
	popq	%rdx
	ret
.Ltmp137:
	.size	xmalloc, .Ltmp137-xmalloc
	.cfi_endproc

	.globl	add_buffer
	.align	16, 0x90
	.type	add_buffer,@function
add_buffer:                             # @add_buffer
	.cfi_startproc
# BB#0:
	subq	$56, %rsp
.Ltmp139:
	.cfi_def_cfa_offset 64
	movq	%rdi, 48(%rsp)
	movq	%rsi, 40(%rsp)
	movl	%edx, 36(%rsp)
	movq	48(%rsp), %rax
	movq	%rax, 24(%rsp)
	movl	4(%rax), %ecx
	addl	36(%rsp), %ecx
	cmpl	(%rax), %ecx
	jle	.LBB43_2
# BB#1:
	movq	24(%rsp), %rax
	shll	(%rax)
	movq	24(%rsp), %rax
	movl	(%rax), %esi
	movq	8(%rax), %rdi
	xorb	%al, %al
	callq	ck_realloc
	movq	24(%rsp), %rcx
	movq	%rax, 8(%rcx)
.LBB43_2:
	movl	36(%rsp), %eax
	movl	%eax, 20(%rsp)
	movq	24(%rsp), %rax
	movslq	4(%rax), %rcx
	addq	8(%rax), %rcx
	movq	%rcx, 8(%rsp)
	jmp	.LBB43_3
	.align	16, 0x90
.LBB43_4:                               #   in Loop: Header=BB43_3 Depth=1
	movq	40(%rsp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, 40(%rsp)
	movb	(%rax), %al
	movq	8(%rsp), %rcx
	leaq	1(%rcx), %rdx
	movq	%rdx, 8(%rsp)
	movb	%al, (%rcx)
.LBB43_3:                               # =>This Inner Loop Header: Depth=1
	movl	20(%rsp), %eax
	leal	-1(%rax), %ecx
	movl	%ecx, 20(%rsp)
	testl	%eax, %eax
	jne	.LBB43_4
# BB#5:
	movq	24(%rsp), %rax
	movl	36(%rsp), %ecx
	addl	%ecx, 4(%rax)
	addq	$56, %rsp
	ret
.Ltmp140:
	.size	add_buffer, .Ltmp140-add_buffer
	.cfi_endproc

	.globl	re_compile_fastmap
	.align	16, 0x90
	.type	re_compile_fastmap,@function
re_compile_fastmap:                     # @re_compile_fastmap
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp144:
	.cfi_def_cfa_offset 16
.Ltmp145:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp146:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$104, %rsp
.Ltmp147:
	.cfi_offset %rbx, -24
	movq	%rdi, -24(%rbp)
	movl	$0, -60(%rbp)
	movq	-24(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -72(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -80(%rbp)
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -88(%rbp)
	movq	-80(%rbp), %rax
	movq	%rax, -96(%rbp)
	movq	-80(%rbp), %rax
	addq	-88(%rbp), %rax
	movq	%rax, -104(%rbp)
	movb	$1, -105(%rbp)
	movb	$0, -106(%rbp)
	leaq	-48(%rsp), %rax
	movq	%rax, %rsp
	movq	%rax, -48(%rbp)
	testq	%rax, %rax
	je	.LBB44_1
# BB#2:
	movl	$5, -40(%rbp)
	movl	$0, -36(%rbp)
	movq	-72(%rbp), %rdi
	xorl	%esi, %esi
	movl	$256, %edx              # imm = 0x100
	callq	memset
	movq	-24(%rbp), %rax
	orl	$8, 56(%rax)
	movq	-24(%rbp), %rax
	andl	$-2, 56(%rax)
	movabsq	$34359738352, %rbx      # imm = 0x7FFFFFFF0
	jmp	.LBB44_3
.LBB44_1:
	movl	$-2, -12(%rbp)
	jmp	.LBB44_66
	.align	16, 0x90
.LBB44_63:                              #   in Loop: Header=BB44_3 Depth=1
	movb	$0, -105(%rbp)
	movq	-104(%rbp), %rax
	movq	%rax, -96(%rbp)
	.align	16, 0x90
.LBB44_3:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB44_12 Depth 2
                                        #     Child Loop BB44_20 Depth 2
                                        #     Child Loop BB44_17 Depth 2
                                        #     Child Loop BB44_25 Depth 2
                                        #     Child Loop BB44_30 Depth 2
                                        #     Child Loop BB44_35 Depth 2
	movb	$1, %al
	movq	-96(%rbp), %rcx
	cmpq	-104(%rbp), %rcx
	jne	.LBB44_5
# BB#4:                                 #   in Loop: Header=BB44_3 Depth=1
	cmpl	$0, -36(%rbp)
	setne	%al
.LBB44_5:                               #   in Loop: Header=BB44_3 Depth=1
	cmpb	$1, %al
	jne	.LBB44_64
# BB#6:                                 #   in Loop: Header=BB44_3 Depth=1
	movq	-96(%rbp), %rax
	cmpq	-104(%rbp), %rax
	jne	.LBB44_8
# BB#7:                                 #   in Loop: Header=BB44_3 Depth=1
	movq	-24(%rbp), %rax
	movl	56(%rax), %ecx
	movzbl	-105(%rbp), %edx
	orl	%ecx, %edx
	andl	$1, %edx
	andl	$-2, %ecx
	orl	%edx, %ecx
	movl	%ecx, 56(%rax)
	movb	$1, -105(%rbp)
	movl	-36(%rbp), %eax
	decl	%eax
	movl	%eax, -36(%rbp)
	movq	-48(%rbp), %rcx
	movq	(%rcx,%rax,8), %rax
	movq	%rax, -96(%rbp)
.LBB44_8:                               #   in Loop: Header=BB44_3 Depth=1
	movq	-96(%rbp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, -96(%rbp)
	movzbl	(%rax), %eax
	cmpq	$28, %rax
	ja	.LBB44_61
# BB#9:                                 #   in Loop: Header=BB44_3 Depth=1
	jmpq	*.LJTI44_0(,%rax,8)
.LBB44_40:                              #   in Loop: Header=BB44_3 Depth=1
	movq	-96(%rbp), %rax
	movzbl	(%rax), %eax
	movl	%eax, -28(%rbp)
	movq	-96(%rbp), %rcx
	movsbl	1(%rcx), %ecx
	shll	$8, %ecx
	orl	%eax, %ecx
	movl	%ecx, -28(%rbp)
	addq	$2, -96(%rbp)
	movslq	-28(%rbp), %rax
	addq	%rax, -96(%rbp)
	cmpl	$0, -28(%rbp)
	jg	.LBB44_3
# BB#41:                                #   in Loop: Header=BB44_3 Depth=1
	movq	-96(%rbp), %rax
	movzbl	(%rax), %eax
	cmpl	$14, %eax
	je	.LBB44_43
# BB#42:                                #   in Loop: Header=BB44_3 Depth=1
	movq	-96(%rbp), %rax
	cmpb	$20, (%rax)
	jne	.LBB44_3
.LBB44_43:                              #   in Loop: Header=BB44_3 Depth=1
	incq	-96(%rbp)
	movq	-96(%rbp), %rax
	movzbl	(%rax), %eax
	movl	%eax, -28(%rbp)
	movq	-96(%rbp), %rcx
	movsbl	1(%rcx), %ecx
	shll	$8, %ecx
	orl	%eax, %ecx
	movl	%ecx, -28(%rbp)
	addq	$2, -96(%rbp)
	movslq	-28(%rbp), %rax
	addq	%rax, -96(%rbp)
	cmpl	$0, -36(%rbp)
	je	.LBB44_3
# BB#44:                                #   in Loop: Header=BB44_3 Depth=1
	movl	-36(%rbp), %eax
	decl	%eax
	movq	-48(%rbp), %rcx
	movq	(%rcx,%rax,8), %rax
	cmpq	-96(%rbp), %rax
	jne	.LBB44_3
# BB#45:                                #   in Loop: Header=BB44_3 Depth=1
	decl	-36(%rbp)
	jmp	.LBB44_3
.LBB44_60:                              #   in Loop: Header=BB44_3 Depth=1
	addq	$2, -96(%rbp)
	jmp	.LBB44_3
.LBB44_62:                              #   in Loop: Header=BB44_3 Depth=1
	movq	-96(%rbp), %rax
	movzbl	1(%rax), %eax
	movq	-72(%rbp), %rcx
	movb	$1, (%rcx,%rax)
	jmp	.LBB44_63
.LBB44_34:                              #   in Loop: Header=BB44_3 Depth=1
	movl	$0, -28(%rbp)
	jmp	.LBB44_35
	.align	16, 0x90
.LBB44_36:                              #   in Loop: Header=BB44_35 Depth=2
	movq	-72(%rbp), %rax
	movslq	-28(%rbp), %rcx
	movb	$1, (%rax,%rcx)
	incl	-28(%rbp)
.LBB44_35:                              #   Parent Loop BB44_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$255, -28(%rbp)
	jle	.LBB44_36
# BB#37:                                #   in Loop: Header=BB44_3 Depth=1
	movq	-24(%rbp), %rax
	testb	$64, 24(%rax)
	je	.LBB44_38
# BB#39:                                #   in Loop: Header=BB44_3 Depth=1
	movq	-24(%rbp), %rax
	testb	$1, 56(%rax)
	je	.LBB44_63
	jmp	.LBB44_65
.LBB44_11:                              #   in Loop: Header=BB44_3 Depth=1
	movq	-96(%rbp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, -96(%rbp)
	movzbl	(%rax), %eax
	leal	-1(,%rax,8), %eax
	movl	%eax, -28(%rbp)
	jmp	.LBB44_12
	.align	16, 0x90
.LBB44_15:                              #   in Loop: Header=BB44_12 Depth=2
	decl	-28(%rbp)
.LBB44_12:                              #   Parent Loop BB44_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$0, -28(%rbp)
	js	.LBB44_63
# BB#13:                                #   in Loop: Header=BB44_12 Depth=2
	movl	-28(%rbp), %eax
	movl	%eax, %ecx
	sarl	$31, %ecx
	shrl	$29, %ecx
	addl	%eax, %ecx
	movl	%ecx, %edx
	andl	$24, %edx
	subl	%edx, %eax
	sarl	$3, %ecx
	movslq	%ecx, %rcx
	movq	-96(%rbp), %rdx
	movzbl	(%rdx,%rcx), %ecx
	btl	%eax, %ecx
	jae	.LBB44_15
# BB#14:                                #   in Loop: Header=BB44_12 Depth=2
	movq	-72(%rbp), %rax
	movslq	-28(%rbp), %rcx
	movb	$1, (%rax,%rcx)
	jmp	.LBB44_15
.LBB44_16:                              #   in Loop: Header=BB44_3 Depth=1
	movq	-96(%rbp), %rax
	movzbl	(%rax), %eax
	shll	$3, %eax
	movl	%eax, -28(%rbp)
	jmp	.LBB44_17
	.align	16, 0x90
.LBB44_18:                              #   in Loop: Header=BB44_17 Depth=2
	movq	-72(%rbp), %rax
	movslq	-28(%rbp), %rcx
	movb	$1, (%rax,%rcx)
	incl	-28(%rbp)
.LBB44_17:                              #   Parent Loop BB44_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$255, -28(%rbp)
	jle	.LBB44_18
# BB#19:                                #   in Loop: Header=BB44_3 Depth=1
	movq	-96(%rbp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, -96(%rbp)
	movzbl	(%rax), %eax
	leal	-1(,%rax,8), %eax
	movl	%eax, -28(%rbp)
	jmp	.LBB44_20
	.align	16, 0x90
.LBB44_23:                              #   in Loop: Header=BB44_20 Depth=2
	decl	-28(%rbp)
.LBB44_20:                              #   Parent Loop BB44_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$0, -28(%rbp)
	js	.LBB44_63
# BB#21:                                #   in Loop: Header=BB44_20 Depth=2
	movl	-28(%rbp), %eax
	movl	%eax, %ecx
	sarl	$31, %ecx
	shrl	$29, %ecx
	addl	%eax, %ecx
	movl	%ecx, %edx
	andl	$24, %edx
	subl	%edx, %eax
	sarl	$3, %ecx
	movslq	%ecx, %rcx
	movq	-96(%rbp), %rdx
	movzbl	(%rdx,%rcx), %ecx
	btl	%eax, %ecx
	jb	.LBB44_23
# BB#22:                                #   in Loop: Header=BB44_20 Depth=2
	movq	-72(%rbp), %rax
	movslq	-28(%rbp), %rcx
	movb	$1, (%rax,%rcx)
	jmp	.LBB44_23
.LBB44_57:                              #   in Loop: Header=BB44_3 Depth=1
	addq	$2, -96(%rbp)
	movq	-96(%rbp), %rax
	movzbl	(%rax), %eax
	movl	%eax, -32(%rbp)
	movq	-96(%rbp), %rcx
	movsbl	1(%rcx), %ecx
	shll	$8, %ecx
	orl	%eax, %ecx
	movl	%ecx, -32(%rbp)
	addq	$2, -96(%rbp)
	cmpl	$0, -32(%rbp)
	jne	.LBB44_3
# BB#58:                                #   in Loop: Header=BB44_3 Depth=1
	addq	$-4, -96(%rbp)
	movb	$1, -106(%rbp)
.LBB44_46:                              #   in Loop: Header=BB44_3 Depth=1
	movq	-96(%rbp), %rax
	movzbl	(%rax), %eax
	movl	%eax, -28(%rbp)
	movq	-96(%rbp), %rcx
	movsbl	1(%rcx), %ecx
	shll	$8, %ecx
	orl	%eax, %ecx
	movl	%ecx, -28(%rbp)
	addq	$2, -96(%rbp)
	movslq	-28(%rbp), %rax
	addq	-96(%rbp), %rax
	cmpq	-104(%rbp), %rax
	jae	.LBB44_54
# BB#47:                                #   in Loop: Header=BB44_3 Depth=1
	movl	-36(%rbp), %eax
	cmpl	-40(%rbp), %eax
	jne	.LBB44_52
# BB#48:                                #   in Loop: Header=BB44_3 Depth=1
	movl	-60(%rbp), %eax
	leal	1(%rax,%rax,2), %eax
	imull	re_max_failures(%rip), %eax
	cmpl	%eax, -40(%rbp)
	ja	.LBB44_53
# BB#49:                                #   in Loop: Header=BB44_3 Depth=1
	movl	-40(%rbp), %eax
	addl	%eax, %eax
	shlq	$3, %rax
	andq	%rbx, %rax
	movq	%rsp, %rdi
	subq	%rax, %rdi
	movq	%rdi, %rsp
	movq	%rdi, -56(%rbp)
	movq	-48(%rbp), %rsi
	movl	-40(%rbp), %edx
	shlq	$3, %rdx
	callq	memcpy
	xorl	%eax, %eax
	movq	-56(%rbp), %rcx
	movq	%rcx, -48(%rbp)
	testq	%rcx, %rcx
	je	.LBB44_51
# BB#50:                                #   in Loop: Header=BB44_3 Depth=1
	shll	-40(%rbp)
	movl	$1, %eax
.LBB44_51:                              #   in Loop: Header=BB44_3 Depth=1
	testl	%eax, %eax
	je	.LBB44_53
.LBB44_52:                              #   in Loop: Header=BB44_3 Depth=1
	movslq	-28(%rbp), %rax
	addq	-96(%rbp), %rax
	movl	-36(%rbp), %ecx
	leal	1(%rcx), %edx
	movl	%edx, -36(%rbp)
	movq	-48(%rbp), %rdx
	movq	%rax, (%rdx,%rcx,8)
	jmp	.LBB44_55
.LBB44_54:                              #   in Loop: Header=BB44_3 Depth=1
	movq	-24(%rbp), %rax
	orl	$1, 56(%rax)
.LBB44_55:                              #   in Loop: Header=BB44_3 Depth=1
	cmpb	$0, -106(%rbp)
	je	.LBB44_3
# BB#56:                                #   in Loop: Header=BB44_3 Depth=1
	movq	-96(%rbp), %rax
	movzbl	(%rax), %eax
	movl	%eax, -32(%rbp)
	movq	-96(%rbp), %rcx
	movsbl	1(%rcx), %ecx
	shll	$8, %ecx
	orl	%eax, %ecx
	movl	%ecx, -32(%rbp)
	addq	$2, -96(%rbp)
	movb	$0, -106(%rbp)
	jmp	.LBB44_3
.LBB44_59:                              #   in Loop: Header=BB44_3 Depth=1
	addq	$4, -96(%rbp)
	jmp	.LBB44_3
.LBB44_24:                              #   in Loop: Header=BB44_3 Depth=1
	movl	$0, -28(%rbp)
	jmp	.LBB44_25
	.align	16, 0x90
.LBB44_28:                              #   in Loop: Header=BB44_25 Depth=2
	incl	-28(%rbp)
.LBB44_25:                              #   Parent Loop BB44_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$255, -28(%rbp)
	jg	.LBB44_63
# BB#26:                                #   in Loop: Header=BB44_25 Depth=2
	movslq	-28(%rbp), %rax
	movsbl	re_syntax_table(%rax), %eax
	cmpl	$1, %eax
	jne	.LBB44_28
# BB#27:                                #   in Loop: Header=BB44_25 Depth=2
	movq	-72(%rbp), %rax
	movslq	-28(%rbp), %rcx
	movb	$1, (%rax,%rcx)
	jmp	.LBB44_28
.LBB44_29:                              #   in Loop: Header=BB44_3 Depth=1
	movl	$0, -28(%rbp)
	jmp	.LBB44_30
	.align	16, 0x90
.LBB44_33:                              #   in Loop: Header=BB44_30 Depth=2
	incl	-28(%rbp)
.LBB44_30:                              #   Parent Loop BB44_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$255, -28(%rbp)
	jg	.LBB44_63
# BB#31:                                #   in Loop: Header=BB44_30 Depth=2
	movslq	-28(%rbp), %rax
	movsbl	re_syntax_table(%rax), %eax
	cmpl	$1, %eax
	je	.LBB44_33
# BB#32:                                #   in Loop: Header=BB44_30 Depth=2
	movq	-72(%rbp), %rax
	movslq	-28(%rbp), %rcx
	movb	$1, (%rax,%rcx)
	jmp	.LBB44_33
.LBB44_38:                              #   in Loop: Header=BB44_3 Depth=1
	movq	-72(%rbp), %rax
	movb	$0, 10(%rax)
	jmp	.LBB44_63
.LBB44_61:
	callq	abort
.LBB44_64:
	movq	-24(%rbp), %rax
	movl	56(%rax), %ecx
	movzbl	-105(%rbp), %edx
	orl	%ecx, %edx
	andl	$1, %edx
	andl	$-2, %ecx
	orl	%edx, %ecx
	movl	%ecx, 56(%rax)
	jmp	.LBB44_65
.LBB44_10:
	movq	-24(%rbp), %rax
	orl	$1, 56(%rax)
.LBB44_65:
	movl	$0, -12(%rbp)
	.align	16, 0x90
.LBB44_66:
	movl	-12(%rbp), %eax
	leaq	-8(%rbp), %rsp
	popq	%rbx
	popq	%rbp
	ret
.LBB44_53:
	movl	$-2, -12(%rbp)
	jmp	.LBB44_66
.Ltmp148:
	.size	re_compile_fastmap, .Ltmp148-re_compile_fastmap
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.align	8
.LJTI44_0:
	.quad	.LBB44_3
	.quad	.LBB44_62
	.quad	.LBB44_34
	.quad	.LBB44_11
	.quad	.LBB44_16
	.quad	.LBB44_60
	.quad	.LBB44_60
	.quad	.LBB44_10
	.quad	.LBB44_3
	.quad	.LBB44_3
	.quad	.LBB44_3
	.quad	.LBB44_3
	.quad	.LBB44_40
	.quad	.LBB44_40
	.quad	.LBB44_46
	.quad	.LBB44_46
	.quad	.LBB44_40
	.quad	.LBB44_40
	.quad	.LBB44_40
	.quad	.LBB44_3
	.quad	.LBB44_57
	.quad	.LBB44_40
	.quad	.LBB44_59
	.quad	.LBB44_24
	.quad	.LBB44_29
	.quad	.LBB44_3
	.quad	.LBB44_3
	.quad	.LBB44_3
	.quad	.LBB44_3

	.text
	.globl	re_set_registers
	.align	16, 0x90
	.type	re_set_registers,@function
re_set_registers:                       # @re_set_registers
	.cfi_startproc
# BB#0:
	movq	%rdi, -8(%rsp)
	movq	%rsi, -16(%rsp)
	movl	%edx, -20(%rsp)
	movq	%rcx, -32(%rsp)
	movq	%r8, -40(%rsp)
	cmpl	$0, -20(%rsp)
	je	.LBB45_2
# BB#1:
	movq	-8(%rsp), %rax
	movl	56(%rax), %ecx
	andl	$-7, %ecx
	orl	$2, %ecx
	movl	%ecx, 56(%rax)
	movq	-16(%rsp), %rax
	movl	-20(%rsp), %ecx
	movl	%ecx, (%rax)
	movq	-16(%rsp), %rax
	movq	-32(%rsp), %rcx
	movq	%rcx, 8(%rax)
	movq	-16(%rsp), %rax
	movq	-40(%rsp), %rcx
	movq	%rcx, 16(%rax)
	ret
.LBB45_2:
	movq	-8(%rsp), %rax
	andl	$-7, 56(%rax)
	movq	-16(%rsp), %rax
	movl	$0, (%rax)
	movq	-16(%rsp), %rax
	movq	$0, 16(%rax)
	movq	-16(%rsp), %rax
	movq	$0, 8(%rax)
	ret
.Ltmp149:
	.size	re_set_registers, .Ltmp149-re_set_registers
	.cfi_endproc

	.globl	re_search_2
	.align	16, 0x90
	.type	re_search_2,@function
re_search_2:                            # @re_search_2
	.cfi_startproc
# BB#0:
	subq	$136, %rsp
.Ltmp151:
	.cfi_def_cfa_offset 144
	movq	%rdi, 120(%rsp)
	movq	%rsi, 112(%rsp)
	movl	%edx, 108(%rsp)
	movq	%rcx, 96(%rsp)
	movl	%r8d, 92(%rsp)
	movl	%r9d, 88(%rsp)
	movl	160(%rsp), %eax
	movq	152(%rsp), %rcx
	movl	144(%rsp), %edx
	movl	%edx, 84(%rsp)
	movq	%rcx, 72(%rsp)
	movl	%eax, 68(%rsp)
	movq	120(%rsp), %rax
	movq	32(%rax), %rax
	movq	%rax, 56(%rsp)
	movq	120(%rsp), %rax
	movq	40(%rax), %rax
	movq	%rax, 48(%rsp)
	movl	108(%rsp), %eax
	addl	92(%rsp), %eax
	movl	%eax, 44(%rsp)
	movl	88(%rsp), %eax
	addl	84(%rsp), %eax
	movl	%eax, 40(%rsp)
	cmpl	$0, 88(%rsp)
	js	.LBB46_56
# BB#1:
	movl	88(%rsp), %eax
	cmpl	44(%rsp), %eax
	jg	.LBB46_56
# BB#2:
	cmpl	$-2, 40(%rsp)
	jg	.LBB46_4
# BB#3:
	movl	88(%rsp), %eax
	notl	%eax
	jmp	.LBB46_6
.LBB46_4:
	movl	40(%rsp), %eax
	cmpl	44(%rsp), %eax
	jle	.LBB46_7
# BB#5:
	movl	44(%rsp), %eax
	subl	88(%rsp), %eax
.LBB46_6:
	movl	%eax, 84(%rsp)
.LBB46_7:
	movq	120(%rsp), %rax
	cmpq	$0, 16(%rax)
	je	.LBB46_12
# BB#8:
	movq	120(%rsp), %rax
	movq	(%rax), %rax
	movzbl	(%rax), %eax
	cmpl	$10, %eax
	jne	.LBB46_12
# BB#9:
	cmpl	$0, 84(%rsp)
	jle	.LBB46_12
# BB#10:
	cmpl	$0, 88(%rsp)
	jg	.LBB46_56
# BB#11:
	movl	$1, 84(%rsp)
.LBB46_12:
	cmpq	$0, 56(%rsp)
	je	.LBB46_17
# BB#13:
	movq	120(%rsp), %rax
	btl	$3, 56(%rax)
	jb	.LBB46_17
# BB#14:
	movq	120(%rsp), %rdi
	xorb	%al, %al
	callq	re_compile_fastmap
	cmpl	$-2, %eax
	jne	.LBB46_17
# BB#15:
	movl	$-2, 132(%rsp)
	jmp	.LBB46_57
	.align	16, 0x90
.LBB46_16:                              #   in Loop: Header=BB46_17 Depth=1
	incl	84(%rsp)
	decl	88(%rsp)
	.align	16, 0x90
.LBB46_17:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB46_28 Depth 2
                                        #     Child Loop BB46_32 Depth 2
	cmpq	$0, 56(%rsp)
	je	.LBB46_45
# BB#18:                                #   in Loop: Header=BB46_17 Depth=1
	movl	88(%rsp), %eax
	cmpl	44(%rsp), %eax
	jge	.LBB46_45
# BB#19:                                #   in Loop: Header=BB46_17 Depth=1
	movq	120(%rsp), %rax
	testb	$1, 56(%rax)
	jne	.LBB46_45
# BB#20:                                #   in Loop: Header=BB46_17 Depth=1
	cmpl	$0, 84(%rsp)
	jle	.LBB46_37
# BB#21:                                #   in Loop: Header=BB46_17 Depth=1
	movl	$0, 28(%rsp)
	movl	84(%rsp), %eax
	movl	%eax, 24(%rsp)
	movl	88(%rsp), %eax
	cmpl	108(%rsp), %eax
	jge	.LBB46_24
# BB#22:                                #   in Loop: Header=BB46_17 Depth=1
	movl	88(%rsp), %eax
	addl	84(%rsp), %eax
	cmpl	108(%rsp), %eax
	jl	.LBB46_24
# BB#23:                                #   in Loop: Header=BB46_17 Depth=1
	movl	108(%rsp), %eax
	subl	88(%rsp), %eax
	movl	84(%rsp), %ecx
	subl	%eax, %ecx
	movl	%ecx, 28(%rsp)
.LBB46_24:                              #   in Loop: Header=BB46_17 Depth=1
	movl	88(%rsp), %eax
	cmpl	108(%rsp), %eax
	jl	.LBB46_26
# BB#25:                                #   in Loop: Header=BB46_17 Depth=1
	movslq	108(%rsp), %rcx
	movq	96(%rsp), %rax
	subq	%rcx, %rax
	jmp	.LBB46_27
.LBB46_37:                              #   in Loop: Header=BB46_17 Depth=1
	cmpl	$0, 108(%rsp)
	je	.LBB46_39
# BB#38:                                #   in Loop: Header=BB46_17 Depth=1
	movl	88(%rsp), %eax
	cmpl	108(%rsp), %eax
	jl	.LBB46_40
.LBB46_39:                              #   in Loop: Header=BB46_17 Depth=1
	movl	88(%rsp), %eax
	subl	108(%rsp), %eax
	movslq	%eax, %rax
	movq	96(%rsp), %rcx
	jmp	.LBB46_41
.LBB46_26:                              #   in Loop: Header=BB46_17 Depth=1
	movq	112(%rsp), %rax
.LBB46_27:                              #   in Loop: Header=BB46_17 Depth=1
	movslq	88(%rsp), %rcx
	addq	%rax, %rcx
	movq	%rcx, 32(%rsp)
	cmpq	$0, 48(%rsp)
	je	.LBB46_32
	jmp	.LBB46_28
	.align	16, 0x90
.LBB46_31:                              #   in Loop: Header=BB46_28 Depth=2
	decl	84(%rsp)
.LBB46_28:                              #   Parent Loop BB46_17 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	xorb	%al, %al
	movl	84(%rsp), %ecx
	cmpl	28(%rsp), %ecx
	jle	.LBB46_30
# BB#29:                                #   in Loop: Header=BB46_28 Depth=2
	movq	32(%rsp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, 32(%rsp)
	movzbl	(%rax), %eax
	movq	48(%rsp), %rcx
	movzbl	(%rcx,%rax), %eax
	movq	56(%rsp), %rcx
	cmpb	$0, (%rcx,%rax)
	sete	%al
.LBB46_30:                              #   in Loop: Header=BB46_28 Depth=2
	cmpb	$1, %al
	jne	.LBB46_36
	jmp	.LBB46_31
	.align	16, 0x90
.LBB46_35:                              #   in Loop: Header=BB46_32 Depth=2
	decl	84(%rsp)
.LBB46_32:                              #   Parent Loop BB46_17 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	xorb	%al, %al
	movl	84(%rsp), %ecx
	cmpl	28(%rsp), %ecx
	jle	.LBB46_34
# BB#33:                                #   in Loop: Header=BB46_32 Depth=2
	movq	32(%rsp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, 32(%rsp)
	movzbl	(%rax), %eax
	movq	56(%rsp), %rcx
	cmpb	$0, (%rcx,%rax)
	sete	%al
.LBB46_34:                              #   in Loop: Header=BB46_32 Depth=2
	cmpb	$1, %al
	je	.LBB46_35
.LBB46_36:                              #   in Loop: Header=BB46_17 Depth=1
	movl	24(%rsp), %eax
	subl	84(%rsp), %eax
	addl	%eax, 88(%rsp)
	jmp	.LBB46_45
.LBB46_40:                              #   in Loop: Header=BB46_17 Depth=1
	movslq	88(%rsp), %rax
	movq	112(%rsp), %rcx
.LBB46_41:                              #   in Loop: Header=BB46_17 Depth=1
	movsbl	(%rcx,%rax), %eax
	movb	%al, 23(%rsp)
	cmpq	$0, 48(%rsp)
	je	.LBB46_43
# BB#42:                                #   in Loop: Header=BB46_17 Depth=1
	movzbl	23(%rsp), %eax
	movq	48(%rsp), %rcx
	movsbl	(%rcx,%rax), %eax
	jmp	.LBB46_44
.LBB46_43:                              #   in Loop: Header=BB46_17 Depth=1
	movsbl	23(%rsp), %eax
.LBB46_44:                              #   in Loop: Header=BB46_17 Depth=1
	movzbl	%al, %eax
	movq	56(%rsp), %rcx
	cmpb	$0, (%rcx,%rax)
	je	.LBB46_53
.LBB46_45:                              #   in Loop: Header=BB46_17 Depth=1
	cmpl	$0, 84(%rsp)
	js	.LBB46_49
# BB#46:                                #   in Loop: Header=BB46_17 Depth=1
	movl	88(%rsp), %eax
	cmpl	44(%rsp), %eax
	jne	.LBB46_49
# BB#47:                                #   in Loop: Header=BB46_17 Depth=1
	cmpq	$0, 56(%rsp)
	je	.LBB46_49
# BB#48:                                #   in Loop: Header=BB46_17 Depth=1
	movq	120(%rsp), %rax
	testb	$1, 56(%rax)
	je	.LBB46_56
.LBB46_49:                              #   in Loop: Header=BB46_17 Depth=1
	movl	88(%rsp), %r9d
	movl	92(%rsp), %r8d
	movq	96(%rsp), %rcx
	movl	108(%rsp), %edx
	movq	112(%rsp), %rsi
	movq	120(%rsp), %rdi
	movq	72(%rsp), %r10
	movl	68(%rsp), %eax
	movl	%eax, 8(%rsp)
	movq	%r10, (%rsp)
	callq	re_match_2
	movl	%eax, 64(%rsp)
	testl	%eax, %eax
	jns	.LBB46_50
# BB#51:                                #   in Loop: Header=BB46_17 Depth=1
	cmpl	$-2, 64(%rsp)
	je	.LBB46_52
.LBB46_53:                              #   in Loop: Header=BB46_17 Depth=1
	cmpl	$0, 84(%rsp)
	je	.LBB46_56
# BB#54:                                #   in Loop: Header=BB46_17 Depth=1
	cmpl	$0, 84(%rsp)
	jle	.LBB46_16
# BB#55:                                #   in Loop: Header=BB46_17 Depth=1
	decl	84(%rsp)
	incl	88(%rsp)
	jmp	.LBB46_17
.LBB46_56:
	movl	$-1, 132(%rsp)
	.align	16, 0x90
.LBB46_57:
	movl	132(%rsp), %eax
	addq	$136, %rsp
	ret
.LBB46_50:
	movl	88(%rsp), %eax
	movl	%eax, 132(%rsp)
	jmp	.LBB46_57
.LBB46_52:
	movl	$-2, 132(%rsp)
	jmp	.LBB46_57
.Ltmp152:
	.size	re_search_2, .Ltmp152-re_search_2
	.cfi_endproc

	.globl	re_match_2
	.align	16, 0x90
	.type	re_match_2,@function
re_match_2:                             # @re_match_2
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp156:
	.cfi_def_cfa_offset 16
.Ltmp157:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp158:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$488, %rsp              # imm = 0x1E8
.Ltmp159:
	.cfi_offset %rbx, -24
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movq	%rcx, -48(%rbp)
	movl	%r8d, -52(%rbp)
	movl	%r9d, -56(%rbp)
	movl	24(%rbp), %eax
	movq	16(%rbp), %rcx
	movq	%rcx, -64(%rbp)
	movl	%eax, -68(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -136(%rbp)
	movq	-24(%rbp), %rcx
	addq	16(%rcx), %rax
	movq	%rax, -144(%rbp)
	movq	-24(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, -152(%rbp)
	movq	-24(%rbp), %rax
	movl	48(%rax), %eax
	incl	%eax
	movl	%eax, -172(%rbp)
	movl	$257, -176(%rbp)        # imm = 0x101
	movl	$256, -180(%rbp)        # imm = 0x100
	movl	$0, -228(%rbp)
	movq	$0, -256(%rbp)
	leaq	-48(%rsp), %rax
	movq	%rax, %rsp
	movq	%rax, -168(%rbp)
	testq	%rax, %rax
	je	.LBB47_1
# BB#2:
	movl	$5, -160(%rbp)
	movl	$0, -156(%rbp)
	movq	-24(%rbp), %rax
	cmpq	$0, 48(%rax)
	je	.LBB47_13
# BB#3:
	movl	-172(%rbp), %eax
	leaq	15(,%rax,8), %rax
	andq	$-16, %rax
	movq	%rsp, %rcx
	subq	%rax, %rcx
	movq	%rcx, %rsp
	movq	%rcx, -192(%rbp)
	movl	-172(%rbp), %eax
	leaq	15(,%rax,8), %rax
	andq	$-16, %rax
	subq	%rax, %rcx
	movq	%rcx, %rsp
	movq	%rcx, -200(%rbp)
	movl	-172(%rbp), %eax
	leaq	15(,%rax,8), %rax
	andq	$-16, %rax
	subq	%rax, %rcx
	movq	%rcx, %rsp
	movq	%rcx, -208(%rbp)
	movl	-172(%rbp), %eax
	leaq	15(,%rax,8), %rax
	andq	$-16, %rax
	subq	%rax, %rcx
	movq	%rcx, %rsp
	movq	%rcx, -216(%rbp)
	movl	-172(%rbp), %eax
	leaq	15(,%rax,8), %rax
	andq	$-16, %rax
	subq	%rax, %rcx
	movq	%rcx, %rsp
	movq	%rcx, -240(%rbp)
	movl	-172(%rbp), %eax
	leaq	15(,%rax,8), %rax
	andq	$-16, %rax
	subq	%rax, %rcx
	movq	%rcx, %rsp
	movq	%rcx, -248(%rbp)
	movl	-172(%rbp), %eax
	leaq	15(,%rax,8), %rax
	andq	$-16, %rax
	subq	%rax, %rcx
	movq	%rcx, %rsp
	movq	%rcx, -224(%rbp)
	movl	-172(%rbp), %eax
	leaq	15(,%rax,8), %rax
	andq	$-16, %rax
	subq	%rax, %rcx
	movq	%rcx, %rsp
	movq	%rcx, -264(%rbp)
	movl	-172(%rbp), %eax
	leaq	15(,%rax,8), %rax
	andq	$-16, %rax
	subq	%rax, %rcx
	movq	%rcx, %rsp
	movq	%rcx, -272(%rbp)
	cmpq	$0, -192(%rbp)
	je	.LBB47_12
# BB#4:
	cmpq	$0, -200(%rbp)
	je	.LBB47_12
# BB#5:
	cmpq	$0, -208(%rbp)
	je	.LBB47_12
# BB#6:
	cmpq	$0, -216(%rbp)
	je	.LBB47_12
# BB#7:
	cmpq	$0, -224(%rbp)
	je	.LBB47_12
# BB#8:
	cmpq	$0, -240(%rbp)
	je	.LBB47_12
# BB#9:
	cmpq	$0, -248(%rbp)
	je	.LBB47_12
# BB#10:
	cmpq	$0, -264(%rbp)
	je	.LBB47_12
# BB#11:
	cmpq	$0, -272(%rbp)
	je	.LBB47_12
.LBB47_13:
	cmpl	$0, -56(%rbp)
	js	.LBB47_458
# BB#14:
	movl	-36(%rbp), %eax
	addl	-52(%rbp), %eax
	cmpl	%eax, -56(%rbp)
	jg	.LBB47_458
# BB#15:
	movl	$1, -72(%rbp)
	jmp	.LBB47_16
	.align	16, 0x90
.LBB47_17:                              #   in Loop: Header=BB47_16 Depth=1
	movq	-216(%rbp), %rax
	movslq	-72(%rbp), %rcx
	movq	$-1, (%rax,%rcx,8)
	movq	-208(%rbp), %rax
	movslq	-72(%rbp), %rcx
	movq	$-1, (%rax,%rcx,8)
	movq	-200(%rbp), %rax
	movslq	-72(%rbp), %rcx
	movq	$-1, (%rax,%rcx,8)
	movq	-192(%rbp), %rax
	movslq	-72(%rbp), %rcx
	movq	$-1, (%rax,%rcx,8)
	movq	-224(%rbp), %rax
	movslq	-72(%rbp), %rcx
	orl	$3, (%rax,%rcx,8)
	movq	-224(%rbp), %rax
	movslq	-72(%rbp), %rcx
	andl	$-5, (%rax,%rcx,8)
	movq	-224(%rbp), %rax
	movslq	-72(%rbp), %rcx
	andl	$-9, (%rax,%rcx,8)
	movq	-224(%rbp), %rax
	movslq	-72(%rbp), %rcx
	andl	$-17, (%rax,%rcx,8)
	incl	-72(%rbp)
.LBB47_16:                              # =>This Inner Loop Header: Depth=1
	movl	-72(%rbp), %eax
	cmpl	-172(%rbp), %eax
	jb	.LBB47_17
# BB#18:
	cmpl	$0, -52(%rbp)
	jne	.LBB47_21
# BB#19:
	cmpq	$0, -32(%rbp)
	je	.LBB47_21
# BB#20:
	movq	-32(%rbp), %rax
	movq	%rax, -48(%rbp)
	movl	-36(%rbp), %eax
	movl	%eax, -52(%rbp)
	movq	$0, -32(%rbp)
	movl	$0, -36(%rbp)
.LBB47_21:
	movslq	-36(%rbp), %rax
	addq	-32(%rbp), %rax
	movq	%rax, -88(%rbp)
	movslq	-52(%rbp), %rax
	addq	-48(%rbp), %rax
	movq	%rax, -96(%rbp)
	movl	-68(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jg	.LBB47_23
# BB#22:
	movslq	-68(%rbp), %rax
	addq	-32(%rbp), %rax
	movq	%rax, -104(%rbp)
	movq	-48(%rbp), %rax
	jmp	.LBB47_24
.LBB47_12:
	movl	$-2, -12(%rbp)
	jmp	.LBB47_459
.LBB47_1:
	movl	$-2, -12(%rbp)
	jmp	.LBB47_459
.LBB47_23:
	movq	-88(%rbp), %rax
	movq	%rax, -104(%rbp)
	movslq	-68(%rbp), %rax
	addq	-48(%rbp), %rax
	movslq	-36(%rbp), %rcx
	subq	%rcx, %rax
.LBB47_24:
	movq	%rax, -112(%rbp)
	cmpl	$0, -36(%rbp)
	jle	.LBB47_27
# BB#25:
	movl	-56(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jg	.LBB47_27
# BB#26:
	movslq	-56(%rbp), %rax
	addq	-32(%rbp), %rax
	movq	%rax, -120(%rbp)
	movq	-104(%rbp), %rax
	jmp	.LBB47_28
.LBB47_27:
	movslq	-56(%rbp), %rax
	addq	-48(%rbp), %rax
	movslq	-36(%rbp), %rcx
	subq	%rcx, %rax
	movq	%rax, -120(%rbp)
	movq	-112(%rbp), %rax
	jmp	.LBB47_28
	.align	16, 0x90
.LBB47_456:                             #   in Loop: Header=BB47_28 Depth=1
	movq	-104(%rbp), %rax
.LBB47_28:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB47_29 Depth 2
                                        #       Child Loop BB47_438 Depth 3
                                        #         Child Loop BB47_442 Depth 4
                                        #       Child Loop BB47_274 Depth 3
                                        #       Child Loop BB47_300 Depth 3
                                        #       Child Loop BB47_309 Depth 3
                                        #       Child Loop BB47_302 Depth 3
                                        #       Child Loop BB47_251 Depth 3
                                        #       Child Loop BB47_244 Depth 3
                                        #       Child Loop BB47_319 Depth 3
                                        #       Child Loop BB47_312 Depth 3
                                        #       Child Loop BB47_208 Depth 3
                                        #         Child Loop BB47_213 Depth 4
                                        #       Child Loop BB47_41 Depth 3
                                        #       Child Loop BB47_99 Depth 3
                                        #       Child Loop BB47_104 Depth 3
                                        #       Child Loop BB47_112 Depth 3
                                        #       Child Loop BB47_130 Depth 3
                                        #       Child Loop BB47_193 Depth 3
                                        #       Child Loop BB47_186 Depth 3
                                        #       Child Loop BB47_181 Depth 3
                                        #       Child Loop BB47_160 Depth 3
                                        #       Child Loop BB47_408 Depth 3
                                        #       Child Loop BB47_422 Depth 3
                                        #       Child Loop BB47_110 Depth 3
                                        #       Child Loop BB47_126 Depth 3
                                        #       Child Loop BB47_141 Depth 3
                                        #       Child Loop BB47_270 Depth 3
                                        #       Child Loop BB47_263 Depth 3
                                        #       Child Loop BB47_255 Depth 3
                                        #       Child Loop BB47_419 Depth 3
                                        #       Child Loop BB47_433 Depth 3
	movq	%rax, -128(%rbp)
	jmp	.LBB47_29
	.align	16, 0x90
.LBB47_296:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-136(%rbp), %rax
	movzbl	(%rax), %eax
	movl	%eax, -72(%rbp)
	movq	-136(%rbp), %rcx
	movsbl	1(%rcx), %ecx
	shll	$8, %ecx
	orl	%eax, %ecx
	movl	%ecx, -72(%rbp)
	addq	$2, -136(%rbp)
	movslq	-72(%rbp), %rax
	addq	%rax, -136(%rbp)
	.align	16, 0x90
.LBB47_29:                              #   Parent Loop BB47_28 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB47_438 Depth 3
                                        #         Child Loop BB47_442 Depth 4
                                        #       Child Loop BB47_274 Depth 3
                                        #       Child Loop BB47_300 Depth 3
                                        #       Child Loop BB47_309 Depth 3
                                        #       Child Loop BB47_302 Depth 3
                                        #       Child Loop BB47_251 Depth 3
                                        #       Child Loop BB47_244 Depth 3
                                        #       Child Loop BB47_319 Depth 3
                                        #       Child Loop BB47_312 Depth 3
                                        #       Child Loop BB47_208 Depth 3
                                        #         Child Loop BB47_213 Depth 4
                                        #       Child Loop BB47_41 Depth 3
                                        #       Child Loop BB47_99 Depth 3
                                        #       Child Loop BB47_104 Depth 3
                                        #       Child Loop BB47_112 Depth 3
                                        #       Child Loop BB47_130 Depth 3
                                        #       Child Loop BB47_193 Depth 3
                                        #       Child Loop BB47_186 Depth 3
                                        #       Child Loop BB47_181 Depth 3
                                        #       Child Loop BB47_160 Depth 3
                                        #       Child Loop BB47_408 Depth 3
                                        #       Child Loop BB47_422 Depth 3
                                        #       Child Loop BB47_110 Depth 3
                                        #       Child Loop BB47_126 Depth 3
                                        #       Child Loop BB47_141 Depth 3
                                        #       Child Loop BB47_270 Depth 3
                                        #       Child Loop BB47_263 Depth 3
                                        #       Child Loop BB47_255 Depth 3
                                        #       Child Loop BB47_419 Depth 3
                                        #       Child Loop BB47_433 Depth 3
	movq	-136(%rbp), %rax
	cmpq	-144(%rbp), %rax
	jne	.LBB47_96
# BB#30:                                #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rax
	cmpq	-112(%rbp), %rax
	je	.LBB47_51
# BB#31:                                #   in Loop: Header=BB47_29 Depth=2
	cmpl	$0, -156(%rbp)
	je	.LBB47_43
# BB#32:                                #   in Loop: Header=BB47_29 Depth=2
	xorb	%al, %al
	cmpl	$0, -36(%rbp)
	je	.LBB47_35
# BB#33:                                #   in Loop: Header=BB47_29 Depth=2
	xorb	%al, %al
	movq	-32(%rbp), %rcx
	cmpq	-256(%rbp), %rcx
	ja	.LBB47_35
# BB#34:                                #   in Loop: Header=BB47_29 Depth=2
	movslq	-36(%rbp), %rax
	addq	-32(%rbp), %rax
	cmpq	%rax, -256(%rbp)
	setbe	%al
.LBB47_35:                              #   in Loop: Header=BB47_29 Depth=2
	movzbl	%al, %eax
	movq	-128(%rbp), %rcx
	cmpq	-104(%rbp), %rcx
	sete	%cl
	movzbl	%cl, %ecx
	cmpl	%ecx, %eax
	sete	-273(%rbp)
	cmpl	$0, -228(%rbp)
	je	.LBB47_40
# BB#36:                                #   in Loop: Header=BB47_29 Depth=2
	movsbl	-273(%rbp), %eax
	testl	%eax, %eax
	je	.LBB47_38
# BB#37:                                #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rax
	cmpq	-256(%rbp), %rax
	ja	.LBB47_40
.LBB47_38:                              #   in Loop: Header=BB47_29 Depth=2
	cmpb	$0, -273(%rbp)
	jne	.LBB47_438
# BB#39:                                #   in Loop: Header=BB47_29 Depth=2
	movq	-128(%rbp), %rax
	cmpq	-104(%rbp), %rax
	je	.LBB47_438
.LBB47_40:                              #   in Loop: Header=BB47_29 Depth=2
	movl	$1, -228(%rbp)
	movq	-120(%rbp), %rax
	movq	%rax, -256(%rbp)
	movl	$1, -72(%rbp)
	jmp	.LBB47_41
	.align	16, 0x90
.LBB47_42:                              #   in Loop: Header=BB47_41 Depth=3
	movslq	-72(%rbp), %rax
	movq	-192(%rbp), %rcx
	movq	(%rcx,%rax,8), %rcx
	movq	-240(%rbp), %rdx
	movq	%rcx, (%rdx,%rax,8)
	movslq	-72(%rbp), %rax
	movq	-200(%rbp), %rcx
	movq	(%rcx,%rax,8), %rcx
	movq	-248(%rbp), %rdx
	movq	%rcx, (%rdx,%rax,8)
	incl	-72(%rbp)
.LBB47_41:                              #   Parent Loop BB47_28 Depth=1
                                        #     Parent Loop BB47_29 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-72(%rbp), %eax
	cmpl	-172(%rbp), %eax
	jae	.LBB47_438
	jmp	.LBB47_42
.LBB47_96:                              #   in Loop: Header=BB47_29 Depth=2
	movq	-136(%rbp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, -136(%rbp)
	movzbl	(%rax), %eax
	cmpq	$28, %rax
	ja	.LBB47_436
# BB#97:                                #   in Loop: Header=BB47_29 Depth=2
	jmpq	*.LJTI47_0(,%rax,8)
.LBB47_129:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-136(%rbp), %rax
	cmpb	$4, -1(%rax)
	sete	-286(%rbp)
	jmp	.LBB47_130
	.align	16, 0x90
.LBB47_132:                             #   in Loop: Header=BB47_130 Depth=3
	movq	-48(%rbp), %rax
	movq	%rax, -120(%rbp)
	movq	-112(%rbp), %rax
	movq	%rax, -128(%rbp)
.LBB47_130:                             #   Parent Loop BB47_28 Depth=1
                                        #     Parent Loop BB47_29 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	-120(%rbp), %rax
	cmpq	-128(%rbp), %rax
	jne	.LBB47_133
# BB#131:                               #   in Loop: Header=BB47_130 Depth=3
	movq	-128(%rbp), %rax
	cmpq	-112(%rbp), %rax
	je	.LBB47_438
	jmp	.LBB47_132
	.align	16, 0x90
.LBB47_114:                             #   in Loop: Header=BB47_112 Depth=3
	movq	-48(%rbp), %rax
	movq	%rax, -120(%rbp)
	movq	-112(%rbp), %rax
	movq	%rax, -128(%rbp)
.LBB47_112:                             #   Parent Loop BB47_28 Depth=1
                                        #     Parent Loop BB47_29 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	-120(%rbp), %rax
	cmpq	-128(%rbp), %rax
	jne	.LBB47_115
# BB#113:                               #   in Loop: Header=BB47_112 Depth=3
	movq	-128(%rbp), %rax
	cmpq	-112(%rbp), %rax
	je	.LBB47_438
	jmp	.LBB47_114
	.align	16, 0x90
.LBB47_410:                             #   in Loop: Header=BB47_408 Depth=3
	movq	-48(%rbp), %rax
	movq	%rax, -120(%rbp)
	movq	-112(%rbp), %rax
	movq	%rax, -128(%rbp)
.LBB47_408:                             #   Parent Loop BB47_28 Depth=1
                                        #     Parent Loop BB47_29 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	-120(%rbp), %rax
	cmpq	-128(%rbp), %rax
	jne	.LBB47_411
# BB#409:                               #   in Loop: Header=BB47_408 Depth=3
	movq	-128(%rbp), %rax
	cmpq	-112(%rbp), %rax
	je	.LBB47_438
	jmp	.LBB47_410
	.align	16, 0x90
.LBB47_424:                             #   in Loop: Header=BB47_422 Depth=3
	movq	-48(%rbp), %rax
	movq	%rax, -120(%rbp)
	movq	-112(%rbp), %rax
	movq	%rax, -128(%rbp)
.LBB47_422:                             #   Parent Loop BB47_28 Depth=1
                                        #     Parent Loop BB47_29 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	-120(%rbp), %rax
	cmpq	-128(%rbp), %rax
	jne	.LBB47_425
# BB#423:                               #   in Loop: Header=BB47_422 Depth=3
	movq	-128(%rbp), %rax
	cmpq	-112(%rbp), %rax
	je	.LBB47_438
	jmp	.LBB47_424
	.align	16, 0x90
.LBB47_302:                             #   Parent Loop BB47_28 Depth=1
                                        #     Parent Loop BB47_29 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-160(%rbp), %eax
	subl	-156(%rbp), %eax
	movl	-180(%rbp), %ecx
	subl	-176(%rbp), %ecx
	leal	7(%rcx,%rcx,2), %ecx
	cmpl	%ecx, %eax
	jae	.LBB47_308
# BB#303:                               #   in Loop: Header=BB47_302 Depth=3
	movl	-172(%rbp), %eax
	leal	1(%rax,%rax,2), %eax
	imull	re_max_failures(%rip), %eax
	cmpl	%eax, -160(%rbp)
	ja	.LBB47_307
# BB#304:                               #   in Loop: Header=BB47_302 Depth=3
	movl	-160(%rbp), %eax
	addl	%eax, %eax
	shlq	$3, %rax
	movabsq	$34359738352, %rcx      # imm = 0x7FFFFFFF0
	andq	%rax, %rcx
	movq	%rsp, %rdi
	subq	%rcx, %rdi
	movq	%rdi, %rsp
	movq	%rdi, -440(%rbp)
	movq	-168(%rbp), %rsi
	movl	-160(%rbp), %edx
	shlq	$3, %rdx
	callq	memcpy
	xorl	%eax, %eax
	movq	-440(%rbp), %rcx
	movq	%rcx, -168(%rbp)
	testq	%rcx, %rcx
	je	.LBB47_306
# BB#305:                               #   in Loop: Header=BB47_302 Depth=3
	shll	-160(%rbp)
	movl	$1, %eax
.LBB47_306:                             #   in Loop: Header=BB47_302 Depth=3
	testl	%eax, %eax
	jne	.LBB47_302
	jmp	.LBB47_307
	.align	16, 0x90
.LBB47_312:                             #   Parent Loop BB47_28 Depth=1
                                        #     Parent Loop BB47_29 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-160(%rbp), %eax
	subl	-156(%rbp), %eax
	movl	-180(%rbp), %ecx
	subl	-176(%rbp), %ecx
	leal	7(%rcx,%rcx,2), %ecx
	cmpl	%ecx, %eax
	jae	.LBB47_318
# BB#313:                               #   in Loop: Header=BB47_312 Depth=3
	movl	-172(%rbp), %eax
	leal	1(%rax,%rax,2), %eax
	imull	re_max_failures(%rip), %eax
	cmpl	%eax, -160(%rbp)
	ja	.LBB47_317
# BB#314:                               #   in Loop: Header=BB47_312 Depth=3
	movl	-160(%rbp), %eax
	addl	%eax, %eax
	shlq	$3, %rax
	movabsq	$34359738352, %rcx      # imm = 0x7FFFFFFF0
	andq	%rax, %rcx
	movq	%rsp, %rdi
	subq	%rcx, %rdi
	movq	%rdi, %rsp
	movq	%rdi, -456(%rbp)
	movq	-168(%rbp), %rsi
	movl	-160(%rbp), %edx
	shlq	$3, %rdx
	callq	memcpy
	xorl	%eax, %eax
	movq	-456(%rbp), %rcx
	movq	%rcx, -168(%rbp)
	testq	%rcx, %rcx
	je	.LBB47_316
# BB#315:                               #   in Loop: Header=BB47_312 Depth=3
	shll	-160(%rbp)
	movl	$1, %eax
.LBB47_316:                             #   in Loop: Header=BB47_312 Depth=3
	testl	%eax, %eax
	jne	.LBB47_312
	jmp	.LBB47_317
.LBB47_98:                              #   in Loop: Header=BB47_29 Depth=2
	movq	-136(%rbp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, -136(%rbp)
	movzbl	(%rax), %eax
	movl	%eax, -72(%rbp)
	cmpq	$0, -152(%rbp)
	je	.LBB47_104
	jmp	.LBB47_99
	.align	16, 0x90
.LBB47_101:                             #   in Loop: Header=BB47_99 Depth=3
	movq	-48(%rbp), %rax
	movq	%rax, -120(%rbp)
	movq	-112(%rbp), %rax
	movq	%rax, -128(%rbp)
	.align	16, 0x90
.LBB47_99:                              #   Parent Loop BB47_28 Depth=1
                                        #     Parent Loop BB47_29 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	-120(%rbp), %rax
	cmpq	-128(%rbp), %rax
	jne	.LBB47_102
# BB#100:                               #   in Loop: Header=BB47_99 Depth=3
	movq	-128(%rbp), %rax
	cmpq	-112(%rbp), %rax
	je	.LBB47_438
	jmp	.LBB47_101
.LBB47_102:                             #   in Loop: Header=BB47_99 Depth=3
	movq	-120(%rbp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, -120(%rbp)
	movzbl	(%rax), %eax
	movq	-152(%rbp), %rcx
	movsbl	(%rcx,%rax), %eax
	movq	-136(%rbp), %rcx
	leaq	1(%rcx), %rdx
	movq	%rdx, -136(%rbp)
	movsbl	(%rcx), %ecx
	cmpl	%ecx, %eax
	jne	.LBB47_438
# BB#103:                               #   in Loop: Header=BB47_99 Depth=3
	decl	-72(%rbp)
	jne	.LBB47_99
	jmp	.LBB47_109
	.align	16, 0x90
.LBB47_106:                             #   in Loop: Header=BB47_104 Depth=3
	movq	-48(%rbp), %rax
	movq	%rax, -120(%rbp)
	movq	-112(%rbp), %rax
	movq	%rax, -128(%rbp)
	.align	16, 0x90
.LBB47_104:                             #   Parent Loop BB47_28 Depth=1
                                        #     Parent Loop BB47_29 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	-120(%rbp), %rax
	cmpq	-128(%rbp), %rax
	jne	.LBB47_107
# BB#105:                               #   in Loop: Header=BB47_104 Depth=3
	movq	-128(%rbp), %rax
	cmpq	-112(%rbp), %rax
	je	.LBB47_438
	jmp	.LBB47_106
.LBB47_107:                             #   in Loop: Header=BB47_104 Depth=3
	movq	-120(%rbp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, -120(%rbp)
	movsbl	(%rax), %eax
	movq	-136(%rbp), %rcx
	leaq	1(%rcx), %rdx
	movq	%rdx, -136(%rbp)
	movsbl	(%rcx), %ecx
	cmpl	%ecx, %eax
	jne	.LBB47_438
# BB#108:                               #   in Loop: Header=BB47_104 Depth=3
	decl	-72(%rbp)
	jne	.LBB47_104
.LBB47_109:                             #   in Loop: Header=BB47_29 Depth=2
	movl	-176(%rbp), %eax
	movl	%eax, -280(%rbp)
	jmp	.LBB47_110
.LBB47_144:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-136(%rbp), %rax
	movq	%rax, -80(%rbp)
	movq	-136(%rbp), %rax
	movzbl	(%rax), %eax
	movq	-224(%rbp), %rcx
	movl	(%rcx,%rax,8), %eax
	andl	$3, %eax
	cmpl	$3, %eax
	jne	.LBB47_146
# BB#145:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-224(%rbp), %rdx
	movq	-144(%rbp), %rsi
	leaq	-80(%rbp), %rdi
	xorb	%al, %al
	callq	group_match_null_string_p
	movzbl	%al, %eax
	andl	$3, %eax
	movq	-136(%rbp), %rcx
	movzbl	(%rcx), %ecx
	movq	-224(%rbp), %rdx
	movl	(%rdx,%rcx,8), %esi
	andl	$-4, %esi
	orl	%eax, %esi
	movl	%esi, (%rdx,%rcx,8)
.LBB47_146:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-136(%rbp), %rax
	movzbl	(%rax), %eax
	movq	-224(%rbp), %rcx
	testb	$3, (%rcx,%rax,8)
	je	.LBB47_149
# BB#147:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-136(%rbp), %rax
	movzbl	(%rax), %eax
	movq	-192(%rbp), %rcx
	cmpq	$-1, (%rcx,%rax,8)
	jne	.LBB47_149
# BB#148:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rax
	jmp	.LBB47_150
.LBB47_153:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-136(%rbp), %rax
	movzbl	(%rax), %eax
	movq	-224(%rbp), %rcx
	testb	$3, (%rcx,%rax,8)
	je	.LBB47_156
# BB#154:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-136(%rbp), %rax
	movzbl	(%rax), %eax
	movq	-200(%rbp), %rcx
	cmpq	$-1, (%rcx,%rax,8)
	jne	.LBB47_156
# BB#155:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rax
	jmp	.LBB47_157
.LBB47_196:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-136(%rbp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, -136(%rbp)
	movzbl	(%rax), %eax
	movl	%eax, -340(%rbp)
	movslq	-340(%rbp), %rax
	movq	-192(%rbp), %rcx
	cmpq	$-1, (%rcx,%rax,8)
	je	.LBB47_438
# BB#197:                               #   in Loop: Header=BB47_29 Depth=2
	movslq	-340(%rbp), %rax
	movq	-200(%rbp), %rcx
	cmpq	$-1, (%rcx,%rax,8)
	je	.LBB47_438
# BB#198:                               #   in Loop: Header=BB47_29 Depth=2
	movslq	-340(%rbp), %rax
	movq	-192(%rbp), %rcx
	movq	(%rcx,%rax,8), %rax
	movq	%rax, -328(%rbp)
	xorb	%al, %al
	cmpl	$0, -36(%rbp)
	movb	$0, %cl
	je	.LBB47_201
# BB#199:                               #   in Loop: Header=BB47_29 Depth=2
	xorb	%cl, %cl
	movslq	-340(%rbp), %rdx
	movq	-192(%rbp), %rsi
	movq	-32(%rbp), %rdi
	cmpq	(%rsi,%rdx,8), %rdi
	ja	.LBB47_201
# BB#200:                               #   in Loop: Header=BB47_29 Depth=2
	movslq	-36(%rbp), %rcx
	addq	-32(%rbp), %rcx
	movslq	-340(%rbp), %rdx
	movq	-192(%rbp), %rsi
	cmpq	%rcx, (%rsi,%rdx,8)
	setbe	%cl
.LBB47_201:                             #   in Loop: Header=BB47_29 Depth=2
	cmpl	$0, -36(%rbp)
	je	.LBB47_204
# BB#202:                               #   in Loop: Header=BB47_29 Depth=2
	xorb	%al, %al
	movslq	-340(%rbp), %rdx
	movq	-200(%rbp), %rsi
	movq	-32(%rbp), %rdi
	cmpq	(%rsi,%rdx,8), %rdi
	ja	.LBB47_204
# BB#203:                               #   in Loop: Header=BB47_29 Depth=2
	movslq	-36(%rbp), %rax
	addq	-32(%rbp), %rax
	movslq	-340(%rbp), %rdx
	movq	-200(%rbp), %rsi
	cmpq	%rax, (%rsi,%rdx,8)
	setbe	%al
.LBB47_204:                             #   in Loop: Header=BB47_29 Depth=2
	movzbl	%cl, %ecx
	movzbl	%al, %eax
	cmpl	%eax, %ecx
	je	.LBB47_205
# BB#206:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-104(%rbp), %rax
	jmp	.LBB47_207
.LBB47_223:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rax
	cmpl	$0, -36(%rbp)
	je	.LBB47_225
# BB#224:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-32(%rbp), %rcx
	jmp	.LBB47_226
.LBB47_232:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rax
	cmpq	-96(%rbp), %rax
	jne	.LBB47_234
# BB#233:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-24(%rbp), %rax
	btl	$6, 56(%rax)
	jae	.LBB47_29
	jmp	.LBB47_438
.LBB47_238:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rax
	cmpl	$0, -36(%rbp)
	je	.LBB47_240
# BB#239:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-32(%rbp), %rcx
	jmp	.LBB47_241
.LBB47_243:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-136(%rbp), %rax
	movzbl	(%rax), %eax
	movl	%eax, -72(%rbp)
	movq	-136(%rbp), %rcx
	movsbl	1(%rcx), %ecx
	shll	$8, %ecx
	orl	%eax, %ecx
	movl	%ecx, -72(%rbp)
	addq	$2, -136(%rbp)
	movabsq	$34359738352, %rbx      # imm = 0x7FFFFFFF0
	.align	16, 0x90
.LBB47_244:                             #   Parent Loop BB47_28 Depth=1
                                        #     Parent Loop BB47_29 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-160(%rbp), %eax
	subl	-156(%rbp), %eax
	movl	-180(%rbp), %ecx
	subl	-176(%rbp), %ecx
	leal	7(%rcx,%rcx,2), %ecx
	cmpl	%ecx, %eax
	jae	.LBB47_250
# BB#245:                               #   in Loop: Header=BB47_244 Depth=3
	movl	-172(%rbp), %eax
	leal	1(%rax,%rax,2), %eax
	imull	re_max_failures(%rip), %eax
	cmpl	%eax, -160(%rbp)
	ja	.LBB47_249
# BB#246:                               #   in Loop: Header=BB47_244 Depth=3
	movl	-160(%rbp), %eax
	addl	%eax, %eax
	shlq	$3, %rax
	andq	%rbx, %rax
	movq	%rsp, %rdi
	subq	%rax, %rdi
	movq	%rdi, %rsp
	movq	%rdi, -352(%rbp)
	movq	-168(%rbp), %rsi
	movl	-160(%rbp), %edx
	shlq	$3, %rdx
	callq	memcpy
	xorl	%eax, %eax
	movq	-352(%rbp), %rcx
	movq	%rcx, -168(%rbp)
	testq	%rcx, %rcx
	je	.LBB47_248
# BB#247:                               #   in Loop: Header=BB47_244 Depth=3
	shll	-160(%rbp)
	movl	$1, %eax
.LBB47_248:                             #   in Loop: Header=BB47_244 Depth=3
	testl	%eax, %eax
	jne	.LBB47_244
	jmp	.LBB47_249
.LBB47_273:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-136(%rbp), %rax
	movzbl	(%rax), %eax
	movl	%eax, -72(%rbp)
	movq	-136(%rbp), %rcx
	movsbl	1(%rcx), %ecx
	shll	$8, %ecx
	orl	%eax, %ecx
	movl	%ecx, -72(%rbp)
	addq	$2, -136(%rbp)
	movq	-136(%rbp), %rax
	movq	%rax, -384(%rbp)
	jmp	.LBB47_274
	.align	16, 0x90
.LBB47_278:                             #   in Loop: Header=BB47_274 Depth=3
	addq	$3, -384(%rbp)
.LBB47_274:                             #   Parent Loop BB47_28 Depth=1
                                        #     Parent Loop BB47_29 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	-384(%rbp), %rcx
	addq	$2, %rcx
	xorb	%al, %al
	cmpq	-144(%rbp), %rcx
	jae	.LBB47_277
# BB#275:                               #   in Loop: Header=BB47_274 Depth=3
	movb	$1, %al
	movq	-384(%rbp), %rcx
	cmpb	$6, (%rcx)
	je	.LBB47_277
# BB#276:                               #   in Loop: Header=BB47_274 Depth=3
	movq	-384(%rbp), %rax
	cmpb	$5, (%rax)
	sete	%al
.LBB47_277:                             #   in Loop: Header=BB47_274 Depth=3
	cmpb	$1, %al
	je	.LBB47_278
# BB#279:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-384(%rbp), %rax
	cmpq	-144(%rbp), %rax
	je	.LBB47_293
# BB#280:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-384(%rbp), %rax
	cmpb	$1, (%rax)
	je	.LBB47_283
# BB#281:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-24(%rbp), %rax
	btl	$7, 56(%rax)
	jae	.LBB47_294
# BB#282:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-384(%rbp), %rax
	movzbl	(%rax), %eax
	cmpl	$9, %eax
	jne	.LBB47_294
.LBB47_283:                             #   in Loop: Header=BB47_29 Depth=2
	movl	$10, %eax
	movq	-384(%rbp), %rcx
	cmpb	$9, (%rcx)
	je	.LBB47_285
# BB#284:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-384(%rbp), %rax
	movzbl	2(%rax), %eax
.LBB47_285:                             #   in Loop: Header=BB47_29 Depth=2
	movb	%al, -385(%rbp)
	movslq	-72(%rbp), %rax
	movq	-136(%rbp), %rcx
	leaq	(%rcx,%rax), %rdx
	movq	%rdx, -80(%rbp)
	movzbl	3(%rcx,%rax), %eax
	cmpl	$1, %eax
	jne	.LBB47_287
# BB#286:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-80(%rbp), %rax
	movzbl	5(%rax), %eax
	movzbl	-385(%rbp), %ecx
	cmpl	%ecx, %eax
	jne	.LBB47_293
.LBB47_287:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-80(%rbp), %rax
	cmpb	$3, 3(%rax)
	je	.LBB47_289
# BB#288:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-80(%rbp), %rax
	movzbl	3(%rax), %eax
	cmpl	$4, %eax
	jne	.LBB47_294
.LBB47_289:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-80(%rbp), %rax
	cmpb	$4, 3(%rax)
	sete	%al
	movzbl	%al, %eax
	movl	%eax, -392(%rbp)
	movq	-80(%rbp), %rax
	movzbl	4(%rax), %eax
	andl	$31, %eax
	shll	$3, %eax
	movzbl	-385(%rbp), %ecx
	cmpl	%eax, %ecx
	jge	.LBB47_292
# BB#290:                               #   in Loop: Header=BB47_29 Depth=2
	movzbl	-385(%rbp), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$5, %ecx
	movslq	%ecx, %rcx
	movq	-80(%rbp), %rdx
	movzbl	(%rdx,%rcx), %ecx
	andb	$7, %al
	movzbl	%al, %eax
	btl	%eax, %ecx
	jae	.LBB47_292
# BB#291:                               #   in Loop: Header=BB47_29 Depth=2
	cmpl	$0, -392(%rbp)
	sete	%al
	movzbl	%al, %eax
	movl	%eax, -392(%rbp)
.LBB47_292:                             #   in Loop: Header=BB47_29 Depth=2
	cmpl	$0, -392(%rbp)
	jne	.LBB47_294
.LBB47_293:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-136(%rbp), %rax
	movb	$16, -3(%rax)
.LBB47_294:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-136(%rbp), %rax
	leaq	-2(%rax), %rcx
	movq	%rcx, -136(%rbp)
	movzbl	-3(%rax), %eax
	cmpl	$16, %eax
	je	.LBB47_297
# BB#295:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-136(%rbp), %rax
	movb	$12, -1(%rax)
	jmp	.LBB47_296
.LBB47_323:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-136(%rbp), %rax
	movzbl	2(%rax), %eax
	movl	%eax, -72(%rbp)
	movq	-136(%rbp), %rcx
	movsbl	3(%rcx), %ecx
	shll	$8, %ecx
	orl	%eax, %ecx
	movl	%ecx, -72(%rbp)
	cmpl	$0, -72(%rbp)
	jle	.LBB47_325
# BB#324:                               #   in Loop: Header=BB47_29 Depth=2
	decl	-72(%rbp)
	addq	$2, -136(%rbp)
	movq	-136(%rbp), %rax
	movb	-72(%rbp), %cl
	movb	%cl, (%rax)
	movq	-136(%rbp), %rax
	movb	-71(%rbp), %cl
	movb	%cl, 1(%rax)
	addq	$2, -136(%rbp)
	jmp	.LBB47_29
.LBB47_327:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-136(%rbp), %rax
	movzbl	2(%rax), %eax
	movl	%eax, -72(%rbp)
	movq	-136(%rbp), %rcx
	movsbl	3(%rcx), %ecx
	shll	$8, %ecx
	orl	%eax, %ecx
	movl	%ecx, -72(%rbp)
	cmpl	$0, -72(%rbp)
	je	.LBB47_329
# BB#328:                               #   in Loop: Header=BB47_29 Depth=2
	decl	-72(%rbp)
	movq	-136(%rbp), %rax
	movb	-72(%rbp), %cl
	movb	%cl, 2(%rax)
	movq	-136(%rbp), %rax
	movb	-71(%rbp), %cl
	movb	%cl, 3(%rax)
	jmp	.LBB47_296
.LBB47_330:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-136(%rbp), %rax
	movzbl	(%rax), %eax
	movl	%eax, -72(%rbp)
	movq	-136(%rbp), %rcx
	movsbl	1(%rcx), %ecx
	shll	$8, %ecx
	orl	%eax, %ecx
	movl	%ecx, -72(%rbp)
	addq	$2, -136(%rbp)
	movslq	-72(%rbp), %rax
	addq	-136(%rbp), %rax
	movq	%rax, -80(%rbp)
	movq	-136(%rbp), %rax
	movzbl	(%rax), %eax
	movl	%eax, -72(%rbp)
	movq	-136(%rbp), %rcx
	movsbl	1(%rcx), %ecx
	shll	$8, %ecx
	orl	%eax, %ecx
	movl	%ecx, -72(%rbp)
	addq	$2, -136(%rbp)
	movq	-80(%rbp), %rax
	movb	-72(%rbp), %cl
	movb	%cl, (%rax)
	movq	-80(%rbp), %rax
	movb	-71(%rbp), %cl
	movb	%cl, 1(%rax)
	jmp	.LBB47_29
.LBB47_369:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rax
	cmpq	-88(%rbp), %rax
	jne	.LBB47_371
# BB#370:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-48(%rbp), %rax
	jmp	.LBB47_374
.LBB47_388:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rax
	cmpl	$0, -36(%rbp)
	je	.LBB47_390
# BB#389:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-32(%rbp), %rcx
	jmp	.LBB47_391
.LBB47_331:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rax
	cmpl	$0, -36(%rbp)
	je	.LBB47_333
# BB#332:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-32(%rbp), %rcx
	jmp	.LBB47_334
.LBB47_350:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rax
	cmpl	$0, -36(%rbp)
	je	.LBB47_352
# BB#351:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-32(%rbp), %rcx
	jmp	.LBB47_353
.LBB47_133:                             #   in Loop: Header=BB47_29 Depth=2
	cmpq	$0, -152(%rbp)
	je	.LBB47_135
# BB#134:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rax
	movzbl	(%rax), %eax
	movq	-152(%rbp), %rcx
	movsbl	(%rcx,%rax), %eax
	jmp	.LBB47_136
.LBB47_297:                             #   in Loop: Header=BB47_29 Depth=2
	movl	-156(%rbp), %eax
	decl	%eax
	movl	%eax, -156(%rbp)
	movq	-168(%rbp), %rcx
	movq	(%rcx,%rax,8), %rax
	movq	%rax, -432(%rbp)
	testq	%rax, %rax
	je	.LBB47_299
# BB#298:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-432(%rbp), %rax
	movq	%rax, -416(%rbp)
.LBB47_299:                             #   in Loop: Header=BB47_29 Depth=2
	movl	-156(%rbp), %eax
	decl	%eax
	movl	%eax, -156(%rbp)
	movq	-168(%rbp), %rcx
	movq	(%rcx,%rax,8), %rax
	movq	%rax, -408(%rbp)
	movl	-156(%rbp), %eax
	decl	%eax
	movl	%eax, -156(%rbp)
	movq	-168(%rbp), %rcx
	movl	(%rcx,%rax,8), %eax
	movl	%eax, -400(%rbp)
	movl	-156(%rbp), %eax
	decl	%eax
	movl	%eax, -156(%rbp)
	movq	-168(%rbp), %rcx
	movl	(%rcx,%rax,8), %eax
	movl	%eax, -396(%rbp)
	movl	-400(%rbp), %eax
	movl	%eax, -420(%rbp)
	jmp	.LBB47_300
	.align	16, 0x90
.LBB47_301:                             #   in Loop: Header=BB47_300 Depth=3
	movl	-156(%rbp), %eax
	decl	%eax
	movl	%eax, -156(%rbp)
	movq	-168(%rbp), %rcx
	movq	(%rcx,%rax,8), %rax
	movq	-272(%rbp), %rcx
	movslq	-420(%rbp), %rdx
	movq	%rax, (%rcx,%rdx,8)
	movl	-156(%rbp), %eax
	decl	%eax
	movl	%eax, -156(%rbp)
	movq	-168(%rbp), %rcx
	movq	(%rcx,%rax,8), %rax
	movq	-264(%rbp), %rcx
	movslq	-420(%rbp), %rdx
	movq	%rax, (%rcx,%rdx,8)
	movl	-156(%rbp), %eax
	decl	%eax
	movl	%eax, -156(%rbp)
	movq	-168(%rbp), %rcx
	movq	(%rcx,%rax,8), %rax
	movq	-264(%rbp), %rcx
	movslq	-420(%rbp), %rdx
	movq	%rax, (%rcx,%rdx,8)
	decl	-420(%rbp)
.LBB47_300:                             #   Parent Loop BB47_28 Depth=1
                                        #     Parent Loop BB47_29 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-420(%rbp), %eax
	cmpl	-396(%rbp), %eax
	jb	.LBB47_296
	jmp	.LBB47_301
.LBB47_115:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-24(%rbp), %rax
	testb	$64, 24(%rax)
	jne	.LBB47_120
# BB#116:                               #   in Loop: Header=BB47_29 Depth=2
	cmpq	$0, -152(%rbp)
	je	.LBB47_118
# BB#117:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rax
	movzbl	(%rax), %eax
	movq	-152(%rbp), %rcx
	movsbl	(%rcx,%rax), %eax
	jmp	.LBB47_119
.LBB47_411:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rax
	cmpq	-88(%rbp), %rax
	jne	.LBB47_413
# BB#412:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-48(%rbp), %rax
	jmp	.LBB47_416
.LBB47_425:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rax
	cmpq	-88(%rbp), %rax
	jne	.LBB47_427
# BB#426:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-48(%rbp), %rax
	jmp	.LBB47_430
.LBB47_149:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-136(%rbp), %rax
	movzbl	(%rax), %eax
	movq	-192(%rbp), %rcx
	movq	(%rcx,%rax,8), %rax
.LBB47_150:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-136(%rbp), %rcx
	movzbl	(%rcx), %ecx
	movq	-208(%rbp), %rdx
	movq	%rax, (%rdx,%rcx,8)
	movq	-136(%rbp), %rax
	movzbl	(%rax), %eax
	movq	-192(%rbp), %rcx
	movq	-120(%rbp), %rdx
	movq	%rdx, (%rcx,%rax,8)
	movq	-136(%rbp), %rax
	movzbl	(%rax), %eax
	movq	-224(%rbp), %rcx
	orl	$4, (%rcx,%rax,8)
	movq	-136(%rbp), %rax
	movzbl	(%rax), %eax
	movq	-224(%rbp), %rcx
	andl	$-9, (%rcx,%rax,8)
	movq	-136(%rbp), %rax
	movzbl	(%rax), %eax
	movl	%eax, -180(%rbp)
	cmpl	$257, -176(%rbp)        # imm = 0x101
	jne	.LBB47_152
# BB#151:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-136(%rbp), %rax
	movzbl	(%rax), %eax
	movl	%eax, -176(%rbp)
.LBB47_152:                             #   in Loop: Header=BB47_29 Depth=2
	addq	$2, -136(%rbp)
	jmp	.LBB47_29
.LBB47_156:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-136(%rbp), %rax
	movzbl	(%rax), %eax
	movq	-200(%rbp), %rcx
	movq	(%rcx,%rax,8), %rax
.LBB47_157:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-136(%rbp), %rcx
	movzbl	(%rcx), %ecx
	movq	-216(%rbp), %rdx
	movq	%rax, (%rdx,%rcx,8)
	movq	-136(%rbp), %rax
	movzbl	(%rax), %eax
	movq	-200(%rbp), %rcx
	movq	-120(%rbp), %rdx
	movq	%rdx, (%rcx,%rax,8)
	movq	-136(%rbp), %rax
	movzbl	(%rax), %eax
	movq	-224(%rbp), %rcx
	andl	$-5, (%rcx,%rax,8)
	movl	-176(%rbp), %eax
	cmpl	-180(%rbp), %eax
	je	.LBB47_158
# BB#159:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-136(%rbp), %rax
	movzbl	(%rax), %eax
	decl	%eax
	movb	%al, -293(%rbp)
	jmp	.LBB47_160
.LBB47_225:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-48(%rbp), %rcx
.LBB47_226:                             #   in Loop: Header=BB47_29 Depth=2
	cmpq	%rcx, %rax
	je	.LBB47_228
# BB#227:                               #   in Loop: Header=BB47_29 Depth=2
	cmpl	$0, -52(%rbp)
	je	.LBB47_228
# BB#229:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rax
	movsbl	-1(%rax), %eax
	jmp	.LBB47_230
.LBB47_234:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rax
	cmpq	-88(%rbp), %rax
	jne	.LBB47_236
# BB#235:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-48(%rbp), %rax
	movsbl	(%rax), %eax
	jmp	.LBB47_230
.LBB47_240:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-48(%rbp), %rcx
.LBB47_241:                             #   in Loop: Header=BB47_29 Depth=2
	cmpq	%rcx, %rax
	je	.LBB47_29
# BB#242:                               #   in Loop: Header=BB47_29 Depth=2
	cmpl	$0, -52(%rbp)
	je	.LBB47_29
	jmp	.LBB47_438
.LBB47_325:                             #   in Loop: Header=BB47_29 Depth=2
	cmpl	$0, -72(%rbp)
	jne	.LBB47_29
# BB#326:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-136(%rbp), %rax
	movb	$0, 2(%rax)
	movq	-136(%rbp), %rax
	movb	$0, 3(%rax)
.LBB47_254:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-136(%rbp), %rax
	movzbl	(%rax), %eax
	movl	%eax, -72(%rbp)
	movq	-136(%rbp), %rcx
	movsbl	1(%rcx), %ecx
	shll	$8, %ecx
	orl	%eax, %ecx
	movl	%ecx, -72(%rbp)
	addq	$2, -136(%rbp)
	movq	-136(%rbp), %rax
	movq	%rax, -80(%rbp)
	jmp	.LBB47_255
	.align	16, 0x90
.LBB47_258:                             #   in Loop: Header=BB47_255 Depth=3
	incq	-80(%rbp)
.LBB47_255:                             #   Parent Loop BB47_28 Depth=1
                                        #     Parent Loop BB47_29 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	xorb	%al, %al
	movq	-80(%rbp), %rcx
	cmpq	-144(%rbp), %rcx
	jae	.LBB47_257
# BB#256:                               #   in Loop: Header=BB47_255 Depth=3
	movq	-80(%rbp), %rax
	cmpb	$0, (%rax)
	sete	%al
.LBB47_257:                             #   in Loop: Header=BB47_255 Depth=3
	cmpb	$1, %al
	je	.LBB47_258
# BB#259:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-80(%rbp), %rax
	cmpq	-144(%rbp), %rax
	jae	.LBB47_263
# BB#260:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-80(%rbp), %rax
	movzbl	(%rax), %eax
	cmpl	$5, %eax
	jne	.LBB47_263
# BB#261:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-80(%rbp), %rcx
	movzbl	2(%rcx), %eax
	movzbl	1(%rcx), %ecx
	addl	%eax, %ecx
	movl	%ecx, -180(%rbp)
	cmpl	$257, -176(%rbp)        # imm = 0x101
	jne	.LBB47_263
# BB#262:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-80(%rbp), %rax
	movzbl	1(%rax), %eax
	movl	%eax, -176(%rbp)
	.align	16, 0x90
.LBB47_263:                             #   Parent Loop BB47_28 Depth=1
                                        #     Parent Loop BB47_29 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-160(%rbp), %eax
	subl	-156(%rbp), %eax
	movl	-180(%rbp), %ecx
	subl	-176(%rbp), %ecx
	leal	7(%rcx,%rcx,2), %ecx
	cmpl	%ecx, %eax
	jae	.LBB47_269
# BB#264:                               #   in Loop: Header=BB47_263 Depth=3
	movl	-172(%rbp), %eax
	leal	1(%rax,%rax,2), %eax
	imull	re_max_failures(%rip), %eax
	cmpl	%eax, -160(%rbp)
	ja	.LBB47_268
# BB#265:                               #   in Loop: Header=BB47_263 Depth=3
	movl	-160(%rbp), %eax
	addl	%eax, %eax
	shlq	$3, %rax
	movabsq	$34359738352, %rcx      # imm = 0x7FFFFFFF0
	andq	%rax, %rcx
	movq	%rsp, %rdi
	subq	%rcx, %rdi
	movq	%rdi, %rsp
	movq	%rdi, -368(%rbp)
	movq	-168(%rbp), %rsi
	movl	-160(%rbp), %edx
	shlq	$3, %rdx
	callq	memcpy
	xorl	%eax, %eax
	movq	-368(%rbp), %rcx
	movq	%rcx, -168(%rbp)
	testq	%rcx, %rcx
	je	.LBB47_267
# BB#266:                               #   in Loop: Header=BB47_263 Depth=3
	shll	-160(%rbp)
	movl	$1, %eax
.LBB47_267:                             #   in Loop: Header=BB47_263 Depth=3
	testl	%eax, %eax
	jne	.LBB47_263
	jmp	.LBB47_268
.LBB47_329:                             #   in Loop: Header=BB47_29 Depth=2
	addq	$4, -136(%rbp)
	jmp	.LBB47_29
.LBB47_371:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-48(%rbp), %rax
	decq	%rax
	cmpq	%rax, -120(%rbp)
	jne	.LBB47_373
# BB#372:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-88(%rbp), %rax
	movsbl	-1(%rax), %eax
	jmp	.LBB47_375
.LBB47_390:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-48(%rbp), %rcx
.LBB47_391:                             #   in Loop: Header=BB47_29 Depth=2
	cmpq	%rcx, %rax
	je	.LBB47_438
# BB#392:                               #   in Loop: Header=BB47_29 Depth=2
	cmpl	$0, -52(%rbp)
	je	.LBB47_438
# BB#393:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rax
	decq	%rax
	cmpq	-88(%rbp), %rax
	jne	.LBB47_395
# BB#394:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-48(%rbp), %rax
	movsbl	(%rax), %eax
	jmp	.LBB47_399
.LBB47_333:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-48(%rbp), %rcx
.LBB47_334:                             #   in Loop: Header=BB47_29 Depth=2
	cmpq	%rcx, %rax
	je	.LBB47_29
# BB#335:                               #   in Loop: Header=BB47_29 Depth=2
	cmpl	$0, -52(%rbp)
	je	.LBB47_29
# BB#336:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rax
	cmpq	-96(%rbp), %rax
	je	.LBB47_29
# BB#337:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rax
	decq	%rax
	cmpq	-88(%rbp), %rax
	jne	.LBB47_339
# BB#338:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-48(%rbp), %rax
	movsbl	(%rax), %eax
	jmp	.LBB47_343
.LBB47_352:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-48(%rbp), %rcx
.LBB47_353:                             #   in Loop: Header=BB47_29 Depth=2
	cmpq	%rcx, %rax
	je	.LBB47_438
# BB#354:                               #   in Loop: Header=BB47_29 Depth=2
	cmpl	$0, -52(%rbp)
	je	.LBB47_438
# BB#355:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rax
	cmpq	-96(%rbp), %rax
	je	.LBB47_438
# BB#356:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rax
	decq	%rax
	cmpq	-88(%rbp), %rax
	jne	.LBB47_358
# BB#357:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-48(%rbp), %rax
	movsbl	(%rax), %eax
	jmp	.LBB47_362
.LBB47_135:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rax
	movsbl	(%rax), %eax
.LBB47_136:                             #   in Loop: Header=BB47_29 Depth=2
	movb	%al, -285(%rbp)
	movq	-136(%rbp), %rax
	movzbl	(%rax), %eax
	shll	$3, %eax
	movzbl	-285(%rbp), %ecx
	cmpl	%eax, %ecx
	jae	.LBB47_139
# BB#137:                               #   in Loop: Header=BB47_29 Depth=2
	movzbl	-285(%rbp), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	incl	%ecx
	movslq	%ecx, %rcx
	movq	-136(%rbp), %rdx
	movzbl	(%rdx,%rcx), %ecx
	andb	$7, %al
	movzbl	%al, %eax
	btl	%eax, %ecx
	jae	.LBB47_139
# BB#138:                               #   in Loop: Header=BB47_29 Depth=2
	cmpb	$0, -286(%rbp)
	sete	-286(%rbp)
.LBB47_139:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-136(%rbp), %rax
	movzbl	(%rax), %ecx
	incl	%ecx
	movslq	%ecx, %rcx
	addq	%rax, %rcx
	movq	%rcx, -136(%rbp)
	cmpb	$0, -286(%rbp)
	je	.LBB47_438
# BB#140:                               #   in Loop: Header=BB47_29 Depth=2
	movl	-176(%rbp), %eax
	movl	%eax, -292(%rbp)
	jmp	.LBB47_141
.LBB47_228:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-24(%rbp), %rax
	btl	$5, 56(%rax)
	jae	.LBB47_29
	jmp	.LBB47_438
.LBB47_308:                             #   in Loop: Header=BB47_29 Depth=2
	movl	-176(%rbp), %eax
	movl	%eax, -444(%rbp)
	jmp	.LBB47_309
.LBB47_318:                             #   in Loop: Header=BB47_29 Depth=2
	movl	-176(%rbp), %eax
	movl	%eax, -460(%rbp)
	jmp	.LBB47_319
	.align	16, 0x90
.LBB47_111:                             #   in Loop: Header=BB47_110 Depth=3
	movq	-224(%rbp), %rax
	movl	-280(%rbp), %ecx
	orl	$16, (%rax,%rcx,8)
	movq	-224(%rbp), %rax
	movl	-280(%rbp), %ecx
	orl	$8, (%rax,%rcx,8)
	incl	-280(%rbp)
.LBB47_110:                             #   Parent Loop BB47_28 Depth=1
                                        #     Parent Loop BB47_29 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-280(%rbp), %eax
	cmpl	-180(%rbp), %eax
	ja	.LBB47_29
	jmp	.LBB47_111
.LBB47_250:                             #   in Loop: Header=BB47_29 Depth=2
	movl	-176(%rbp), %eax
	movl	%eax, -356(%rbp)
	jmp	.LBB47_251
.LBB47_118:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rax
	movsbl	(%rax), %eax
.LBB47_119:                             #   in Loop: Header=BB47_29 Depth=2
	cmpl	$10, %eax
	je	.LBB47_438
.LBB47_120:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-24(%rbp), %rax
	testb	$-128, 24(%rax)
	je	.LBB47_125
# BB#121:                               #   in Loop: Header=BB47_29 Depth=2
	cmpq	$0, -152(%rbp)
	je	.LBB47_123
# BB#122:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rax
	movzbl	(%rax), %eax
	movq	-152(%rbp), %rcx
	movsbl	(%rcx,%rax), %eax
	jmp	.LBB47_124
.LBB47_413:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-48(%rbp), %rax
	decq	%rax
	cmpq	%rax, -120(%rbp)
	jne	.LBB47_415
# BB#414:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-88(%rbp), %rax
	movsbl	-1(%rax), %eax
	jmp	.LBB47_417
.LBB47_427:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-48(%rbp), %rax
	decq	%rax
	cmpq	%rax, -120(%rbp)
	jne	.LBB47_429
# BB#428:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-88(%rbp), %rax
	movsbl	-1(%rax), %eax
	jmp	.LBB47_431
	.align	16, 0x90
.LBB47_163:                             #   in Loop: Header=BB47_160 Depth=3
	decb	-293(%rbp)
.LBB47_160:                             #   Parent Loop BB47_28 Depth=1
                                        #     Parent Loop BB47_29 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	xorb	%al, %al
	movzbl	-293(%rbp), %ecx
	testl	%ecx, %ecx
	jle	.LBB47_162
# BB#161:                               #   in Loop: Header=BB47_160 Depth=3
	movzbl	-293(%rbp), %eax
	movq	-224(%rbp), %rcx
	btl	$2, (%rcx,%rax,8)
	setae	%al
.LBB47_162:                             #   in Loop: Header=BB47_160 Depth=3
	cmpb	$1, %al
	je	.LBB47_163
# BB#164:                               #   in Loop: Header=BB47_29 Depth=2
	movzbl	-293(%rbp), %eax
	testl	%eax, %eax
	je	.LBB47_158
# BB#165:                               #   in Loop: Header=BB47_29 Depth=2
	movzbl	-293(%rbp), %eax
	movl	%eax, -180(%rbp)
	jmp	.LBB47_166
.LBB47_236:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rax
	movsbl	(%rax), %eax
.LBB47_230:                             #   in Loop: Header=BB47_29 Depth=2
	cmpl	$10, %eax
	jne	.LBB47_438
# BB#231:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-24(%rbp), %rax
	btl	$7, 56(%rax)
	jb	.LBB47_29
	jmp	.LBB47_438
.LBB47_269:                             #   in Loop: Header=BB47_29 Depth=2
	movl	-176(%rbp), %eax
	movl	%eax, -372(%rbp)
	jmp	.LBB47_270
.LBB47_373:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rax
.LBB47_374:                             #   in Loop: Header=BB47_29 Depth=2
	movsbl	(%rax), %eax
.LBB47_375:                             #   in Loop: Header=BB47_29 Depth=2
	movslq	%eax, %rax
	movsbl	re_syntax_table(%rax), %eax
	cmpl	$1, %eax
	jne	.LBB47_438
# BB#376:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rax
	cmpl	$0, -36(%rbp)
	je	.LBB47_378
# BB#377:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-32(%rbp), %rcx
	jmp	.LBB47_379
.LBB47_395:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rax
	cmpq	-48(%rbp), %rax
	jne	.LBB47_397
# BB#396:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-88(%rbp), %rax
	jmp	.LBB47_398
.LBB47_339:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rax
	cmpq	-48(%rbp), %rax
	jne	.LBB47_341
# BB#340:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-88(%rbp), %rax
	jmp	.LBB47_342
.LBB47_358:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rax
	cmpq	-48(%rbp), %rax
	jne	.LBB47_360
# BB#359:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-88(%rbp), %rax
	jmp	.LBB47_361
	.align	16, 0x90
.LBB47_142:                             #   in Loop: Header=BB47_141 Depth=3
	movq	-224(%rbp), %rax
	movl	-292(%rbp), %ecx
	orl	$16, (%rax,%rcx,8)
	movq	-224(%rbp), %rax
	movl	-292(%rbp), %ecx
	orl	$8, (%rax,%rcx,8)
	incl	-292(%rbp)
.LBB47_141:                             #   Parent Loop BB47_28 Depth=1
                                        #     Parent Loop BB47_29 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-292(%rbp), %eax
	cmpl	-180(%rbp), %eax
	jbe	.LBB47_142
# BB#143:                               #   in Loop: Header=BB47_29 Depth=2
	incq	-120(%rbp)
	jmp	.LBB47_29
	.align	16, 0x90
.LBB47_310:                             #   in Loop: Header=BB47_309 Depth=3
	movslq	-444(%rbp), %rax
	movq	-192(%rbp), %rcx
	movq	(%rcx,%rax,8), %rax
	movl	-156(%rbp), %ecx
	leal	1(%rcx), %edx
	movl	%edx, -156(%rbp)
	movq	-168(%rbp), %rdx
	movq	%rax, (%rdx,%rcx,8)
	movslq	-444(%rbp), %rax
	movq	-200(%rbp), %rcx
	movq	(%rcx,%rax,8), %rax
	movl	-156(%rbp), %ecx
	leal	1(%rcx), %edx
	movl	%edx, -156(%rbp)
	movq	-168(%rbp), %rdx
	movq	%rax, (%rdx,%rcx,8)
	movslq	-444(%rbp), %rax
	movq	-224(%rbp), %rcx
	movq	(%rcx,%rax,8), %rax
	movl	-156(%rbp), %ecx
	leal	1(%rcx), %edx
	movl	%edx, -156(%rbp)
	movq	-168(%rbp), %rdx
	movq	%rax, (%rdx,%rcx,8)
	incl	-444(%rbp)
.LBB47_309:                             #   Parent Loop BB47_28 Depth=1
                                        #     Parent Loop BB47_29 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-444(%rbp), %eax
	cmpl	-180(%rbp), %eax
	jbe	.LBB47_310
# BB#311:                               #   in Loop: Header=BB47_29 Depth=2
	movl	-156(%rbp), %eax
	leal	1(%rax), %edx
	movl	-176(%rbp), %ecx
	movl	%edx, -156(%rbp)
	movq	-168(%rbp), %rdx
	movq	%rcx, (%rdx,%rax,8)
	movl	-156(%rbp), %eax
	leal	1(%rax), %edx
	movl	-180(%rbp), %ecx
	movl	%edx, -156(%rbp)
	movq	-168(%rbp), %rdx
	movq	%rcx, (%rdx,%rax,8)
	movl	-156(%rbp), %eax
	leal	1(%rax), %ecx
	movl	%ecx, -156(%rbp)
	movq	-168(%rbp), %rcx
	movq	$0, (%rcx,%rax,8)
	movl	-156(%rbp), %eax
	leal	1(%rax), %ecx
	movl	%ecx, -156(%rbp)
	movq	-168(%rbp), %rcx
	movq	$0, (%rcx,%rax,8)
	jmp	.LBB47_296
	.align	16, 0x90
.LBB47_320:                             #   in Loop: Header=BB47_319 Depth=3
	movslq	-460(%rbp), %rax
	movq	-192(%rbp), %rcx
	movq	(%rcx,%rax,8), %rax
	movl	-156(%rbp), %ecx
	leal	1(%rcx), %edx
	movl	%edx, -156(%rbp)
	movq	-168(%rbp), %rdx
	movq	%rax, (%rdx,%rcx,8)
	movslq	-460(%rbp), %rax
	movq	-200(%rbp), %rcx
	movq	(%rcx,%rax,8), %rax
	movl	-156(%rbp), %ecx
	leal	1(%rcx), %edx
	movl	%edx, -156(%rbp)
	movq	-168(%rbp), %rdx
	movq	%rax, (%rdx,%rcx,8)
	movslq	-460(%rbp), %rax
	movq	-224(%rbp), %rcx
	movq	(%rcx,%rax,8), %rax
	movl	-156(%rbp), %ecx
	leal	1(%rcx), %edx
	movl	%edx, -156(%rbp)
	movq	-168(%rbp), %rdx
	movq	%rax, (%rdx,%rcx,8)
	incl	-460(%rbp)
.LBB47_319:                             #   Parent Loop BB47_28 Depth=1
                                        #     Parent Loop BB47_29 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-460(%rbp), %eax
	cmpl	-180(%rbp), %eax
	jbe	.LBB47_320
# BB#321:                               #   in Loop: Header=BB47_29 Depth=2
	movl	-156(%rbp), %eax
	leal	1(%rax), %edx
	movl	-176(%rbp), %ecx
	movl	%edx, -156(%rbp)
	movq	-168(%rbp), %rdx
	movq	%rcx, (%rdx,%rax,8)
	movl	-156(%rbp), %eax
	leal	1(%rax), %edx
	movl	-180(%rbp), %ecx
	movl	%edx, -156(%rbp)
	movq	-168(%rbp), %rdx
	movq	%rcx, (%rdx,%rax,8)
	movl	-156(%rbp), %eax
	leal	1(%rax), %ecx
	movl	%ecx, -156(%rbp)
	movq	-168(%rbp), %rcx
	movq	$0, (%rcx,%rax,8)
	jmp	.LBB47_322
	.align	16, 0x90
.LBB47_252:                             #   in Loop: Header=BB47_251 Depth=3
	movslq	-356(%rbp), %rax
	movq	-192(%rbp), %rcx
	movq	(%rcx,%rax,8), %rax
	movl	-156(%rbp), %ecx
	leal	1(%rcx), %edx
	movl	%edx, -156(%rbp)
	movq	-168(%rbp), %rdx
	movq	%rax, (%rdx,%rcx,8)
	movslq	-356(%rbp), %rax
	movq	-200(%rbp), %rcx
	movq	(%rcx,%rax,8), %rax
	movl	-156(%rbp), %ecx
	leal	1(%rcx), %edx
	movl	%edx, -156(%rbp)
	movq	-168(%rbp), %rdx
	movq	%rax, (%rdx,%rcx,8)
	movslq	-356(%rbp), %rax
	movq	-224(%rbp), %rcx
	movq	(%rcx,%rax,8), %rax
	movl	-156(%rbp), %ecx
	leal	1(%rcx), %edx
	movl	%edx, -156(%rbp)
	movq	-168(%rbp), %rdx
	movq	%rax, (%rdx,%rcx,8)
	incl	-356(%rbp)
.LBB47_251:                             #   Parent Loop BB47_28 Depth=1
                                        #     Parent Loop BB47_29 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-356(%rbp), %eax
	cmpl	-180(%rbp), %eax
	jbe	.LBB47_252
# BB#253:                               #   in Loop: Header=BB47_29 Depth=2
	movl	-156(%rbp), %eax
	leal	1(%rax), %edx
	movl	-176(%rbp), %ecx
	movl	%edx, -156(%rbp)
	movq	-168(%rbp), %rdx
	movq	%rcx, (%rdx,%rax,8)
	movl	-156(%rbp), %eax
	leal	1(%rax), %edx
	movl	-180(%rbp), %ecx
	movl	%edx, -156(%rbp)
	movq	-168(%rbp), %rdx
	movq	%rcx, (%rdx,%rax,8)
	movslq	-72(%rbp), %rax
	addq	-136(%rbp), %rax
	movl	-156(%rbp), %ecx
	leal	1(%rcx), %edx
	movl	%edx, -156(%rbp)
	movq	-168(%rbp), %rdx
	movq	%rax, (%rdx,%rcx,8)
.LBB47_322:                             #   in Loop: Header=BB47_29 Depth=2
	movl	-156(%rbp), %eax
	leal	1(%rax), %ecx
	movl	%ecx, -156(%rbp)
	movq	-168(%rbp), %rcx
	movq	$0, (%rcx,%rax,8)
	jmp	.LBB47_29
.LBB47_123:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rax
	movsbl	(%rax), %eax
.LBB47_124:                             #   in Loop: Header=BB47_29 Depth=2
	testl	%eax, %eax
	je	.LBB47_438
.LBB47_125:                             #   in Loop: Header=BB47_29 Depth=2
	movl	-176(%rbp), %eax
	movl	%eax, -284(%rbp)
	jmp	.LBB47_126
.LBB47_415:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rax
.LBB47_416:                             #   in Loop: Header=BB47_29 Depth=2
	movsbl	(%rax), %eax
.LBB47_417:                             #   in Loop: Header=BB47_29 Depth=2
	movslq	%eax, %rax
	movsbl	re_syntax_table(%rax), %eax
	cmpl	$1, %eax
	jne	.LBB47_438
# BB#418:                               #   in Loop: Header=BB47_29 Depth=2
	movl	-176(%rbp), %eax
	movl	%eax, -464(%rbp)
	jmp	.LBB47_419
.LBB47_429:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rax
.LBB47_430:                             #   in Loop: Header=BB47_29 Depth=2
	movsbl	(%rax), %eax
.LBB47_431:                             #   in Loop: Header=BB47_29 Depth=2
	movslq	%eax, %rax
	movsbl	re_syntax_table(%rax), %eax
	cmpl	$1, %eax
	je	.LBB47_438
# BB#432:                               #   in Loop: Header=BB47_29 Depth=2
	movl	-176(%rbp), %eax
	movl	%eax, -468(%rbp)
	jmp	.LBB47_433
.LBB47_158:                             #   in Loop: Header=BB47_29 Depth=2
	movl	$257, -176(%rbp)        # imm = 0x101
	movl	$256, -180(%rbp)        # imm = 0x100
.LBB47_166:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-136(%rbp), %rax
	movzbl	(%rax), %eax
	movq	-224(%rbp), %rcx
	btl	$3, (%rcx,%rax,8)
	jae	.LBB47_168
# BB#167:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-136(%rbp), %rax
	movzbl	-3(%rax), %eax
	cmpl	$5, %eax
	jne	.LBB47_195
.LBB47_168:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-136(%rbp), %rax
	addq	$2, %rax
	cmpq	-144(%rbp), %rax
	jae	.LBB47_195
# BB#169:                               #   in Loop: Header=BB47_29 Depth=2
	movb	$0, -294(%rbp)
	movq	-136(%rbp), %rax
	addq	$2, %rax
	movq	%rax, -80(%rbp)
	movl	$0, -72(%rbp)
	movq	-80(%rbp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, -80(%rbp)
	movzbl	(%rax), %eax
	cmpl	$12, %eax
	je	.LBB47_173
# BB#170:                               #   in Loop: Header=BB47_29 Depth=2
	leal	-16(%rax), %ecx
	cmpl	$3, %ecx
	jb	.LBB47_173
# BB#171:                               #   in Loop: Header=BB47_29 Depth=2
	cmpl	$21, %eax
	jne	.LBB47_175
# BB#172:                               #   in Loop: Header=BB47_29 Depth=2
	movb	$1, -294(%rbp)
.LBB47_173:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-80(%rbp), %rax
	movzbl	(%rax), %eax
	movl	%eax, -72(%rbp)
	movq	-80(%rbp), %rcx
	movsbl	1(%rcx), %ecx
	shll	$8, %ecx
	orl	%eax, %ecx
	movl	%ecx, -72(%rbp)
	addq	$2, -80(%rbp)
	cmpb	$0, -294(%rbp)
	je	.LBB47_175
# BB#174:                               #   in Loop: Header=BB47_29 Depth=2
	addq	$2, -80(%rbp)
.LBB47_175:                             #   in Loop: Header=BB47_29 Depth=2
	movslq	-72(%rbp), %rax
	addq	%rax, -80(%rbp)
	cmpl	$0, -72(%rbp)
	jns	.LBB47_195
# BB#176:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-80(%rbp), %rax
	movzbl	(%rax), %eax
	cmpl	$14, %eax
	jne	.LBB47_195
# BB#177:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-80(%rbp), %rax
	movzbl	3(%rax), %eax
	cmpl	$5, %eax
	jne	.LBB47_195
# BB#178:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-136(%rbp), %rax
	movzbl	(%rax), %eax
	movq	-80(%rbp), %rcx
	movzbl	4(%rcx), %ecx
	cmpl	%eax, %ecx
	jne	.LBB47_195
# BB#179:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-136(%rbp), %rax
	movzbl	(%rax), %eax
	movq	-224(%rbp), %rcx
	btl	$4, (%rcx,%rax,8)
	jae	.LBB47_185
# BB#180:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-136(%rbp), %rax
	movzbl	(%rax), %eax
	movq	-224(%rbp), %rcx
	andl	$-17, (%rcx,%rax,8)
	movq	-136(%rbp), %rax
	movzbl	(%rax), %eax
	movl	%eax, -300(%rbp)
	jmp	.LBB47_181
	.align	16, 0x90
.LBB47_271:                             #   in Loop: Header=BB47_270 Depth=3
	movslq	-372(%rbp), %rax
	movq	-192(%rbp), %rcx
	movq	(%rcx,%rax,8), %rax
	movl	-156(%rbp), %ecx
	leal	1(%rcx), %edx
	movl	%edx, -156(%rbp)
	movq	-168(%rbp), %rdx
	movq	%rax, (%rdx,%rcx,8)
	movslq	-372(%rbp), %rax
	movq	-200(%rbp), %rcx
	movq	(%rcx,%rax,8), %rax
	movl	-156(%rbp), %ecx
	leal	1(%rcx), %edx
	movl	%edx, -156(%rbp)
	movq	-168(%rbp), %rdx
	movq	%rax, (%rdx,%rcx,8)
	movslq	-372(%rbp), %rax
	movq	-224(%rbp), %rcx
	movq	(%rcx,%rax,8), %rax
	movl	-156(%rbp), %ecx
	leal	1(%rcx), %edx
	movl	%edx, -156(%rbp)
	movq	-168(%rbp), %rdx
	movq	%rax, (%rdx,%rcx,8)
	incl	-372(%rbp)
.LBB47_270:                             #   Parent Loop BB47_28 Depth=1
                                        #     Parent Loop BB47_29 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-372(%rbp), %eax
	cmpl	-180(%rbp), %eax
	jbe	.LBB47_271
# BB#272:                               #   in Loop: Header=BB47_29 Depth=2
	movl	-156(%rbp), %eax
	leal	1(%rax), %edx
	movl	-176(%rbp), %ecx
	movl	%edx, -156(%rbp)
	movq	-168(%rbp), %rdx
	movq	%rcx, (%rdx,%rax,8)
	movl	-156(%rbp), %eax
	leal	1(%rax), %edx
	movl	-180(%rbp), %ecx
	movl	%edx, -156(%rbp)
	movq	-168(%rbp), %rdx
	movq	%rcx, (%rdx,%rax,8)
	movslq	-72(%rbp), %rax
	addq	-136(%rbp), %rax
	movl	-156(%rbp), %ecx
	leal	1(%rcx), %edx
	movl	%edx, -156(%rbp)
	movq	-168(%rbp), %rdx
	movq	%rax, (%rdx,%rcx,8)
	movl	-156(%rbp), %eax
	leal	1(%rax), %edx
	movq	-120(%rbp), %rcx
	movl	%edx, -156(%rbp)
	movq	-168(%rbp), %rdx
	movq	%rcx, (%rdx,%rax,8)
	jmp	.LBB47_29
.LBB47_378:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-48(%rbp), %rcx
.LBB47_379:                             #   in Loop: Header=BB47_29 Depth=2
	cmpq	%rcx, %rax
	je	.LBB47_29
# BB#380:                               #   in Loop: Header=BB47_29 Depth=2
	cmpl	$0, -52(%rbp)
	je	.LBB47_29
# BB#381:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rax
	decq	%rax
	cmpq	-88(%rbp), %rax
	jne	.LBB47_383
# BB#382:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-48(%rbp), %rax
	movsbl	(%rax), %eax
	jmp	.LBB47_387
.LBB47_397:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rax
.LBB47_398:                             #   in Loop: Header=BB47_29 Depth=2
	movsbl	-1(%rax), %eax
.LBB47_399:                             #   in Loop: Header=BB47_29 Depth=2
	movslq	%eax, %rax
	movsbl	re_syntax_table(%rax), %eax
	cmpl	$1, %eax
	jne	.LBB47_438
# BB#400:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rax
	cmpq	-88(%rbp), %rax
	jne	.LBB47_402
# BB#401:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-48(%rbp), %rax
	jmp	.LBB47_405
.LBB47_341:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rax
.LBB47_342:                             #   in Loop: Header=BB47_29 Depth=2
	movsbl	-1(%rax), %eax
.LBB47_343:                             #   in Loop: Header=BB47_29 Depth=2
	movslq	%eax, %rax
	movsbl	re_syntax_table(%rax), %eax
	cmpl	$1, %eax
	sete	%al
	movzbl	%al, %eax
	movq	-120(%rbp), %rcx
	cmpq	-88(%rbp), %rcx
	jne	.LBB47_345
# BB#344:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-48(%rbp), %rcx
	jmp	.LBB47_348
.LBB47_360:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rax
.LBB47_361:                             #   in Loop: Header=BB47_29 Depth=2
	movsbl	-1(%rax), %eax
.LBB47_362:                             #   in Loop: Header=BB47_29 Depth=2
	movslq	%eax, %rax
	movsbl	re_syntax_table(%rax), %eax
	cmpl	$1, %eax
	sete	%al
	movzbl	%al, %eax
	movq	-120(%rbp), %rcx
	cmpq	-88(%rbp), %rcx
	jne	.LBB47_364
# BB#363:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-48(%rbp), %rcx
	jmp	.LBB47_367
	.align	16, 0x90
.LBB47_127:                             #   in Loop: Header=BB47_126 Depth=3
	movq	-224(%rbp), %rax
	movl	-284(%rbp), %ecx
	orl	$16, (%rax,%rcx,8)
	movq	-224(%rbp), %rax
	movl	-284(%rbp), %ecx
	orl	$8, (%rax,%rcx,8)
	incl	-284(%rbp)
.LBB47_126:                             #   Parent Loop BB47_28 Depth=1
                                        #     Parent Loop BB47_29 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-284(%rbp), %eax
	cmpl	-180(%rbp), %eax
	jbe	.LBB47_127
# BB#128:                               #   in Loop: Header=BB47_29 Depth=2
	incq	-120(%rbp)
	jmp	.LBB47_29
	.align	16, 0x90
.LBB47_420:                             #   in Loop: Header=BB47_419 Depth=3
	movq	-224(%rbp), %rax
	movl	-464(%rbp), %ecx
	orl	$16, (%rax,%rcx,8)
	movq	-224(%rbp), %rax
	movl	-464(%rbp), %ecx
	orl	$8, (%rax,%rcx,8)
	incl	-464(%rbp)
.LBB47_419:                             #   Parent Loop BB47_28 Depth=1
                                        #     Parent Loop BB47_29 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-464(%rbp), %eax
	cmpl	-180(%rbp), %eax
	jbe	.LBB47_420
# BB#421:                               #   in Loop: Header=BB47_29 Depth=2
	incq	-120(%rbp)
	jmp	.LBB47_29
	.align	16, 0x90
.LBB47_434:                             #   in Loop: Header=BB47_433 Depth=3
	movq	-224(%rbp), %rax
	movl	-468(%rbp), %ecx
	orl	$16, (%rax,%rcx,8)
	movq	-224(%rbp), %rax
	movl	-468(%rbp), %ecx
	orl	$8, (%rax,%rcx,8)
	incl	-468(%rbp)
.LBB47_433:                             #   Parent Loop BB47_28 Depth=1
                                        #     Parent Loop BB47_29 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-468(%rbp), %eax
	cmpl	-180(%rbp), %eax
	jbe	.LBB47_434
# BB#435:                               #   in Loop: Header=BB47_29 Depth=2
	incq	-120(%rbp)
	jmp	.LBB47_29
.LBB47_195:                             #   in Loop: Header=BB47_29 Depth=2
	addq	$2, -136(%rbp)
	jmp	.LBB47_29
	.align	16, 0x90
.LBB47_184:                             #   in Loop: Header=BB47_181 Depth=3
	incl	-300(%rbp)
.LBB47_181:                             #   Parent Loop BB47_28 Depth=1
                                        #     Parent Loop BB47_29 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	-136(%rbp), %rcx
	movzbl	1(%rcx), %eax
	movzbl	(%rcx), %ecx
	addl	%eax, %ecx
	cmpl	%ecx, -300(%rbp)
	jae	.LBB47_185
# BB#182:                               #   in Loop: Header=BB47_181 Depth=3
	movl	-300(%rbp), %eax
	movq	-208(%rbp), %rcx
	movq	(%rcx,%rax,8), %rcx
	movq	-192(%rbp), %rdx
	movq	%rcx, (%rdx,%rax,8)
	movl	-300(%rbp), %eax
	movq	-216(%rbp), %rcx
	movl	(%rcx,%rax,8), %ecx
	movq	-192(%rbp), %rdx
	cmpl	(%rdx,%rax,8), %ecx
	jl	.LBB47_184
# BB#183:                               #   in Loop: Header=BB47_181 Depth=3
	movl	-300(%rbp), %eax
	movq	-216(%rbp), %rcx
	movq	(%rcx,%rax,8), %rcx
	movq	-200(%rbp), %rdx
	movq	%rcx, (%rdx,%rax,8)
	jmp	.LBB47_184
.LBB47_383:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rax
	cmpq	-48(%rbp), %rax
	jne	.LBB47_385
# BB#384:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-88(%rbp), %rax
	jmp	.LBB47_386
.LBB47_402:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-48(%rbp), %rax
	decq	%rax
	cmpq	%rax, -120(%rbp)
	jne	.LBB47_404
# BB#403:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-88(%rbp), %rax
	movsbl	-1(%rax), %eax
	jmp	.LBB47_406
.LBB47_345:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-48(%rbp), %rcx
	decq	%rcx
	cmpq	%rcx, -120(%rbp)
	jne	.LBB47_347
# BB#346:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-88(%rbp), %rcx
	movsbl	-1(%rcx), %ecx
	jmp	.LBB47_349
.LBB47_364:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-48(%rbp), %rcx
	decq	%rcx
	cmpq	%rcx, -120(%rbp)
	jne	.LBB47_366
# BB#365:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-88(%rbp), %rcx
	movsbl	-1(%rcx), %ecx
	jmp	.LBB47_368
.LBB47_185:                             #   in Loop: Header=BB47_29 Depth=2
	incq	-80(%rbp)
	movq	-80(%rbp), %rax
	movzbl	(%rax), %eax
	movl	%eax, -72(%rbp)
	movq	-80(%rbp), %rcx
	movsbl	1(%rcx), %ecx
	shll	$8, %ecx
	orl	%eax, %ecx
	movl	%ecx, -72(%rbp)
	addq	$2, -80(%rbp)
	movabsq	$34359738352, %rbx      # imm = 0x7FFFFFFF0
	.align	16, 0x90
.LBB47_186:                             #   Parent Loop BB47_28 Depth=1
                                        #     Parent Loop BB47_29 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-160(%rbp), %eax
	subl	-156(%rbp), %eax
	movl	-180(%rbp), %ecx
	subl	-176(%rbp), %ecx
	leal	7(%rcx,%rcx,2), %ecx
	cmpl	%ecx, %eax
	jae	.LBB47_192
# BB#187:                               #   in Loop: Header=BB47_186 Depth=3
	movl	-172(%rbp), %eax
	leal	1(%rax,%rax,2), %eax
	imull	re_max_failures(%rip), %eax
	cmpl	%eax, -160(%rbp)
	ja	.LBB47_191
# BB#188:                               #   in Loop: Header=BB47_186 Depth=3
	movl	-160(%rbp), %eax
	addl	%eax, %eax
	shlq	$3, %rax
	andq	%rbx, %rax
	movq	%rsp, %rdi
	subq	%rax, %rdi
	movq	%rdi, %rsp
	movq	%rdi, -312(%rbp)
	movq	-168(%rbp), %rsi
	movl	-160(%rbp), %edx
	shlq	$3, %rdx
	callq	memcpy
	xorl	%eax, %eax
	movq	-312(%rbp), %rcx
	movq	%rcx, -168(%rbp)
	testq	%rcx, %rcx
	je	.LBB47_190
# BB#189:                               #   in Loop: Header=BB47_186 Depth=3
	shll	-160(%rbp)
	movl	$1, %eax
.LBB47_190:                             #   in Loop: Header=BB47_186 Depth=3
	testl	%eax, %eax
	jne	.LBB47_186
	jmp	.LBB47_191
.LBB47_385:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rax
.LBB47_386:                             #   in Loop: Header=BB47_29 Depth=2
	movsbl	-1(%rax), %eax
.LBB47_387:                             #   in Loop: Header=BB47_29 Depth=2
	movslq	%eax, %rax
	movsbl	re_syntax_table(%rax), %eax
	cmpl	$1, %eax
	jne	.LBB47_29
	jmp	.LBB47_438
.LBB47_404:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rax
.LBB47_405:                             #   in Loop: Header=BB47_29 Depth=2
	movsbl	(%rax), %eax
.LBB47_406:                             #   in Loop: Header=BB47_29 Depth=2
	movslq	%eax, %rax
	movsbl	re_syntax_table(%rax), %eax
	cmpl	$1, %eax
	jne	.LBB47_29
.LBB47_407:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rax
	cmpq	-96(%rbp), %rax
	je	.LBB47_29
	jmp	.LBB47_438
.LBB47_347:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rcx
.LBB47_348:                             #   in Loop: Header=BB47_29 Depth=2
	movsbl	(%rcx), %ecx
.LBB47_349:                             #   in Loop: Header=BB47_29 Depth=2
	movslq	%ecx, %rcx
	movsbl	re_syntax_table(%rcx), %ecx
	cmpl	$1, %ecx
	sete	%cl
	movzbl	%cl, %ecx
	cmpl	%ecx, %eax
	jne	.LBB47_29
	jmp	.LBB47_438
.LBB47_366:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rcx
.LBB47_367:                             #   in Loop: Header=BB47_29 Depth=2
	movsbl	(%rcx), %ecx
.LBB47_368:                             #   in Loop: Header=BB47_29 Depth=2
	movslq	%ecx, %rcx
	movsbl	re_syntax_table(%rcx), %ecx
	cmpl	$1, %ecx
	sete	%cl
	movzbl	%cl, %ecx
	cmpl	%ecx, %eax
	je	.LBB47_29
	jmp	.LBB47_438
.LBB47_192:                             #   in Loop: Header=BB47_29 Depth=2
	movl	-176(%rbp), %eax
	movl	%eax, -316(%rbp)
	jmp	.LBB47_193
	.align	16, 0x90
.LBB47_194:                             #   in Loop: Header=BB47_193 Depth=3
	movslq	-316(%rbp), %rax
	movq	-192(%rbp), %rcx
	movq	(%rcx,%rax,8), %rax
	movl	-156(%rbp), %ecx
	leal	1(%rcx), %edx
	movl	%edx, -156(%rbp)
	movq	-168(%rbp), %rdx
	movq	%rax, (%rdx,%rcx,8)
	movslq	-316(%rbp), %rax
	movq	-200(%rbp), %rcx
	movq	(%rcx,%rax,8), %rax
	movl	-156(%rbp), %ecx
	leal	1(%rcx), %edx
	movl	%edx, -156(%rbp)
	movq	-168(%rbp), %rdx
	movq	%rax, (%rdx,%rcx,8)
	movslq	-316(%rbp), %rax
	movq	-224(%rbp), %rcx
	movq	(%rcx,%rax,8), %rax
	movl	-156(%rbp), %ecx
	leal	1(%rcx), %edx
	movl	%edx, -156(%rbp)
	movq	-168(%rbp), %rdx
	movq	%rax, (%rdx,%rcx,8)
	incl	-316(%rbp)
.LBB47_193:                             #   Parent Loop BB47_28 Depth=1
                                        #     Parent Loop BB47_29 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-316(%rbp), %eax
	cmpl	-180(%rbp), %eax
	jbe	.LBB47_194
# BB#437:                               #   in Loop: Header=BB47_29 Depth=2
	movl	-156(%rbp), %eax
	leal	1(%rax), %edx
	movl	-176(%rbp), %ecx
	movl	%edx, -156(%rbp)
	movq	-168(%rbp), %rdx
	movq	%rcx, (%rdx,%rax,8)
	movl	-156(%rbp), %eax
	leal	1(%rax), %edx
	movl	-180(%rbp), %ecx
	movl	%edx, -156(%rbp)
	movq	-168(%rbp), %rdx
	movq	%rcx, (%rdx,%rax,8)
	movslq	-72(%rbp), %rax
	addq	-80(%rbp), %rax
	movl	-156(%rbp), %ecx
	leal	1(%rcx), %edx
	movl	%edx, -156(%rbp)
	movq	-168(%rbp), %rdx
	movq	%rax, (%rdx,%rcx,8)
	movl	-156(%rbp), %eax
	leal	1(%rax), %edx
	movq	-120(%rbp), %rcx
	movl	%edx, -156(%rbp)
	movq	-168(%rbp), %rdx
	movq	%rcx, (%rdx,%rax,8)
	jmp	.LBB47_438
	.align	16, 0x90
.LBB47_205:                             #   in Loop: Header=BB47_29 Depth=2
	movslq	-340(%rbp), %rax
	movq	-200(%rbp), %rcx
	movq	(%rcx,%rax,8), %rax
.LBB47_207:                             #   in Loop: Header=BB47_29 Depth=2
	movq	%rax, -336(%rbp)
	jmp	.LBB47_208
	.align	16, 0x90
.LBB47_222:                             #   in Loop: Header=BB47_208 Depth=3
	movslq	-72(%rbp), %rax
	addq	%rax, -120(%rbp)
	movslq	-72(%rbp), %rax
	addq	%rax, -328(%rbp)
.LBB47_208:                             #   Parent Loop BB47_28 Depth=1
                                        #     Parent Loop BB47_29 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB47_213 Depth 4
	movq	-328(%rbp), %rax
	cmpq	-336(%rbp), %rax
	jne	.LBB47_212
# BB#209:                               #   in Loop: Header=BB47_208 Depth=3
	movq	-336(%rbp), %rax
	cmpq	-112(%rbp), %rax
	je	.LBB47_212
# BB#210:                               #   in Loop: Header=BB47_208 Depth=3
	movslq	-340(%rbp), %rax
	movq	-200(%rbp), %rcx
	movq	-336(%rbp), %rdx
	cmpq	(%rcx,%rax,8), %rdx
	jne	.LBB47_211
.LBB47_212:                             #   in Loop: Header=BB47_208 Depth=3
	movq	-328(%rbp), %rax
	cmpq	-336(%rbp), %rax
	je	.LBB47_29
	jmp	.LBB47_213
	.align	16, 0x90
.LBB47_215:                             #   in Loop: Header=BB47_213 Depth=4
	movq	-48(%rbp), %rax
	movq	%rax, -120(%rbp)
	movq	-112(%rbp), %rax
	movq	%rax, -128(%rbp)
.LBB47_213:                             #   Parent Loop BB47_28 Depth=1
                                        #     Parent Loop BB47_29 Depth=2
                                        #       Parent Loop BB47_208 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movq	-120(%rbp), %rax
	cmpq	-128(%rbp), %rax
	jne	.LBB47_216
# BB#214:                               #   in Loop: Header=BB47_213 Depth=4
	movq	-128(%rbp), %rax
	cmpq	-112(%rbp), %rax
	je	.LBB47_438
	jmp	.LBB47_215
.LBB47_216:                             #   in Loop: Header=BB47_208 Depth=3
	movl	-128(%rbp), %eax
	subl	-120(%rbp), %eax
	movl	%eax, -72(%rbp)
	movq	-336(%rbp), %rax
	subq	-328(%rbp), %rax
	movslq	-72(%rbp), %rcx
	cmpq	%rax, %rcx
	jle	.LBB47_218
# BB#217:                               #   in Loop: Header=BB47_208 Depth=3
	movl	-336(%rbp), %eax
	subl	-328(%rbp), %eax
	movl	%eax, -72(%rbp)
.LBB47_218:                             #   in Loop: Header=BB47_208 Depth=3
	cmpq	$0, -152(%rbp)
	je	.LBB47_220
# BB#219:                               #   in Loop: Header=BB47_208 Depth=3
	movq	-152(%rbp), %rcx
	movl	-72(%rbp), %edx
	movq	-328(%rbp), %rsi
	movq	-120(%rbp), %rdi
	xorb	%al, %al
	callq	bcmp_translate
	jmp	.LBB47_221
.LBB47_220:                             #   in Loop: Header=BB47_208 Depth=3
	movslq	-72(%rbp), %rdx
	movq	-328(%rbp), %rsi
	movq	-120(%rbp), %rdi
	callq	memcmp
.LBB47_221:                             #   in Loop: Header=BB47_208 Depth=3
	testl	%eax, %eax
	je	.LBB47_222
	.align	16, 0x90
.LBB47_438:                             #   Parent Loop BB47_28 Depth=1
                                        #     Parent Loop BB47_29 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB47_442 Depth 4
	cmpl	$0, -156(%rbp)
	je	.LBB47_457
# BB#439:                               #   in Loop: Header=BB47_438 Depth=3
	movl	-156(%rbp), %eax
	decl	%eax
	movl	%eax, -156(%rbp)
	movq	-168(%rbp), %rcx
	movq	(%rcx,%rax,8), %rax
	movq	%rax, -480(%rbp)
	testq	%rax, %rax
	je	.LBB47_441
# BB#440:                               #   in Loop: Header=BB47_438 Depth=3
	movq	-480(%rbp), %rax
	movq	%rax, -120(%rbp)
.LBB47_441:                             #   in Loop: Header=BB47_438 Depth=3
	movl	-156(%rbp), %eax
	decl	%eax
	movl	%eax, -156(%rbp)
	movq	-168(%rbp), %rcx
	movq	(%rcx,%rax,8), %rax
	movq	%rax, -136(%rbp)
	movl	-156(%rbp), %eax
	decl	%eax
	movl	%eax, -156(%rbp)
	movq	-168(%rbp), %rcx
	movl	(%rcx,%rax,8), %eax
	movl	%eax, -180(%rbp)
	movl	-156(%rbp), %eax
	decl	%eax
	movl	%eax, -156(%rbp)
	movq	-168(%rbp), %rcx
	movl	(%rcx,%rax,8), %eax
	movl	%eax, -176(%rbp)
	movl	-180(%rbp), %eax
	movl	%eax, -472(%rbp)
	jmp	.LBB47_442
	.align	16, 0x90
.LBB47_443:                             #   in Loop: Header=BB47_442 Depth=4
	movl	-156(%rbp), %eax
	decl	%eax
	movl	%eax, -156(%rbp)
	movq	-168(%rbp), %rcx
	movq	(%rcx,%rax,8), %rax
	movq	-224(%rbp), %rcx
	movslq	-472(%rbp), %rdx
	movq	%rax, (%rcx,%rdx,8)
	movl	-156(%rbp), %eax
	decl	%eax
	movl	%eax, -156(%rbp)
	movq	-168(%rbp), %rcx
	movq	(%rcx,%rax,8), %rax
	movq	-200(%rbp), %rcx
	movslq	-472(%rbp), %rdx
	movq	%rax, (%rcx,%rdx,8)
	movl	-156(%rbp), %eax
	decl	%eax
	movl	%eax, -156(%rbp)
	movq	-168(%rbp), %rcx
	movq	(%rcx,%rax,8), %rax
	movq	-192(%rbp), %rcx
	movslq	-472(%rbp), %rdx
	movq	%rax, (%rcx,%rdx,8)
	decl	-472(%rbp)
.LBB47_442:                             #   Parent Loop BB47_28 Depth=1
                                        #     Parent Loop BB47_29 Depth=2
                                        #       Parent Loop BB47_438 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	-472(%rbp), %eax
	cmpl	-176(%rbp), %eax
	jae	.LBB47_443
# BB#444:                               #   in Loop: Header=BB47_438 Depth=3
	cmpq	$0, -136(%rbp)
	je	.LBB47_438
# BB#445:                               #   in Loop: Header=BB47_438 Depth=3
	movq	-136(%rbp), %rax
	cmpq	-144(%rbp), %rax
	jae	.LBB47_454
# BB#446:                               #   in Loop: Header=BB47_438 Depth=3
	movb	$0, -481(%rbp)
	movq	-136(%rbp), %rax
	movzbl	(%rax), %eax
	cmpl	$12, %eax
	je	.LBB47_450
# BB#447:                               #   in Loop: Header=BB47_438 Depth=3
	leal	-16(%rax), %ecx
	cmpl	$2, %ecx
	jb	.LBB47_450
# BB#448:                               #   in Loop: Header=BB47_438 Depth=3
	cmpl	$21, %eax
	jne	.LBB47_454
# BB#449:                               #   in Loop: Header=BB47_438 Depth=3
	movb	$1, -481(%rbp)
.LBB47_450:                             #   in Loop: Header=BB47_438 Depth=3
	movq	-136(%rbp), %rax
	incq	%rax
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	movzbl	(%rax), %eax
	movl	%eax, -72(%rbp)
	movq	-80(%rbp), %rcx
	movsbl	1(%rcx), %ecx
	shll	$8, %ecx
	orl	%eax, %ecx
	movl	%ecx, -72(%rbp)
	addq	$2, -80(%rbp)
	movslq	-72(%rbp), %rax
	addq	%rax, -80(%rbp)
	movsbl	-481(%rbp), %eax
	testl	%eax, %eax
	je	.LBB47_452
# BB#451:                               #   in Loop: Header=BB47_438 Depth=3
	movq	-80(%rbp), %rax
	cmpb	$20, (%rax)
	je	.LBB47_438
.LBB47_452:                             #   in Loop: Header=BB47_438 Depth=3
	cmpb	$0, -481(%rbp)
	jne	.LBB47_454
# BB#453:                               #   in Loop: Header=BB47_438 Depth=3
	movq	-80(%rbp), %rax
	cmpb	$14, (%rax)
	je	.LBB47_438
.LBB47_454:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jb	.LBB47_29
# BB#455:                               #   in Loop: Header=BB47_29 Depth=2
	movq	-120(%rbp), %rax
	cmpq	-88(%rbp), %rax
	ja	.LBB47_29
	jmp	.LBB47_456
.LBB47_211:                             #   in Loop: Header=BB47_29 Depth=2
	movq	-48(%rbp), %rax
	movq	%rax, -328(%rbp)
	jmp	.LBB47_205
.LBB47_457:
	cmpl	$0, -228(%rbp)
	jne	.LBB47_44
.LBB47_458:
	movl	$-1, -12(%rbp)
	.align	16, 0x90
.LBB47_459:
	movl	-12(%rbp), %eax
	leaq	-8(%rbp), %rsp
	popq	%rbx
	popq	%rbp
	ret
.LBB47_436:
	callq	abort
.LBB47_43:
	cmpl	$0, -228(%rbp)
	je	.LBB47_51
.LBB47_44:
	movq	-256(%rbp), %rax
	movq	%rax, -120(%rbp)
	cmpq	-32(%rbp), %rax
	jb	.LBB47_47
# BB#45:
	movq	-120(%rbp), %rax
	cmpq	-88(%rbp), %rax
	ja	.LBB47_47
# BB#46:
	movq	-104(%rbp), %rax
	jmp	.LBB47_48
.LBB47_47:
	movq	-112(%rbp), %rax
.LBB47_48:
	movq	%rax, -128(%rbp)
	movl	$1, -72(%rbp)
	jmp	.LBB47_49
	.align	16, 0x90
.LBB47_50:                              #   in Loop: Header=BB47_49 Depth=1
	movslq	-72(%rbp), %rax
	movq	-240(%rbp), %rcx
	movq	(%rcx,%rax,8), %rcx
	movq	-192(%rbp), %rdx
	movq	%rcx, (%rdx,%rax,8)
	movslq	-72(%rbp), %rax
	movq	-248(%rbp), %rcx
	movq	(%rcx,%rax,8), %rcx
	movq	-200(%rbp), %rdx
	movq	%rcx, (%rdx,%rax,8)
	incl	-72(%rbp)
.LBB47_49:                              # =>This Inner Loop Header: Depth=1
	movl	-72(%rbp), %eax
	cmpl	-172(%rbp), %eax
	jb	.LBB47_50
.LBB47_51:
	cmpq	$0, -64(%rbp)
	je	.LBB47_92
# BB#52:
	movq	-24(%rbp), %rax
	btl	$4, 56(%rax)
	jb	.LBB47_92
# BB#53:
	movq	-24(%rbp), %rax
	movl	56(%rax), %eax
	shrl	%eax
	testb	$3, %al
	je	.LBB47_54
# BB#59:
	movq	-24(%rbp), %rax
	movl	56(%rax), %eax
	shrl	%eax
	andl	$3, %eax
	cmpl	$1, %eax
	jne	.LBB47_65
# BB#60:
	movl	-172(%rbp), %eax
	incl	%eax
	movq	-64(%rbp), %rcx
	cmpl	%eax, (%rcx)
	jae	.LBB47_65
# BB#61:
	movl	-172(%rbp), %eax
	incl	%eax
	movq	-64(%rbp), %rcx
	movl	%eax, (%rcx)
	movq	-64(%rbp), %rax
	movq	8(%rax), %rdi
	movl	(%rax), %esi
	shlq	$2, %rsi
	callq	realloc
	movq	-64(%rbp), %rcx
	movq	%rax, 8(%rcx)
	movq	-64(%rbp), %rax
	movq	16(%rax), %rdi
	movl	(%rax), %esi
	shlq	$2, %rsi
	callq	realloc
	movq	-64(%rbp), %rcx
	movq	%rax, 16(%rcx)
	movq	-64(%rbp), %rax
	cmpq	$0, 8(%rax)
	je	.LBB47_63
# BB#62:
	movq	-64(%rbp), %rax
	cmpq	$0, 16(%rax)
	jne	.LBB47_65
.LBB47_63:
	movl	$-2, -12(%rbp)
	jmp	.LBB47_459
.LBB47_307:
	movl	$-2, -12(%rbp)
	jmp	.LBB47_459
.LBB47_317:
	movl	$-2, -12(%rbp)
	jmp	.LBB47_459
.LBB47_249:
	movl	$-2, -12(%rbp)
	jmp	.LBB47_459
.LBB47_54:
	movl	-172(%rbp), %ecx
	incl	%ecx
	movl	$30, %eax
	cmpl	$30, %ecx
	jb	.LBB47_56
# BB#55:
	movl	-172(%rbp), %eax
	incl	%eax
.LBB47_56:
	movq	-64(%rbp), %rcx
	movl	%eax, (%rcx)
	movq	-64(%rbp), %rax
	movl	(%rax), %edi
	shlq	$2, %rdi
	callq	malloc
	movq	-64(%rbp), %rcx
	movq	%rax, 8(%rcx)
	movq	-64(%rbp), %rax
	movl	(%rax), %edi
	shlq	$2, %rdi
	callq	malloc
	movq	-64(%rbp), %rcx
	movq	%rax, 16(%rcx)
	movq	-64(%rbp), %rax
	cmpq	$0, 8(%rax)
	je	.LBB47_58
# BB#57:
	movq	-64(%rbp), %rax
	cmpq	$0, 16(%rax)
	je	.LBB47_58
# BB#64:
	movq	-24(%rbp), %rax
	movl	56(%rax), %ecx
	andl	$-7, %ecx
	orl	$2, %ecx
	movl	%ecx, 56(%rax)
.LBB47_65:
	movq	-64(%rbp), %rax
	cmpl	$0, (%rax)
	je	.LBB47_70
# BB#66:
	movq	-64(%rbp), %rax
	movq	8(%rax), %rax
	movl	-56(%rbp), %ecx
	movl	%ecx, (%rax)
	movq	-128(%rbp), %rax
	cmpq	-104(%rbp), %rax
	je	.LBB47_67
# BB#68:
	movq	-120(%rbp), %rcx
	subq	-48(%rbp), %rcx
	movslq	-36(%rbp), %rax
	addq	%rcx, %rax
	jmp	.LBB47_69
.LBB47_268:
	movl	$-2, -12(%rbp)
	jmp	.LBB47_459
.LBB47_191:
	movl	$-2, -12(%rbp)
	jmp	.LBB47_459
.LBB47_58:
	movl	$-2, -12(%rbp)
	jmp	.LBB47_459
.LBB47_67:
	movq	-120(%rbp), %rax
	subq	-32(%rbp), %rax
.LBB47_69:
	movq	-64(%rbp), %rcx
	movq	16(%rcx), %rcx
	movl	%eax, (%rcx)
.LBB47_70:
	movl	$1, -72(%rbp)
	jmp	.LBB47_71
	.align	16, 0x90
.LBB47_77:                              #   in Loop: Header=BB47_71 Depth=1
	movq	-64(%rbp), %rax
	movq	16(%rax), %rax
	movslq	-72(%rbp), %rcx
	movl	$-1, (%rax,%rcx,4)
	movq	-64(%rbp), %rax
	movq	8(%rax), %rax
	movslq	-72(%rbp), %rcx
	movl	$-1, (%rax,%rcx,4)
	incl	-72(%rbp)
	.align	16, 0x90
.LBB47_71:                              # =>This Inner Loop Header: Depth=1
	movl	-72(%rbp), %eax
	movq	-64(%rbp), %rcx
	movl	-172(%rbp), %edx
	cmpl	(%rcx), %edx
	jae	.LBB47_73
# BB#72:                                #   in Loop: Header=BB47_71 Depth=1
	movl	-172(%rbp), %ecx
	jmp	.LBB47_74
.LBB47_73:                              #   in Loop: Header=BB47_71 Depth=1
	movq	-64(%rbp), %rcx
	movl	(%rcx), %ecx
.LBB47_74:                              #   in Loop: Header=BB47_71 Depth=1
	cmpl	%ecx, %eax
	jae	.LBB47_89
# BB#75:                                #   in Loop: Header=BB47_71 Depth=1
	movslq	-72(%rbp), %rax
	movq	-192(%rbp), %rcx
	cmpq	$-1, (%rcx,%rax,8)
	je	.LBB47_77
# BB#76:                                #   in Loop: Header=BB47_71 Depth=1
	movslq	-72(%rbp), %rax
	movq	-200(%rbp), %rcx
	cmpq	$-1, (%rcx,%rax,8)
	je	.LBB47_77
# BB#78:                                #   in Loop: Header=BB47_71 Depth=1
	cmpl	$0, -36(%rbp)
	je	.LBB47_82
# BB#79:                                #   in Loop: Header=BB47_71 Depth=1
	movslq	-72(%rbp), %rax
	movq	-192(%rbp), %rcx
	movq	-32(%rbp), %rdx
	cmpq	(%rcx,%rax,8), %rdx
	ja	.LBB47_82
# BB#80:                                #   in Loop: Header=BB47_71 Depth=1
	movslq	-36(%rbp), %rax
	addq	-32(%rbp), %rax
	movslq	-72(%rbp), %rcx
	movq	-192(%rbp), %rdx
	cmpq	%rax, (%rdx,%rcx,8)
	ja	.LBB47_82
# BB#81:                                #   in Loop: Header=BB47_71 Depth=1
	movslq	-72(%rbp), %rax
	movq	-192(%rbp), %rcx
	movq	(%rcx,%rax,8), %rax
	subq	-32(%rbp), %rax
	jmp	.LBB47_83
.LBB47_82:                              #   in Loop: Header=BB47_71 Depth=1
	movslq	-72(%rbp), %rax
	movq	-192(%rbp), %rcx
	movq	(%rcx,%rax,8), %rcx
	subq	-48(%rbp), %rcx
	movslq	-36(%rbp), %rax
	addq	%rcx, %rax
.LBB47_83:                              #   in Loop: Header=BB47_71 Depth=1
	movq	-64(%rbp), %rcx
	movq	8(%rcx), %rcx
	movslq	-72(%rbp), %rdx
	movl	%eax, (%rcx,%rdx,4)
	cmpl	$0, -36(%rbp)
	je	.LBB47_87
# BB#84:                                #   in Loop: Header=BB47_71 Depth=1
	movslq	-72(%rbp), %rax
	movq	-200(%rbp), %rcx
	movq	-32(%rbp), %rdx
	cmpq	(%rcx,%rax,8), %rdx
	ja	.LBB47_87
# BB#85:                                #   in Loop: Header=BB47_71 Depth=1
	movslq	-36(%rbp), %rax
	addq	-32(%rbp), %rax
	movslq	-72(%rbp), %rcx
	movq	-200(%rbp), %rdx
	cmpq	%rax, (%rdx,%rcx,8)
	ja	.LBB47_87
# BB#86:                                #   in Loop: Header=BB47_71 Depth=1
	movslq	-72(%rbp), %rax
	movq	-200(%rbp), %rcx
	movq	(%rcx,%rax,8), %rax
	subq	-32(%rbp), %rax
	jmp	.LBB47_88
.LBB47_87:                              #   in Loop: Header=BB47_71 Depth=1
	movslq	-72(%rbp), %rax
	movq	-200(%rbp), %rcx
	movq	(%rcx,%rax,8), %rcx
	subq	-48(%rbp), %rcx
	movslq	-36(%rbp), %rax
	addq	%rcx, %rax
.LBB47_88:                              #   in Loop: Header=BB47_71 Depth=1
	movq	-64(%rbp), %rcx
	movq	16(%rcx), %rcx
	movslq	-72(%rbp), %rdx
	movl	%eax, (%rcx,%rdx,4)
	incl	-72(%rbp)
	jmp	.LBB47_71
.LBB47_89:
	movl	-172(%rbp), %eax
	movl	%eax, -72(%rbp)
	jmp	.LBB47_90
	.align	16, 0x90
.LBB47_91:                              #   in Loop: Header=BB47_90 Depth=1
	movq	-64(%rbp), %rax
	movq	16(%rax), %rax
	movslq	-72(%rbp), %rcx
	movl	$-1, (%rax,%rcx,4)
	movq	-64(%rbp), %rax
	movq	8(%rax), %rax
	movslq	-72(%rbp), %rcx
	movl	$-1, (%rax,%rcx,4)
	incl	-72(%rbp)
.LBB47_90:                              # =>This Inner Loop Header: Depth=1
	movq	-64(%rbp), %rax
	movl	-72(%rbp), %ecx
	cmpl	(%rax), %ecx
	jb	.LBB47_91
.LBB47_92:
	movslq	-56(%rbp), %rcx
	movq	-120(%rbp), %rax
	subq	%rcx, %rax
	movq	-128(%rbp), %rcx
	cmpq	-104(%rbp), %rcx
	je	.LBB47_93
# BB#94:
	movslq	-36(%rbp), %rdx
	movq	-48(%rbp), %rcx
	subq	%rdx, %rcx
	jmp	.LBB47_95
.LBB47_93:
	movq	-32(%rbp), %rcx
.LBB47_95:
	subl	%ecx, %eax
	movl	%eax, -72(%rbp)
	movl	%eax, -12(%rbp)
	jmp	.LBB47_459
.Ltmp160:
	.size	re_match_2, .Ltmp160-re_match_2
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.align	8
.LJTI47_0:
	.quad	.LBB47_29
	.quad	.LBB47_98
	.quad	.LBB47_112
	.quad	.LBB47_129
	.quad	.LBB47_129
	.quad	.LBB47_144
	.quad	.LBB47_153
	.quad	.LBB47_196
	.quad	.LBB47_223
	.quad	.LBB47_232
	.quad	.LBB47_238
	.quad	.LBB47_407
	.quad	.LBB47_296
	.quad	.LBB47_296
	.quad	.LBB47_254
	.quad	.LBB47_243
	.quad	.LBB47_297
	.quad	.LBB47_273
	.quad	.LBB47_302
	.quad	.LBB47_312
	.quad	.LBB47_323
	.quad	.LBB47_327
	.quad	.LBB47_330
	.quad	.LBB47_408
	.quad	.LBB47_422
	.quad	.LBB47_369
	.quad	.LBB47_388
	.quad	.LBB47_331
	.quad	.LBB47_350

	.text
	.globl	re_match
	.align	16, 0x90
	.type	re_match,@function
re_match:                               # @re_match
	.cfi_startproc
# BB#0:
	subq	$56, %rsp
.Ltmp162:
	.cfi_def_cfa_offset 64
	movq	%rdi, 48(%rsp)
	movq	%rsi, 40(%rsp)
	movl	%edx, 36(%rsp)
	movl	%ecx, 32(%rsp)
	movq	%r8, 24(%rsp)
	movl	32(%rsp), %r9d
	movq	40(%rsp), %rcx
	movq	48(%rsp), %rdi
	movl	36(%rsp), %eax
	movl	%eax, 8(%rsp)
	movq	%r8, (%rsp)
	movl	$0, %esi
	xorl	%edx, %edx
	movl	%eax, %r8d
	callq	re_match_2
	addq	$56, %rsp
	ret
.Ltmp163:
	.size	re_match, .Ltmp163-re_match
	.cfi_endproc

	.align	16, 0x90
	.type	regex_compile,@function
regex_compile:                          # @regex_compile
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp169:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp170:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp171:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp172:
	.cfi_def_cfa_offset 40
	subq	$440, %rsp              # imm = 0x1B8
.Ltmp173:
	.cfi_def_cfa_offset 480
.Ltmp174:
	.cfi_offset %rbx, -40
.Ltmp175:
	.cfi_offset %r14, -32
.Ltmp176:
	.cfi_offset %r15, -24
.Ltmp177:
	.cfi_offset %rbp, -16
	movq	%rdi, 424(%rsp)
	movl	%esi, 420(%rsp)
	movl	%edx, 416(%rsp)
	movq	%rcx, 408(%rsp)
	movq	424(%rsp), %rax
	movq	%rax, 360(%rsp)
	movslq	420(%rsp), %rax
	addq	424(%rsp), %rax
	movq	%rax, 352(%rsp)
	movq	408(%rsp), %rax
	movq	40(%rax), %rax
	movq	%rax, 344(%rsp)
	movq	$0, 336(%rsp)
	movq	$0, 328(%rsp)
	movq	$0, 304(%rsp)
	movl	$0, 300(%rsp)
	movl	$640, %edi              # imm = 0x280
	callq	malloc
	movq	%rax, 368(%rsp)
	testq	%rax, %rax
	je	.LBB49_1
# BB#2:
	movl	$32, 376(%rsp)
	movl	$0, 380(%rsp)
	movq	408(%rsp), %rax
	movl	416(%rsp), %ecx
	movl	%ecx, 24(%rax)
	movq	408(%rsp), %rax
	andl	$-9, 56(%rax)
	movq	408(%rsp), %rax
	andl	$-65, 56(%rax)
	movq	408(%rsp), %rax
	andl	$-33, 56(%rax)
	movq	408(%rsp), %rax
	movq	$0, 16(%rax)
	movq	408(%rsp), %rax
	movq	$0, 48(%rax)
	callq	init_syntax_once
	movq	408(%rsp), %rax
	cmpq	$0, 8(%rax)
	jne	.LBB49_9
# BB#3:
	movq	408(%rsp), %rax
	cmpq	$0, (%rax)
	je	.LBB49_5
# BB#4:
	movq	408(%rsp), %rax
	movq	(%rax), %rdi
	movl	$32, %esi
	callq	realloc
	jmp	.LBB49_6
.LBB49_1:
	movl	$12, 436(%rsp)
	jmp	.LBB49_776
.LBB49_5:
	movl	$32, %edi
	callq	malloc
.LBB49_6:
	movq	408(%rsp), %rcx
	movq	%rax, (%rcx)
	movq	408(%rsp), %rax
	cmpq	$0, (%rax)
	je	.LBB49_7
# BB#8:
	movq	408(%rsp), %rax
	movq	$32, 8(%rax)
.LBB49_9:
	movq	408(%rsp), %rax
	movq	(%rax), %rax
	movq	%rax, 384(%rsp)
	movq	%rax, 320(%rsp)
	movl	$1, %ebp
	leaq	360(%rsp), %r14
	leaq	193(%rsp), %r15
	jmp	.LBB49_10
.LBB49_7:
	movl	$12, 436(%rsp)
	jmp	.LBB49_776
	.align	16, 0x90
.LBB49_770:                             #   in Loop: Header=BB49_10 Depth=1
	movq	384(%rsp), %rax
	leaq	1(%rax), %rcx
	movb	407(%rsp), %dl
	movq	%rcx, 384(%rsp)
	movb	%dl, (%rax)
	movq	336(%rsp), %rax
	incb	(%rax)
	.align	16, 0x90
.LBB49_10:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB49_756 Depth 2
                                        #     Child Loop BB49_740 Depth 2
                                        #     Child Loop BB49_412 Depth 2
                                        #     Child Loop BB49_503 Depth 2
                                        #     Child Loop BB49_489 Depth 2
                                        #     Child Loop BB49_29 Depth 2
                                        #     Child Loop BB49_50 Depth 2
                                        #     Child Loop BB49_144 Depth 2
                                        #     Child Loop BB49_129 Depth 2
                                        #     Child Loop BB49_97 Depth 2
                                        #     Child Loop BB49_73 Depth 2
                                        #     Child Loop BB49_160 Depth 2
                                        #     Child Loop BB49_350 Depth 2
                                        #     Child Loop BB49_226 Depth 2
                                        #       Child Loop BB49_305 Depth 3
                                        #       Child Loop BB49_274 Depth 3
                                        #       Child Loop BB49_346 Depth 3
                                        #     Child Loop BB49_209 Depth 2
                                        #     Child Loop BB49_192 Depth 2
                                        #     Child Loop BB49_177 Depth 2
                                        #     Child Loop BB49_390 Depth 2
                                        #     Child Loop BB49_434 Depth 2
                                        #     Child Loop BB49_463 Depth 2
                                        #     Child Loop BB49_378 Depth 2
                                        #     Child Loop BB49_537 Depth 2
                                        #     Child Loop BB49_553 Depth 2
                                        #     Child Loop BB49_578 Depth 2
                                        #     Child Loop BB49_594 Depth 2
                                        #     Child Loop BB49_609 Depth 2
                                        #     Child Loop BB49_624 Depth 2
                                        #     Child Loop BB49_369 Depth 2
                                        #     Child Loop BB49_651 Depth 2
                                        #     Child Loop BB49_666 Depth 2
                                        #     Child Loop BB49_681 Depth 2
                                        #     Child Loop BB49_701 Depth 2
	movq	360(%rsp), %rax
	cmpq	352(%rsp), %rax
	je	.LBB49_771
# BB#11:                                #   in Loop: Header=BB49_10 Depth=1
	movq	360(%rsp), %rax
	cmpq	352(%rsp), %rax
	je	.LBB49_12
# BB#13:                                #   in Loop: Header=BB49_10 Depth=1
	movq	360(%rsp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, 360(%rsp)
	movb	(%rax), %al
	movb	%al, 407(%rsp)
	cmpq	$0, 344(%rsp)
	je	.LBB49_15
# BB#14:                                #   in Loop: Header=BB49_10 Depth=1
	movzbl	407(%rsp), %eax
	movq	344(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, 407(%rsp)
.LBB49_15:                              #   in Loop: Header=BB49_10 Depth=1
	movzbl	407(%rsp), %eax
	cmpl	$35, %eax
	jg	.LBB49_18
# BB#16:                                #   in Loop: Header=BB49_10 Depth=1
	cmpl	$10, %eax
	jne	.LBB49_721
# BB#17:                                #   in Loop: Header=BB49_10 Depth=1
	testb	$8, 417(%rsp)
	jne	.LBB49_377
	jmp	.LBB49_721
.LBB49_18:                              #   in Loop: Header=BB49_10 Depth=1
	cmpl	$122, %eax
	jg	.LBB49_32
# BB#19:                                #   in Loop: Header=BB49_10 Depth=1
	cmpl	$90, %eax
	jg	.LBB49_23
# BB#20:                                #   in Loop: Header=BB49_10 Depth=1
	cmpl	$62, %eax
	jg	.LBB49_65
# BB#21:                                #   in Loop: Header=BB49_10 Depth=1
	addl	$-36, %eax
	cmpl	$10, %eax
	ja	.LBB49_721
# BB#22:                                #   in Loop: Header=BB49_10 Depth=1
	jmpq	*.LJTI49_0(,%rax,8)
.LBB49_47:                              #   in Loop: Header=BB49_10 Depth=1
	movq	360(%rsp), %rax
	cmpq	352(%rsp), %rax
	je	.LBB49_50
# BB#48:                                #   in Loop: Header=BB49_10 Depth=1
	testb	$8, 416(%rsp)
	jne	.LBB49_50
# BB#49:                                #   in Loop: Header=BB49_10 Depth=1
	movl	416(%rsp), %edx
	movq	352(%rsp), %rsi
	movq	360(%rsp), %rdi
	xorb	%al, %al
	callq	at_endline_loc_p
	movsbl	%al, %eax
	testl	%eax, %eax
	je	.LBB49_721
	jmp	.LBB49_50
.LBB49_32:                              #   in Loop: Header=BB49_10 Depth=1
	cmpl	$123, %eax
	jne	.LBB49_33
# BB#356:                               #   in Loop: Header=BB49_10 Depth=1
	testb	$2, 417(%rsp)
	je	.LBB49_721
# BB#357:                               #   in Loop: Header=BB49_10 Depth=1
	testb	$16, 417(%rsp)
	jne	.LBB49_483
	jmp	.LBB49_721
.LBB49_23:                              #   in Loop: Header=BB49_10 Depth=1
	cmpl	$91, %eax
	jne	.LBB49_24
# BB#175:                               #   in Loop: Header=BB49_10 Depth=1
	movb	$0, 239(%rsp)
	movq	360(%rsp), %rax
	cmpq	352(%rsp), %rax
	jne	.LBB49_177
	jmp	.LBB49_176
	.align	16, 0x90
.LBB49_190:                             #   in Loop: Header=BB49_177 Depth=2
	movq	336(%rsp), %rax
	subq	224(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 336(%rsp)
	.align	16, 0x90
.LBB49_177:                             #   Parent Loop BB49_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	408(%rsp), %rax
	movq	384(%rsp), %rcx
	subq	(%rax), %rcx
	addq	$34, %rcx
	cmpq	8(%rax), %rcx
	jbe	.LBB49_191
# BB#178:                               #   in Loop: Header=BB49_177 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rax
	movq	%rax, 224(%rsp)
	movq	408(%rsp), %rax
	cmpq	$65536, 8(%rax)         # imm = 0x10000
	je	.LBB49_179
# BB#180:                               #   in Loop: Header=BB49_177 Depth=2
	movq	408(%rsp), %rax
	shlq	8(%rax)
	movq	408(%rsp), %rax
	cmpq	$65537, 8(%rax)         # imm = 0x10001
	jb	.LBB49_182
# BB#181:                               #   in Loop: Header=BB49_177 Depth=2
	movq	408(%rsp), %rax
	movq	$65536, 8(%rax)         # imm = 0x10000
.LBB49_182:                             #   in Loop: Header=BB49_177 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rdi
	movq	8(%rax), %rsi
	callq	realloc
	movq	408(%rsp), %rcx
	movq	%rax, (%rcx)
	movq	408(%rsp), %rax
	cmpq	$0, (%rax)
	je	.LBB49_183
# BB#184:                               #   in Loop: Header=BB49_177 Depth=2
	movq	408(%rsp), %rax
	movq	224(%rsp), %rcx
	cmpq	(%rax), %rcx
	je	.LBB49_177
# BB#185:                               #   in Loop: Header=BB49_177 Depth=2
	movq	384(%rsp), %rax
	subq	224(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 384(%rsp)
	movq	320(%rsp), %rax
	subq	224(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 320(%rsp)
	cmpq	$0, 304(%rsp)
	je	.LBB49_187
# BB#186:                               #   in Loop: Header=BB49_177 Depth=2
	movq	304(%rsp), %rax
	subq	224(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 304(%rsp)
.LBB49_187:                             #   in Loop: Header=BB49_177 Depth=2
	cmpq	$0, 328(%rsp)
	je	.LBB49_189
# BB#188:                               #   in Loop: Header=BB49_177 Depth=2
	movq	328(%rsp), %rax
	subq	224(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 328(%rsp)
.LBB49_189:                             #   in Loop: Header=BB49_177 Depth=2
	cmpq	$0, 336(%rsp)
	je	.LBB49_177
	jmp	.LBB49_190
.LBB49_33:                              #   in Loop: Header=BB49_10 Depth=1
	cmpl	$124, %eax
	jne	.LBB49_721
# BB#34:                                #   in Loop: Header=BB49_10 Depth=1
	testb	$-128, 417(%rsp)
	jne	.LBB49_377
	jmp	.LBB49_721
.LBB49_65:                              #   in Loop: Header=BB49_10 Depth=1
	cmpl	$63, %eax
	jne	.LBB49_721
.LBB49_66:                              #   in Loop: Header=BB49_10 Depth=1
	testb	$2, 416(%rsp)
	jne	.LBB49_721
# BB#67:                                #   in Loop: Header=BB49_10 Depth=1
	testb	$4, 417(%rsp)
	jne	.LBB49_721
	jmp	.LBB49_68
.LBB49_24:                              #   in Loop: Header=BB49_10 Depth=1
	cmpl	$92, %eax
	jne	.LBB49_25
# BB#358:                               #   in Loop: Header=BB49_10 Depth=1
	movq	360(%rsp), %rax
	cmpq	352(%rsp), %rax
	je	.LBB49_359
# BB#360:                               #   in Loop: Header=BB49_10 Depth=1
	movq	360(%rsp), %rax
	cmpq	352(%rsp), %rax
	je	.LBB49_361
# BB#362:                               #   in Loop: Header=BB49_10 Depth=1
	movq	360(%rsp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, 360(%rsp)
	movb	(%rax), %al
	movb	%al, 407(%rsp)
	movzbl	407(%rsp), %eax
	cmpl	$118, %eax
	jg	.LBB49_372
# BB#363:                               #   in Loop: Header=BB49_10 Depth=1
	cmpl	$86, %eax
	jg	.LBB49_366
# BB#364:                               #   in Loop: Header=BB49_10 Depth=1
	addl	$-39, %eax
	cmpl	$27, %eax
	ja	.LBB49_717
# BB#365:                               #   in Loop: Header=BB49_10 Depth=1
	jmpq	*.LJTI49_1(,%rax,8)
.LBB49_696:                             #   in Loop: Header=BB49_10 Depth=1
	testb	$64, 417(%rsp)
	jne	.LBB49_721
# BB#697:                               #   in Loop: Header=BB49_10 Depth=1
	movzbl	407(%rsp), %eax
	addl	$-48, %eax
	movb	%al, 406(%rsp)
	movzbl	406(%rsp), %eax
	cmpl	300(%rsp), %eax
	ja	.LBB49_698
# BB#699:                               #   in Loop: Header=BB49_10 Depth=1
	movq	368(%rsp), %rdi
	movq	376(%rsp), %rsi
	movzbl	406(%rsp), %edx
	xorb	%al, %al
	callq	group_in_compile_stack
	testb	%al, %al
	jne	.LBB49_721
# BB#700:                               #   in Loop: Header=BB49_10 Depth=1
	movq	384(%rsp), %rax
	movq	%rax, 328(%rsp)
	jmp	.LBB49_701
.LBB49_25:                              #   in Loop: Header=BB49_10 Depth=1
	cmpl	$94, %eax
	jne	.LBB49_721
# BB#26:                                #   in Loop: Header=BB49_10 Depth=1
	movq	424(%rsp), %rax
	incq	%rax
	cmpq	%rax, 360(%rsp)
	je	.LBB49_29
# BB#27:                                #   in Loop: Header=BB49_10 Depth=1
	testb	$8, 416(%rsp)
	jne	.LBB49_29
# BB#28:                                #   in Loop: Header=BB49_10 Depth=1
	movl	416(%rsp), %edx
	movq	360(%rsp), %rsi
	movq	424(%rsp), %rdi
	xorb	%al, %al
	callq	at_begline_loc_p
	movsbl	%al, %eax
	testl	%eax, %eax
	je	.LBB49_721
	jmp	.LBB49_29
	.align	16, 0x90
.LBB49_45:                              #   in Loop: Header=BB49_29 Depth=2
	movq	336(%rsp), %rax
	subq	288(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 336(%rsp)
	.align	16, 0x90
.LBB49_29:                              #   Parent Loop BB49_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	408(%rsp), %rax
	movq	384(%rsp), %rcx
	subq	(%rax), %rcx
	incq	%rcx
	cmpq	8(%rax), %rcx
	jbe	.LBB49_46
# BB#30:                                #   in Loop: Header=BB49_29 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rax
	movq	%rax, 288(%rsp)
	movq	408(%rsp), %rax
	cmpq	$65536, 8(%rax)         # imm = 0x10000
	je	.LBB49_31
# BB#35:                                #   in Loop: Header=BB49_29 Depth=2
	movq	408(%rsp), %rax
	shlq	8(%rax)
	movq	408(%rsp), %rax
	cmpq	$65537, 8(%rax)         # imm = 0x10001
	jb	.LBB49_37
# BB#36:                                #   in Loop: Header=BB49_29 Depth=2
	movq	408(%rsp), %rax
	movq	$65536, 8(%rax)         # imm = 0x10000
.LBB49_37:                              #   in Loop: Header=BB49_29 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rdi
	movq	8(%rax), %rsi
	callq	realloc
	movq	408(%rsp), %rcx
	movq	%rax, (%rcx)
	movq	408(%rsp), %rax
	cmpq	$0, (%rax)
	je	.LBB49_38
# BB#39:                                #   in Loop: Header=BB49_29 Depth=2
	movq	408(%rsp), %rax
	movq	288(%rsp), %rcx
	cmpq	(%rax), %rcx
	je	.LBB49_29
# BB#40:                                #   in Loop: Header=BB49_29 Depth=2
	movq	384(%rsp), %rax
	subq	288(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 384(%rsp)
	movq	320(%rsp), %rax
	subq	288(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 320(%rsp)
	cmpq	$0, 304(%rsp)
	je	.LBB49_42
# BB#41:                                #   in Loop: Header=BB49_29 Depth=2
	movq	304(%rsp), %rax
	subq	288(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 304(%rsp)
.LBB49_42:                              #   in Loop: Header=BB49_29 Depth=2
	cmpq	$0, 328(%rsp)
	je	.LBB49_44
# BB#43:                                #   in Loop: Header=BB49_29 Depth=2
	movq	328(%rsp), %rax
	subq	288(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 328(%rsp)
.LBB49_44:                              #   in Loop: Header=BB49_29 Depth=2
	cmpq	$0, 336(%rsp)
	je	.LBB49_29
	jmp	.LBB49_45
.LBB49_191:                             #   in Loop: Header=BB49_10 Depth=1
	movq	384(%rsp), %rax
	movq	%rax, 328(%rsp)
	jmp	.LBB49_192
	.align	16, 0x90
.LBB49_205:                             #   in Loop: Header=BB49_192 Depth=2
	movq	336(%rsp), %rax
	subq	216(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 336(%rsp)
	.align	16, 0x90
.LBB49_192:                             #   Parent Loop BB49_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	408(%rsp), %rax
	movq	384(%rsp), %rcx
	subq	(%rax), %rcx
	incq	%rcx
	cmpq	8(%rax), %rcx
	jbe	.LBB49_206
# BB#193:                               #   in Loop: Header=BB49_192 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rax
	movq	%rax, 216(%rsp)
	movq	408(%rsp), %rax
	cmpq	$65536, 8(%rax)         # imm = 0x10000
	je	.LBB49_194
# BB#195:                               #   in Loop: Header=BB49_192 Depth=2
	movq	408(%rsp), %rax
	shlq	8(%rax)
	movq	408(%rsp), %rax
	cmpq	$65537, 8(%rax)         # imm = 0x10001
	jb	.LBB49_197
# BB#196:                               #   in Loop: Header=BB49_192 Depth=2
	movq	408(%rsp), %rax
	movq	$65536, 8(%rax)         # imm = 0x10000
.LBB49_197:                             #   in Loop: Header=BB49_192 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rdi
	movq	8(%rax), %rsi
	callq	realloc
	movq	408(%rsp), %rcx
	movq	%rax, (%rcx)
	movq	408(%rsp), %rax
	cmpq	$0, (%rax)
	je	.LBB49_198
# BB#199:                               #   in Loop: Header=BB49_192 Depth=2
	movq	408(%rsp), %rax
	movq	216(%rsp), %rcx
	cmpq	(%rax), %rcx
	je	.LBB49_192
# BB#200:                               #   in Loop: Header=BB49_192 Depth=2
	movq	384(%rsp), %rax
	subq	216(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 384(%rsp)
	movq	320(%rsp), %rax
	subq	216(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 320(%rsp)
	cmpq	$0, 304(%rsp)
	je	.LBB49_202
# BB#201:                               #   in Loop: Header=BB49_192 Depth=2
	movq	304(%rsp), %rax
	subq	216(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 304(%rsp)
.LBB49_202:                             #   in Loop: Header=BB49_192 Depth=2
	cmpq	$0, 328(%rsp)
	je	.LBB49_204
# BB#203:                               #   in Loop: Header=BB49_192 Depth=2
	movq	328(%rsp), %rax
	subq	216(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 328(%rsp)
.LBB49_204:                             #   in Loop: Header=BB49_192 Depth=2
	cmpq	$0, 336(%rsp)
	je	.LBB49_192
	jmp	.LBB49_205
.LBB49_372:                             #   in Loop: Header=BB49_10 Depth=1
	cmpl	$119, %eax
	jne	.LBB49_373
# BB#577:                               #   in Loop: Header=BB49_10 Depth=1
	movq	384(%rsp), %rax
	movq	%rax, 328(%rsp)
	jmp	.LBB49_578
	.align	16, 0x90
.LBB49_591:                             #   in Loop: Header=BB49_578 Depth=2
	movq	336(%rsp), %rax
	subq	80(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 336(%rsp)
	.align	16, 0x90
.LBB49_578:                             #   Parent Loop BB49_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	408(%rsp), %rax
	movq	384(%rsp), %rcx
	subq	(%rax), %rcx
	incq	%rcx
	cmpq	8(%rax), %rcx
	jbe	.LBB49_592
# BB#579:                               #   in Loop: Header=BB49_578 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rax
	movq	%rax, 80(%rsp)
	movq	408(%rsp), %rax
	cmpq	$65536, 8(%rax)         # imm = 0x10000
	je	.LBB49_580
# BB#581:                               #   in Loop: Header=BB49_578 Depth=2
	movq	408(%rsp), %rax
	shlq	8(%rax)
	movq	408(%rsp), %rax
	cmpq	$65537, 8(%rax)         # imm = 0x10001
	jb	.LBB49_583
# BB#582:                               #   in Loop: Header=BB49_578 Depth=2
	movq	408(%rsp), %rax
	movq	$65536, 8(%rax)         # imm = 0x10000
.LBB49_583:                             #   in Loop: Header=BB49_578 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rdi
	movq	8(%rax), %rsi
	callq	realloc
	movq	408(%rsp), %rcx
	movq	%rax, (%rcx)
	movq	408(%rsp), %rax
	cmpq	$0, (%rax)
	je	.LBB49_584
# BB#585:                               #   in Loop: Header=BB49_578 Depth=2
	movq	408(%rsp), %rax
	movq	80(%rsp), %rcx
	cmpq	(%rax), %rcx
	je	.LBB49_578
# BB#586:                               #   in Loop: Header=BB49_578 Depth=2
	movq	384(%rsp), %rax
	subq	80(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 384(%rsp)
	movq	320(%rsp), %rax
	subq	80(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 320(%rsp)
	cmpq	$0, 304(%rsp)
	je	.LBB49_588
# BB#587:                               #   in Loop: Header=BB49_578 Depth=2
	movq	304(%rsp), %rax
	subq	80(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 304(%rsp)
.LBB49_588:                             #   in Loop: Header=BB49_578 Depth=2
	cmpq	$0, 328(%rsp)
	je	.LBB49_590
# BB#589:                               #   in Loop: Header=BB49_578 Depth=2
	movq	328(%rsp), %rax
	subq	80(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 328(%rsp)
.LBB49_590:                             #   in Loop: Header=BB49_578 Depth=2
	cmpq	$0, 336(%rsp)
	je	.LBB49_578
	jmp	.LBB49_591
.LBB49_366:                             #   in Loop: Header=BB49_10 Depth=1
	cmpl	$87, %eax
	jne	.LBB49_367
# BB#593:                               #   in Loop: Header=BB49_10 Depth=1
	movq	384(%rsp), %rax
	movq	%rax, 328(%rsp)
	jmp	.LBB49_594
.LBB49_206:                             #   in Loop: Header=BB49_10 Depth=1
	movq	360(%rsp), %rax
	movsbl	(%rax), %ecx
	movq	384(%rsp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, 384(%rsp)
	cmpl	$94, %ecx
	sete	%cl
	movzbl	%cl, %ecx
	addl	$3, %ecx
	movb	%cl, (%rax)
	movq	360(%rsp), %rax
	movsbl	(%rax), %eax
	cmpl	$94, %eax
	jne	.LBB49_208
# BB#207:                               #   in Loop: Header=BB49_10 Depth=1
	incq	360(%rsp)
.LBB49_208:                             #   in Loop: Header=BB49_10 Depth=1
	movq	360(%rsp), %rax
	movq	%rax, 392(%rsp)
	jmp	.LBB49_209
	.align	16, 0x90
.LBB49_222:                             #   in Loop: Header=BB49_209 Depth=2
	movq	336(%rsp), %rax
	subq	208(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 336(%rsp)
	.align	16, 0x90
.LBB49_209:                             #   Parent Loop BB49_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	408(%rsp), %rax
	movq	384(%rsp), %rcx
	subq	(%rax), %rcx
	incq	%rcx
	cmpq	8(%rax), %rcx
	jbe	.LBB49_223
# BB#210:                               #   in Loop: Header=BB49_209 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rax
	movq	%rax, 208(%rsp)
	movq	408(%rsp), %rax
	cmpq	$65536, 8(%rax)         # imm = 0x10000
	je	.LBB49_211
# BB#212:                               #   in Loop: Header=BB49_209 Depth=2
	movq	408(%rsp), %rax
	shlq	8(%rax)
	movq	408(%rsp), %rax
	cmpq	$65537, 8(%rax)         # imm = 0x10001
	jb	.LBB49_214
# BB#213:                               #   in Loop: Header=BB49_209 Depth=2
	movq	408(%rsp), %rax
	movq	$65536, 8(%rax)         # imm = 0x10000
.LBB49_214:                             #   in Loop: Header=BB49_209 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rdi
	movq	8(%rax), %rsi
	callq	realloc
	movq	408(%rsp), %rcx
	movq	%rax, (%rcx)
	movq	408(%rsp), %rax
	cmpq	$0, (%rax)
	je	.LBB49_215
# BB#216:                               #   in Loop: Header=BB49_209 Depth=2
	movq	408(%rsp), %rax
	movq	208(%rsp), %rcx
	cmpq	(%rax), %rcx
	je	.LBB49_209
# BB#217:                               #   in Loop: Header=BB49_209 Depth=2
	movq	384(%rsp), %rax
	subq	208(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 384(%rsp)
	movq	320(%rsp), %rax
	subq	208(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 320(%rsp)
	cmpq	$0, 304(%rsp)
	je	.LBB49_219
# BB#218:                               #   in Loop: Header=BB49_209 Depth=2
	movq	304(%rsp), %rax
	subq	208(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 304(%rsp)
.LBB49_219:                             #   in Loop: Header=BB49_209 Depth=2
	cmpq	$0, 328(%rsp)
	je	.LBB49_221
# BB#220:                               #   in Loop: Header=BB49_209 Depth=2
	movq	328(%rsp), %rax
	subq	208(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 328(%rsp)
.LBB49_221:                             #   in Loop: Header=BB49_209 Depth=2
	cmpq	$0, 336(%rsp)
	je	.LBB49_209
	jmp	.LBB49_222
.LBB49_373:                             #   in Loop: Header=BB49_10 Depth=1
	cmpl	$123, %eax
	jne	.LBB49_374
# BB#478:                               #   in Loop: Header=BB49_10 Depth=1
	testb	$2, 417(%rsp)
	je	.LBB49_717
# BB#479:                               #   in Loop: Header=BB49_10 Depth=1
	testb	$2, 417(%rsp)
	je	.LBB49_481
# BB#480:                               #   in Loop: Header=BB49_10 Depth=1
	testb	$16, 417(%rsp)
	jne	.LBB49_717
.LBB49_481:                             #   in Loop: Header=BB49_10 Depth=1
	movq	360(%rsp), %rax
	addq	$-2, %rax
	cmpq	424(%rsp), %rax
	jne	.LBB49_483
# BB#482:                               #   in Loop: Header=BB49_10 Depth=1
	movq	360(%rsp), %rax
	cmpq	352(%rsp), %rax
	je	.LBB49_717
.LBB49_483:                             #   in Loop: Header=BB49_10 Depth=1
	movl	$-1, 116(%rsp)
	movl	$-1, 112(%rsp)
	movq	360(%rsp), %rax
	decq	%rax
	movq	%rax, 312(%rsp)
	movq	360(%rsp), %rax
	cmpq	352(%rsp), %rax
	jne	.LBB49_486
# BB#484:                               #   in Loop: Header=BB49_10 Depth=1
	testb	$16, 417(%rsp)
	je	.LBB49_485
	.align	16, 0x90
.LBB49_570:                             #   in Loop: Header=BB49_10 Depth=1
	movq	312(%rsp), %rax
	movq	%rax, 360(%rsp)
	movq	$0, 312(%rsp)
	movq	360(%rsp), %rax
	cmpq	352(%rsp), %rax
	je	.LBB49_571
# BB#572:                               #   in Loop: Header=BB49_10 Depth=1
	movq	360(%rsp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, 360(%rsp)
	movb	(%rax), %al
	movb	%al, 407(%rsp)
	cmpq	$0, 344(%rsp)
	je	.LBB49_574
# BB#573:                               #   in Loop: Header=BB49_10 Depth=1
	movzbl	407(%rsp), %eax
	movq	344(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, 407(%rsp)
.LBB49_574:                             #   in Loop: Header=BB49_10 Depth=1
	testb	$16, 417(%rsp)
	jne	.LBB49_721
# BB#575:                               #   in Loop: Header=BB49_10 Depth=1
	movq	360(%rsp), %rax
	cmpq	424(%rsp), %rax
	jbe	.LBB49_721
# BB#576:                               #   in Loop: Header=BB49_10 Depth=1
	movq	360(%rsp), %rax
	movsbl	-1(%rax), %eax
	cmpl	$92, %eax
	je	.LBB49_717
	jmp	.LBB49_721
.LBB49_486:                             #   in Loop: Header=BB49_10 Depth=1
	movq	360(%rsp), %rax
	cmpq	352(%rsp), %rax
	je	.LBB49_499
# BB#487:                               #   in Loop: Header=BB49_10 Depth=1
	movq	360(%rsp), %rax
	cmpq	352(%rsp), %rax
	je	.LBB49_488
	.align	16, 0x90
.LBB49_489:                             #   Parent Loop BB49_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	360(%rsp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, 360(%rsp)
	movb	(%rax), %al
	movb	%al, 407(%rsp)
	cmpq	$0, 344(%rsp)
	je	.LBB49_491
# BB#490:                               #   in Loop: Header=BB49_489 Depth=2
	movzbl	407(%rsp), %eax
	movq	344(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, 407(%rsp)
.LBB49_491:                             #   in Loop: Header=BB49_489 Depth=2
	movzbl	407(%rsp), %ecx
	xorb	%al, %al
	testb	$-128, %cl
	jne	.LBB49_493
# BB#492:                               #   in Loop: Header=BB49_489 Depth=2
	movzbl	407(%rsp), %ebx
	callq	__ctype_b_loc
	movq	(%rax), %rax
	movb	1(%rax,%rbx,2), %al
	andb	$8, %al
	shrb	$3, %al
.LBB49_493:                             #   in Loop: Header=BB49_489 Depth=2
	cmpb	$1, %al
	jne	.LBB49_499
# BB#494:                               #   in Loop: Header=BB49_489 Depth=2
	cmpl	$0, 116(%rsp)
	jns	.LBB49_496
# BB#495:                               #   in Loop: Header=BB49_489 Depth=2
	movl	$0, 116(%rsp)
.LBB49_496:                             #   in Loop: Header=BB49_489 Depth=2
	movzbl	407(%rsp), %eax
	imull	$10, 116(%rsp), %ecx
	leal	-48(%rcx,%rax), %eax
	movl	%eax, 116(%rsp)
	movq	360(%rsp), %rax
	cmpq	352(%rsp), %rax
	je	.LBB49_499
# BB#497:                               #   in Loop: Header=BB49_489 Depth=2
	movq	360(%rsp), %rax
	cmpq	352(%rsp), %rax
	jne	.LBB49_489
	jmp	.LBB49_498
.LBB49_499:                             #   in Loop: Header=BB49_10 Depth=1
	movzbl	407(%rsp), %eax
	cmpl	$44, %eax
	jne	.LBB49_515
# BB#500:                               #   in Loop: Header=BB49_10 Depth=1
	movq	360(%rsp), %rax
	cmpq	352(%rsp), %rax
	je	.LBB49_513
# BB#501:                               #   in Loop: Header=BB49_10 Depth=1
	movq	360(%rsp), %rax
	cmpq	352(%rsp), %rax
	je	.LBB49_502
	.align	16, 0x90
.LBB49_503:                             #   Parent Loop BB49_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	360(%rsp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, 360(%rsp)
	movb	(%rax), %al
	movb	%al, 407(%rsp)
	cmpq	$0, 344(%rsp)
	je	.LBB49_505
# BB#504:                               #   in Loop: Header=BB49_503 Depth=2
	movzbl	407(%rsp), %eax
	movq	344(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, 407(%rsp)
.LBB49_505:                             #   in Loop: Header=BB49_503 Depth=2
	movzbl	407(%rsp), %ecx
	xorb	%al, %al
	testb	$-128, %cl
	jne	.LBB49_507
# BB#506:                               #   in Loop: Header=BB49_503 Depth=2
	movzbl	407(%rsp), %ebx
	callq	__ctype_b_loc
	movq	(%rax), %rax
	movb	1(%rax,%rbx,2), %al
	andb	$8, %al
	shrb	$3, %al
.LBB49_507:                             #   in Loop: Header=BB49_503 Depth=2
	cmpb	$1, %al
	jne	.LBB49_513
# BB#508:                               #   in Loop: Header=BB49_503 Depth=2
	cmpl	$0, 112(%rsp)
	jns	.LBB49_510
# BB#509:                               #   in Loop: Header=BB49_503 Depth=2
	movl	$0, 112(%rsp)
.LBB49_510:                             #   in Loop: Header=BB49_503 Depth=2
	movzbl	407(%rsp), %eax
	imull	$10, 112(%rsp), %ecx
	leal	-48(%rcx,%rax), %eax
	movl	%eax, 112(%rsp)
	movq	360(%rsp), %rax
	cmpq	352(%rsp), %rax
	je	.LBB49_513
# BB#511:                               #   in Loop: Header=BB49_503 Depth=2
	movq	360(%rsp), %rax
	cmpq	352(%rsp), %rax
	jne	.LBB49_503
	jmp	.LBB49_512
.LBB49_355:                             #   in Loop: Header=BB49_10 Depth=1
	testb	$32, 417(%rsp)
	jne	.LBB49_382
	jmp	.LBB49_721
.LBB49_410:                             #   in Loop: Header=BB49_10 Depth=1
	testb	$32, 417(%rsp)
	je	.LBB49_721
	jmp	.LBB49_411
.LBB49_159:                             #   in Loop: Header=BB49_10 Depth=1
	movq	384(%rsp), %rax
	movq	%rax, 328(%rsp)
	jmp	.LBB49_160
	.align	16, 0x90
.LBB49_173:                             #   in Loop: Header=BB49_160 Depth=2
	movq	336(%rsp), %rax
	subq	240(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 336(%rsp)
	.align	16, 0x90
.LBB49_160:                             #   Parent Loop BB49_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	408(%rsp), %rax
	movq	384(%rsp), %rcx
	subq	(%rax), %rcx
	incq	%rcx
	cmpq	8(%rax), %rcx
	jbe	.LBB49_174
# BB#161:                               #   in Loop: Header=BB49_160 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rax
	movq	%rax, 240(%rsp)
	movq	408(%rsp), %rax
	cmpq	$65536, 8(%rax)         # imm = 0x10000
	je	.LBB49_162
# BB#163:                               #   in Loop: Header=BB49_160 Depth=2
	movq	408(%rsp), %rax
	shlq	8(%rax)
	movq	408(%rsp), %rax
	cmpq	$65537, 8(%rax)         # imm = 0x10001
	jb	.LBB49_165
# BB#164:                               #   in Loop: Header=BB49_160 Depth=2
	movq	408(%rsp), %rax
	movq	$65536, 8(%rax)         # imm = 0x10000
.LBB49_165:                             #   in Loop: Header=BB49_160 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rdi
	movq	8(%rax), %rsi
	callq	realloc
	movq	408(%rsp), %rcx
	movq	%rax, (%rcx)
	movq	408(%rsp), %rax
	cmpq	$0, (%rax)
	je	.LBB49_166
# BB#167:                               #   in Loop: Header=BB49_160 Depth=2
	movq	408(%rsp), %rax
	movq	240(%rsp), %rcx
	cmpq	(%rax), %rcx
	je	.LBB49_160
# BB#168:                               #   in Loop: Header=BB49_160 Depth=2
	movq	384(%rsp), %rax
	subq	240(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 384(%rsp)
	movq	320(%rsp), %rax
	subq	240(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 320(%rsp)
	cmpq	$0, 304(%rsp)
	je	.LBB49_170
# BB#169:                               #   in Loop: Header=BB49_160 Depth=2
	movq	304(%rsp), %rax
	subq	240(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 304(%rsp)
.LBB49_170:                             #   in Loop: Header=BB49_160 Depth=2
	cmpq	$0, 328(%rsp)
	je	.LBB49_172
# BB#171:                               #   in Loop: Header=BB49_160 Depth=2
	movq	328(%rsp), %rax
	subq	240(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 328(%rsp)
.LBB49_172:                             #   in Loop: Header=BB49_160 Depth=2
	cmpq	$0, 336(%rsp)
	je	.LBB49_160
	jmp	.LBB49_173
.LBB49_46:                              #   in Loop: Header=BB49_10 Depth=1
	movq	384(%rsp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, 384(%rsp)
	movb	$8, (%rax)
	jmp	.LBB49_10
.LBB49_515:                             #   in Loop: Header=BB49_10 Depth=1
	movl	116(%rsp), %eax
	movl	%eax, 112(%rsp)
	jmp	.LBB49_516
	.align	16, 0x90
.LBB49_63:                              #   in Loop: Header=BB49_50 Depth=2
	movq	336(%rsp), %rax
	subq	280(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 336(%rsp)
	.align	16, 0x90
.LBB49_50:                              #   Parent Loop BB49_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	408(%rsp), %rax
	movq	384(%rsp), %rcx
	subq	(%rax), %rcx
	incq	%rcx
	cmpq	8(%rax), %rcx
	jbe	.LBB49_64
# BB#51:                                #   in Loop: Header=BB49_50 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rax
	movq	%rax, 280(%rsp)
	movq	408(%rsp), %rax
	cmpq	$65536, 8(%rax)         # imm = 0x10000
	je	.LBB49_52
# BB#53:                                #   in Loop: Header=BB49_50 Depth=2
	movq	408(%rsp), %rax
	shlq	8(%rax)
	movq	408(%rsp), %rax
	cmpq	$65537, 8(%rax)         # imm = 0x10001
	jb	.LBB49_55
# BB#54:                                #   in Loop: Header=BB49_50 Depth=2
	movq	408(%rsp), %rax
	movq	$65536, 8(%rax)         # imm = 0x10000
.LBB49_55:                              #   in Loop: Header=BB49_50 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rdi
	movq	8(%rax), %rsi
	callq	realloc
	movq	408(%rsp), %rcx
	movq	%rax, (%rcx)
	movq	408(%rsp), %rax
	cmpq	$0, (%rax)
	je	.LBB49_56
# BB#57:                                #   in Loop: Header=BB49_50 Depth=2
	movq	408(%rsp), %rax
	movq	280(%rsp), %rcx
	cmpq	(%rax), %rcx
	je	.LBB49_50
# BB#58:                                #   in Loop: Header=BB49_50 Depth=2
	movq	384(%rsp), %rax
	subq	280(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 384(%rsp)
	movq	320(%rsp), %rax
	subq	280(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 320(%rsp)
	cmpq	$0, 304(%rsp)
	je	.LBB49_60
# BB#59:                                #   in Loop: Header=BB49_50 Depth=2
	movq	304(%rsp), %rax
	subq	280(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 304(%rsp)
.LBB49_60:                              #   in Loop: Header=BB49_50 Depth=2
	cmpq	$0, 328(%rsp)
	je	.LBB49_62
# BB#61:                                #   in Loop: Header=BB49_50 Depth=2
	movq	328(%rsp), %rax
	subq	280(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 328(%rsp)
.LBB49_62:                              #   in Loop: Header=BB49_50 Depth=2
	cmpq	$0, 336(%rsp)
	je	.LBB49_50
	jmp	.LBB49_63
.LBB49_592:                             #   in Loop: Header=BB49_10 Depth=1
	movq	384(%rsp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, 384(%rsp)
	movb	$23, (%rax)
	jmp	.LBB49_10
.LBB49_367:                             #   in Loop: Header=BB49_10 Depth=1
	cmpl	$96, %eax
	je	.LBB49_666
# BB#368:                               #   in Loop: Header=BB49_10 Depth=1
	cmpl	$98, %eax
	jne	.LBB49_717
	jmp	.LBB49_369
	.align	16, 0x90
.LBB49_607:                             #   in Loop: Header=BB49_594 Depth=2
	movq	336(%rsp), %rax
	subq	72(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 336(%rsp)
	.align	16, 0x90
.LBB49_594:                             #   Parent Loop BB49_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	408(%rsp), %rax
	movq	384(%rsp), %rcx
	subq	(%rax), %rcx
	incq	%rcx
	cmpq	8(%rax), %rcx
	jbe	.LBB49_608
# BB#595:                               #   in Loop: Header=BB49_594 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rax
	movq	%rax, 72(%rsp)
	movq	408(%rsp), %rax
	cmpq	$65536, 8(%rax)         # imm = 0x10000
	je	.LBB49_596
# BB#597:                               #   in Loop: Header=BB49_594 Depth=2
	movq	408(%rsp), %rax
	shlq	8(%rax)
	movq	408(%rsp), %rax
	cmpq	$65537, 8(%rax)         # imm = 0x10001
	jb	.LBB49_599
# BB#598:                               #   in Loop: Header=BB49_594 Depth=2
	movq	408(%rsp), %rax
	movq	$65536, 8(%rax)         # imm = 0x10000
.LBB49_599:                             #   in Loop: Header=BB49_594 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rdi
	movq	8(%rax), %rsi
	callq	realloc
	movq	408(%rsp), %rcx
	movq	%rax, (%rcx)
	movq	408(%rsp), %rax
	cmpq	$0, (%rax)
	je	.LBB49_600
# BB#601:                               #   in Loop: Header=BB49_594 Depth=2
	movq	408(%rsp), %rax
	movq	72(%rsp), %rcx
	cmpq	(%rax), %rcx
	je	.LBB49_594
# BB#602:                               #   in Loop: Header=BB49_594 Depth=2
	movq	384(%rsp), %rax
	subq	72(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 384(%rsp)
	movq	320(%rsp), %rax
	subq	72(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 320(%rsp)
	cmpq	$0, 304(%rsp)
	je	.LBB49_604
# BB#603:                               #   in Loop: Header=BB49_594 Depth=2
	movq	304(%rsp), %rax
	subq	72(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 304(%rsp)
.LBB49_604:                             #   in Loop: Header=BB49_594 Depth=2
	cmpq	$0, 328(%rsp)
	je	.LBB49_606
# BB#605:                               #   in Loop: Header=BB49_594 Depth=2
	movq	328(%rsp), %rax
	subq	72(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 328(%rsp)
.LBB49_606:                             #   in Loop: Header=BB49_594 Depth=2
	cmpq	$0, 336(%rsp)
	je	.LBB49_594
	jmp	.LBB49_607
.LBB49_374:                             #   in Loop: Header=BB49_10 Depth=1
	cmpl	$124, %eax
	jne	.LBB49_717
# BB#375:                               #   in Loop: Header=BB49_10 Depth=1
	testb	$4, 417(%rsp)
	jne	.LBB49_717
# BB#376:                               #   in Loop: Header=BB49_10 Depth=1
	testb	$-128, 417(%rsp)
	jne	.LBB49_717
.LBB49_377:                             #   in Loop: Header=BB49_10 Depth=1
	testb	$4, 417(%rsp)
	jne	.LBB49_721
	jmp	.LBB49_378
	.align	16, 0x90
.LBB49_459:                             #   in Loop: Header=BB49_378 Depth=2
	movq	336(%rsp), %rax
	subq	128(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 336(%rsp)
	.align	16, 0x90
.LBB49_378:                             #   Parent Loop BB49_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	408(%rsp), %rax
	movq	384(%rsp), %rcx
	subq	(%rax), %rcx
	addq	$3, %rcx
	cmpq	8(%rax), %rcx
	jbe	.LBB49_460
# BB#379:                               #   in Loop: Header=BB49_378 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rax
	movq	%rax, 128(%rsp)
	movq	408(%rsp), %rax
	cmpq	$65536, 8(%rax)         # imm = 0x10000
	je	.LBB49_380
# BB#449:                               #   in Loop: Header=BB49_378 Depth=2
	movq	408(%rsp), %rax
	shlq	8(%rax)
	movq	408(%rsp), %rax
	cmpq	$65537, 8(%rax)         # imm = 0x10001
	jb	.LBB49_451
# BB#450:                               #   in Loop: Header=BB49_378 Depth=2
	movq	408(%rsp), %rax
	movq	$65536, 8(%rax)         # imm = 0x10000
.LBB49_451:                             #   in Loop: Header=BB49_378 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rdi
	movq	8(%rax), %rsi
	callq	realloc
	movq	408(%rsp), %rcx
	movq	%rax, (%rcx)
	movq	408(%rsp), %rax
	cmpq	$0, (%rax)
	je	.LBB49_452
# BB#453:                               #   in Loop: Header=BB49_378 Depth=2
	movq	408(%rsp), %rax
	movq	128(%rsp), %rcx
	cmpq	(%rax), %rcx
	je	.LBB49_378
# BB#454:                               #   in Loop: Header=BB49_378 Depth=2
	movq	384(%rsp), %rax
	subq	128(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 384(%rsp)
	movq	320(%rsp), %rax
	subq	128(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 320(%rsp)
	cmpq	$0, 304(%rsp)
	je	.LBB49_456
# BB#455:                               #   in Loop: Header=BB49_378 Depth=2
	movq	304(%rsp), %rax
	subq	128(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 304(%rsp)
.LBB49_456:                             #   in Loop: Header=BB49_378 Depth=2
	cmpq	$0, 328(%rsp)
	je	.LBB49_458
# BB#457:                               #   in Loop: Header=BB49_378 Depth=2
	movq	328(%rsp), %rax
	subq	128(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 328(%rsp)
.LBB49_458:                             #   in Loop: Header=BB49_378 Depth=2
	cmpq	$0, 336(%rsp)
	je	.LBB49_378
	jmp	.LBB49_459
.LBB49_460:                             #   in Loop: Header=BB49_10 Depth=1
	movq	384(%rsp), %rcx
	leaq	6(%rcx), %rdx
	movq	320(%rsp), %rsi
	subq	%rsi, %rdx
	addq	$-3, %rdx
	movl	$14, %edi
	xorb	%al, %al
	callq	insert_op1
	movq	$0, 336(%rsp)
	addq	$3, 384(%rsp)
	cmpq	$0, 304(%rsp)
	je	.LBB49_462
# BB#461:                               #   in Loop: Header=BB49_10 Depth=1
	movq	304(%rsp), %rsi
	movq	384(%rsp), %rdx
	subq	%rsi, %rdx
	addq	$-3, %rdx
	movl	$13, %edi
	xorb	%al, %al
	callq	store_op1
.LBB49_462:                             #   in Loop: Header=BB49_10 Depth=1
	movq	384(%rsp), %rax
	movq	%rax, 304(%rsp)
	jmp	.LBB49_463
	.align	16, 0x90
.LBB49_476:                             #   in Loop: Header=BB49_463 Depth=2
	movq	336(%rsp), %rax
	subq	120(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 336(%rsp)
	.align	16, 0x90
.LBB49_463:                             #   Parent Loop BB49_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	408(%rsp), %rax
	movq	384(%rsp), %rcx
	subq	(%rax), %rcx
	addq	$3, %rcx
	cmpq	8(%rax), %rcx
	jbe	.LBB49_477
# BB#464:                               #   in Loop: Header=BB49_463 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rax
	movq	%rax, 120(%rsp)
	movq	408(%rsp), %rax
	cmpq	$65536, 8(%rax)         # imm = 0x10000
	je	.LBB49_465
# BB#466:                               #   in Loop: Header=BB49_463 Depth=2
	movq	408(%rsp), %rax
	shlq	8(%rax)
	movq	408(%rsp), %rax
	cmpq	$65537, 8(%rax)         # imm = 0x10001
	jb	.LBB49_468
# BB#467:                               #   in Loop: Header=BB49_463 Depth=2
	movq	408(%rsp), %rax
	movq	$65536, 8(%rax)         # imm = 0x10000
.LBB49_468:                             #   in Loop: Header=BB49_463 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rdi
	movq	8(%rax), %rsi
	callq	realloc
	movq	408(%rsp), %rcx
	movq	%rax, (%rcx)
	movq	408(%rsp), %rax
	cmpq	$0, (%rax)
	je	.LBB49_469
# BB#470:                               #   in Loop: Header=BB49_463 Depth=2
	movq	408(%rsp), %rax
	movq	120(%rsp), %rcx
	cmpq	(%rax), %rcx
	je	.LBB49_463
# BB#471:                               #   in Loop: Header=BB49_463 Depth=2
	movq	384(%rsp), %rax
	subq	120(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 384(%rsp)
	movq	320(%rsp), %rax
	subq	120(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 320(%rsp)
	cmpq	$0, 304(%rsp)
	je	.LBB49_473
# BB#472:                               #   in Loop: Header=BB49_463 Depth=2
	movq	304(%rsp), %rax
	subq	120(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 304(%rsp)
.LBB49_473:                             #   in Loop: Header=BB49_463 Depth=2
	cmpq	$0, 328(%rsp)
	je	.LBB49_475
# BB#474:                               #   in Loop: Header=BB49_463 Depth=2
	movq	328(%rsp), %rax
	subq	120(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 328(%rsp)
.LBB49_475:                             #   in Loop: Header=BB49_463 Depth=2
	cmpq	$0, 336(%rsp)
	je	.LBB49_463
	jmp	.LBB49_476
.LBB49_477:                             #   in Loop: Header=BB49_10 Depth=1
	addq	$3, 384(%rsp)
	movq	$0, 328(%rsp)
	movq	384(%rsp), %rax
	movq	%rax, 320(%rsp)
	jmp	.LBB49_10
.LBB49_513:                             #   in Loop: Header=BB49_10 Depth=1
	cmpl	$0, 112(%rsp)
	jns	.LBB49_516
# BB#514:                               #   in Loop: Header=BB49_10 Depth=1
	movl	$32767, 112(%rsp)       # imm = 0x7FFF
.LBB49_516:                             #   in Loop: Header=BB49_10 Depth=1
	cmpl	$0, 116(%rsp)
	js	.LBB49_519
# BB#517:                               #   in Loop: Header=BB49_10 Depth=1
	cmpl	$32767, 112(%rsp)       # imm = 0x7FFF
	jg	.LBB49_519
# BB#518:                               #   in Loop: Header=BB49_10 Depth=1
	movl	116(%rsp), %eax
	cmpl	112(%rsp), %eax
	jle	.LBB49_521
.LBB49_519:                             #   in Loop: Header=BB49_10 Depth=1
	testb	$16, 417(%rsp)
	jne	.LBB49_570
	jmp	.LBB49_520
	.align	16, 0x90
.LBB49_694:                             #   in Loop: Header=BB49_681 Depth=2
	movq	336(%rsp), %rax
	subq	24(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 336(%rsp)
	.align	16, 0x90
.LBB49_681:                             #   Parent Loop BB49_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	408(%rsp), %rax
	movq	384(%rsp), %rcx
	subq	(%rax), %rcx
	incq	%rcx
	cmpq	8(%rax), %rcx
	jbe	.LBB49_695
# BB#682:                               #   in Loop: Header=BB49_681 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rax
	movq	%rax, 24(%rsp)
	movq	408(%rsp), %rax
	cmpq	$65536, 8(%rax)         # imm = 0x10000
	je	.LBB49_683
# BB#684:                               #   in Loop: Header=BB49_681 Depth=2
	movq	408(%rsp), %rax
	shlq	8(%rax)
	movq	408(%rsp), %rax
	cmpq	$65537, 8(%rax)         # imm = 0x10001
	jb	.LBB49_686
# BB#685:                               #   in Loop: Header=BB49_681 Depth=2
	movq	408(%rsp), %rax
	movq	$65536, 8(%rax)         # imm = 0x10000
.LBB49_686:                             #   in Loop: Header=BB49_681 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rdi
	movq	8(%rax), %rsi
	callq	realloc
	movq	408(%rsp), %rcx
	movq	%rax, (%rcx)
	movq	408(%rsp), %rax
	cmpq	$0, (%rax)
	je	.LBB49_687
# BB#688:                               #   in Loop: Header=BB49_681 Depth=2
	movq	408(%rsp), %rax
	movq	24(%rsp), %rcx
	cmpq	(%rax), %rcx
	je	.LBB49_681
# BB#689:                               #   in Loop: Header=BB49_681 Depth=2
	movq	384(%rsp), %rax
	subq	24(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 384(%rsp)
	movq	320(%rsp), %rax
	subq	24(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 320(%rsp)
	cmpq	$0, 304(%rsp)
	je	.LBB49_691
# BB#690:                               #   in Loop: Header=BB49_681 Depth=2
	movq	304(%rsp), %rax
	subq	24(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 304(%rsp)
.LBB49_691:                             #   in Loop: Header=BB49_681 Depth=2
	cmpq	$0, 328(%rsp)
	je	.LBB49_693
# BB#692:                               #   in Loop: Header=BB49_681 Depth=2
	movq	328(%rsp), %rax
	subq	24(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 328(%rsp)
.LBB49_693:                             #   in Loop: Header=BB49_681 Depth=2
	cmpq	$0, 336(%rsp)
	je	.LBB49_681
	jmp	.LBB49_694
.LBB49_381:                             #   in Loop: Header=BB49_10 Depth=1
	testb	$32, 417(%rsp)
	jne	.LBB49_717
.LBB49_382:                             #   in Loop: Header=BB49_10 Depth=1
	movq	408(%rsp), %rax
	incq	48(%rax)
	incl	300(%rsp)
	movl	380(%rsp), %eax
	cmpl	376(%rsp), %eax
	jne	.LBB49_386
# BB#383:                               #   in Loop: Header=BB49_10 Depth=1
	movq	368(%rsp), %rdi
	movl	376(%rsp), %eax
	addl	%eax, %eax
	shlq	$2, %rax
	leaq	(%rax,%rax,4), %rsi
	callq	realloc
	movq	%rax, 368(%rsp)
	testq	%rax, %rax
	je	.LBB49_384
# BB#385:                               #   in Loop: Header=BB49_10 Depth=1
	shll	376(%rsp)
.LBB49_386:                             #   in Loop: Header=BB49_10 Depth=1
	movq	408(%rsp), %rcx
	movl	320(%rsp), %eax
	subl	(%rcx), %eax
	movl	380(%rsp), %ecx
	leaq	(%rcx,%rcx,4), %rcx
	movq	368(%rsp), %rdx
	movl	%eax, (%rdx,%rcx,4)
	xorl	%eax, %eax
	cmpq	$0, 304(%rsp)
	je	.LBB49_388
# BB#387:                               #   in Loop: Header=BB49_10 Depth=1
	movq	408(%rsp), %rcx
	movq	304(%rsp), %rax
	subq	(%rcx), %rax
	incq	%rax
.LBB49_388:                             #   in Loop: Header=BB49_10 Depth=1
	movl	380(%rsp), %ecx
	leaq	(%rcx,%rcx,4), %rcx
	movq	368(%rsp), %rdx
	movl	%eax, 4(%rdx,%rcx,4)
	movq	408(%rsp), %rcx
	movl	384(%rsp), %eax
	subl	(%rcx), %eax
	movl	380(%rsp), %ecx
	leaq	(%rcx,%rcx,4), %rcx
	movq	368(%rsp), %rdx
	movl	%eax, 12(%rdx,%rcx,4)
	movl	380(%rsp), %eax
	leaq	(%rax,%rax,4), %rax
	movq	368(%rsp), %rcx
	movl	300(%rsp), %edx
	movl	%edx, 16(%rcx,%rax,4)
	cmpl	$255, 300(%rsp)
	ja	.LBB49_405
# BB#389:                               #   in Loop: Header=BB49_10 Depth=1
	movq	408(%rsp), %rcx
	movl	384(%rsp), %eax
	subl	(%rcx), %eax
	addl	$2, %eax
	movl	380(%rsp), %ecx
	leaq	(%rcx,%rcx,4), %rcx
	movq	368(%rsp), %rdx
	movl	%eax, 8(%rdx,%rcx,4)
	jmp	.LBB49_390
.LBB49_406:                             #   in Loop: Header=BB49_10 Depth=1
	testb	$32, 417(%rsp)
	jne	.LBB49_717
# BB#407:                               #   in Loop: Header=BB49_10 Depth=1
	cmpl	$0, 380(%rsp)
	jne	.LBB49_411
# BB#408:                               #   in Loop: Header=BB49_10 Depth=1
	testb	$2, 418(%rsp)
	jne	.LBB49_717
	jmp	.LBB49_409
.LBB49_411:                             #   in Loop: Header=BB49_10 Depth=1
	cmpq	$0, 304(%rsp)
	je	.LBB49_427
	jmp	.LBB49_412
.LBB49_716:                             #   in Loop: Header=BB49_10 Depth=1
	testb	$2, 416(%rsp)
	je	.LBB49_717
.LBB49_68:                              #   in Loop: Header=BB49_10 Depth=1
	cmpq	$0, 328(%rsp)
	jne	.LBB49_72
# BB#69:                                #   in Loop: Header=BB49_10 Depth=1
	testb	$32, 416(%rsp)
	jne	.LBB49_70
# BB#71:                                #   in Loop: Header=BB49_10 Depth=1
	testb	$16, 416(%rsp)
	je	.LBB49_721
.LBB49_72:                              #   in Loop: Header=BB49_10 Depth=1
	movb	$0, 279(%rsp)
	movb	$0, 278(%rsp)
	movb	$0, 277(%rsp)
	jmp	.LBB49_73
	.align	16, 0x90
.LBB49_93:                              #   in Loop: Header=BB49_73 Depth=2
	movb	406(%rsp), %al
	movb	%al, 407(%rsp)
	.align	16, 0x90
.LBB49_73:                              #   Parent Loop BB49_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpb	$43, 407(%rsp)
	setne	%al
	movzbl	%al, %ecx
	movzbl	278(%rsp), %eax
	orl	%ecx, %eax
	movb	%al, 278(%rsp)
	cmpb	$63, 407(%rsp)
	setne	%al
	movzbl	%al, %ecx
	movzbl	277(%rsp), %eax
	orl	%ecx, %eax
	movb	%al, 277(%rsp)
	movq	360(%rsp), %rax
	cmpq	352(%rsp), %rax
	je	.LBB49_95
# BB#74:                                #   in Loop: Header=BB49_73 Depth=2
	movq	360(%rsp), %rax
	cmpq	352(%rsp), %rax
	je	.LBB49_75
# BB#76:                                #   in Loop: Header=BB49_73 Depth=2
	movq	360(%rsp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, 360(%rsp)
	movb	(%rax), %al
	movb	%al, 407(%rsp)
	cmpq	$0, 344(%rsp)
	je	.LBB49_78
# BB#77:                                #   in Loop: Header=BB49_73 Depth=2
	movzbl	407(%rsp), %eax
	movq	344(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, 407(%rsp)
.LBB49_78:                              #   in Loop: Header=BB49_73 Depth=2
	cmpb	$42, 407(%rsp)
	je	.LBB49_73
# BB#79:                                #   in Loop: Header=BB49_73 Depth=2
	testb	$2, 416(%rsp)
	jne	.LBB49_82
# BB#80:                                #   in Loop: Header=BB49_73 Depth=2
	cmpb	$43, 407(%rsp)
	je	.LBB49_73
# BB#81:                                #   in Loop: Header=BB49_73 Depth=2
	cmpb	$63, 407(%rsp)
	je	.LBB49_73
.LBB49_82:                              #   in Loop: Header=BB49_73 Depth=2
	testb	$2, 416(%rsp)
	je	.LBB49_94
# BB#83:                                #   in Loop: Header=BB49_73 Depth=2
	movzbl	407(%rsp), %eax
	cmpl	$92, %eax
	jne	.LBB49_94
# BB#84:                                #   in Loop: Header=BB49_73 Depth=2
	movq	360(%rsp), %rax
	cmpq	352(%rsp), %rax
	je	.LBB49_85
# BB#86:                                #   in Loop: Header=BB49_73 Depth=2
	movq	360(%rsp), %rax
	cmpq	352(%rsp), %rax
	je	.LBB49_87
# BB#88:                                #   in Loop: Header=BB49_73 Depth=2
	movq	360(%rsp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, 360(%rsp)
	movb	(%rax), %al
	movb	%al, 406(%rsp)
	cmpq	$0, 344(%rsp)
	je	.LBB49_90
# BB#89:                                #   in Loop: Header=BB49_73 Depth=2
	movzbl	406(%rsp), %eax
	movq	344(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, 406(%rsp)
.LBB49_90:                              #   in Loop: Header=BB49_73 Depth=2
	cmpb	$43, 406(%rsp)
	je	.LBB49_93
# BB#91:                                #   in Loop: Header=BB49_73 Depth=2
	cmpb	$63, 406(%rsp)
	je	.LBB49_93
# BB#92:                                #   in Loop: Header=BB49_10 Depth=1
	movq	360(%rsp), %rax
	leaq	-1(%rax), %rcx
	movq	%rcx, 360(%rsp)
	addq	$-2, %rax
	movq	%rax, 360(%rsp)
	jmp	.LBB49_95
.LBB49_717:                             #   in Loop: Header=BB49_10 Depth=1
	cmpq	$0, 344(%rsp)
	je	.LBB49_719
# BB#718:                               #   in Loop: Header=BB49_10 Depth=1
	movzbl	407(%rsp), %eax
	movq	344(%rsp), %rcx
	movsbl	(%rcx,%rax), %eax
	jmp	.LBB49_720
	.align	16, 0x90
.LBB49_622:                             #   in Loop: Header=BB49_609 Depth=2
	movq	336(%rsp), %rax
	subq	64(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 336(%rsp)
	.align	16, 0x90
.LBB49_609:                             #   Parent Loop BB49_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	408(%rsp), %rax
	movq	384(%rsp), %rcx
	subq	(%rax), %rcx
	incq	%rcx
	cmpq	8(%rax), %rcx
	jbe	.LBB49_623
# BB#610:                               #   in Loop: Header=BB49_609 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rax
	movq	%rax, 64(%rsp)
	movq	408(%rsp), %rax
	cmpq	$65536, 8(%rax)         # imm = 0x10000
	je	.LBB49_611
# BB#612:                               #   in Loop: Header=BB49_609 Depth=2
	movq	408(%rsp), %rax
	shlq	8(%rax)
	movq	408(%rsp), %rax
	cmpq	$65537, 8(%rax)         # imm = 0x10001
	jb	.LBB49_614
# BB#613:                               #   in Loop: Header=BB49_609 Depth=2
	movq	408(%rsp), %rax
	movq	$65536, 8(%rax)         # imm = 0x10000
.LBB49_614:                             #   in Loop: Header=BB49_609 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rdi
	movq	8(%rax), %rsi
	callq	realloc
	movq	408(%rsp), %rcx
	movq	%rax, (%rcx)
	movq	408(%rsp), %rax
	cmpq	$0, (%rax)
	je	.LBB49_615
# BB#616:                               #   in Loop: Header=BB49_609 Depth=2
	movq	408(%rsp), %rax
	movq	64(%rsp), %rcx
	cmpq	(%rax), %rcx
	je	.LBB49_609
# BB#617:                               #   in Loop: Header=BB49_609 Depth=2
	movq	384(%rsp), %rax
	subq	64(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 384(%rsp)
	movq	320(%rsp), %rax
	subq	64(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 320(%rsp)
	cmpq	$0, 304(%rsp)
	je	.LBB49_619
# BB#618:                               #   in Loop: Header=BB49_609 Depth=2
	movq	304(%rsp), %rax
	subq	64(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 304(%rsp)
.LBB49_619:                             #   in Loop: Header=BB49_609 Depth=2
	cmpq	$0, 328(%rsp)
	je	.LBB49_621
# BB#620:                               #   in Loop: Header=BB49_609 Depth=2
	movq	328(%rsp), %rax
	subq	64(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 328(%rsp)
.LBB49_621:                             #   in Loop: Header=BB49_609 Depth=2
	cmpq	$0, 336(%rsp)
	je	.LBB49_609
	jmp	.LBB49_622
	.align	16, 0x90
.LBB49_637:                             #   in Loop: Header=BB49_624 Depth=2
	movq	336(%rsp), %rax
	subq	56(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 336(%rsp)
	.align	16, 0x90
.LBB49_624:                             #   Parent Loop BB49_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	408(%rsp), %rax
	movq	384(%rsp), %rcx
	subq	(%rax), %rcx
	incq	%rcx
	cmpq	8(%rax), %rcx
	jbe	.LBB49_638
# BB#625:                               #   in Loop: Header=BB49_624 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rax
	movq	%rax, 56(%rsp)
	movq	408(%rsp), %rax
	cmpq	$65536, 8(%rax)         # imm = 0x10000
	je	.LBB49_626
# BB#627:                               #   in Loop: Header=BB49_624 Depth=2
	movq	408(%rsp), %rax
	shlq	8(%rax)
	movq	408(%rsp), %rax
	cmpq	$65537, 8(%rax)         # imm = 0x10001
	jb	.LBB49_629
# BB#628:                               #   in Loop: Header=BB49_624 Depth=2
	movq	408(%rsp), %rax
	movq	$65536, 8(%rax)         # imm = 0x10000
.LBB49_629:                             #   in Loop: Header=BB49_624 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rdi
	movq	8(%rax), %rsi
	callq	realloc
	movq	408(%rsp), %rcx
	movq	%rax, (%rcx)
	movq	408(%rsp), %rax
	cmpq	$0, (%rax)
	je	.LBB49_630
# BB#631:                               #   in Loop: Header=BB49_624 Depth=2
	movq	408(%rsp), %rax
	movq	56(%rsp), %rcx
	cmpq	(%rax), %rcx
	je	.LBB49_624
# BB#632:                               #   in Loop: Header=BB49_624 Depth=2
	movq	384(%rsp), %rax
	subq	56(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 384(%rsp)
	movq	320(%rsp), %rax
	subq	56(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 320(%rsp)
	cmpq	$0, 304(%rsp)
	je	.LBB49_634
# BB#633:                               #   in Loop: Header=BB49_624 Depth=2
	movq	304(%rsp), %rax
	subq	56(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 304(%rsp)
.LBB49_634:                             #   in Loop: Header=BB49_624 Depth=2
	cmpq	$0, 328(%rsp)
	je	.LBB49_636
# BB#635:                               #   in Loop: Header=BB49_624 Depth=2
	movq	328(%rsp), %rax
	subq	56(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 328(%rsp)
.LBB49_636:                             #   in Loop: Header=BB49_624 Depth=2
	cmpq	$0, 336(%rsp)
	je	.LBB49_624
	jmp	.LBB49_637
	.align	16, 0x90
.LBB49_664:                             #   in Loop: Header=BB49_651 Depth=2
	movq	336(%rsp), %rax
	subq	40(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 336(%rsp)
	.align	16, 0x90
.LBB49_651:                             #   Parent Loop BB49_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	408(%rsp), %rax
	movq	384(%rsp), %rcx
	subq	(%rax), %rcx
	incq	%rcx
	cmpq	8(%rax), %rcx
	jbe	.LBB49_665
# BB#652:                               #   in Loop: Header=BB49_651 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rax
	movq	%rax, 40(%rsp)
	movq	408(%rsp), %rax
	cmpq	$65536, 8(%rax)         # imm = 0x10000
	je	.LBB49_653
# BB#654:                               #   in Loop: Header=BB49_651 Depth=2
	movq	408(%rsp), %rax
	shlq	8(%rax)
	movq	408(%rsp), %rax
	cmpq	$65537, 8(%rax)         # imm = 0x10001
	jb	.LBB49_656
# BB#655:                               #   in Loop: Header=BB49_651 Depth=2
	movq	408(%rsp), %rax
	movq	$65536, 8(%rax)         # imm = 0x10000
.LBB49_656:                             #   in Loop: Header=BB49_651 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rdi
	movq	8(%rax), %rsi
	callq	realloc
	movq	408(%rsp), %rcx
	movq	%rax, (%rcx)
	movq	408(%rsp), %rax
	cmpq	$0, (%rax)
	je	.LBB49_657
# BB#658:                               #   in Loop: Header=BB49_651 Depth=2
	movq	408(%rsp), %rax
	movq	40(%rsp), %rcx
	cmpq	(%rax), %rcx
	je	.LBB49_651
# BB#659:                               #   in Loop: Header=BB49_651 Depth=2
	movq	384(%rsp), %rax
	subq	40(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 384(%rsp)
	movq	320(%rsp), %rax
	subq	40(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 320(%rsp)
	cmpq	$0, 304(%rsp)
	je	.LBB49_661
# BB#660:                               #   in Loop: Header=BB49_651 Depth=2
	movq	304(%rsp), %rax
	subq	40(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 304(%rsp)
.LBB49_661:                             #   in Loop: Header=BB49_651 Depth=2
	cmpq	$0, 328(%rsp)
	je	.LBB49_663
# BB#662:                               #   in Loop: Header=BB49_651 Depth=2
	movq	328(%rsp), %rax
	subq	40(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 328(%rsp)
.LBB49_663:                             #   in Loop: Header=BB49_651 Depth=2
	cmpq	$0, 336(%rsp)
	je	.LBB49_651
	jmp	.LBB49_664
	.align	16, 0x90
.LBB49_714:                             #   in Loop: Header=BB49_701 Depth=2
	movq	336(%rsp), %rax
	subq	16(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 336(%rsp)
	.align	16, 0x90
.LBB49_701:                             #   Parent Loop BB49_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	408(%rsp), %rax
	movq	384(%rsp), %rcx
	subq	(%rax), %rcx
	addq	$2, %rcx
	cmpq	8(%rax), %rcx
	jbe	.LBB49_715
# BB#702:                               #   in Loop: Header=BB49_701 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rax
	movq	%rax, 16(%rsp)
	movq	408(%rsp), %rax
	cmpq	$65536, 8(%rax)         # imm = 0x10000
	je	.LBB49_703
# BB#704:                               #   in Loop: Header=BB49_701 Depth=2
	movq	408(%rsp), %rax
	shlq	8(%rax)
	movq	408(%rsp), %rax
	cmpq	$65537, 8(%rax)         # imm = 0x10001
	jb	.LBB49_706
# BB#705:                               #   in Loop: Header=BB49_701 Depth=2
	movq	408(%rsp), %rax
	movq	$65536, 8(%rax)         # imm = 0x10000
.LBB49_706:                             #   in Loop: Header=BB49_701 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rdi
	movq	8(%rax), %rsi
	callq	realloc
	movq	408(%rsp), %rcx
	movq	%rax, (%rcx)
	movq	408(%rsp), %rax
	cmpq	$0, (%rax)
	je	.LBB49_707
# BB#708:                               #   in Loop: Header=BB49_701 Depth=2
	movq	408(%rsp), %rax
	movq	16(%rsp), %rcx
	cmpq	(%rax), %rcx
	je	.LBB49_701
# BB#709:                               #   in Loop: Header=BB49_701 Depth=2
	movq	384(%rsp), %rax
	subq	16(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 384(%rsp)
	movq	320(%rsp), %rax
	subq	16(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 320(%rsp)
	cmpq	$0, 304(%rsp)
	je	.LBB49_711
# BB#710:                               #   in Loop: Header=BB49_701 Depth=2
	movq	304(%rsp), %rax
	subq	16(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 304(%rsp)
.LBB49_711:                             #   in Loop: Header=BB49_701 Depth=2
	cmpq	$0, 328(%rsp)
	je	.LBB49_713
# BB#712:                               #   in Loop: Header=BB49_701 Depth=2
	movq	328(%rsp), %rax
	subq	16(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 328(%rsp)
.LBB49_713:                             #   in Loop: Header=BB49_701 Depth=2
	cmpq	$0, 336(%rsp)
	je	.LBB49_701
	jmp	.LBB49_714
.LBB49_223:                             #   in Loop: Header=BB49_10 Depth=1
	movq	384(%rsp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, 384(%rsp)
	movb	$32, (%rax)
	movq	384(%rsp), %rax
	movq	$0, 24(%rax)
	movq	$0, 16(%rax)
	movq	$0, 8(%rax)
	movq	$0, (%rax)
	movq	384(%rsp), %rax
	movzbl	-2(%rax), %eax
	cmpl	$4, %eax
	jne	.LBB49_226
# BB#224:                               #   in Loop: Header=BB49_10 Depth=1
	testb	$1, 417(%rsp)
	je	.LBB49_226
# BB#225:                               #   in Loop: Header=BB49_10 Depth=1
	movq	384(%rsp), %rax
	movzbl	1(%rax), %ecx
	orl	$4, %ecx
	movb	%cl, 1(%rax)
	jmp	.LBB49_226
.LBB49_174:                             #   in Loop: Header=BB49_10 Depth=1
	movq	384(%rsp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, 384(%rsp)
	movb	$2, (%rax)
	jmp	.LBB49_10
.LBB49_64:                              #   in Loop: Header=BB49_10 Depth=1
	movq	384(%rsp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, 384(%rsp)
	movb	$9, (%rax)
	jmp	.LBB49_10
	.align	16, 0x90
.LBB49_679:                             #   in Loop: Header=BB49_666 Depth=2
	movq	336(%rsp), %rax
	subq	32(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 336(%rsp)
	.align	16, 0x90
.LBB49_666:                             #   Parent Loop BB49_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	408(%rsp), %rax
	movq	384(%rsp), %rcx
	subq	(%rax), %rcx
	incq	%rcx
	cmpq	8(%rax), %rcx
	jbe	.LBB49_680
# BB#667:                               #   in Loop: Header=BB49_666 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rax
	movq	%rax, 32(%rsp)
	movq	408(%rsp), %rax
	cmpq	$65536, 8(%rax)         # imm = 0x10000
	je	.LBB49_668
# BB#669:                               #   in Loop: Header=BB49_666 Depth=2
	movq	408(%rsp), %rax
	shlq	8(%rax)
	movq	408(%rsp), %rax
	cmpq	$65537, 8(%rax)         # imm = 0x10001
	jb	.LBB49_671
# BB#670:                               #   in Loop: Header=BB49_666 Depth=2
	movq	408(%rsp), %rax
	movq	$65536, 8(%rax)         # imm = 0x10000
.LBB49_671:                             #   in Loop: Header=BB49_666 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rdi
	movq	8(%rax), %rsi
	callq	realloc
	movq	408(%rsp), %rcx
	movq	%rax, (%rcx)
	movq	408(%rsp), %rax
	cmpq	$0, (%rax)
	je	.LBB49_672
# BB#673:                               #   in Loop: Header=BB49_666 Depth=2
	movq	408(%rsp), %rax
	movq	32(%rsp), %rcx
	cmpq	(%rax), %rcx
	je	.LBB49_666
# BB#674:                               #   in Loop: Header=BB49_666 Depth=2
	movq	384(%rsp), %rax
	subq	32(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 384(%rsp)
	movq	320(%rsp), %rax
	subq	32(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 320(%rsp)
	cmpq	$0, 304(%rsp)
	je	.LBB49_676
# BB#675:                               #   in Loop: Header=BB49_666 Depth=2
	movq	304(%rsp), %rax
	subq	32(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 304(%rsp)
.LBB49_676:                             #   in Loop: Header=BB49_666 Depth=2
	cmpq	$0, 328(%rsp)
	je	.LBB49_678
# BB#677:                               #   in Loop: Header=BB49_666 Depth=2
	movq	328(%rsp), %rax
	subq	32(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 328(%rsp)
.LBB49_678:                             #   in Loop: Header=BB49_666 Depth=2
	cmpq	$0, 336(%rsp)
	je	.LBB49_666
	jmp	.LBB49_679
	.align	16, 0x90
.LBB49_649:                             #   in Loop: Header=BB49_369 Depth=2
	movq	336(%rsp), %rax
	subq	48(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 336(%rsp)
	.align	16, 0x90
.LBB49_369:                             #   Parent Loop BB49_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	408(%rsp), %rax
	movq	384(%rsp), %rcx
	subq	(%rax), %rcx
	incq	%rcx
	cmpq	8(%rax), %rcx
	jbe	.LBB49_650
# BB#370:                               #   in Loop: Header=BB49_369 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rax
	movq	%rax, 48(%rsp)
	movq	408(%rsp), %rax
	cmpq	$65536, 8(%rax)         # imm = 0x10000
	je	.LBB49_371
# BB#639:                               #   in Loop: Header=BB49_369 Depth=2
	movq	408(%rsp), %rax
	shlq	8(%rax)
	movq	408(%rsp), %rax
	cmpq	$65537, 8(%rax)         # imm = 0x10001
	jb	.LBB49_641
# BB#640:                               #   in Loop: Header=BB49_369 Depth=2
	movq	408(%rsp), %rax
	movq	$65536, 8(%rax)         # imm = 0x10000
.LBB49_641:                             #   in Loop: Header=BB49_369 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rdi
	movq	8(%rax), %rsi
	callq	realloc
	movq	408(%rsp), %rcx
	movq	%rax, (%rcx)
	movq	408(%rsp), %rax
	cmpq	$0, (%rax)
	je	.LBB49_642
# BB#643:                               #   in Loop: Header=BB49_369 Depth=2
	movq	408(%rsp), %rax
	movq	48(%rsp), %rcx
	cmpq	(%rax), %rcx
	je	.LBB49_369
# BB#644:                               #   in Loop: Header=BB49_369 Depth=2
	movq	384(%rsp), %rax
	subq	48(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 384(%rsp)
	movq	320(%rsp), %rax
	subq	48(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 320(%rsp)
	cmpq	$0, 304(%rsp)
	je	.LBB49_646
# BB#645:                               #   in Loop: Header=BB49_369 Depth=2
	movq	304(%rsp), %rax
	subq	48(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 304(%rsp)
.LBB49_646:                             #   in Loop: Header=BB49_369 Depth=2
	cmpq	$0, 328(%rsp)
	je	.LBB49_648
# BB#647:                               #   in Loop: Header=BB49_369 Depth=2
	movq	328(%rsp), %rax
	subq	48(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 328(%rsp)
.LBB49_648:                             #   in Loop: Header=BB49_369 Depth=2
	cmpq	$0, 336(%rsp)
	je	.LBB49_369
	jmp	.LBB49_649
.LBB49_608:                             #   in Loop: Header=BB49_10 Depth=1
	movq	384(%rsp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, 384(%rsp)
	movb	$24, (%rax)
	jmp	.LBB49_10
.LBB49_521:                             #   in Loop: Header=BB49_10 Depth=1
	testb	$16, 417(%rsp)
	jne	.LBB49_528
# BB#522:                               #   in Loop: Header=BB49_10 Depth=1
	movzbl	407(%rsp), %eax
	cmpl	$92, %eax
	jne	.LBB49_523
# BB#524:                               #   in Loop: Header=BB49_10 Depth=1
	movq	360(%rsp), %rax
	cmpq	352(%rsp), %rax
	je	.LBB49_525
# BB#526:                               #   in Loop: Header=BB49_10 Depth=1
	movq	360(%rsp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, 360(%rsp)
	movb	(%rax), %al
	movb	%al, 407(%rsp)
	cmpq	$0, 344(%rsp)
	je	.LBB49_528
# BB#527:                               #   in Loop: Header=BB49_10 Depth=1
	movzbl	407(%rsp), %eax
	movq	344(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, 407(%rsp)
.LBB49_528:                             #   in Loop: Header=BB49_10 Depth=1
	movzbl	407(%rsp), %eax
	cmpl	$125, %eax
	je	.LBB49_531
# BB#529:                               #   in Loop: Header=BB49_10 Depth=1
	testb	$16, 417(%rsp)
	jne	.LBB49_570
	jmp	.LBB49_530
.LBB49_695:                             #   in Loop: Header=BB49_10 Depth=1
	movq	384(%rsp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, 384(%rsp)
	movb	$11, (%rax)
	jmp	.LBB49_10
	.align	16, 0x90
.LBB49_403:                             #   in Loop: Header=BB49_390 Depth=2
	movq	336(%rsp), %rax
	subq	168(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 336(%rsp)
	.align	16, 0x90
.LBB49_390:                             #   Parent Loop BB49_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	408(%rsp), %rax
	movq	384(%rsp), %rcx
	subq	(%rax), %rcx
	addq	$3, %rcx
	cmpq	8(%rax), %rcx
	jbe	.LBB49_404
# BB#391:                               #   in Loop: Header=BB49_390 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rax
	movq	%rax, 168(%rsp)
	movq	408(%rsp), %rax
	cmpq	$65536, 8(%rax)         # imm = 0x10000
	je	.LBB49_392
# BB#393:                               #   in Loop: Header=BB49_390 Depth=2
	movq	408(%rsp), %rax
	shlq	8(%rax)
	movq	408(%rsp), %rax
	cmpq	$65537, 8(%rax)         # imm = 0x10001
	jb	.LBB49_395
# BB#394:                               #   in Loop: Header=BB49_390 Depth=2
	movq	408(%rsp), %rax
	movq	$65536, 8(%rax)         # imm = 0x10000
.LBB49_395:                             #   in Loop: Header=BB49_390 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rdi
	movq	8(%rax), %rsi
	callq	realloc
	movq	408(%rsp), %rcx
	movq	%rax, (%rcx)
	movq	408(%rsp), %rax
	cmpq	$0, (%rax)
	je	.LBB49_396
# BB#397:                               #   in Loop: Header=BB49_390 Depth=2
	movq	408(%rsp), %rax
	movq	168(%rsp), %rcx
	cmpq	(%rax), %rcx
	je	.LBB49_390
# BB#398:                               #   in Loop: Header=BB49_390 Depth=2
	movq	384(%rsp), %rax
	subq	168(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 384(%rsp)
	movq	320(%rsp), %rax
	subq	168(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 320(%rsp)
	cmpq	$0, 304(%rsp)
	je	.LBB49_400
# BB#399:                               #   in Loop: Header=BB49_390 Depth=2
	movq	304(%rsp), %rax
	subq	168(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 304(%rsp)
.LBB49_400:                             #   in Loop: Header=BB49_390 Depth=2
	cmpq	$0, 328(%rsp)
	je	.LBB49_402
# BB#401:                               #   in Loop: Header=BB49_390 Depth=2
	movq	328(%rsp), %rax
	subq	168(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 328(%rsp)
.LBB49_402:                             #   in Loop: Header=BB49_390 Depth=2
	cmpq	$0, 336(%rsp)
	je	.LBB49_390
	jmp	.LBB49_403
	.align	16, 0x90
.LBB49_425:                             #   in Loop: Header=BB49_412 Depth=2
	movq	336(%rsp), %rax
	subq	160(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 336(%rsp)
	.align	16, 0x90
.LBB49_412:                             #   Parent Loop BB49_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	408(%rsp), %rax
	movq	384(%rsp), %rcx
	subq	(%rax), %rcx
	incq	%rcx
	cmpq	8(%rax), %rcx
	jbe	.LBB49_426
# BB#413:                               #   in Loop: Header=BB49_412 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rax
	movq	%rax, 160(%rsp)
	movq	408(%rsp), %rax
	cmpq	$65536, 8(%rax)         # imm = 0x10000
	je	.LBB49_414
# BB#415:                               #   in Loop: Header=BB49_412 Depth=2
	movq	408(%rsp), %rax
	shlq	8(%rax)
	movq	408(%rsp), %rax
	cmpq	$65537, 8(%rax)         # imm = 0x10001
	jb	.LBB49_417
# BB#416:                               #   in Loop: Header=BB49_412 Depth=2
	movq	408(%rsp), %rax
	movq	$65536, 8(%rax)         # imm = 0x10000
.LBB49_417:                             #   in Loop: Header=BB49_412 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rdi
	movq	8(%rax), %rsi
	callq	realloc
	movq	408(%rsp), %rcx
	movq	%rax, (%rcx)
	movq	408(%rsp), %rax
	cmpq	$0, (%rax)
	je	.LBB49_418
# BB#419:                               #   in Loop: Header=BB49_412 Depth=2
	movq	408(%rsp), %rax
	movq	160(%rsp), %rcx
	cmpq	(%rax), %rcx
	je	.LBB49_412
# BB#420:                               #   in Loop: Header=BB49_412 Depth=2
	movq	384(%rsp), %rax
	subq	160(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 384(%rsp)
	movq	320(%rsp), %rax
	subq	160(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 320(%rsp)
	cmpq	$0, 304(%rsp)
	je	.LBB49_422
# BB#421:                               #   in Loop: Header=BB49_412 Depth=2
	movq	304(%rsp), %rax
	subq	160(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 304(%rsp)
.LBB49_422:                             #   in Loop: Header=BB49_412 Depth=2
	cmpq	$0, 328(%rsp)
	je	.LBB49_424
# BB#423:                               #   in Loop: Header=BB49_412 Depth=2
	movq	328(%rsp), %rax
	subq	160(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 328(%rsp)
.LBB49_424:                             #   in Loop: Header=BB49_412 Depth=2
	cmpq	$0, 336(%rsp)
	je	.LBB49_412
	jmp	.LBB49_425
.LBB49_94:                              #   in Loop: Header=BB49_10 Depth=1
	decq	360(%rsp)
.LBB49_95:                              #   in Loop: Header=BB49_10 Depth=1
	cmpq	$0, 328(%rsp)
	je	.LBB49_10
# BB#96:                                #   in Loop: Header=BB49_10 Depth=1
	cmpb	$0, 277(%rsp)
	je	.LBB49_129
	jmp	.LBB49_97
.LBB49_719:                             #   in Loop: Header=BB49_10 Depth=1
	movzbl	407(%rsp), %eax
.LBB49_720:                             #   in Loop: Header=BB49_10 Depth=1
	movb	%al, 407(%rsp)
	jmp	.LBB49_721
.LBB49_623:                             #   in Loop: Header=BB49_10 Depth=1
	movq	384(%rsp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, 384(%rsp)
	movb	$25, (%rax)
	jmp	.LBB49_10
.LBB49_638:                             #   in Loop: Header=BB49_10 Depth=1
	movq	384(%rsp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, 384(%rsp)
	movb	$26, (%rax)
	jmp	.LBB49_10
.LBB49_665:                             #   in Loop: Header=BB49_10 Depth=1
	movq	384(%rsp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, 384(%rsp)
	movb	$28, (%rax)
	jmp	.LBB49_10
.LBB49_715:                             #   in Loop: Header=BB49_10 Depth=1
	movq	384(%rsp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, 384(%rsp)
	movb	$7, (%rax)
	movq	384(%rsp), %rax
	leaq	1(%rax), %rcx
	movb	406(%rsp), %dl
	movq	%rcx, 384(%rsp)
	movb	%dl, (%rax)
	jmp	.LBB49_10
	.align	16, 0x90
.LBB49_348:                             #   in Loop: Header=BB49_226 Depth=2
	movq	384(%rsp), %rax
	movzbl	11(%rax), %ecx
	orl	$8, %ecx
	movb	%cl, 11(%rax)
	movq	384(%rsp), %rax
	movzbl	7(%rax), %ecx
	orl	$4, %ecx
	movb	%cl, 7(%rax)
	movb	$0, 239(%rsp)
	.align	16, 0x90
.LBB49_226:                             #   Parent Loop BB49_10 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB49_305 Depth 3
                                        #       Child Loop BB49_274 Depth 3
                                        #       Child Loop BB49_346 Depth 3
	movq	360(%rsp), %rax
	cmpq	352(%rsp), %rax
	je	.LBB49_227
# BB#228:                               #   in Loop: Header=BB49_226 Depth=2
	movq	360(%rsp), %rax
	cmpq	352(%rsp), %rax
	je	.LBB49_229
# BB#230:                               #   in Loop: Header=BB49_226 Depth=2
	movq	360(%rsp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, 360(%rsp)
	movb	(%rax), %al
	movb	%al, 407(%rsp)
	cmpq	$0, 344(%rsp)
	je	.LBB49_232
# BB#231:                               #   in Loop: Header=BB49_226 Depth=2
	movzbl	407(%rsp), %eax
	movq	344(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, 407(%rsp)
.LBB49_232:                             #   in Loop: Header=BB49_226 Depth=2
	testb	$1, 416(%rsp)
	je	.LBB49_242
# BB#233:                               #   in Loop: Header=BB49_226 Depth=2
	movzbl	407(%rsp), %eax
	cmpl	$92, %eax
	jne	.LBB49_242
# BB#234:                               #   in Loop: Header=BB49_226 Depth=2
	movq	360(%rsp), %rax
	cmpq	352(%rsp), %rax
	je	.LBB49_235
# BB#236:                               #   in Loop: Header=BB49_226 Depth=2
	movq	360(%rsp), %rax
	cmpq	352(%rsp), %rax
	je	.LBB49_237
# BB#238:                               #   in Loop: Header=BB49_226 Depth=2
	movq	360(%rsp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, 360(%rsp)
	movb	(%rax), %al
	movb	%al, 406(%rsp)
	cmpq	$0, 344(%rsp)
	je	.LBB49_240
# BB#239:                               #   in Loop: Header=BB49_226 Depth=2
	movzbl	406(%rsp), %eax
	movq	344(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, 406(%rsp)
.LBB49_240:                             #   in Loop: Header=BB49_226 Depth=2
	movzbl	406(%rsp), %eax
	jmp	.LBB49_241
.LBB49_242:                             #   in Loop: Header=BB49_226 Depth=2
	movzbl	407(%rsp), %eax
	cmpl	$93, %eax
	jne	.LBB49_244
# BB#243:                               #   in Loop: Header=BB49_226 Depth=2
	movq	392(%rsp), %rax
	incq	%rax
	cmpq	%rax, 360(%rsp)
	jne	.LBB49_350
.LBB49_244:                             #   in Loop: Header=BB49_226 Depth=2
	movsbl	239(%rsp), %eax
	testl	%eax, %eax
	je	.LBB49_248
# BB#245:                               #   in Loop: Header=BB49_226 Depth=2
	movzbl	407(%rsp), %eax
	cmpl	$45, %eax
	jne	.LBB49_248
# BB#246:                               #   in Loop: Header=BB49_226 Depth=2
	movq	360(%rsp), %rax
	movsbl	(%rax), %eax
	cmpl	$93, %eax
	jne	.LBB49_247
.LBB49_248:                             #   in Loop: Header=BB49_226 Depth=2
	movzbl	407(%rsp), %eax
	cmpl	$45, %eax
	jne	.LBB49_257
# BB#249:                               #   in Loop: Header=BB49_226 Depth=2
	movq	360(%rsp), %rax
	addq	$-2, %rax
	cmpq	424(%rsp), %rax
	jb	.LBB49_251
# BB#250:                               #   in Loop: Header=BB49_226 Depth=2
	movq	360(%rsp), %rax
	movsbl	-2(%rax), %eax
	cmpl	$91, %eax
	je	.LBB49_257
.LBB49_251:                             #   in Loop: Header=BB49_226 Depth=2
	movq	360(%rsp), %rax
	addq	$-3, %rax
	cmpq	424(%rsp), %rax
	jb	.LBB49_254
# BB#252:                               #   in Loop: Header=BB49_226 Depth=2
	movq	360(%rsp), %rax
	movsbl	-3(%rax), %eax
	cmpl	$91, %eax
	jne	.LBB49_254
# BB#253:                               #   in Loop: Header=BB49_226 Depth=2
	movq	360(%rsp), %rax
	movsbl	-2(%rax), %eax
	cmpl	$94, %eax
	je	.LBB49_257
.LBB49_254:                             #   in Loop: Header=BB49_226 Depth=2
	movq	360(%rsp), %rax
	movsbl	(%rax), %eax
	cmpl	$93, %eax
	je	.LBB49_257
# BB#255:                               #   in Loop: Header=BB49_226 Depth=2
	movq	384(%rsp), %r8
	movl	416(%rsp), %ecx
	movq	344(%rsp), %rdx
	movq	352(%rsp), %rsi
	movq	%r14, %rdi
	xorb	%al, %al
	callq	compile_range
	movl	%eax, 204(%rsp)
	testl	%eax, %eax
	je	.LBB49_226
	jmp	.LBB49_256
.LBB49_257:                             #   in Loop: Header=BB49_226 Depth=2
	movq	360(%rsp), %rax
	movsbl	(%rax), %eax
	cmpl	$45, %eax
	jne	.LBB49_265
# BB#258:                               #   in Loop: Header=BB49_226 Depth=2
	movq	360(%rsp), %rax
	movsbl	1(%rax), %eax
	cmpl	$93, %eax
	je	.LBB49_265
# BB#259:                               #   in Loop: Header=BB49_226 Depth=2
	movq	360(%rsp), %rax
	cmpq	352(%rsp), %rax
	je	.LBB49_260
# BB#261:                               #   in Loop: Header=BB49_226 Depth=2
	movq	360(%rsp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, 360(%rsp)
	movb	(%rax), %al
	movb	%al, 406(%rsp)
	cmpq	$0, 344(%rsp)
	je	.LBB49_263
# BB#262:                               #   in Loop: Header=BB49_226 Depth=2
	movzbl	406(%rsp), %eax
	movq	344(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, 406(%rsp)
.LBB49_263:                             #   in Loop: Header=BB49_226 Depth=2
	movq	384(%rsp), %r8
	movl	416(%rsp), %ecx
	movq	344(%rsp), %rdx
	movq	352(%rsp), %rsi
	movq	%r14, %rdi
	xorb	%al, %al
	callq	compile_range
	movl	%eax, 200(%rsp)
	testl	%eax, %eax
	je	.LBB49_226
	jmp	.LBB49_264
.LBB49_265:                             #   in Loop: Header=BB49_226 Depth=2
	testb	$4, 416(%rsp)
	je	.LBB49_349
# BB#266:                               #   in Loop: Header=BB49_226 Depth=2
	movzbl	407(%rsp), %eax
	cmpl	$91, %eax
	jne	.LBB49_349
# BB#267:                               #   in Loop: Header=BB49_226 Depth=2
	movq	360(%rsp), %rax
	movsbl	(%rax), %eax
	cmpl	$58, %eax
	jne	.LBB49_349
# BB#268:                               #   in Loop: Header=BB49_226 Depth=2
	movq	360(%rsp), %rax
	cmpq	352(%rsp), %rax
	je	.LBB49_269
# BB#270:                               #   in Loop: Header=BB49_226 Depth=2
	movq	360(%rsp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, 360(%rsp)
	movb	(%rax), %al
	movb	%al, 407(%rsp)
	cmpq	$0, 344(%rsp)
	je	.LBB49_272
# BB#271:                               #   in Loop: Header=BB49_226 Depth=2
	movzbl	407(%rsp), %eax
	movq	344(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, 407(%rsp)
.LBB49_272:                             #   in Loop: Header=BB49_226 Depth=2
	movb	$0, 406(%rsp)
	movq	360(%rsp), %rax
	cmpq	352(%rsp), %rax
	jne	.LBB49_274
	jmp	.LBB49_273
.LBB49_349:                             #   in Loop: Header=BB49_226 Depth=2
	movb	$0, 239(%rsp)
	movzbl	407(%rsp), %eax
.LBB49_241:                             #   in Loop: Header=BB49_226 Depth=2
	movb	%al, %cl
	andb	$7, %cl
	movl	%ebp, %edx
	shll	%cl, %edx
	shrl	$3, %eax
	movq	384(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	orl	%edx, %esi
	movb	%sil, (%rcx,%rax)
	jmp	.LBB49_226
	.align	16, 0x90
.LBB49_282:                             #   in Loop: Header=BB49_274 Depth=3
	movzbl	406(%rsp), %eax
	movb	%al, %cl
	incb	%cl
	movb	407(%rsp), %dl
	movb	%cl, 406(%rsp)
	movb	%dl, 193(%rsp,%rax)
.LBB49_274:                             #   Parent Loop BB49_10 Depth=1
                                        #     Parent Loop BB49_226 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	360(%rsp), %rax
	cmpq	352(%rsp), %rax
	je	.LBB49_275
# BB#276:                               #   in Loop: Header=BB49_274 Depth=3
	movq	360(%rsp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, 360(%rsp)
	movb	(%rax), %al
	movb	%al, 407(%rsp)
	cmpq	$0, 344(%rsp)
	je	.LBB49_278
# BB#277:                               #   in Loop: Header=BB49_274 Depth=3
	movzbl	407(%rsp), %eax
	movq	344(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, 407(%rsp)
.LBB49_278:                             #   in Loop: Header=BB49_274 Depth=3
	cmpb	$58, 407(%rsp)
	je	.LBB49_283
# BB#279:                               #   in Loop: Header=BB49_274 Depth=3
	cmpb	$93, 407(%rsp)
	je	.LBB49_283
# BB#280:                               #   in Loop: Header=BB49_274 Depth=3
	movq	360(%rsp), %rax
	cmpq	352(%rsp), %rax
	je	.LBB49_283
# BB#281:                               #   in Loop: Header=BB49_274 Depth=3
	cmpb	$6, 406(%rsp)
	jne	.LBB49_282
.LBB49_283:                             #   in Loop: Header=BB49_226 Depth=2
	movzbl	406(%rsp), %eax
	movb	$0, 193(%rsp,%rax)
	movzbl	407(%rsp), %eax
	cmpl	$58, %eax
	jne	.LBB49_345
# BB#284:                               #   in Loop: Header=BB49_226 Depth=2
	movq	360(%rsp), %rax
	movsbl	(%rax), %eax
	cmpl	$93, %eax
	jne	.LBB49_345
# BB#285:                               #   in Loop: Header=BB49_226 Depth=2
	movq	%r15, %rdi
	movl	$.L.str67, %esi
	callq	strcmp
	testl	%eax, %eax
	sete	187(%rsp)
	movq	%r15, %rdi
	movl	$.L.str68, %esi
	callq	strcmp
	testl	%eax, %eax
	sete	186(%rsp)
	movq	%r15, %rdi
	movl	$.L.str69, %esi
	callq	strcmp
	testl	%eax, %eax
	sete	185(%rsp)
	movq	%r15, %rdi
	movl	$.L.str70, %esi
	callq	strcmp
	testl	%eax, %eax
	sete	184(%rsp)
	movq	%r15, %rdi
	movl	$.L.str71, %esi
	callq	strcmp
	testl	%eax, %eax
	sete	183(%rsp)
	movq	%r15, %rdi
	movl	$.L.str72, %esi
	callq	strcmp
	testl	%eax, %eax
	sete	182(%rsp)
	movq	%r15, %rdi
	movl	$.L.str73, %esi
	callq	strcmp
	testl	%eax, %eax
	sete	181(%rsp)
	movq	%r15, %rdi
	movl	$.L.str74, %esi
	callq	strcmp
	testl	%eax, %eax
	sete	180(%rsp)
	movq	%r15, %rdi
	movl	$.L.str75, %esi
	callq	strcmp
	testl	%eax, %eax
	sete	179(%rsp)
	movq	%r15, %rdi
	movl	$.L.str76, %esi
	callq	strcmp
	testl	%eax, %eax
	sete	178(%rsp)
	movq	%r15, %rdi
	movl	$.L.str77, %esi
	callq	strcmp
	testl	%eax, %eax
	sete	177(%rsp)
	movq	%r15, %rdi
	movl	$.L.str78, %esi
	callq	strcmp
	testl	%eax, %eax
	sete	176(%rsp)
	movq	%r15, %rdi
	movl	$.L.str68, %esi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB49_298
# BB#286:                               #   in Loop: Header=BB49_226 Depth=2
	movq	%r15, %rdi
	movl	$.L.str77, %esi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB49_298
# BB#287:                               #   in Loop: Header=BB49_226 Depth=2
	movq	%r15, %rdi
	movl	$.L.str73, %esi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB49_298
# BB#288:                               #   in Loop: Header=BB49_226 Depth=2
	movq	%r15, %rdi
	movl	$.L.str71, %esi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB49_298
# BB#289:                               #   in Loop: Header=BB49_226 Depth=2
	movq	%r15, %rdi
	movl	$.L.str67, %esi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB49_298
# BB#290:                               #   in Loop: Header=BB49_226 Depth=2
	movq	%r15, %rdi
	movl	$.L.str78, %esi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB49_298
# BB#291:                               #   in Loop: Header=BB49_226 Depth=2
	movq	%r15, %rdi
	movl	$.L.str76, %esi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB49_298
# BB#292:                               #   in Loop: Header=BB49_226 Depth=2
	movq	%r15, %rdi
	movl	$.L.str74, %esi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB49_298
# BB#293:                               #   in Loop: Header=BB49_226 Depth=2
	movq	%r15, %rdi
	movl	$.L.str75, %esi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB49_298
# BB#294:                               #   in Loop: Header=BB49_226 Depth=2
	movq	%r15, %rdi
	movl	$.L.str72, %esi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB49_298
# BB#295:                               #   in Loop: Header=BB49_226 Depth=2
	movq	%r15, %rdi
	movl	$.L.str70, %esi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB49_298
# BB#296:                               #   in Loop: Header=BB49_226 Depth=2
	movq	%r15, %rdi
	movl	$.L.str69, %esi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB49_297
.LBB49_298:                             #   in Loop: Header=BB49_226 Depth=2
	movq	360(%rsp), %rax
	cmpq	352(%rsp), %rax
	je	.LBB49_299
# BB#300:                               #   in Loop: Header=BB49_226 Depth=2
	movq	360(%rsp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, 360(%rsp)
	movb	(%rax), %al
	movb	%al, 407(%rsp)
	cmpq	$0, 344(%rsp)
	je	.LBB49_302
# BB#301:                               #   in Loop: Header=BB49_226 Depth=2
	movzbl	407(%rsp), %eax
	movq	344(%rsp), %rcx
	movb	(%rcx,%rax), %al
	movb	%al, 407(%rsp)
.LBB49_302:                             #   in Loop: Header=BB49_226 Depth=2
	movq	360(%rsp), %rax
	cmpq	352(%rsp), %rax
	je	.LBB49_303
# BB#304:                               #   in Loop: Header=BB49_226 Depth=2
	movl	$0, 188(%rsp)
	jmp	.LBB49_305
.LBB49_345:                             #   in Loop: Header=BB49_226 Depth=2
	incb	406(%rsp)
	jmp	.LBB49_346
	.align	16, 0x90
.LBB49_343:                             #   in Loop: Header=BB49_305 Depth=3
	incl	188(%rsp)
.LBB49_305:                             #   Parent Loop BB49_10 Depth=1
                                        #     Parent Loop BB49_226 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	cmpl	$255, 188(%rsp)
	jg	.LBB49_344
# BB#306:                               #   in Loop: Header=BB49_305 Depth=3
	movsbl	187(%rsp), %eax
	testl	%eax, %eax
	je	.LBB49_309
# BB#307:                               #   in Loop: Header=BB49_305 Depth=3
	testl	$-128, 188(%rsp)
	jne	.LBB49_309
# BB#308:                               #   in Loop: Header=BB49_305 Depth=3
	movslq	188(%rsp), %rbx
	callq	__ctype_b_loc
	movq	(%rax), %rax
	movzwl	(%rax,%rbx,2), %eax
	testb	$8, %al
	jne	.LBB49_342
.LBB49_309:                             #   in Loop: Header=BB49_305 Depth=3
	movsbl	186(%rsp), %eax
	testl	%eax, %eax
	je	.LBB49_312
# BB#310:                               #   in Loop: Header=BB49_305 Depth=3
	testl	$-128, 188(%rsp)
	jne	.LBB49_312
# BB#311:                               #   in Loop: Header=BB49_305 Depth=3
	movslq	188(%rsp), %rbx
	callq	__ctype_b_loc
	movq	(%rax), %rax
	movzwl	(%rax,%rbx,2), %eax
	testb	$4, %ah
	jne	.LBB49_342
.LBB49_312:                             #   in Loop: Header=BB49_305 Depth=3
	movsbl	185(%rsp), %eax
	testl	%eax, %eax
	je	.LBB49_315
# BB#313:                               #   in Loop: Header=BB49_305 Depth=3
	testl	$-128, 188(%rsp)
	jne	.LBB49_315
# BB#314:                               #   in Loop: Header=BB49_305 Depth=3
	movslq	188(%rsp), %rbx
	callq	__ctype_b_loc
	movq	(%rax), %rax
	movzwl	(%rax,%rbx,2), %eax
	testb	$1, %al
	jne	.LBB49_342
.LBB49_315:                             #   in Loop: Header=BB49_305 Depth=3
	movsbl	184(%rsp), %eax
	testl	%eax, %eax
	je	.LBB49_318
# BB#316:                               #   in Loop: Header=BB49_305 Depth=3
	testl	$-128, 188(%rsp)
	jne	.LBB49_318
# BB#317:                               #   in Loop: Header=BB49_305 Depth=3
	movslq	188(%rsp), %rbx
	callq	__ctype_b_loc
	movq	(%rax), %rax
	movzwl	(%rax,%rbx,2), %eax
	testb	$2, %al
	jne	.LBB49_342
.LBB49_318:                             #   in Loop: Header=BB49_305 Depth=3
	movsbl	183(%rsp), %eax
	testl	%eax, %eax
	je	.LBB49_321
# BB#319:                               #   in Loop: Header=BB49_305 Depth=3
	testl	$-128, 188(%rsp)
	jne	.LBB49_321
# BB#320:                               #   in Loop: Header=BB49_305 Depth=3
	movslq	188(%rsp), %rbx
	callq	__ctype_b_loc
	movq	(%rax), %rax
	movzwl	(%rax,%rbx,2), %eax
	testb	$8, %ah
	jne	.LBB49_342
.LBB49_321:                             #   in Loop: Header=BB49_305 Depth=3
	movsbl	182(%rsp), %eax
	testl	%eax, %eax
	je	.LBB49_324
# BB#322:                               #   in Loop: Header=BB49_305 Depth=3
	testl	$-128, 188(%rsp)
	jne	.LBB49_324
# BB#323:                               #   in Loop: Header=BB49_305 Depth=3
	movslq	188(%rsp), %rbx
	callq	__ctype_b_loc
	movq	(%rax), %rax
	movzwl	(%rax,%rbx,2), %eax
	testb	$-128, %ah
	jne	.LBB49_342
.LBB49_324:                             #   in Loop: Header=BB49_305 Depth=3
	movsbl	181(%rsp), %eax
	testl	%eax, %eax
	je	.LBB49_327
# BB#325:                               #   in Loop: Header=BB49_305 Depth=3
	testl	$-128, 188(%rsp)
	jne	.LBB49_327
# BB#326:                               #   in Loop: Header=BB49_305 Depth=3
	movslq	188(%rsp), %rbx
	callq	__ctype_b_loc
	movq	(%rax), %rax
	movzwl	(%rax,%rbx,2), %eax
	testb	$2, %ah
	jne	.LBB49_342
.LBB49_327:                             #   in Loop: Header=BB49_305 Depth=3
	movsbl	180(%rsp), %eax
	testl	%eax, %eax
	je	.LBB49_330
# BB#328:                               #   in Loop: Header=BB49_305 Depth=3
	testl	$-128, 188(%rsp)
	jne	.LBB49_330
# BB#329:                               #   in Loop: Header=BB49_305 Depth=3
	movslq	188(%rsp), %rbx
	callq	__ctype_b_loc
	movq	(%rax), %rax
	movzwl	(%rax,%rbx,2), %eax
	testb	$64, %ah
	jne	.LBB49_342
.LBB49_330:                             #   in Loop: Header=BB49_305 Depth=3
	movsbl	179(%rsp), %eax
	testl	%eax, %eax
	je	.LBB49_333
# BB#331:                               #   in Loop: Header=BB49_305 Depth=3
	testl	$-128, 188(%rsp)
	jne	.LBB49_333
# BB#332:                               #   in Loop: Header=BB49_305 Depth=3
	movslq	188(%rsp), %rbx
	callq	__ctype_b_loc
	movq	(%rax), %rax
	movzwl	(%rax,%rbx,2), %eax
	testb	$4, %al
	jne	.LBB49_342
.LBB49_333:                             #   in Loop: Header=BB49_305 Depth=3
	movsbl	178(%rsp), %eax
	testl	%eax, %eax
	je	.LBB49_336
# BB#334:                               #   in Loop: Header=BB49_305 Depth=3
	testl	$-128, 188(%rsp)
	jne	.LBB49_336
# BB#335:                               #   in Loop: Header=BB49_305 Depth=3
	movslq	188(%rsp), %rbx
	callq	__ctype_b_loc
	movq	(%rax), %rax
	movzwl	(%rax,%rbx,2), %eax
	testb	$32, %ah
	jne	.LBB49_342
.LBB49_336:                             #   in Loop: Header=BB49_305 Depth=3
	movsbl	177(%rsp), %eax
	testl	%eax, %eax
	je	.LBB49_339
# BB#337:                               #   in Loop: Header=BB49_305 Depth=3
	testl	$-128, 188(%rsp)
	jne	.LBB49_339
# BB#338:                               #   in Loop: Header=BB49_305 Depth=3
	movslq	188(%rsp), %rbx
	callq	__ctype_b_loc
	movq	(%rax), %rax
	movzwl	(%rax,%rbx,2), %eax
	testb	$1, %ah
	jne	.LBB49_342
.LBB49_339:                             #   in Loop: Header=BB49_305 Depth=3
	movsbl	176(%rsp), %eax
	testl	%eax, %eax
	je	.LBB49_343
# BB#340:                               #   in Loop: Header=BB49_305 Depth=3
	testl	$-128, 188(%rsp)
	jne	.LBB49_343
# BB#341:                               #   in Loop: Header=BB49_305 Depth=3
	movslq	188(%rsp), %rbx
	callq	__ctype_b_loc
	movq	(%rax), %rax
	testb	$16, 1(%rax,%rbx,2)
	je	.LBB49_343
.LBB49_342:                             #   in Loop: Header=BB49_305 Depth=3
	movzbl	188(%rsp), %eax
	movb	%al, %cl
	andb	$7, %cl
	movl	%ebp, %edx
	shll	%cl, %edx
	shrl	$3, %eax
	movq	384(%rsp), %rcx
	movzbl	(%rcx,%rax), %esi
	orl	%edx, %esi
	movb	%sil, (%rcx,%rax)
	jmp	.LBB49_343
	.align	16, 0x90
.LBB49_347:                             #   in Loop: Header=BB49_346 Depth=3
	decq	360(%rsp)
.LBB49_346:                             #   Parent Loop BB49_10 Depth=1
                                        #     Parent Loop BB49_226 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movb	406(%rsp), %al
	movb	%al, %cl
	decb	%cl
	movb	%cl, 406(%rsp)
	testb	%al, %al
	je	.LBB49_348
	jmp	.LBB49_347
.LBB49_344:                             #   in Loop: Header=BB49_226 Depth=2
	movb	$1, 239(%rsp)
	jmp	.LBB49_226
.LBB49_680:                             #   in Loop: Header=BB49_10 Depth=1
	movq	384(%rsp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, 384(%rsp)
	movb	$10, (%rax)
	jmp	.LBB49_10
.LBB49_650:                             #   in Loop: Header=BB49_10 Depth=1
	movq	384(%rsp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, 384(%rsp)
	movb	$27, (%rax)
	jmp	.LBB49_10
.LBB49_531:                             #   in Loop: Header=BB49_10 Depth=1
	cmpq	$0, 328(%rsp)
	jne	.LBB49_536
# BB#532:                               #   in Loop: Header=BB49_10 Depth=1
	testb	$32, 416(%rsp)
	jne	.LBB49_533
# BB#534:                               #   in Loop: Header=BB49_10 Depth=1
	testb	$16, 416(%rsp)
	je	.LBB49_570
# BB#535:                               #   in Loop: Header=BB49_10 Depth=1
	movq	384(%rsp), %rax
	movq	%rax, 328(%rsp)
.LBB49_536:                             #   in Loop: Header=BB49_10 Depth=1
	cmpl	$0, 112(%rsp)
	je	.LBB49_537
# BB#552:                               #   in Loop: Header=BB49_10 Depth=1
	cmpl	$1, 112(%rsp)
	setg	%al
	movzbl	%al, %eax
	imull	$10, %eax, %eax
	addl	$10, %eax
	movl	%eax, 100(%rsp)
	jmp	.LBB49_553
.LBB49_404:                             #   in Loop: Header=BB49_10 Depth=1
	movq	384(%rsp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, 384(%rsp)
	movb	$5, (%rax)
	movq	384(%rsp), %rax
	leaq	1(%rax), %rcx
	movb	300(%rsp), %dl
	movq	%rcx, 384(%rsp)
	movb	%dl, (%rax)
	movq	384(%rsp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, 384(%rsp)
	movb	$0, (%rax)
.LBB49_405:                             #   in Loop: Header=BB49_10 Depth=1
	incl	380(%rsp)
	movq	$0, 304(%rsp)
	movq	$0, 328(%rsp)
	movq	384(%rsp), %rax
	movq	%rax, 320(%rsp)
	movq	$0, 336(%rsp)
	jmp	.LBB49_10
.LBB49_426:                             #   in Loop: Header=BB49_10 Depth=1
	movq	384(%rsp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, 384(%rsp)
	movb	$19, (%rax)
	movq	384(%rsp), %rdx
	decq	%rdx
	movq	304(%rsp), %rsi
	subq	%rsi, %rdx
	addq	$-3, %rdx
	movl	$13, %edi
	xorb	%al, %al
	callq	store_op1
.LBB49_427:                             #   in Loop: Header=BB49_10 Depth=1
	cmpl	$0, 380(%rsp)
	jne	.LBB49_430
# BB#428:                               #   in Loop: Header=BB49_10 Depth=1
	testb	$2, 418(%rsp)
	je	.LBB49_429
.LBB49_721:                             #   in Loop: Header=BB49_10 Depth=1
	cmpq	$0, 336(%rsp)
	je	.LBB49_739
# BB#722:                               #   in Loop: Header=BB49_10 Depth=1
	movq	336(%rsp), %rax
	movzbl	(%rax), %ecx
	leaq	1(%rax,%rcx), %rax
	cmpq	384(%rsp), %rax
	jne	.LBB49_739
# BB#723:                               #   in Loop: Header=BB49_10 Depth=1
	movq	336(%rsp), %rax
	cmpb	$-1, (%rax)
	je	.LBB49_739
# BB#724:                               #   in Loop: Header=BB49_10 Depth=1
	movq	360(%rsp), %rax
	movsbl	(%rax), %eax
	cmpl	$42, %eax
	je	.LBB49_739
# BB#725:                               #   in Loop: Header=BB49_10 Depth=1
	movq	360(%rsp), %rax
	movsbl	(%rax), %eax
	cmpl	$94, %eax
	je	.LBB49_739
# BB#726:                               #   in Loop: Header=BB49_10 Depth=1
	testb	$2, 416(%rsp)
	je	.LBB49_730
# BB#727:                               #   in Loop: Header=BB49_10 Depth=1
	movq	360(%rsp), %rax
	movsbl	(%rax), %eax
	cmpl	$92, %eax
	jne	.LBB49_733
# BB#728:                               #   in Loop: Header=BB49_10 Depth=1
	movq	360(%rsp), %rax
	movsbl	1(%rax), %eax
	cmpl	$43, %eax
	je	.LBB49_739
# BB#729:                               #   in Loop: Header=BB49_10 Depth=1
	movq	360(%rsp), %rax
	movsbl	1(%rax), %eax
	jmp	.LBB49_732
.LBB49_730:                             #   in Loop: Header=BB49_10 Depth=1
	movq	360(%rsp), %rax
	movsbl	(%rax), %eax
	cmpl	$43, %eax
	je	.LBB49_739
# BB#731:                               #   in Loop: Header=BB49_10 Depth=1
	movq	360(%rsp), %rax
	movsbl	(%rax), %eax
.LBB49_732:                             #   in Loop: Header=BB49_10 Depth=1
	cmpl	$63, %eax
	je	.LBB49_739
.LBB49_733:                             #   in Loop: Header=BB49_10 Depth=1
	testb	$2, 417(%rsp)
	je	.LBB49_756
# BB#734:                               #   in Loop: Header=BB49_10 Depth=1
	testb	$16, 417(%rsp)
	je	.LBB49_736
# BB#735:                               #   in Loop: Header=BB49_10 Depth=1
	movq	360(%rsp), %rax
	movsbl	(%rax), %eax
	jmp	.LBB49_738
.LBB49_736:                             #   in Loop: Header=BB49_10 Depth=1
	movq	360(%rsp), %rax
	movsbl	(%rax), %eax
	cmpl	$92, %eax
	jne	.LBB49_756
# BB#737:                               #   in Loop: Header=BB49_10 Depth=1
	movq	360(%rsp), %rax
	movsbl	1(%rax), %eax
.LBB49_738:                             #   in Loop: Header=BB49_10 Depth=1
	cmpl	$123, %eax
	jne	.LBB49_756
.LBB49_739:                             #   in Loop: Header=BB49_10 Depth=1
	movq	384(%rsp), %rax
	movq	%rax, 328(%rsp)
	jmp	.LBB49_740
	.align	16, 0x90
.LBB49_753:                             #   in Loop: Header=BB49_740 Depth=2
	movq	336(%rsp), %rax
	subq	8(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 336(%rsp)
	.align	16, 0x90
.LBB49_740:                             #   Parent Loop BB49_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	408(%rsp), %rax
	movq	384(%rsp), %rcx
	subq	(%rax), %rcx
	addq	$2, %rcx
	cmpq	8(%rax), %rcx
	jbe	.LBB49_754
# BB#741:                               #   in Loop: Header=BB49_740 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rax
	movq	%rax, 8(%rsp)
	movq	408(%rsp), %rax
	cmpq	$65536, 8(%rax)         # imm = 0x10000
	je	.LBB49_742
# BB#743:                               #   in Loop: Header=BB49_740 Depth=2
	movq	408(%rsp), %rax
	shlq	8(%rax)
	movq	408(%rsp), %rax
	cmpq	$65537, 8(%rax)         # imm = 0x10001
	jb	.LBB49_745
# BB#744:                               #   in Loop: Header=BB49_740 Depth=2
	movq	408(%rsp), %rax
	movq	$65536, 8(%rax)         # imm = 0x10000
.LBB49_745:                             #   in Loop: Header=BB49_740 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rdi
	movq	8(%rax), %rsi
	callq	realloc
	movq	408(%rsp), %rcx
	movq	%rax, (%rcx)
	movq	408(%rsp), %rax
	cmpq	$0, (%rax)
	je	.LBB49_746
# BB#747:                               #   in Loop: Header=BB49_740 Depth=2
	movq	408(%rsp), %rax
	movq	8(%rsp), %rcx
	cmpq	(%rax), %rcx
	je	.LBB49_740
# BB#748:                               #   in Loop: Header=BB49_740 Depth=2
	movq	384(%rsp), %rax
	subq	8(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 384(%rsp)
	movq	320(%rsp), %rax
	subq	8(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 320(%rsp)
	cmpq	$0, 304(%rsp)
	je	.LBB49_750
# BB#749:                               #   in Loop: Header=BB49_740 Depth=2
	movq	304(%rsp), %rax
	subq	8(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 304(%rsp)
.LBB49_750:                             #   in Loop: Header=BB49_740 Depth=2
	cmpq	$0, 328(%rsp)
	je	.LBB49_752
# BB#751:                               #   in Loop: Header=BB49_740 Depth=2
	movq	328(%rsp), %rax
	subq	8(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 328(%rsp)
.LBB49_752:                             #   in Loop: Header=BB49_740 Depth=2
	cmpq	$0, 336(%rsp)
	je	.LBB49_740
	jmp	.LBB49_753
.LBB49_754:                             #   in Loop: Header=BB49_10 Depth=1
	movq	384(%rsp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, 384(%rsp)
	movb	$1, (%rax)
	movq	384(%rsp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, 384(%rsp)
	movb	$0, (%rax)
	movq	384(%rsp), %rax
	decq	%rax
	jmp	.LBB49_755
	.align	16, 0x90
.LBB49_110:                             #   in Loop: Header=BB49_97 Depth=2
	movq	336(%rsp), %rax
	subq	264(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 336(%rsp)
	.align	16, 0x90
.LBB49_97:                              #   Parent Loop BB49_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	408(%rsp), %rax
	movq	384(%rsp), %rcx
	subq	(%rax), %rcx
	addq	$3, %rcx
	cmpq	8(%rax), %rcx
	jbe	.LBB49_111
# BB#98:                                #   in Loop: Header=BB49_97 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rax
	movq	%rax, 264(%rsp)
	movq	408(%rsp), %rax
	cmpq	$65536, 8(%rax)         # imm = 0x10000
	je	.LBB49_99
# BB#100:                               #   in Loop: Header=BB49_97 Depth=2
	movq	408(%rsp), %rax
	shlq	8(%rax)
	movq	408(%rsp), %rax
	cmpq	$65537, 8(%rax)         # imm = 0x10001
	jb	.LBB49_102
# BB#101:                               #   in Loop: Header=BB49_97 Depth=2
	movq	408(%rsp), %rax
	movq	$65536, 8(%rax)         # imm = 0x10000
.LBB49_102:                             #   in Loop: Header=BB49_97 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rdi
	movq	8(%rax), %rsi
	callq	realloc
	movq	408(%rsp), %rcx
	movq	%rax, (%rcx)
	movq	408(%rsp), %rax
	cmpq	$0, (%rax)
	je	.LBB49_103
# BB#104:                               #   in Loop: Header=BB49_97 Depth=2
	movq	408(%rsp), %rax
	movq	264(%rsp), %rcx
	cmpq	(%rax), %rcx
	je	.LBB49_97
# BB#105:                               #   in Loop: Header=BB49_97 Depth=2
	movq	384(%rsp), %rax
	subq	264(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 384(%rsp)
	movq	320(%rsp), %rax
	subq	264(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 320(%rsp)
	cmpq	$0, 304(%rsp)
	je	.LBB49_107
# BB#106:                               #   in Loop: Header=BB49_97 Depth=2
	movq	304(%rsp), %rax
	subq	264(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 304(%rsp)
.LBB49_107:                             #   in Loop: Header=BB49_97 Depth=2
	cmpq	$0, 328(%rsp)
	je	.LBB49_109
# BB#108:                               #   in Loop: Header=BB49_97 Depth=2
	movq	328(%rsp), %rax
	subq	264(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 328(%rsp)
.LBB49_109:                             #   in Loop: Header=BB49_97 Depth=2
	cmpq	$0, 336(%rsp)
	je	.LBB49_97
	jmp	.LBB49_110
	.align	16, 0x90
.LBB49_353:                             #   in Loop: Header=BB49_350 Depth=2
	movq	384(%rsp), %rax
	decb	-1(%rax)
.LBB49_350:                             #   Parent Loop BB49_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	384(%rsp), %rax
	movzbl	-1(%rax), %ecx
	xorb	%al, %al
	testl	%ecx, %ecx
	jle	.LBB49_352
# BB#351:                               #   in Loop: Header=BB49_350 Depth=2
	movq	384(%rsp), %rax
	movzbl	-1(%rax), %ecx
	decl	%ecx
	movslq	%ecx, %rcx
	cmpb	$0, (%rax,%rcx)
	sete	%al
.LBB49_352:                             #   in Loop: Header=BB49_350 Depth=2
	cmpb	$1, %al
	je	.LBB49_353
# BB#354:                               #   in Loop: Header=BB49_10 Depth=1
	movq	384(%rsp), %rax
	movzbl	-1(%rax), %ecx
	addq	%rax, %rcx
	movq	%rcx, 384(%rsp)
	jmp	.LBB49_10
	.align	16, 0x90
.LBB49_550:                             #   in Loop: Header=BB49_537 Depth=2
	movq	336(%rsp), %rax
	subq	104(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 336(%rsp)
	.align	16, 0x90
.LBB49_537:                             #   Parent Loop BB49_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	408(%rsp), %rax
	movq	384(%rsp), %rcx
	subq	(%rax), %rcx
	addq	$3, %rcx
	cmpq	8(%rax), %rcx
	jbe	.LBB49_551
# BB#538:                               #   in Loop: Header=BB49_537 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rax
	movq	%rax, 104(%rsp)
	movq	408(%rsp), %rax
	cmpq	$65536, 8(%rax)         # imm = 0x10000
	je	.LBB49_539
# BB#540:                               #   in Loop: Header=BB49_537 Depth=2
	movq	408(%rsp), %rax
	shlq	8(%rax)
	movq	408(%rsp), %rax
	cmpq	$65537, 8(%rax)         # imm = 0x10001
	jb	.LBB49_542
# BB#541:                               #   in Loop: Header=BB49_537 Depth=2
	movq	408(%rsp), %rax
	movq	$65536, 8(%rax)         # imm = 0x10000
.LBB49_542:                             #   in Loop: Header=BB49_537 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rdi
	movq	8(%rax), %rsi
	callq	realloc
	movq	408(%rsp), %rcx
	movq	%rax, (%rcx)
	movq	408(%rsp), %rax
	cmpq	$0, (%rax)
	je	.LBB49_543
# BB#544:                               #   in Loop: Header=BB49_537 Depth=2
	movq	408(%rsp), %rax
	movq	104(%rsp), %rcx
	cmpq	(%rax), %rcx
	je	.LBB49_537
# BB#545:                               #   in Loop: Header=BB49_537 Depth=2
	movq	384(%rsp), %rax
	subq	104(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 384(%rsp)
	movq	320(%rsp), %rax
	subq	104(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 320(%rsp)
	cmpq	$0, 304(%rsp)
	je	.LBB49_547
# BB#546:                               #   in Loop: Header=BB49_537 Depth=2
	movq	304(%rsp), %rax
	subq	104(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 304(%rsp)
.LBB49_547:                             #   in Loop: Header=BB49_537 Depth=2
	cmpq	$0, 328(%rsp)
	je	.LBB49_549
# BB#548:                               #   in Loop: Header=BB49_537 Depth=2
	movq	328(%rsp), %rax
	subq	104(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 328(%rsp)
.LBB49_549:                             #   in Loop: Header=BB49_537 Depth=2
	cmpq	$0, 336(%rsp)
	je	.LBB49_537
	jmp	.LBB49_550
	.align	16, 0x90
.LBB49_566:                             #   in Loop: Header=BB49_553 Depth=2
	movq	336(%rsp), %rax
	subq	88(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 336(%rsp)
	.align	16, 0x90
.LBB49_553:                             #   Parent Loop BB49_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	408(%rsp), %rax
	movq	384(%rsp), %rcx
	subq	(%rax), %rcx
	movl	100(%rsp), %edx
	addq	%rcx, %rdx
	cmpq	8(%rax), %rdx
	jbe	.LBB49_567
# BB#554:                               #   in Loop: Header=BB49_553 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rax
	movq	%rax, 88(%rsp)
	movq	408(%rsp), %rax
	cmpq	$65536, 8(%rax)         # imm = 0x10000
	je	.LBB49_555
# BB#556:                               #   in Loop: Header=BB49_553 Depth=2
	movq	408(%rsp), %rax
	shlq	8(%rax)
	movq	408(%rsp), %rax
	cmpq	$65537, 8(%rax)         # imm = 0x10001
	jb	.LBB49_558
# BB#557:                               #   in Loop: Header=BB49_553 Depth=2
	movq	408(%rsp), %rax
	movq	$65536, 8(%rax)         # imm = 0x10000
.LBB49_558:                             #   in Loop: Header=BB49_553 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rdi
	movq	8(%rax), %rsi
	callq	realloc
	movq	408(%rsp), %rcx
	movq	%rax, (%rcx)
	movq	408(%rsp), %rax
	cmpq	$0, (%rax)
	je	.LBB49_559
# BB#560:                               #   in Loop: Header=BB49_553 Depth=2
	movq	408(%rsp), %rax
	movq	88(%rsp), %rcx
	cmpq	(%rax), %rcx
	je	.LBB49_553
# BB#561:                               #   in Loop: Header=BB49_553 Depth=2
	movq	384(%rsp), %rax
	subq	88(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 384(%rsp)
	movq	320(%rsp), %rax
	subq	88(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 320(%rsp)
	cmpq	$0, 304(%rsp)
	je	.LBB49_563
# BB#562:                               #   in Loop: Header=BB49_553 Depth=2
	movq	304(%rsp), %rax
	subq	88(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 304(%rsp)
.LBB49_563:                             #   in Loop: Header=BB49_553 Depth=2
	cmpq	$0, 328(%rsp)
	je	.LBB49_565
# BB#564:                               #   in Loop: Header=BB49_553 Depth=2
	movq	328(%rsp), %rax
	subq	88(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 328(%rsp)
.LBB49_565:                             #   in Loop: Header=BB49_553 Depth=2
	cmpq	$0, 336(%rsp)
	je	.LBB49_553
	jmp	.LBB49_566
.LBB49_430:                             #   in Loop: Header=BB49_10 Depth=1
	decl	380(%rsp)
	movl	380(%rsp), %eax
	leaq	(%rax,%rax,4), %rax
	movq	368(%rsp), %rcx
	movslq	(%rcx,%rax,4), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 320(%rsp)
	xorl	%eax, %eax
	movl	380(%rsp), %ecx
	leaq	(%rcx,%rcx,4), %rcx
	movq	368(%rsp), %rdx
	cmpl	$0, 4(%rdx,%rcx,4)
	je	.LBB49_432
# BB#431:                               #   in Loop: Header=BB49_10 Depth=1
	movl	380(%rsp), %eax
	leaq	(%rax,%rax,4), %rax
	movq	368(%rsp), %rcx
	movslq	4(%rcx,%rax,4), %rax
	movq	408(%rsp), %rcx
	movq	(%rcx), %rcx
	leaq	-1(%rcx,%rax), %rax
.LBB49_432:                             #   in Loop: Header=BB49_10 Depth=1
	movq	%rax, 304(%rsp)
	movl	380(%rsp), %eax
	leaq	(%rax,%rax,4), %rax
	movq	368(%rsp), %rcx
	movslq	12(%rcx,%rax,4), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 328(%rsp)
	movl	380(%rsp), %eax
	leaq	(%rax,%rax,4), %rax
	movq	368(%rsp), %rcx
	movl	16(%rcx,%rax,4), %eax
	movl	%eax, 156(%rsp)
	movq	$0, 336(%rsp)
	cmpl	$255, 156(%rsp)
	ja	.LBB49_10
# BB#433:                               #   in Loop: Header=BB49_10 Depth=1
	movl	380(%rsp), %eax
	leaq	(%rax,%rax,4), %rax
	movq	368(%rsp), %rcx
	movslq	8(%rcx,%rax,4), %rax
	movq	408(%rsp), %rcx
	movq	(%rcx), %rcx
	leaq	(%rcx,%rax), %rdx
	movq	%rdx, 144(%rsp)
	movl	300(%rsp), %edx
	subl	156(%rsp), %edx
	movb	%dl, (%rcx,%rax)
	jmp	.LBB49_434
.LBB49_111:                             #   in Loop: Header=BB49_10 Depth=1
	cmpq	$0, 344(%rsp)
	je	.LBB49_113
# BB#112:                               #   in Loop: Header=BB49_10 Depth=1
	movq	360(%rsp), %rax
	movzbl	-2(%rax), %eax
	movq	344(%rsp), %rcx
	movsbl	(%rcx,%rax), %eax
	jmp	.LBB49_114
.LBB49_551:                             #   in Loop: Header=BB49_10 Depth=1
	movq	384(%rsp), %rcx
	leaq	3(%rcx), %rdx
	movq	328(%rsp), %rsi
	subq	%rsi, %rdx
	addq	$-3, %rdx
	movl	$12, %edi
	xorb	%al, %al
	callq	insert_op1
	addq	$3, 384(%rsp)
	jmp	.LBB49_569
.LBB49_567:                             #   in Loop: Header=BB49_10 Depth=1
	cmpl	$1, 112(%rsp)
	setg	%al
	movzbl	%al, %eax
	leal	(%rax,%rax,4), %eax
	movq	384(%rsp), %r8
	leaq	5(%r8,%rax), %rdx
	movq	328(%rsp), %rsi
	subq	%rsi, %rdx
	movl	116(%rsp), %ecx
	addq	$-3, %rdx
	movl	$20, %edi
	xorb	%al, %al
	callq	insert_op2
	movq	384(%rsp), %r8
	addq	$5, %r8
	movq	%r8, 384(%rsp)
	movl	116(%rsp), %ecx
	movq	328(%rsp), %rsi
	movl	$22, %edi
	movl	$5, %edx
	xorb	%al, %al
	callq	insert_op2
	addq	$5, 384(%rsp)
	cmpl	$2, 112(%rsp)
	jl	.LBB49_569
# BB#568:                               #   in Loop: Header=BB49_10 Depth=1
	movq	328(%rsp), %rdx
	addq	$5, %rdx
	movq	384(%rsp), %rsi
	subq	%rsi, %rdx
	addq	$-3, %rdx
	movl	112(%rsp), %ecx
	decl	%ecx
	movl	$21, %edi
	xorb	%al, %al
	callq	store_op2
	movq	384(%rsp), %r8
	addq	$5, %r8
	movq	%r8, 384(%rsp)
	movq	328(%rsp), %rsi
	movq	%r8, %rdx
	subq	%rsi, %rdx
	movl	112(%rsp), %ecx
	decl	%ecx
	movl	$22, %edi
	xorb	%al, %al
	callq	insert_op2
	addq	$5, 384(%rsp)
.LBB49_569:                             #   in Loop: Header=BB49_10 Depth=1
	movq	$0, 336(%rsp)
	movq	$0, 312(%rsp)
	jmp	.LBB49_10
	.align	16, 0x90
.LBB49_447:                             #   in Loop: Header=BB49_434 Depth=2
	movq	336(%rsp), %rax
	subq	136(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 336(%rsp)
	.align	16, 0x90
.LBB49_434:                             #   Parent Loop BB49_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	408(%rsp), %rax
	movq	384(%rsp), %rcx
	subq	(%rax), %rcx
	addq	$3, %rcx
	cmpq	8(%rax), %rcx
	jbe	.LBB49_448
# BB#435:                               #   in Loop: Header=BB49_434 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rax
	movq	%rax, 136(%rsp)
	movq	408(%rsp), %rax
	cmpq	$65536, 8(%rax)         # imm = 0x10000
	je	.LBB49_436
# BB#437:                               #   in Loop: Header=BB49_434 Depth=2
	movq	408(%rsp), %rax
	shlq	8(%rax)
	movq	408(%rsp), %rax
	cmpq	$65537, 8(%rax)         # imm = 0x10001
	jb	.LBB49_439
# BB#438:                               #   in Loop: Header=BB49_434 Depth=2
	movq	408(%rsp), %rax
	movq	$65536, 8(%rax)         # imm = 0x10000
.LBB49_439:                             #   in Loop: Header=BB49_434 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rdi
	movq	8(%rax), %rsi
	callq	realloc
	movq	408(%rsp), %rcx
	movq	%rax, (%rcx)
	movq	408(%rsp), %rax
	cmpq	$0, (%rax)
	je	.LBB49_440
# BB#441:                               #   in Loop: Header=BB49_434 Depth=2
	movq	408(%rsp), %rax
	movq	136(%rsp), %rcx
	cmpq	(%rax), %rcx
	je	.LBB49_434
# BB#442:                               #   in Loop: Header=BB49_434 Depth=2
	movq	384(%rsp), %rax
	subq	136(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 384(%rsp)
	movq	320(%rsp), %rax
	subq	136(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 320(%rsp)
	cmpq	$0, 304(%rsp)
	je	.LBB49_444
# BB#443:                               #   in Loop: Header=BB49_434 Depth=2
	movq	304(%rsp), %rax
	subq	136(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 304(%rsp)
.LBB49_444:                             #   in Loop: Header=BB49_434 Depth=2
	cmpq	$0, 328(%rsp)
	je	.LBB49_446
# BB#445:                               #   in Loop: Header=BB49_434 Depth=2
	movq	328(%rsp), %rax
	subq	136(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 328(%rsp)
.LBB49_446:                             #   in Loop: Header=BB49_434 Depth=2
	cmpq	$0, 336(%rsp)
	je	.LBB49_434
	jmp	.LBB49_447
.LBB49_113:                             #   in Loop: Header=BB49_10 Depth=1
	movq	360(%rsp), %rax
	movsbl	-2(%rax), %eax
.LBB49_114:                             #   in Loop: Header=BB49_10 Depth=1
	movl	$46, %ecx
	cmpq	$0, 344(%rsp)
	je	.LBB49_116
# BB#115:                               #   in Loop: Header=BB49_10 Depth=1
	movq	344(%rsp), %rcx
	movsbl	46(%rcx), %ecx
.LBB49_116:                             #   in Loop: Header=BB49_10 Depth=1
	cmpl	%ecx, %eax
	jne	.LBB49_127
# BB#117:                               #   in Loop: Header=BB49_10 Depth=1
	movsbl	278(%rsp), %eax
	testl	%eax, %eax
	je	.LBB49_127
# BB#118:                               #   in Loop: Header=BB49_10 Depth=1
	movq	360(%rsp), %rax
	cmpq	352(%rsp), %rax
	jae	.LBB49_127
# BB#119:                               #   in Loop: Header=BB49_10 Depth=1
	cmpq	$0, 344(%rsp)
	je	.LBB49_121
# BB#120:                               #   in Loop: Header=BB49_10 Depth=1
	movq	360(%rsp), %rax
	movzbl	(%rax), %eax
	movq	344(%rsp), %rcx
	movsbl	(%rcx,%rax), %eax
	jmp	.LBB49_122
.LBB49_448:                             #   in Loop: Header=BB49_10 Depth=1
	movq	384(%rsp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, 384(%rsp)
	movb	$6, (%rax)
	movq	384(%rsp), %rax
	leaq	1(%rax), %rcx
	movb	156(%rsp), %dl
	movq	%rcx, 384(%rsp)
	movb	%dl, (%rax)
	movl	300(%rsp), %eax
	subl	156(%rsp), %eax
	movq	384(%rsp), %rcx
	leaq	1(%rcx), %rdx
	movq	%rdx, 384(%rsp)
	movb	%al, (%rcx)
	jmp	.LBB49_10
.LBB49_121:                             #   in Loop: Header=BB49_10 Depth=1
	movq	360(%rsp), %rax
	movsbl	(%rax), %eax
.LBB49_122:                             #   in Loop: Header=BB49_10 Depth=1
	movl	$10, %ecx
	cmpq	$0, 344(%rsp)
	je	.LBB49_124
# BB#123:                               #   in Loop: Header=BB49_10 Depth=1
	movq	344(%rsp), %rcx
	movsbl	10(%rcx), %ecx
.LBB49_124:                             #   in Loop: Header=BB49_10 Depth=1
	cmpl	%ecx, %eax
	jne	.LBB49_127
# BB#125:                               #   in Loop: Header=BB49_10 Depth=1
	testb	$64, 416(%rsp)
	je	.LBB49_126
.LBB49_127:                             #   in Loop: Header=BB49_10 Depth=1
	movq	328(%rsp), %rdx
	addq	$-3, %rdx
	movq	384(%rsp), %rsi
	subq	%rsi, %rdx
	addq	$-3, %rdx
	movl	$17, %edi
	xorb	%al, %al
	callq	store_op1
	jmp	.LBB49_128
.LBB49_126:                             #   in Loop: Header=BB49_10 Depth=1
	movq	384(%rsp), %rsi
	movq	328(%rsp), %rdx
	subq	%rsi, %rdx
	addq	$-3, %rdx
	movl	$12, %edi
	xorb	%al, %al
	callq	store_op1
	movb	$1, 279(%rsp)
.LBB49_128:                             #   in Loop: Header=BB49_10 Depth=1
	addq	$3, 384(%rsp)
	jmp	.LBB49_129
	.align	16, 0x90
.LBB49_142:                             #   in Loop: Header=BB49_129 Depth=2
	movq	336(%rsp), %rax
	subq	256(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 336(%rsp)
	.align	16, 0x90
.LBB49_129:                             #   Parent Loop BB49_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	408(%rsp), %rax
	movq	384(%rsp), %rcx
	subq	(%rax), %rcx
	addq	$3, %rcx
	cmpq	8(%rax), %rcx
	jbe	.LBB49_143
# BB#130:                               #   in Loop: Header=BB49_129 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rax
	movq	%rax, 256(%rsp)
	movq	408(%rsp), %rax
	cmpq	$65536, 8(%rax)         # imm = 0x10000
	je	.LBB49_131
# BB#132:                               #   in Loop: Header=BB49_129 Depth=2
	movq	408(%rsp), %rax
	shlq	8(%rax)
	movq	408(%rsp), %rax
	cmpq	$65537, 8(%rax)         # imm = 0x10001
	jb	.LBB49_134
# BB#133:                               #   in Loop: Header=BB49_129 Depth=2
	movq	408(%rsp), %rax
	movq	$65536, 8(%rax)         # imm = 0x10000
.LBB49_134:                             #   in Loop: Header=BB49_129 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rdi
	movq	8(%rax), %rsi
	callq	realloc
	movq	408(%rsp), %rcx
	movq	%rax, (%rcx)
	movq	408(%rsp), %rax
	cmpq	$0, (%rax)
	je	.LBB49_135
# BB#136:                               #   in Loop: Header=BB49_129 Depth=2
	movq	408(%rsp), %rax
	movq	256(%rsp), %rcx
	cmpq	(%rax), %rcx
	je	.LBB49_129
# BB#137:                               #   in Loop: Header=BB49_129 Depth=2
	movq	384(%rsp), %rax
	subq	256(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 384(%rsp)
	movq	320(%rsp), %rax
	subq	256(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 320(%rsp)
	cmpq	$0, 304(%rsp)
	je	.LBB49_139
# BB#138:                               #   in Loop: Header=BB49_129 Depth=2
	movq	304(%rsp), %rax
	subq	256(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 304(%rsp)
.LBB49_139:                             #   in Loop: Header=BB49_129 Depth=2
	cmpq	$0, 328(%rsp)
	je	.LBB49_141
# BB#140:                               #   in Loop: Header=BB49_129 Depth=2
	movq	328(%rsp), %rax
	subq	256(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 328(%rsp)
.LBB49_141:                             #   in Loop: Header=BB49_129 Depth=2
	cmpq	$0, 336(%rsp)
	je	.LBB49_129
	jmp	.LBB49_142
.LBB49_143:                             #   in Loop: Header=BB49_10 Depth=1
	movq	384(%rsp), %rcx
	leaq	3(%rcx), %rdx
	movq	328(%rsp), %rsi
	subq	%rsi, %rdx
	movsbl	279(%rsp), %eax
	addq	$-3, %rdx
	testl	%eax, %eax
	setne	%al
	movzbl	%al, %edi
	orl	$14, %edi
	xorb	%al, %al
	callq	insert_op1
	movq	$0, 336(%rsp)
	addq	$3, 384(%rsp)
	cmpb	$0, 278(%rsp)
	jne	.LBB49_10
	jmp	.LBB49_144
	.align	16, 0x90
.LBB49_157:                             #   in Loop: Header=BB49_144 Depth=2
	movq	336(%rsp), %rax
	subq	248(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 336(%rsp)
	.align	16, 0x90
.LBB49_144:                             #   Parent Loop BB49_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	408(%rsp), %rax
	movq	384(%rsp), %rcx
	subq	(%rax), %rcx
	addq	$3, %rcx
	cmpq	8(%rax), %rcx
	jbe	.LBB49_158
# BB#145:                               #   in Loop: Header=BB49_144 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rax
	movq	%rax, 248(%rsp)
	movq	408(%rsp), %rax
	cmpq	$65536, 8(%rax)         # imm = 0x10000
	je	.LBB49_146
# BB#147:                               #   in Loop: Header=BB49_144 Depth=2
	movq	408(%rsp), %rax
	shlq	8(%rax)
	movq	408(%rsp), %rax
	cmpq	$65537, 8(%rax)         # imm = 0x10001
	jb	.LBB49_149
# BB#148:                               #   in Loop: Header=BB49_144 Depth=2
	movq	408(%rsp), %rax
	movq	$65536, 8(%rax)         # imm = 0x10000
.LBB49_149:                             #   in Loop: Header=BB49_144 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rdi
	movq	8(%rax), %rsi
	callq	realloc
	movq	408(%rsp), %rcx
	movq	%rax, (%rcx)
	movq	408(%rsp), %rax
	cmpq	$0, (%rax)
	je	.LBB49_150
# BB#151:                               #   in Loop: Header=BB49_144 Depth=2
	movq	408(%rsp), %rax
	movq	248(%rsp), %rcx
	cmpq	(%rax), %rcx
	je	.LBB49_144
# BB#152:                               #   in Loop: Header=BB49_144 Depth=2
	movq	384(%rsp), %rax
	subq	248(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 384(%rsp)
	movq	320(%rsp), %rax
	subq	248(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 320(%rsp)
	cmpq	$0, 304(%rsp)
	je	.LBB49_154
# BB#153:                               #   in Loop: Header=BB49_144 Depth=2
	movq	304(%rsp), %rax
	subq	248(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 304(%rsp)
.LBB49_154:                             #   in Loop: Header=BB49_144 Depth=2
	cmpq	$0, 328(%rsp)
	je	.LBB49_156
# BB#155:                               #   in Loop: Header=BB49_144 Depth=2
	movq	328(%rsp), %rax
	subq	248(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 328(%rsp)
.LBB49_156:                             #   in Loop: Header=BB49_144 Depth=2
	cmpq	$0, 336(%rsp)
	je	.LBB49_144
	jmp	.LBB49_157
.LBB49_158:                             #   in Loop: Header=BB49_10 Depth=1
	movq	384(%rsp), %rcx
	movq	328(%rsp), %rsi
	movl	$18, %edi
	movl	$3, %edx
	xorb	%al, %al
	callq	insert_op1
	addq	$3, 384(%rsp)
	jmp	.LBB49_10
	.align	16, 0x90
.LBB49_755:                             #   in Loop: Header=BB49_10 Depth=1
	movq	%rax, 336(%rsp)
	.align	16, 0x90
.LBB49_756:                             #   Parent Loop BB49_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	408(%rsp), %rax
	movq	384(%rsp), %rcx
	subq	(%rax), %rcx
	incq	%rcx
	cmpq	8(%rax), %rcx
	jbe	.LBB49_770
# BB#757:                               #   in Loop: Header=BB49_756 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rax
	movq	%rax, (%rsp)
	movq	408(%rsp), %rax
	cmpq	$65536, 8(%rax)         # imm = 0x10000
	je	.LBB49_758
# BB#759:                               #   in Loop: Header=BB49_756 Depth=2
	movq	408(%rsp), %rax
	shlq	8(%rax)
	movq	408(%rsp), %rax
	cmpq	$65537, 8(%rax)         # imm = 0x10001
	jb	.LBB49_761
# BB#760:                               #   in Loop: Header=BB49_756 Depth=2
	movq	408(%rsp), %rax
	movq	$65536, 8(%rax)         # imm = 0x10000
.LBB49_761:                             #   in Loop: Header=BB49_756 Depth=2
	movq	408(%rsp), %rax
	movq	(%rax), %rdi
	movq	8(%rax), %rsi
	callq	realloc
	movq	408(%rsp), %rcx
	movq	%rax, (%rcx)
	movq	408(%rsp), %rax
	cmpq	$0, (%rax)
	je	.LBB49_762
# BB#763:                               #   in Loop: Header=BB49_756 Depth=2
	movq	408(%rsp), %rax
	movq	(%rsp), %rcx
	cmpq	(%rax), %rcx
	je	.LBB49_756
# BB#764:                               #   in Loop: Header=BB49_756 Depth=2
	movq	384(%rsp), %rax
	subq	(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 384(%rsp)
	movq	320(%rsp), %rax
	subq	(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 320(%rsp)
	cmpq	$0, 304(%rsp)
	je	.LBB49_766
# BB#765:                               #   in Loop: Header=BB49_756 Depth=2
	movq	304(%rsp), %rax
	subq	(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 304(%rsp)
.LBB49_766:                             #   in Loop: Header=BB49_756 Depth=2
	cmpq	$0, 328(%rsp)
	je	.LBB49_768
# BB#767:                               #   in Loop: Header=BB49_756 Depth=2
	movq	328(%rsp), %rax
	subq	(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	movq	%rax, 328(%rsp)
.LBB49_768:                             #   in Loop: Header=BB49_756 Depth=2
	cmpq	$0, 336(%rsp)
	je	.LBB49_756
# BB#769:                               #   in Loop: Header=BB49_10 Depth=1
	movq	336(%rsp), %rax
	subq	(%rsp), %rax
	movq	408(%rsp), %rcx
	addq	(%rcx), %rax
	jmp	.LBB49_755
.LBB49_742:
	movl	$15, 436(%rsp)
	jmp	.LBB49_776
.LBB49_746:
	movl	$12, 436(%rsp)
	jmp	.LBB49_776
.LBB49_758:
	movl	$15, 436(%rsp)
	jmp	.LBB49_776
.LBB49_762:
	movl	$12, 436(%rsp)
	jmp	.LBB49_776
.LBB49_771:
	cmpq	$0, 304(%rsp)
	je	.LBB49_773
# BB#772:
	movq	304(%rsp), %rsi
	movq	384(%rsp), %rdx
	subq	%rsi, %rdx
	addq	$-3, %rdx
	movl	$13, %edi
	xorb	%al, %al
	callq	store_op1
.LBB49_773:
	cmpl	$0, 380(%rsp)
	je	.LBB49_775
# BB#774:
	movl	$8, 436(%rsp)
	jmp	.LBB49_776
.LBB49_12:
	movl	$14, 436(%rsp)
	jmp	.LBB49_776
.LBB49_380:
	movl	$15, 436(%rsp)
	jmp	.LBB49_776
.LBB49_452:
	movl	$12, 436(%rsp)
	jmp	.LBB49_776
.LBB49_179:
	movl	$15, 436(%rsp)
	jmp	.LBB49_776
.LBB49_183:
	movl	$12, 436(%rsp)
	jmp	.LBB49_776
.LBB49_775:
	movq	368(%rsp), %rdi
	callq	free
	movq	408(%rsp), %rax
	movq	384(%rsp), %rcx
	subq	(%rax), %rcx
	movq	%rcx, 16(%rax)
	movl	$0, 436(%rsp)
	jmp	.LBB49_776
.LBB49_465:
	movl	$15, 436(%rsp)
	jmp	.LBB49_776
.LBB49_469:
	movl	$12, 436(%rsp)
	jmp	.LBB49_776
.LBB49_194:
	movl	$15, 436(%rsp)
	jmp	.LBB49_776
.LBB49_198:
	movl	$12, 436(%rsp)
	jmp	.LBB49_776
.LBB49_31:
	movl	$15, 436(%rsp)
	jmp	.LBB49_776
.LBB49_38:
	movl	$12, 436(%rsp)
	jmp	.LBB49_776
.LBB49_176:
	movl	$7, 436(%rsp)
	jmp	.LBB49_776
.LBB49_75:
	movl	$14, 436(%rsp)
	jmp	.LBB49_776
.LBB49_359:
	movl	$5, 436(%rsp)
	jmp	.LBB49_776
.LBB49_361:
	movl	$14, 436(%rsp)
	jmp	.LBB49_776
.LBB49_698:
	movl	$6, 436(%rsp)
	jmp	.LBB49_776
.LBB49_580:
	movl	$15, 436(%rsp)
	jmp	.LBB49_776
.LBB49_584:
	movl	$12, 436(%rsp)
	jmp	.LBB49_776
.LBB49_211:
	movl	$15, 436(%rsp)
	jmp	.LBB49_776
.LBB49_215:
	movl	$12, 436(%rsp)
	jmp	.LBB49_776
.LBB49_485:
	movl	$9, 436(%rsp)
	jmp	.LBB49_776
.LBB49_571:
	movl	$14, 436(%rsp)
	jmp	.LBB49_776
.LBB49_488:
	movl	$14, 436(%rsp)
	jmp	.LBB49_776
.LBB49_498:
	movl	$14, 436(%rsp)
	jmp	.LBB49_776
.LBB49_502:
	movl	$14, 436(%rsp)
	jmp	.LBB49_776
.LBB49_512:
	movl	$14, 436(%rsp)
	jmp	.LBB49_776
.LBB49_162:
	movl	$15, 436(%rsp)
	jmp	.LBB49_776
.LBB49_166:
	movl	$12, 436(%rsp)
	jmp	.LBB49_776
.LBB49_52:
	movl	$15, 436(%rsp)
	jmp	.LBB49_776
.LBB49_56:
	movl	$12, 436(%rsp)
	jmp	.LBB49_776
.LBB49_596:
	movl	$15, 436(%rsp)
	jmp	.LBB49_776
.LBB49_600:
	movl	$12, 436(%rsp)
	jmp	.LBB49_776
.LBB49_520:
	movl	$10, 436(%rsp)
	jmp	.LBB49_776
.LBB49_683:
	movl	$15, 436(%rsp)
	jmp	.LBB49_776
.LBB49_687:
	movl	$12, 436(%rsp)
	jmp	.LBB49_776
.LBB49_384:
	movl	$12, 436(%rsp)
	jmp	.LBB49_776
.LBB49_409:
	movl	$16, 436(%rsp)
	jmp	.LBB49_776
.LBB49_70:
	movl	$13, 436(%rsp)
	jmp	.LBB49_776
.LBB49_85:
	movl	$5, 436(%rsp)
	jmp	.LBB49_776
.LBB49_87:
	movl	$14, 436(%rsp)
	jmp	.LBB49_776
.LBB49_611:
	movl	$15, 436(%rsp)
	jmp	.LBB49_776
.LBB49_615:
	movl	$12, 436(%rsp)
	jmp	.LBB49_776
.LBB49_626:
	movl	$15, 436(%rsp)
	jmp	.LBB49_776
.LBB49_630:
	movl	$12, 436(%rsp)
	jmp	.LBB49_776
.LBB49_653:
	movl	$15, 436(%rsp)
	jmp	.LBB49_776
.LBB49_657:
	movl	$12, 436(%rsp)
	jmp	.LBB49_776
.LBB49_703:
	movl	$15, 436(%rsp)
	jmp	.LBB49_776
.LBB49_707:
	movl	$12, 436(%rsp)
	jmp	.LBB49_776
.LBB49_668:
	movl	$15, 436(%rsp)
	jmp	.LBB49_776
.LBB49_672:
	movl	$12, 436(%rsp)
	jmp	.LBB49_776
.LBB49_371:
	movl	$15, 436(%rsp)
	jmp	.LBB49_776
.LBB49_642:
	movl	$12, 436(%rsp)
	jmp	.LBB49_776
.LBB49_523:
	movl	$9, 436(%rsp)
	jmp	.LBB49_776
.LBB49_525:
	movl	$14, 436(%rsp)
	jmp	.LBB49_776
.LBB49_530:
	movl	$10, 436(%rsp)
	jmp	.LBB49_776
.LBB49_392:
	movl	$15, 436(%rsp)
	jmp	.LBB49_776
.LBB49_396:
	movl	$12, 436(%rsp)
	jmp	.LBB49_776
.LBB49_414:
	movl	$15, 436(%rsp)
	jmp	.LBB49_776
.LBB49_418:
	movl	$12, 436(%rsp)
	jmp	.LBB49_776
.LBB49_227:
	movl	$7, 436(%rsp)
	jmp	.LBB49_776
.LBB49_229:
	movl	$14, 436(%rsp)
	jmp	.LBB49_776
.LBB49_235:
	movl	$5, 436(%rsp)
	jmp	.LBB49_776
.LBB49_237:
	movl	$14, 436(%rsp)
	jmp	.LBB49_776
.LBB49_247:
	movl	$11, 436(%rsp)
	jmp	.LBB49_776
.LBB49_256:
	movl	204(%rsp), %eax
	movl	%eax, 436(%rsp)
	jmp	.LBB49_776
.LBB49_260:
	movl	$14, 436(%rsp)
	jmp	.LBB49_776
.LBB49_264:
	movl	200(%rsp), %eax
	movl	%eax, 436(%rsp)
	jmp	.LBB49_776
.LBB49_269:
	movl	$14, 436(%rsp)
	jmp	.LBB49_776
.LBB49_273:
	movl	$7, 436(%rsp)
	jmp	.LBB49_776
.LBB49_275:
	movl	$14, 436(%rsp)
	jmp	.LBB49_776
.LBB49_297:
	movl	$4, 436(%rsp)
	jmp	.LBB49_776
.LBB49_299:
	movl	$14, 436(%rsp)
	jmp	.LBB49_776
.LBB49_303:
	movl	$7, 436(%rsp)
	jmp	.LBB49_776
.LBB49_533:
	movl	$13, 436(%rsp)
	jmp	.LBB49_776
.LBB49_429:
	movl	$16, 436(%rsp)
	jmp	.LBB49_776
.LBB49_99:
	movl	$15, 436(%rsp)
	jmp	.LBB49_776
.LBB49_103:
	movl	$12, 436(%rsp)
	jmp	.LBB49_776
.LBB49_539:
	movl	$15, 436(%rsp)
	jmp	.LBB49_776
.LBB49_543:
	movl	$12, 436(%rsp)
	jmp	.LBB49_776
.LBB49_555:
	movl	$15, 436(%rsp)
	jmp	.LBB49_776
.LBB49_559:
	movl	$12, 436(%rsp)
	jmp	.LBB49_776
.LBB49_436:
	movl	$15, 436(%rsp)
	jmp	.LBB49_776
.LBB49_440:
	movl	$12, 436(%rsp)
	jmp	.LBB49_776
.LBB49_131:
	movl	$15, 436(%rsp)
	jmp	.LBB49_776
.LBB49_135:
	movl	$12, 436(%rsp)
	jmp	.LBB49_776
.LBB49_146:
	movl	$15, 436(%rsp)
	jmp	.LBB49_776
.LBB49_150:
	movl	$12, 436(%rsp)
.LBB49_776:
	movl	436(%rsp), %eax
	addq	$440, %rsp              # imm = 0x1B8
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp178:
	.size	regex_compile, .Ltmp178-regex_compile
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.align	8
.LJTI49_0:
	.quad	.LBB49_47
	.quad	.LBB49_721
	.quad	.LBB49_721
	.quad	.LBB49_721
	.quad	.LBB49_355
	.quad	.LBB49_410
	.quad	.LBB49_68
	.quad	.LBB49_66
	.quad	.LBB49_721
	.quad	.LBB49_721
	.quad	.LBB49_159
.LJTI49_1:
	.quad	.LBB49_681
	.quad	.LBB49_381
	.quad	.LBB49_406
	.quad	.LBB49_717
	.quad	.LBB49_716
	.quad	.LBB49_717
	.quad	.LBB49_717
	.quad	.LBB49_717
	.quad	.LBB49_717
	.quad	.LBB49_717
	.quad	.LBB49_696
	.quad	.LBB49_696
	.quad	.LBB49_696
	.quad	.LBB49_696
	.quad	.LBB49_696
	.quad	.LBB49_696
	.quad	.LBB49_696
	.quad	.LBB49_696
	.quad	.LBB49_696
	.quad	.LBB49_717
	.quad	.LBB49_717
	.quad	.LBB49_609
	.quad	.LBB49_717
	.quad	.LBB49_624
	.quad	.LBB49_716
	.quad	.LBB49_717
	.quad	.LBB49_717
	.quad	.LBB49_651

	.text
	.globl	regcomp
	.align	16, 0x90
	.type	regcomp,@function
regcomp:                                # @regcomp
	.cfi_startproc
# BB#0:
	pushq	%rbx
.Ltmp181:
	.cfi_def_cfa_offset 16
	subq	$48, %rsp
.Ltmp182:
	.cfi_def_cfa_offset 64
.Ltmp183:
	.cfi_offset %rbx, -16
	movq	%rdi, 32(%rsp)
	movq	%rsi, 24(%rsp)
	movl	%edx, 20(%rsp)
	movl	$242396, %eax           # imm = 0x3B2DC
	testb	$1, %dl
	movl	$66246, %ecx            # imm = 0x102C6
	cmovnel	%eax, %ecx
	movl	%ecx, 12(%rsp)
	movq	32(%rsp), %rax
	movq	$0, (%rax)
	movq	32(%rsp), %rax
	movq	$0, 8(%rax)
	movq	32(%rsp), %rax
	movq	$0, 32(%rax)
	testb	$2, 20(%rsp)
	je	.LBB50_10
# BB#1:
	movl	$256, %edi              # imm = 0x100
	callq	malloc
	movq	32(%rsp), %rcx
	movq	%rax, 40(%rcx)
	movq	32(%rsp), %rax
	cmpq	$0, 40(%rax)
	je	.LBB50_2
# BB#3:
	movl	$0, 8(%rsp)
	jmp	.LBB50_4
	.align	16, 0x90
.LBB50_9:                               #   in Loop: Header=BB50_4 Depth=1
	movq	32(%rsp), %rcx
	movq	40(%rcx), %rcx
	movl	8(%rsp), %edx
	movb	%al, (%rcx,%rdx)
	incl	8(%rsp)
.LBB50_4:                               # =>This Inner Loop Header: Depth=1
	cmpl	$255, 8(%rsp)
	ja	.LBB50_11
# BB#5:                                 #   in Loop: Header=BB50_4 Depth=1
	testl	$-128, 8(%rsp)
	jne	.LBB50_8
# BB#6:                                 #   in Loop: Header=BB50_4 Depth=1
	movslq	8(%rsp), %rbx
	callq	__ctype_b_loc
	movq	(%rax), %rax
	testb	$1, 1(%rax,%rbx,2)
	je	.LBB50_8
# BB#7:                                 #   in Loop: Header=BB50_4 Depth=1
	movl	8(%rsp), %edi
	callq	tolower
	jmp	.LBB50_9
.LBB50_8:                               #   in Loop: Header=BB50_4 Depth=1
	movl	8(%rsp), %eax
	jmp	.LBB50_9
.LBB50_10:
	movq	32(%rsp), %rax
	movq	$0, 40(%rax)
.LBB50_11:
	testb	$4, 20(%rsp)
	je	.LBB50_13
# BB#12:
	andb	$-65, 12(%rsp)
	orb	$1, 13(%rsp)
	movq	32(%rsp), %rax
	orl	$128, 56(%rax)
	jmp	.LBB50_14
.LBB50_13:
	movq	32(%rsp), %rax
	andl	$-129, 56(%rax)
.LBB50_14:
	movl	20(%rsp), %eax
	andl	$8, %eax
	addl	%eax, %eax
	movq	32(%rsp), %rcx
	movl	56(%rcx), %edx
	andl	$-17, %edx
	orl	%eax, %edx
	movl	%edx, 56(%rcx)
	movq	24(%rsp), %rbx
	movq	%rbx, %rdi
	callq	strlen
	movq	32(%rsp), %rcx
	movl	12(%rsp), %edx
	movq	%rbx, %rdi
	movl	%eax, %esi
	xorb	%al, %al
	callq	regex_compile
	movl	%eax, 16(%rsp)
	cmpl	$16, %eax
	jne	.LBB50_16
# BB#15:
	movl	$8, 16(%rsp)
.LBB50_16:
	movl	16(%rsp), %eax
	movl	%eax, 44(%rsp)
	jmp	.LBB50_17
.LBB50_2:
	movl	$12, 44(%rsp)
.LBB50_17:
	movl	44(%rsp), %eax
	addq	$48, %rsp
	popq	%rbx
	ret
.Ltmp184:
	.size	regcomp, .Ltmp184-regcomp
	.cfi_endproc

	.globl	regexec
	.align	16, 0x90
	.type	regexec,@function
regexec:                                # @regexec
	.cfi_startproc
# BB#0:
	subq	$152, %rsp
.Ltmp186:
	.cfi_def_cfa_offset 160
	movq	%rdi, 136(%rsp)
	movq	%rsi, 128(%rsp)
	movq	%rdx, 120(%rsp)
	movq	%rcx, 112(%rsp)
	movl	%r8d, 108(%rsp)
	movq	128(%rsp), %rdi
	callq	strlen
	xorb	%cl, %cl
	movl	%eax, 12(%rsp)
	movq	136(%rsp), %rax
	btl	$4, 56(%rax)
	jb	.LBB51_2
# BB#1:
	cmpq	$0, 120(%rsp)
	setne	%cl
.LBB51_2:
	movb	%cl, 11(%rsp)
	movq	136(%rsp), %rax
	movq	32(%rax), %rcx
	movq	40(%rax), %rdx
	movq	48(%rax), %rsi
	movq	56(%rax), %rdi
	movq	%rdi, 72(%rsp)
	movq	%rsi, 64(%rsp)
	movq	%rdx, 56(%rsp)
	movq	%rcx, 48(%rsp)
	movq	24(%rax), %rcx
	movq	%rcx, 40(%rsp)
	movq	16(%rax), %rcx
	movq	%rcx, 32(%rsp)
	movq	(%rax), %rcx
	movq	8(%rax), %rax
	movq	%rax, 24(%rsp)
	movq	%rcx, 16(%rsp)
	movl	72(%rsp), %ecx
	andl	$-33, %ecx
	movl	108(%rsp), %eax
	andl	$1, %eax
	shll	$5, %eax
	orl	%ecx, %eax
	movl	%eax, 72(%rsp)
	andl	$-65, %eax
	movl	108(%rsp), %ecx
	andl	$2, %ecx
	shll	$5, %ecx
	orl	%eax, %ecx
	movl	%ecx, 72(%rsp)
	andl	$-7, %ecx
	orl	$4, %ecx
	movl	%ecx, 72(%rsp)
	cmpb	$0, 11(%rsp)
	je	.LBB51_6
# BB#3:
	movl	120(%rsp), %eax
	movl	%eax, 80(%rsp)
	movq	120(%rsp), %rdi
	shlq	$2, %rdi
	callq	malloc
	movq	%rax, 88(%rsp)
	movq	120(%rsp), %rdi
	shlq	$2, %rdi
	callq	malloc
	movq	%rax, 96(%rsp)
	cmpq	$0, 88(%rsp)
	je	.LBB51_5
# BB#4:
	cmpq	$0, 96(%rsp)
	je	.LBB51_5
.LBB51_6:
	movl	12(%rsp), %r8d
	movq	128(%rsp), %rsi
	movsbl	11(%rsp), %eax
	testl	%eax, %eax
	je	.LBB51_8
# BB#7:
	leaq	80(%rsp), %r9
	jmp	.LBB51_9
.LBB51_5:
	movl	$1, 148(%rsp)
	jmp	.LBB51_16
.LBB51_8:
	xorl	%r9d, %r9d
.LBB51_9:
	leaq	16(%rsp), %rdi
	movl	%r8d, %edx
	xorl	%ecx, %ecx
	xorb	%al, %al
	callq	re_search
	movl	%eax, 104(%rsp)
	cmpb	$0, 11(%rsp)
	je	.LBB51_15
# BB#10:
	cmpl	$0, 104(%rsp)
	js	.LBB51_14
# BB#11:
	movl	$0, 4(%rsp)
	jmp	.LBB51_12
	.align	16, 0x90
.LBB51_13:                              #   in Loop: Header=BB51_12 Depth=1
	movl	4(%rsp), %eax
	movq	88(%rsp), %rcx
	movl	(%rcx,%rax,4), %ecx
	movq	112(%rsp), %rdx
	movl	%ecx, (%rdx,%rax,8)
	movl	4(%rsp), %eax
	movq	96(%rsp), %rcx
	movl	(%rcx,%rax,4), %ecx
	movq	112(%rsp), %rdx
	movl	%ecx, 4(%rdx,%rax,8)
	incl	4(%rsp)
.LBB51_12:                              # =>This Inner Loop Header: Depth=1
	movl	4(%rsp), %eax
	cmpq	120(%rsp), %rax
	jb	.LBB51_13
.LBB51_14:
	movq	88(%rsp), %rdi
	callq	free
	movq	96(%rsp), %rdi
	callq	free
.LBB51_15:
	movl	104(%rsp), %eax
	shrl	$31, %eax
	movl	%eax, 148(%rsp)
.LBB51_16:
	movl	148(%rsp), %eax
	addq	$152, %rsp
	ret
.Ltmp187:
	.size	regexec, .Ltmp187-regexec
	.cfi_endproc

	.globl	regerror
	.align	16, 0x90
	.type	regerror,@function
regerror:                               # @regerror
	.cfi_startproc
# BB#0:
	subq	$56, %rsp
.Ltmp189:
	.cfi_def_cfa_offset 64
	movl	%edi, 52(%rsp)
	movq	%rsi, 40(%rsp)
	movq	%rdx, 32(%rsp)
	movq	%rcx, 24(%rsp)
	cmpl	$0, 52(%rsp)
	js	.LBB52_9
# BB#1:
	movslq	52(%rsp), %rax
	cmpq	$17, %rax
	jae	.LBB52_9
# BB#2:
	movslq	52(%rsp), %rax
	movq	re_error_msg(,%rax,8), %rax
	movq	%rax, 16(%rsp)
	testq	%rax, %rax
	jne	.LBB52_4
# BB#3:
	movq	$.L.str50, 16(%rsp)
.LBB52_4:
	movq	16(%rsp), %rdi
	callq	strlen
	incq	%rax
	movq	%rax, 8(%rsp)
	cmpq	$0, 24(%rsp)
	je	.LBB52_8
# BB#5:
	movq	8(%rsp), %rax
	cmpq	24(%rsp), %rax
	jbe	.LBB52_7
# BB#6:
	movq	16(%rsp), %rsi
	movq	32(%rsp), %rdi
	movq	24(%rsp), %rdx
	decq	%rdx
	callq	strncpy
	movq	32(%rsp), %rax
	movq	24(%rsp), %rcx
	movb	$0, -1(%rcx,%rax)
	jmp	.LBB52_8
.LBB52_7:
	movq	16(%rsp), %rsi
	movq	32(%rsp), %rdi
	callq	strcpy
.LBB52_8:
	movq	8(%rsp), %rax
	addq	$56, %rsp
	ret
.LBB52_9:
	callq	abort
.Ltmp190:
	.size	regerror, .Ltmp190-regerror
	.cfi_endproc

	.globl	regfree
	.align	16, 0x90
	.type	regfree,@function
regfree:                                # @regfree
	.cfi_startproc
# BB#0:
	pushq	%rax
.Ltmp192:
	.cfi_def_cfa_offset 16
	movq	%rdi, (%rsp)
	cmpq	$0, (%rdi)
	je	.LBB53_2
# BB#1:
	movq	(%rsp), %rax
	movq	(%rax), %rdi
	callq	free
.LBB53_2:
	movq	(%rsp), %rax
	movq	$0, (%rax)
	movq	(%rsp), %rax
	movq	$0, 8(%rax)
	movq	(%rsp), %rax
	movq	$0, 16(%rax)
	movq	(%rsp), %rax
	cmpq	$0, 32(%rax)
	je	.LBB53_4
# BB#3:
	movq	(%rsp), %rax
	movq	32(%rax), %rdi
	callq	free
.LBB53_4:
	movq	(%rsp), %rax
	movq	$0, 32(%rax)
	movq	(%rsp), %rax
	andl	$-9, 56(%rax)
	movq	(%rsp), %rax
	cmpq	$0, 40(%rax)
	je	.LBB53_6
# BB#5:
	movq	(%rsp), %rax
	movq	40(%rax), %rdi
	callq	free
.LBB53_6:
	movq	(%rsp), %rax
	movq	$0, 40(%rax)
	popq	%rax
	ret
.Ltmp193:
	.size	regfree, .Ltmp193-regfree
	.cfi_endproc

	.align	16, 0x90
	.type	group_in_compile_stack,@function
group_in_compile_stack:                 # @group_in_compile_stack
	.cfi_startproc
# BB#0:
	movq	%rdi, -24(%rsp)
	movq	%rsi, -16(%rsp)
	movl	%edx, -28(%rsp)
	movl	-12(%rsp), %eax
	decl	%eax
	movl	%eax, -32(%rsp)
	jmp	.LBB54_1
	.align	16, 0x90
.LBB54_4:                               #   in Loop: Header=BB54_1 Depth=1
	decl	-32(%rsp)
.LBB54_1:                               # =>This Inner Loop Header: Depth=1
	cmpl	$0, -32(%rsp)
	js	.LBB54_5
# BB#2:                                 #   in Loop: Header=BB54_1 Depth=1
	movslq	-32(%rsp), %rax
	leaq	(%rax,%rax,4), %rax
	movq	-24(%rsp), %rcx
	movl	16(%rcx,%rax,4), %eax
	cmpl	-28(%rsp), %eax
	jne	.LBB54_4
# BB#3:
	movb	$1, -1(%rsp)
	movsbl	-1(%rsp), %eax
	ret
.LBB54_5:
	movb	$0, -1(%rsp)
	movsbl	-1(%rsp), %eax
	ret
.Ltmp194:
	.size	group_in_compile_stack, .Ltmp194-group_in_compile_stack
	.cfi_endproc

	.align	16, 0x90
	.type	store_op2,@function
store_op2:                              # @store_op2
	.cfi_startproc
# BB#0:
	movl	%edi, -4(%rsp)
	movq	%rsi, -16(%rsp)
	movl	%edx, -20(%rsp)
	movl	%ecx, -24(%rsp)
	movq	-16(%rsp), %rax
	movb	-4(%rsp), %cl
	movb	%cl, (%rax)
	movq	-16(%rsp), %rax
	movb	-20(%rsp), %cl
	movb	%cl, 1(%rax)
	movq	-16(%rsp), %rax
	movb	-19(%rsp), %cl
	movb	%cl, 2(%rax)
	movq	-16(%rsp), %rax
	movb	-24(%rsp), %cl
	movb	%cl, 3(%rax)
	movq	-16(%rsp), %rax
	movb	-23(%rsp), %cl
	movb	%cl, 4(%rax)
	ret
.Ltmp195:
	.size	store_op2, .Ltmp195-store_op2
	.cfi_endproc

	.align	16, 0x90
	.type	insert_op2,@function
insert_op2:                             # @insert_op2
	.cfi_startproc
# BB#0:
	subq	$56, %rsp
.Ltmp197:
	.cfi_def_cfa_offset 64
	movl	%edi, 52(%rsp)
	movq	%rsi, 40(%rsp)
	movl	%edx, 36(%rsp)
	movl	%ecx, 32(%rsp)
	movq	%r8, 24(%rsp)
	movq	%r8, 16(%rsp)
	movq	24(%rsp), %rax
	addq	$5, %rax
	movq	%rax, 8(%rsp)
	jmp	.LBB56_1
	.align	16, 0x90
.LBB56_2:                               #   in Loop: Header=BB56_1 Depth=1
	movq	16(%rsp), %rax
	leaq	-1(%rax), %rcx
	movq	%rcx, 16(%rsp)
	movb	-1(%rax), %al
	movq	8(%rsp), %rcx
	leaq	-1(%rcx), %rdx
	movq	%rdx, 8(%rsp)
	movb	%al, -1(%rcx)
.LBB56_1:                               # =>This Inner Loop Header: Depth=1
	movq	16(%rsp), %rax
	cmpq	40(%rsp), %rax
	jne	.LBB56_2
# BB#3:
	movl	32(%rsp), %ecx
	movl	36(%rsp), %edx
	movq	40(%rsp), %rsi
	movl	52(%rsp), %edi
	xorb	%al, %al
	callq	store_op2
	addq	$56, %rsp
	ret
.Ltmp198:
	.size	insert_op2, .Ltmp198-insert_op2
	.cfi_endproc

	.align	16, 0x90
	.type	compile_range,@function
compile_range:                          # @compile_range
	.cfi_startproc
# BB#0:
	movq	%rdi, -16(%rsp)
	movq	%rsi, -24(%rsp)
	movq	%rdx, -32(%rsp)
	movl	%ecx, -36(%rsp)
	movq	%r8, -48(%rsp)
	movq	-16(%rsp), %rax
	movq	(%rax), %rax
	movq	%rax, -64(%rsp)
	cmpq	-24(%rsp), %rax
	je	.LBB57_1
# BB#2:
	movq	-64(%rsp), %rax
	movzbl	-2(%rax), %eax
	movl	%eax, -68(%rsp)
	movq	-64(%rsp), %rax
	movzbl	(%rax), %eax
	movl	%eax, -72(%rsp)
	movq	-16(%rsp), %rax
	incq	(%rax)
	movl	-68(%rsp), %eax
	cmpl	-72(%rsp), %eax
	jle	.LBB57_4
# BB#3:
	movl	$65536, %eax            # imm = 0x10000
	andl	-36(%rsp), %eax
	shrl	$16, %eax
	movl	$11, %ecx
	testl	%eax, %eax
	movl	$0, %eax
	cmovnel	%ecx, %eax
	movl	%eax, -4(%rsp)
	movl	-4(%rsp), %eax
	ret
.LBB57_1:
	movl	$11, -4(%rsp)
	movl	-4(%rsp), %eax
	ret
.LBB57_4:
	movl	-68(%rsp), %eax
	movl	%eax, -52(%rsp)
	jmp	.LBB57_5
	.align	16, 0x90
.LBB57_12:                              #   in Loop: Header=BB57_5 Depth=1
	andl	$248, %ecx
	shrl	$3, %ecx
	movq	-48(%rsp), %rdx
	movzbl	(%rdx,%rcx), %esi
	orl	%eax, %esi
	movb	%sil, (%rdx,%rcx)
	incl	-52(%rsp)
.LBB57_5:                               # =>This Inner Loop Header: Depth=1
	movl	-52(%rsp), %eax
	cmpl	-72(%rsp), %eax
	ja	.LBB57_13
# BB#6:                                 #   in Loop: Header=BB57_5 Depth=1
	cmpq	$0, -32(%rsp)
	je	.LBB57_8
# BB#7:                                 #   in Loop: Header=BB57_5 Depth=1
	movzbl	-52(%rsp), %eax
	movq	-32(%rsp), %rcx
	movsbl	(%rcx,%rax), %ecx
	jmp	.LBB57_9
.LBB57_8:                               #   in Loop: Header=BB57_5 Depth=1
	movl	-52(%rsp), %ecx
.LBB57_9:                               #   in Loop: Header=BB57_5 Depth=1
	andb	$7, %cl
                                        # kill: CL<def> CL<kill> ECX<kill>
	movl	$1, %eax
	shll	%cl, %eax
	cmpq	$0, -32(%rsp)
	je	.LBB57_11
# BB#10:                                #   in Loop: Header=BB57_5 Depth=1
	movzbl	-52(%rsp), %ecx
	movq	-32(%rsp), %rdx
	movsbl	(%rdx,%rcx), %ecx
	jmp	.LBB57_12
.LBB57_11:                              #   in Loop: Header=BB57_5 Depth=1
	movl	-52(%rsp), %ecx
	jmp	.LBB57_12
.LBB57_13:
	movl	$0, -4(%rsp)
	movl	-4(%rsp), %eax
	ret
.Ltmp199:
	.size	compile_range, .Ltmp199-compile_range
	.cfi_endproc

	.align	16, 0x90
	.type	insert_op1,@function
insert_op1:                             # @insert_op1
	.cfi_startproc
# BB#0:
	subq	$56, %rsp
.Ltmp201:
	.cfi_def_cfa_offset 64
	movl	%edi, 52(%rsp)
	movq	%rsi, 40(%rsp)
	movl	%edx, 36(%rsp)
	movq	%rcx, 24(%rsp)
	movq	%rcx, 16(%rsp)
	movq	24(%rsp), %rax
	addq	$3, %rax
	movq	%rax, 8(%rsp)
	jmp	.LBB58_1
	.align	16, 0x90
.LBB58_2:                               #   in Loop: Header=BB58_1 Depth=1
	movq	16(%rsp), %rax
	leaq	-1(%rax), %rcx
	movq	%rcx, 16(%rsp)
	movb	-1(%rax), %al
	movq	8(%rsp), %rcx
	leaq	-1(%rcx), %rdx
	movq	%rdx, 8(%rsp)
	movb	%al, -1(%rcx)
.LBB58_1:                               # =>This Inner Loop Header: Depth=1
	movq	16(%rsp), %rax
	cmpq	40(%rsp), %rax
	jne	.LBB58_2
# BB#3:
	movl	36(%rsp), %edx
	movq	40(%rsp), %rsi
	movl	52(%rsp), %edi
	xorb	%al, %al
	callq	store_op1
	addq	$56, %rsp
	ret
.Ltmp202:
	.size	insert_op1, .Ltmp202-insert_op1
	.cfi_endproc

	.align	16, 0x90
	.type	store_op1,@function
store_op1:                              # @store_op1
	.cfi_startproc
# BB#0:
	movl	%edi, -4(%rsp)
	movq	%rsi, -16(%rsp)
	movl	%edx, -20(%rsp)
	movq	-16(%rsp), %rax
	movb	-4(%rsp), %cl
	movb	%cl, (%rax)
	movq	-16(%rsp), %rax
	movb	-20(%rsp), %cl
	movb	%cl, 1(%rax)
	movq	-16(%rsp), %rax
	movb	-19(%rsp), %cl
	movb	%cl, 2(%rax)
	ret
.Ltmp203:
	.size	store_op1, .Ltmp203-store_op1
	.cfi_endproc

	.align	16, 0x90
	.type	at_endline_loc_p,@function
at_endline_loc_p:                       # @at_endline_loc_p
	.cfi_startproc
# BB#0:
	movq	%rdi, -8(%rsp)
	movq	%rsi, -16(%rsp)
	movl	%edx, -20(%rsp)
	movq	-8(%rsp), %rax
	movq	%rax, -32(%rsp)
	movsbl	(%rax), %ecx
	xorl	%eax, %eax
	cmpl	$92, %ecx
	sete	-33(%rsp)
	movq	-8(%rsp), %rcx
	incq	%rcx
	cmpq	-16(%rsp), %rcx
	jae	.LBB60_2
# BB#1:
	movq	-8(%rsp), %rax
	incq	%rax
.LBB60_2:
	movq	%rax, -48(%rsp)
	testb	$32, -19(%rsp)
	je	.LBB60_4
# BB#3:
	movq	-32(%rsp), %rax
	jmp	.LBB60_7
.LBB60_4:
	movsbl	-33(%rsp), %eax
	testl	%eax, %eax
	je	.LBB60_8
# BB#5:
	cmpq	$0, -48(%rsp)
	je	.LBB60_8
# BB#6:
	movq	-48(%rsp), %rax
.LBB60_7:
	movsbl	(%rax), %ecx
	movb	$1, %al
	cmpl	$41, %ecx
	je	.LBB60_15
.LBB60_8:
	testb	$-128, -19(%rsp)
	je	.LBB60_10
# BB#9:
	movq	-32(%rsp), %rax
	jmp	.LBB60_13
.LBB60_10:
	xorb	%al, %al
	movsbl	-33(%rsp), %ecx
	testl	%ecx, %ecx
	je	.LBB60_14
# BB#11:
	xorb	%al, %al
	cmpq	$0, -48(%rsp)
	je	.LBB60_14
# BB#12:
	movq	-48(%rsp), %rax
.LBB60_13:
	movsbl	(%rax), %eax
	cmpl	$124, %eax
	sete	%al
.LBB60_14:
	movzbl	%al, %eax
	testl	%eax, %eax
	setne	%al
.LBB60_15:
	movzbl	%al, %eax
	ret
.Ltmp204:
	.size	at_endline_loc_p, .Ltmp204-at_endline_loc_p
	.cfi_endproc

	.align	16, 0x90
	.type	at_begline_loc_p,@function
at_begline_loc_p:                       # @at_begline_loc_p
	.cfi_startproc
# BB#0:
	movq	%rdi, -8(%rsp)
	movq	%rsi, -16(%rsp)
	movl	%edx, -20(%rsp)
	movq	-16(%rsp), %rcx
	addq	$-2, %rcx
	movq	%rcx, -32(%rsp)
	xorb	%al, %al
	cmpq	-8(%rsp), %rcx
	jbe	.LBB61_2
# BB#1:
	movq	-32(%rsp), %rax
	movsbl	-1(%rax), %eax
	cmpl	$92, %eax
	sete	%al
.LBB61_2:
	movb	%al, -33(%rsp)
	movq	-32(%rsp), %rax
	movsbl	(%rax), %eax
	cmpl	$40, %eax
	jne	.LBB61_5
# BB#3:
	movb	$1, %al
	testb	$32, -19(%rsp)
	jne	.LBB61_8
# BB#4:
	movb	$1, %al
	movsbl	-33(%rsp), %ecx
	testl	%ecx, %ecx
	jne	.LBB61_8
.LBB61_5:
	movq	-32(%rsp), %rax
	movsbl	(%rax), %ecx
	xorb	%al, %al
	cmpl	$124, %ecx
	jne	.LBB61_8
# BB#6:
	movb	$1, %al
	testb	$-128, -19(%rsp)
	jne	.LBB61_8
# BB#7:
	movsbl	-33(%rsp), %eax
	testl	%eax, %eax
	setne	%al
.LBB61_8:
	movzbl	%al, %eax
	ret
.Ltmp205:
	.size	at_begline_loc_p, .Ltmp205-at_begline_loc_p
	.cfi_endproc

	.align	16, 0x90
	.type	init_syntax_once,@function
init_syntax_once:                       # @init_syntax_once
	.cfi_startproc
# BB#0:
	pushq	%rax
.Ltmp207:
	.cfi_def_cfa_offset 16
	cmpl	$0, init_syntax_once.done(%rip)
	jne	.LBB62_11
# BB#1:
	movl	$re_syntax_table, %edi
	xorl	%esi, %esi
	movl	$256, %edx              # imm = 0x100
	callq	memset
	movl	$97, 4(%rsp)
	jmp	.LBB62_2
	.align	16, 0x90
.LBB62_3:                               #   in Loop: Header=BB62_2 Depth=1
	movslq	4(%rsp), %rax
	movb	$1, re_syntax_table(%rax)
	incl	4(%rsp)
.LBB62_2:                               # =>This Inner Loop Header: Depth=1
	cmpl	$122, 4(%rsp)
	jle	.LBB62_3
# BB#4:
	movl	$65, 4(%rsp)
	jmp	.LBB62_5
	.align	16, 0x90
.LBB62_6:                               #   in Loop: Header=BB62_5 Depth=1
	movslq	4(%rsp), %rax
	movb	$1, re_syntax_table(%rax)
	incl	4(%rsp)
.LBB62_5:                               # =>This Inner Loop Header: Depth=1
	cmpl	$90, 4(%rsp)
	jle	.LBB62_6
# BB#7:
	movl	$48, 4(%rsp)
	jmp	.LBB62_8
	.align	16, 0x90
.LBB62_9:                               #   in Loop: Header=BB62_8 Depth=1
	movslq	4(%rsp), %rax
	movb	$1, re_syntax_table(%rax)
	incl	4(%rsp)
.LBB62_8:                               # =>This Inner Loop Header: Depth=1
	cmpl	$57, 4(%rsp)
	jle	.LBB62_9
# BB#10:
	movb	$1, re_syntax_table+95(%rip)
	movl	$1, init_syntax_once.done(%rip)
.LBB62_11:
	popq	%rax
	ret
.Ltmp208:
	.size	init_syntax_once, .Ltmp208-init_syntax_once
	.cfi_endproc

	.align	16, 0x90
	.type	bcmp_translate,@function
bcmp_translate:                         # @bcmp_translate
	.cfi_startproc
# BB#0:
	movq	%rdi, -16(%rsp)
	movq	%rsi, -24(%rsp)
	movl	%edx, -28(%rsp)
	movq	%rcx, -40(%rsp)
	movq	-16(%rsp), %rax
	movq	%rax, -48(%rsp)
	movq	-24(%rsp), %rax
	movq	%rax, -56(%rsp)
	jmp	.LBB63_1
	.align	16, 0x90
.LBB63_4:                               #   in Loop: Header=BB63_1 Depth=1
	decl	-28(%rsp)
.LBB63_1:                               # =>This Inner Loop Header: Depth=1
	cmpl	$0, -28(%rsp)
	je	.LBB63_5
# BB#2:                                 #   in Loop: Header=BB63_1 Depth=1
	movq	-48(%rsp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, -48(%rsp)
	movzbl	(%rax), %eax
	movq	-40(%rsp), %rcx
	movsbl	(%rcx,%rax), %eax
	movq	-56(%rsp), %rcx
	leaq	1(%rcx), %rdx
	movq	%rdx, -56(%rsp)
	movzbl	(%rcx), %ecx
	movq	-40(%rsp), %rdx
	movsbl	(%rdx,%rcx), %ecx
	cmpl	%ecx, %eax
	je	.LBB63_4
# BB#3:
	movl	$1, -4(%rsp)
	movl	-4(%rsp), %eax
	ret
.LBB63_5:
	movl	$0, -4(%rsp)
	movl	-4(%rsp), %eax
	ret
.Ltmp209:
	.size	bcmp_translate, .Ltmp209-bcmp_translate
	.cfi_endproc

	.align	16, 0x90
	.type	group_match_null_string_p,@function
group_match_null_string_p:              # @group_match_null_string_p
	.cfi_startproc
# BB#0:
	pushq	%rbx
.Ltmp212:
	.cfi_def_cfa_offset 16
	subq	$48, %rsp
.Ltmp213:
	.cfi_def_cfa_offset 64
.Ltmp214:
	.cfi_offset %rbx, -16
	movq	%rdi, 32(%rsp)
	movq	%rsi, 24(%rsp)
	movq	%rdx, 16(%rsp)
	movq	32(%rsp), %rax
	movq	(%rax), %rax
	addq	$2, %rax
	movq	%rax, (%rsp)
	leaq	(%rsp), %rbx
	jmp	.LBB64_1
	.align	16, 0x90
.LBB64_11:                              #   in Loop: Header=BB64_1 Depth=1
	movslq	12(%rsp), %rax
	addq	%rax, (%rsp)
	.align	16, 0x90
.LBB64_1:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB64_5 Depth 2
	movq	(%rsp), %rax
	cmpq	24(%rsp), %rax
	jae	.LBB64_14
# BB#2:                                 #   in Loop: Header=BB64_1 Depth=1
	movq	(%rsp), %rax
	movzbl	(%rax), %eax
	cmpl	$6, %eax
	je	.LBB64_12
# BB#3:                                 #   in Loop: Header=BB64_1 Depth=1
	cmpl	$14, %eax
	jne	.LBB64_13
# BB#4:                                 #   in Loop: Header=BB64_1 Depth=1
	incq	(%rsp)
	movq	(%rsp), %rax
	movzbl	(%rax), %eax
	movl	%eax, 12(%rsp)
	movq	(%rsp), %rcx
	movsbl	1(%rcx), %ecx
	shll	$8, %ecx
	orl	%eax, %ecx
	movl	%ecx, 12(%rsp)
	addq	$2, (%rsp)
	cmpl	$0, 12(%rsp)
	js	.LBB64_1
	.align	16, 0x90
.LBB64_5:                               #   Parent Loop BB64_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	12(%rsp), %eax
	addl	$-3, %eax
	movslq	%eax, %rax
	movq	(%rsp), %rcx
	movzbl	(%rcx,%rax), %eax
	cmpl	$13, %eax
	jne	.LBB64_10
# BB#6:                                 #   in Loop: Header=BB64_5 Depth=2
	movslq	12(%rsp), %rax
	movq	(%rsp), %rdi
	leaq	-3(%rdi,%rax), %rsi
	movq	16(%rsp), %rdx
	xorb	%al, %al
	callq	alt_match_null_string_p
	testb	%al, %al
	je	.LBB64_14
# BB#7:                                 #   in Loop: Header=BB64_5 Depth=2
	movslq	12(%rsp), %rax
	movq	(%rsp), %rcx
	leaq	(%rcx,%rax), %rdx
	movq	%rdx, (%rsp)
	cmpb	$14, (%rcx,%rax)
	jne	.LBB64_10
# BB#8:                                 #   in Loop: Header=BB64_5 Depth=2
	incq	(%rsp)
	movq	(%rsp), %rax
	movzbl	(%rax), %eax
	movl	%eax, 12(%rsp)
	movq	(%rsp), %rcx
	movsbl	1(%rcx), %ecx
	shll	$8, %ecx
	orl	%eax, %ecx
	movl	%ecx, 12(%rsp)
	addq	$2, (%rsp)
	movl	12(%rsp), %eax
	addl	$-3, %eax
	movslq	%eax, %rax
	movq	(%rsp), %rcx
	movzbl	(%rcx,%rax), %eax
	cmpl	$13, %eax
	je	.LBB64_5
# BB#9:                                 #   in Loop: Header=BB64_1 Depth=1
	addq	$-3, (%rsp)
.LBB64_10:                              #   in Loop: Header=BB64_1 Depth=1
	movq	(%rsp), %rax
	movzbl	-2(%rax), %eax
	movl	%eax, 12(%rsp)
	movq	(%rsp), %rcx
	movsbl	-1(%rcx), %ecx
	shll	$8, %ecx
	orl	%eax, %ecx
	movl	%ecx, 12(%rsp)
	movslq	12(%rsp), %rsi
	movq	(%rsp), %rdi
	addq	%rdi, %rsi
	movq	16(%rsp), %rdx
	xorb	%al, %al
	callq	alt_match_null_string_p
	testb	%al, %al
	je	.LBB64_14
	jmp	.LBB64_11
.LBB64_13:                              #   in Loop: Header=BB64_1 Depth=1
	movq	16(%rsp), %rdx
	movq	24(%rsp), %rsi
	movq	%rbx, %rdi
	xorb	%al, %al
	callq	common_op_match_null_string_p
	testb	%al, %al
	jne	.LBB64_1
.LBB64_14:
	movb	$0, 47(%rsp)
	jmp	.LBB64_15
.LBB64_12:
	movq	(%rsp), %rax
	addq	$2, %rax
	movq	32(%rsp), %rcx
	movq	%rax, (%rcx)
	movb	$1, 47(%rsp)
.LBB64_15:
	movsbl	47(%rsp), %eax
	addq	$48, %rsp
	popq	%rbx
	ret
.Ltmp215:
	.size	group_match_null_string_p, .Ltmp215-group_match_null_string_p
	.cfi_endproc

	.align	16, 0x90
	.type	common_op_match_null_string_p,@function
common_op_match_null_string_p:          # @common_op_match_null_string_p
	.cfi_startproc
# BB#0:
	subq	$56, %rsp
.Ltmp217:
	.cfi_def_cfa_offset 64
	movq	%rdi, 40(%rsp)
	movq	%rsi, 32(%rsp)
	movq	%rdx, 24(%rsp)
	movq	40(%rsp), %rax
	movq	(%rax), %rax
	movq	%rax, (%rsp)
	leaq	1(%rax), %rcx
	movq	%rcx, (%rsp)
	movzbl	(%rax), %eax
	cmpq	$28, %rax
	ja	.LBB65_12
# BB#1:
	jmpq	*.LJTI65_0(,%rax,8)
	.align	16, 0x90
.LBB65_7:
	movq	40(%rsp), %rax
	movq	(%rsp), %rcx
	movq	%rcx, (%rax)
	movb	$1, 55(%rsp)
	jmp	.LBB65_13
.LBB65_2:
	movq	(%rsp), %rax
	movzbl	(%rax), %eax
	movl	%eax, 12(%rsp)
	movq	24(%rsp), %rdx
	movq	32(%rsp), %rsi
	leaq	(%rsp), %rdi
	xorb	%al, %al
	callq	group_match_null_string_p
	movb	%al, 19(%rsp)
	movslq	12(%rsp), %rax
	movq	24(%rsp), %rcx
	movl	(%rcx,%rax,8), %eax
	andl	$3, %eax
	cmpl	$3, %eax
	jne	.LBB65_4
# BB#3:
	movslq	12(%rsp), %rax
	movq	24(%rsp), %rcx
	movl	(%rcx,%rax,8), %edx
	andl	$-4, %edx
	movzbl	19(%rsp), %esi
	andl	$3, %esi
	orl	%edx, %esi
	movl	%esi, (%rcx,%rax,8)
.LBB65_4:
	cmpb	$0, 19(%rsp)
	jne	.LBB65_7
	jmp	.LBB65_12
.LBB65_10:
	movq	(%rsp), %rax
	movzbl	(%rax), %eax
	movq	24(%rsp), %rcx
	testb	$3, (%rcx,%rax,8)
	jne	.LBB65_7
	jmp	.LBB65_12
.LBB65_5:
	movq	(%rsp), %rax
	movzbl	(%rax), %eax
	movl	%eax, 20(%rsp)
	movq	(%rsp), %rcx
	movsbl	1(%rcx), %ecx
	shll	$8, %ecx
	orl	%eax, %ecx
	movl	%ecx, 20(%rsp)
	addq	$2, (%rsp)
	cmpl	$0, 20(%rsp)
	js	.LBB65_12
	jmp	.LBB65_6
.LBB65_8:
	addq	$2, (%rsp)
	movq	(%rsp), %rax
	movzbl	(%rax), %eax
	movl	%eax, 20(%rsp)
	movq	(%rsp), %rcx
	movsbl	1(%rcx), %ecx
	shll	$8, %ecx
	orl	%eax, %ecx
	movl	%ecx, 20(%rsp)
	addq	$2, (%rsp)
	cmpl	$0, 20(%rsp)
	jne	.LBB65_12
# BB#9:
	addq	$-4, (%rsp)
	movq	(%rsp), %rax
	movzbl	(%rax), %eax
	movl	%eax, 20(%rsp)
	movq	(%rsp), %rcx
	movsbl	1(%rcx), %ecx
	shll	$8, %ecx
	orl	%eax, %ecx
	movl	%ecx, 20(%rsp)
	addq	$2, (%rsp)
.LBB65_6:
	movslq	20(%rsp), %rax
	addq	%rax, (%rsp)
	jmp	.LBB65_7
.LBB65_11:
	addq	$4, (%rsp)
.LBB65_12:
	movb	$0, 55(%rsp)
.LBB65_13:
	movsbl	55(%rsp), %eax
	addq	$56, %rsp
	ret
.Ltmp218:
	.size	common_op_match_null_string_p, .Ltmp218-common_op_match_null_string_p
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.align	8
.LJTI65_0:
	.quad	.LBB65_7
	.quad	.LBB65_12
	.quad	.LBB65_12
	.quad	.LBB65_12
	.quad	.LBB65_12
	.quad	.LBB65_2
	.quad	.LBB65_12
	.quad	.LBB65_10
	.quad	.LBB65_7
	.quad	.LBB65_7
	.quad	.LBB65_7
	.quad	.LBB65_7
	.quad	.LBB65_5
	.quad	.LBB65_12
	.quad	.LBB65_12
	.quad	.LBB65_12
	.quad	.LBB65_12
	.quad	.LBB65_12
	.quad	.LBB65_12
	.quad	.LBB65_12
	.quad	.LBB65_8
	.quad	.LBB65_12
	.quad	.LBB65_11
	.quad	.LBB65_12
	.quad	.LBB65_12
	.quad	.LBB65_7
	.quad	.LBB65_7
	.quad	.LBB65_7
	.quad	.LBB65_7

	.text
	.align	16, 0x90
	.type	alt_match_null_string_p,@function
alt_match_null_string_p:                # @alt_match_null_string_p
	.cfi_startproc
# BB#0:
	pushq	%rbx
.Ltmp221:
	.cfi_def_cfa_offset 16
	subq	$48, %rsp
.Ltmp222:
	.cfi_def_cfa_offset 64
.Ltmp223:
	.cfi_offset %rbx, -16
	movq	%rdi, 32(%rsp)
	movq	%rsi, 24(%rsp)
	movq	%rdx, 16(%rsp)
	movq	32(%rsp), %rax
	movq	%rax, (%rsp)
	leaq	(%rsp), %rbx
	jmp	.LBB66_1
	.align	16, 0x90
.LBB66_3:                               #   in Loop: Header=BB66_1 Depth=1
	incq	(%rsp)
	movq	(%rsp), %rax
	movzbl	(%rax), %eax
	movl	%eax, 12(%rsp)
	movq	(%rsp), %rcx
	movsbl	1(%rcx), %ecx
	shll	$8, %ecx
	orl	%eax, %ecx
	movl	%ecx, 12(%rsp)
	addq	$2, (%rsp)
	movslq	12(%rsp), %rax
	addq	%rax, (%rsp)
	.align	16, 0x90
.LBB66_1:                               # =>This Inner Loop Header: Depth=1
	movq	(%rsp), %rax
	cmpq	24(%rsp), %rax
	jae	.LBB66_6
# BB#2:                                 #   in Loop: Header=BB66_1 Depth=1
	movq	(%rsp), %rax
	movzbl	(%rax), %eax
	cmpl	$14, %eax
	je	.LBB66_3
# BB#4:                                 #   in Loop: Header=BB66_1 Depth=1
	movq	16(%rsp), %rdx
	movq	24(%rsp), %rsi
	movq	%rbx, %rdi
	xorb	%al, %al
	callq	common_op_match_null_string_p
	testb	%al, %al
	jne	.LBB66_1
# BB#5:
	movb	$0, 47(%rsp)
	jmp	.LBB66_7
.LBB66_6:
	movb	$1, 47(%rsp)
.LBB66_7:
	movsbl	47(%rsp), %eax
	addq	$48, %rsp
	popq	%rbx
	ret
.Ltmp224:
	.size	alt_match_null_string_p, .Ltmp224-alt_match_null_string_p
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "GNU sed version 1.18"
	.size	.L.str, 21

	.type	version_string,@object  # @version_string
	.data
	.globl	version_string
	.align	8
version_string:
	.quad	.L.str
	.size	version_string, 8

	.type	no_default_output,@object # @no_default_output
	.bss
	.globl	no_default_output
	.align	4
no_default_output:
	.long	0                       # 0x0
	.size	no_default_output, 4

	.type	input_line_number,@object # @input_line_number
	.globl	input_line_number
	.align	4
input_line_number:
	.long	0                       # 0x0
	.size	input_line_number, 4

	.type	last_input_file,@object # @last_input_file
	.globl	last_input_file
	.align	4
last_input_file:
	.long	0                       # 0x0
	.size	last_input_file, 4

	.type	input_EOF,@object       # @input_EOF
	.globl	input_EOF
	.align	4
input_EOF:
	.long	0                       # 0x0
	.size	input_EOF, 4

	.type	quit_cmd,@object        # @quit_cmd
	.globl	quit_cmd
	.align	4
quit_cmd:
	.long	0                       # 0x0
	.size	quit_cmd, 4

	.type	replaced,@object        # @replaced
	.globl	replaced
	.align	4
replaced:
	.long	0                       # 0x0
	.size	replaced, 4

	.type	program_depth,@object   # @program_depth
	.globl	program_depth
	.align	4
program_depth:
	.long	0                       # 0x0
	.size	program_depth, 4

	.type	the_program,@object     # @the_program
	.globl	the_program
	.align	8
the_program:
	.quad	0
	.size	the_program, 8

	.type	jumps,@object           # @jumps
	.globl	jumps
	.align	8
jumps:
	.quad	0
	.size	jumps, 8

	.type	labels,@object          # @labels
	.globl	labels
	.align	8
labels:
	.quad	0
	.size	labels, 8

	.type	prog_line,@object       # @prog_line
	.data
	.globl	prog_line
	.align	4
prog_line:
	.long	1                       # 0x1
	.size	prog_line, 4

	.type	bad_input,@object       # @bad_input
	.bss
	.globl	bad_input
	.align	4
bad_input:
	.long	0                       # 0x0
	.size	bad_input, 4

	.type	.L.str1,@object         # @.str1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str1:
	.asciz	 "Executable"
	.size	.L.str1, 11

	.type	myname,@object          # @myname
	.comm	myname,8,8
	.type	.L.str2,@object         # @.str2
.L.str2:
	.asciz	 "hne:f:V"
	.size	.L.str2, 8

	.type	.L.str3,@object         # @.str3
.L.str3:
	.asciz	 "\n"
	.size	.L.str3, 2

	.type	.L.str4,@object         # @.str4
.L.str4:
	.asciz	 "%s\n"
	.size	.L.str4, 4

	.type	.L.str5,@object         # @.str5
.L.str5:
	.asciz	 "Can't find label for jump to '%s'"
	.size	.L.str5, 34

	.type	line,@object            # @line
	.comm	line,16,8
	.type	append,@object          # @append
	.comm	append,16,8
	.type	hold,@object            # @hold
	.comm	hold,16,8
	.type	.L.str6,@object         # @.str6
.L.str6:
	.asciz	 "-"
	.size	.L.str6, 2

	.type	file_ptrs,@object       # @file_ptrs
	.comm	file_ptrs,768,16
	.type	prog_file,@object       # @prog_file
	.comm	prog_file,8,8
	.type	prog_cur,@object        # @prog_cur
	.comm	prog_cur,8,8
	.type	prog_start,@object      # @prog_start
	.comm	prog_start,8,8
	.type	prog_end,@object        # @prog_end
	.comm	prog_end,8,8
	.type	prog_name,@object       # @prog_name
	.comm	prog_name,8,8
	.type	.L.str7,@object         # @.str7
.L.str7:
	.asciz	 "r"
	.size	.L.str7, 2

	.type	.L.str8,@object         # @.str8
.L.str8:
	.asciz	 "Unexpected ','"
	.size	.L.str8, 15

	.type	NO_COMMAND,@object      # @NO_COMMAND
	.data
	.align	16
NO_COMMAND:
	.asciz	 "Missing command"
	.size	NO_COMMAND, 16

	.type	NO_ADDR,@object         # @NO_ADDR
	.align	16
NO_ADDR:
	.asciz	 "Command doesn't take any addresses"
	.size	NO_ADDR, 35

	.type	.L.str9,@object         # @.str9
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str9:
	.asciz	 "Multiple '!'s"
	.size	.L.str9, 14

	.type	ONE_ADDR,@object        # @ONE_ADDR
	.data
	.align	16
ONE_ADDR:
	.asciz	 "Command only uses one address"
	.size	ONE_ADDR, 30

	.type	LINE_JUNK,@object       # @LINE_JUNK
	.align	16
LINE_JUNK:
	.asciz	 "Extra characters after command"
	.size	LINE_JUNK, 31

	.type	.L.str10,@object        # @.str10
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str10:
	.asciz	 "Unexpected '}'"
	.size	.L.str10, 15

	.type	.L.str11,@object        # @.str11
.L.str11:
	.asciz	 "} doesn't want any addresses"
	.size	.L.str11, 29

	.type	.L.str12,@object        # @.str12
.L.str12:
	.asciz	 ": doesn't want any addresses"
	.size	.L.str12, 29

	.type	last_regex,@object      # @last_regex
	.comm	last_regex,8,8
	.type	.L.str13,@object        # @.str13
.L.str13:
	.asciz	 "Unterminated `s' command"
	.size	.L.str13, 25

	.type	.L.str14,@object        # @.str14
.L.str14:
	.asciz	 "multiple 'p' options to 's' command"
	.size	.L.str14, 36

	.type	.L.str15,@object        # @.str15
.L.str15:
	.asciz	 "multiple 'g' options to 's' command"
	.size	.L.str15, 36

	.type	.L.str16,@object        # @.str16
.L.str16:
	.asciz	 "multiple number options to 's' command"
	.size	.L.str16, 39

	.type	.L.str17,@object        # @.str17
.L.str17:
	.asciz	 "Unknown option to 's'"
	.size	.L.str17, 22

	.type	BAD_EOF,@object         # @BAD_EOF
	.data
	.align	16
BAD_EOF:
	.asciz	 "Unexpected End-of-file"
	.size	BAD_EOF, 23

	.type	.L.str18,@object        # @.str18
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str18:
	.asciz	 "strings for y command are different lengths"
	.size	.L.str18, 44

	.type	.L.str19,@object        # @.str19
.L.str19:
	.asciz	 "Unknown command"
	.size	.L.str19, 16

	.type	.L.str20,@object        # @.str20
.L.str20:
	.asciz	 "Unmatched `{'"
	.size	.L.str20, 14

	.type	.L.str21,@object        # @.str21
.L.str21:
	.asciz	 "%s: file %s line %d: %s\n"
	.size	.L.str21, 25

	.type	.L.str22,@object        # @.str22
.L.str22:
	.asciz	 "%s: %s\n"
	.size	.L.str22, 8

	.type	NO_REGEX,@object        # @NO_REGEX
	.data
	.align	16
NO_REGEX:
	.asciz	 "No previous regular expression"
	.size	NO_REGEX, 31

	.type	.L.str23,@object        # @.str23
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str23:
	.asciz	 "missing ' ' before filename"
	.size	.L.str23, 28

	.type	.L.str24,@object        # @.str24
.L.str24:
	.asciz	 "Can't open file for both reading and writing"
	.size	.L.str24, 45

	.type	.L.str25,@object        # @.str25
.L.str25:
	.asciz	 "w"
	.size	.L.str25, 2

	.type	.L.str26,@object        # @.str26
.L.str26:
	.asciz	 "Hopelessely evil compiled in limit on number of open files.  re-compile sed"
	.size	.L.str26, 76

	.type	input_file,@object      # @input_file
	.comm	input_file,8,8
	.type	.L.str27,@object        # @.str27
.L.str27:
	.asciz	 "%s: can't read %s: %s\n"
	.size	.L.str27, 23

	.type	execute_program.end_cycle,@object # @execute_program.end_cycle
	.local	execute_program.end_cycle
	.comm	execute_program.end_cycle,4,4
	.type	execute_program.tmp,@object # @execute_program.tmp
	.local	execute_program.tmp
	.comm	execute_program.tmp,16,8
	.type	.L.str28,@object        # @.str28
.L.str28:
	.asciz	 "%d\n"
	.size	.L.str28, 4

	.type	.L.str29,@object        # @.str29
.L.str29:
	.asciz	 "\\\\"
	.size	.L.str29, 3

	.type	.L.str30,@object        # @.str30
.L.str30:
	.asciz	 "\\a"
	.size	.L.str30, 3

	.type	.L.str31,@object        # @.str31
.L.str31:
	.asciz	 "\\b"
	.size	.L.str31, 3

	.type	.L.str32,@object        # @.str32
.L.str32:
	.asciz	 "\\f"
	.size	.L.str32, 3

	.type	.L.str33,@object        # @.str33
.L.str33:
	.asciz	 "\\n"
	.size	.L.str33, 3

	.type	.L.str34,@object        # @.str34
.L.str34:
	.asciz	 "\\r"
	.size	.L.str34, 3

	.type	.L.str35,@object        # @.str35
.L.str35:
	.asciz	 "\\t"
	.size	.L.str35, 3

	.type	.L.str36,@object        # @.str36
.L.str36:
	.asciz	 "\\v"
	.size	.L.str36, 3

	.type	.L.str37,@object        # @.str37
.L.str37:
	.asciz	 "\\%02x"
	.size	.L.str37, 6

	.type	.L.str38,@object        # @.str38
.L.str38:
	.asciz	 "Read error on input file to 'r' command"
	.size	.L.str38, 40

	.type	regs,@object            # @regs
	.local	regs
	.comm	regs,24,8
	.type	.L.str39,@object        # @.str39
.L.str39:
	.asciz	 "INTERNAL ERROR: Bad cmd %c"
	.size	.L.str39, 27

	.type	.L.str40,@object        # @.str40
.L.str40:
	.asciz	 "INTERNAL ERROR: bad address type"
	.size	.L.str40, 33

	.type	.L.str41,@object        # @.str41
.L.str41:
	.asciz	 "Usage: %s [-nV] [--quiet] [--silent] [--version] [-e script]\n        [-f script-file] [--expression=script] [--file=script-file] [file...]\n"
	.size	.L.str41, 140

	.type	.L.str42,@object        # @.str42
.L.str42:
	.asciz	 "%s: "
	.size	.L.str42, 5

	.type	__id_s,@object          # @__id_s
	.local	__id_s
	.comm	__id_s,512,16
	.type	.L.str43,@object        # @.str43
.L.str43:
	.asciz	 "{Unknown file pointer}"
	.size	.L.str43, 23

	.type	.L.str44,@object        # @.str44
.L.str44:
	.asciz	 "Couldn't open file %s"
	.size	.L.str44, 22

	.type	.L.str45,@object        # @.str45
.L.str45:
	.asciz	 "Internal error: too many files open"
	.size	.L.str45, 36

	.type	.L.str46,@object        # @.str46
.L.str46:
	.asciz	 "couldn't write %d items to %s"
	.size	.L.str46, 30

	.type	.L.str47,@object        # @.str47
.L.str47:
	.asciz	 "Couldn't close %s"
	.size	.L.str47, 18

	.type	.L.str48,@object        # @.str48
.L.str48:
	.asciz	 "Couldn't allocate memory"
	.size	.L.str48, 25

	.type	.L.str49,@object        # @.str49
.L.str49:
	.asciz	 "Couldn't re-allocate memory"
	.size	.L.str49, 28

	.type	re_syntax_options,@object # @re_syntax_options
	.bss
	.globl	re_syntax_options
	.align	4
re_syntax_options:
	.long	0                       # 0x0
	.size	re_syntax_options, 4

	.type	re_max_failures,@object # @re_max_failures
	.data
	.globl	re_max_failures
	.align	4
re_max_failures:
	.long	2000                    # 0x7d0
	.size	re_max_failures, 4

	.type	re_syntax_table,@object # @re_syntax_table
	.local	re_syntax_table
	.comm	re_syntax_table,256,16
	.type	re_error_msg,@object    # @re_error_msg
	.align	16
re_error_msg:
	.quad	0
	.quad	.L.str51
	.quad	.L.str52
	.quad	.L.str53
	.quad	.L.str54
	.quad	.L.str55
	.quad	.L.str56
	.quad	.L.str57
	.quad	.L.str58
	.quad	.L.str59
	.quad	.L.str60
	.quad	.L.str61
	.quad	.L.str62
	.quad	.L.str63
	.quad	.L.str64
	.quad	.L.str65
	.quad	.L.str66
	.size	re_error_msg, 136

	.type	.L.str50,@object        # @.str50
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str50:
	.asciz	 "Success"
	.size	.L.str50, 8

	.type	.L.str51,@object        # @.str51
.L.str51:
	.asciz	 "No match"
	.size	.L.str51, 9

	.type	.L.str52,@object        # @.str52
.L.str52:
	.asciz	 "Invalid regular expression"
	.size	.L.str52, 27

	.type	.L.str53,@object        # @.str53
.L.str53:
	.asciz	 "Invalid collation character"
	.size	.L.str53, 28

	.type	.L.str54,@object        # @.str54
.L.str54:
	.asciz	 "Invalid character class name"
	.size	.L.str54, 29

	.type	.L.str55,@object        # @.str55
.L.str55:
	.asciz	 "Trailing backslash"
	.size	.L.str55, 19

	.type	.L.str56,@object        # @.str56
.L.str56:
	.asciz	 "Invalid back reference"
	.size	.L.str56, 23

	.type	.L.str57,@object        # @.str57
.L.str57:
	.asciz	 "Unmatched [ or [^"
	.size	.L.str57, 18

	.type	.L.str58,@object        # @.str58
.L.str58:
	.asciz	 "Unmatched ( or \\("
	.size	.L.str58, 18

	.type	.L.str59,@object        # @.str59
.L.str59:
	.asciz	 "Unmatched \\{"
	.size	.L.str59, 13

	.type	.L.str60,@object        # @.str60
.L.str60:
	.asciz	 "Invalid content of \\{\\}"
	.size	.L.str60, 24

	.type	.L.str61,@object        # @.str61
.L.str61:
	.asciz	 "Invalid range end"
	.size	.L.str61, 18

	.type	.L.str62,@object        # @.str62
.L.str62:
	.asciz	 "Memory exhausted"
	.size	.L.str62, 17

	.type	.L.str63,@object        # @.str63
.L.str63:
	.asciz	 "Invalid preceding regular expression"
	.size	.L.str63, 37

	.type	.L.str64,@object        # @.str64
.L.str64:
	.asciz	 "Premature end of regular expression"
	.size	.L.str64, 36

	.type	.L.str65,@object        # @.str65
.L.str65:
	.asciz	 "Regular expression too big"
	.size	.L.str65, 27

	.type	.L.str66,@object        # @.str66
.L.str66:
	.asciz	 "Unmatched ) or \\)"
	.size	.L.str66, 18

	.type	.L.str67,@object        # @.str67
.L.str67:
	.asciz	 "alnum"
	.size	.L.str67, 6

	.type	.L.str68,@object        # @.str68
.L.str68:
	.asciz	 "alpha"
	.size	.L.str68, 6

	.type	.L.str69,@object        # @.str69
.L.str69:
	.asciz	 "blank"
	.size	.L.str69, 6

	.type	.L.str70,@object        # @.str70
.L.str70:
	.asciz	 "cntrl"
	.size	.L.str70, 6

	.type	.L.str71,@object        # @.str71
.L.str71:
	.asciz	 "digit"
	.size	.L.str71, 6

	.type	.L.str72,@object        # @.str72
.L.str72:
	.asciz	 "graph"
	.size	.L.str72, 6

	.type	.L.str73,@object        # @.str73
.L.str73:
	.asciz	 "lower"
	.size	.L.str73, 6

	.type	.L.str74,@object        # @.str74
.L.str74:
	.asciz	 "print"
	.size	.L.str74, 6

	.type	.L.str75,@object        # @.str75
.L.str75:
	.asciz	 "punct"
	.size	.L.str75, 6

	.type	.L.str76,@object        # @.str76
.L.str76:
	.asciz	 "space"
	.size	.L.str76, 6

	.type	.L.str77,@object        # @.str77
.L.str77:
	.asciz	 "upper"
	.size	.L.str77, 6

	.type	.L.str78,@object        # @.str78
.L.str78:
	.asciz	 "xdigit"
	.size	.L.str78, 7

	.type	init_syntax_once.done,@object # @init_syntax_once.done
	.local	init_syntax_once.done
	.comm	init_syntax_once.done,4,4
	.type	.L.str79,@object        # @.str79
.L.str79:
	.asciz	 "expression"
	.size	.L.str79, 11

	.type	.L.str80,@object        # @.str80
.L.str80:
	.asciz	 "file"
	.size	.L.str80, 5

	.type	.L.str81,@object        # @.str81
.L.str81:
	.asciz	 "quiet"
	.size	.L.str81, 6

	.type	.L.str82,@object        # @.str82
.L.str82:
	.asciz	 "silent"
	.size	.L.str82, 7

	.type	.L.str83,@object        # @.str83
.L.str83:
	.asciz	 "version"
	.size	.L.str83, 8

	.type	.L.str84,@object        # @.str84
.L.str84:
	.asciz	 "help"
	.size	.L.str84, 5

	.type	longopts,@object        # @longopts
	.data
	.align	16
longopts:
	.quad	.L.str79
	.long	1                       # 0x1
	.zero	4
	.quad	0
	.long	101                     # 0x65
	.zero	4
	.quad	.L.str80
	.long	1                       # 0x1
	.zero	4
	.quad	0
	.long	102                     # 0x66
	.zero	4
	.quad	.L.str81
	.long	0                       # 0x0
	.zero	4
	.quad	0
	.long	110                     # 0x6e
	.zero	4
	.quad	.L.str82
	.long	0                       # 0x0
	.zero	4
	.quad	0
	.long	110                     # 0x6e
	.zero	4
	.quad	.L.str83
	.long	0                       # 0x0
	.zero	4
	.quad	0
	.long	86                      # 0x56
	.zero	4
	.quad	.L.str84
	.long	0                       # 0x0
	.zero	4
	.quad	0
	.long	104                     # 0x68
	.zero	4
	.quad	0
	.long	0                       # 0x0
	.zero	4
	.quad	0
	.long	0                       # 0x0
	.zero	4
	.size	longopts, 224


	.section	".note.GNU-stack","",@progbits
