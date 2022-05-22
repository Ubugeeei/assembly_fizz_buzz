global	_main
global	start


section	.text

start:
	mov	rax, 0x02000004
	mov	rdi, 0x00000001
	mov	rsi, message
	mov	rdx, 0x0000000d
	syscall
	mov	rax, 0x02000001
	xor	rdi, rdi
	syscall

section	.data

message:
	db	"Hello, World", 10
