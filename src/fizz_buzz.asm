global	_main
global	start


section	.text

start:
	mov	rcx, 1
	jmp	fizz_buzz_branch

fizz_buzz_branch:
	mov	rdx, 0
	mov	rax, rcx

	mov	r15, 15
	div	r15
	cmp	rdx, 0
	jne	fizz_branch

	mov	rax, 0x02000004 ; syscall: write
	mov	rdi, 0x01
	mov	rsi, fizz_buzz ; val
	mov	rdx, 0x0a ; len

	push	rcx
	syscall
	pop	rcx

	inc	rcx
	cmp	rcx, 16
	jl	fizz_buzz_branch

	jmp exit


fizz_branch:
	mov	rdx, 0
	mov	rax, rcx

	mov	r15, 3
	div	r15
	cmp	rdx, 0
	jne	buzz_branch

	mov	rax, 0x02000004 ; syscall: write
	mov	rdi, 0x01
	mov	rsi, fizz ; val
	mov	rdx, 0x05 ; len

	push	rcx
	syscall
	pop	rcx
	
	inc	rcx
	cmp	rcx, 16
	jl	fizz_buzz_branch

	jmp exit

buzz_branch:
	mov	rdx, 0
	mov	rax, rcx

	mov	r15, 5
	div	r15
	cmp	rdx, 0
	jne	else_branch

	mov	rax, 0x02000004 ; syscall: write
	mov	rdi, 0x01
	mov	rsi, buzz ; val
	mov	rdx, 0x05 ; len

	push	rcx
	syscall
	pop	rcx

	inc	rcx
	cmp	rcx, 16
	jl	fizz_buzz_branch

	jmp exit

else_branch:
	mov	rax, 0x02000004 ; syscall: write
	mov	rdi, 0x01
	mov	rsi, new_line ; val
	mov	rdx, 0x01 ; len
	push	rcx
	syscall
	pop	rcx


	inc	rcx
	cmp	rcx, 16
	jl	fizz_buzz_branch

	jmp exit

exit:
	mov	rax, 0x02000001 ; syscall: exit
	xor	rdi, rdi
	syscall
	

section	.data

fizz:
	db	"fizz", 0x0a

buzz:
	db	"buzz", 0x0a

fizz_buzz:
	db	"fizz_buzz", 0x0a

new_line:
	db	0x0a
