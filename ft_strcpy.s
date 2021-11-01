BITS	64

	section	.text
	global	_ft_strcpy

_ft_strcpy:
	mov		rax, 0
	push	rdi

_loop:
	mov		dl, byte [rsi]
	mov		byte [rdi], dl
	cmp		byte [rsi], 0x0
	je		_ret
	inc		rdi
	inc		rsi
	jmp		_loop

_ret:
	pop		rdi
	mov		rax, rdi
	ret
