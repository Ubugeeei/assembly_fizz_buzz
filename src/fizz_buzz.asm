global	_main
global	start


section	.text

start:
	mov	rcx, 0
	jmp	fizz_buzz_loop


exit:
	mov	rax, 0x02000001 ; syscall: exit
	xor	rdi, rdi
	syscall
	

fizz_buzz_loop:
	mov	rax, 0x02000004 ; syscall: write
	mov	rdi, 0x01
	mov	rsi, fizz; val
	mov	rdx, 0x05 ; len
	push rcx
	syscall


	; TODO fizz_buzz proccess


	pop	rcx
	inc	rcx
	cmp	rcx, 10
	jl	fizz_buzz_loop

	jmp	exit

print_fizz:
	mov	rax, 0x02000004 ; syscall: write
	mov	rdi, 0x01
	mov	rsi, fizz ; val
	mov	rdx, 0x05 ; len
	syscall
	jmp	exit

print_buzz:
	mov	rax, 0x02000004 ; syscall: write
	mov	rdi, 0x01
	mov	rsi, buzz ; val
	mov	rdx, 0x05 ; len
	syscall
	jmp	exit

print_fizz_buzz:
	mov	rax, 0x02000004 ; syscall: write
	mov	rdi, 0x01
	mov	rsi, fizz_buzz ; val
	mov	rdx, 0x0a ; len
	syscall
	jmp	exit

section	.data

fizz:
	db	"fizz", 0x0a

buzz:
	db	"buzz", 0x0a

fizz_buzz:
	db	"fizz_buzz", 0x0a
