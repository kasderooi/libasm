BITS	64

extern	___error
	section	.text
	global	_ft_write

_ft_write:
	mov		rax, 0x2000004
	syscall
	jc		_error
	jmp		_ret

_error:
	push	rax
	call	___error
	pop		qword [rax]
	mov		rax, -1

_ret:
	ret
