BITS	64

extern	___error

	section	.text
	global	_ft_putchar

_ft_putchar:
	push	rdi
	lea		rsi, [rsp]
	mov		rdi, 1
	mov		rdx, 1
	mov		rax, 0x2000004
	syscall
	pop		rdi
	jc		_error
	jmp		_ret

_error:
	push	rax
	call	___error
	pop		qword [rax]
	mov		rax, -1

_ret:
	ret
