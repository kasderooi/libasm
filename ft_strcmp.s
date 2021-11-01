BITS	64

	section	.text
	global	_ft_strcmp

_ft_strcmp:
	mov		rax, 0
	mov		rcx, 0

_loop:
	movzx	rax, byte [rdi]
	movzx	rcx, byte [rsi]
	sub		rax, rcx
	jnz		_ret
	cmp		byte [rdi], 0x0
	je		_ret
	inc		rdi
	inc		rsi
	jmp		_loop

_ret:
	ret
