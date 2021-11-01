BITS	64

	section	.text
	global	_ft_strlen

_ft_strlen:
	push	rdi
	push	rcx
	xor		rcx, rcx

_loop:
	cmp		byte [rdi], 0x0
	jz		_ret
	inc		rcx
	inc		rdi
	jmp		_loop

_ret:
	mov		rax, rcx
	pop		rdi
	pop		rcx
	ret
