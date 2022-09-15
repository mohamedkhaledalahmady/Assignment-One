	.file	"main.c"
	.text
	.globl	Length
	.type	Length, @function
Length:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movb	$0, -1(%rbp)
	jmp	.L2
.L3:
	movzbl	-1(%rbp), %eax
	addl	$1, %eax
	movb	%al, -1(%rbp)
.L2:
	movzbl	-1(%rbp), %edx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L3
	movzbl	-1(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	Length, .-Length
	.globl	Compare
	.type	Compare, @function
Compare:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	Length
	movb	%al, -2(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	Length
	movb	%al, -1(%rbp)
	movb	$0, -5(%rbp)
	movzbl	-2(%rbp), %eax
	cmpb	-1(%rbp), %al
	ja	.L6
	movb	$0, -4(%rbp)
	jmp	.L7
.L12:
	movzbl	-4(%rbp), %edx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %edx
	movzbl	-4(%rbp), %ecx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	cmpb	%al, %dl
	je	.L8
	movzbl	-4(%rbp), %edx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %edx
	movzbl	-4(%rbp), %ecx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	cmpb	%al, %dl
	jbe	.L9
	movl	$1, %eax
	jmp	.L10
.L9:
	movl	$-1, %eax
.L10:
	movb	%al, -5(%rbp)
	jmp	.L11
.L8:
	movzbl	-4(%rbp), %eax
	addl	$1, %eax
	movb	%al, -4(%rbp)
.L7:
	movzbl	-4(%rbp), %eax
	cmpb	-1(%rbp), %al
	jb	.L12
	jmp	.L11
.L6:
	movb	$0, -3(%rbp)
	jmp	.L13
.L17:
	movzbl	-3(%rbp), %edx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %edx
	movzbl	-3(%rbp), %ecx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	cmpb	%al, %dl
	je	.L14
	movzbl	-3(%rbp), %edx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %edx
	movzbl	-3(%rbp), %ecx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	cmpb	%al, %dl
	jbe	.L15
	movl	$1, %eax
	jmp	.L16
.L15:
	movl	$-1, %eax
.L16:
	movb	%al, -5(%rbp)
	jmp	.L11
.L14:
	movzbl	-3(%rbp), %eax
	addl	$1, %eax
	movb	%al, -3(%rbp)
.L13:
	movzbl	-3(%rbp), %eax
	cmpb	-2(%rbp), %al
	jb	.L17
	nop
.L11:
	movzbl	-5(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	Compare, .-Compare
	.section	.rodata
.LC0:
	.string	"qawl ya sahibaa #$ "
.LC1:
	.string	"you said: %s\n"
	.align 8
.LC2:
	.string	"you didn't tell anything ya sahbii :(\n"
.LC3:
	.string	"exit"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
.L24:
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	stdin(%rip), %rdx
	leaq	-64(%rbp), %rax
	movl	$50, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	Length
	cmpb	$1, %al
	je	.L20
	leaq	-64(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L21
.L20:
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L21:
	leaq	-64(%rbp), %rax
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	call	Compare
	testb	%al, %al
	jne	.L28
	jmp	.L24
.L28:
	nop
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L26
	call	__stack_chk_fail@PLT
.L26:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
