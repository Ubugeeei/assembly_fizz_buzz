global	_main
global	start


section	.text

start:
	jmp	print_fizz_buzz


exit:
	mov	rax, 0x02000001 ; syscall: exit
	xor	rdi, rdi
	syscall
	

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
