global	_main
global	start


section	.text

start:
	mov	rax, 0x02000004 ; syscall: write
	mov	rdi, 0x01
	mov	rsi, fizz ; val
	mov	rdx, 0xff ; len
	syscall
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
