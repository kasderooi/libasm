BITS	64

	section	.text
	global	_ft_strncpy

_ft_strncpy:
	mov		rax, 0
	mov		rcx, 0
	mov		r8, rdx
	push	rdi
	jmp		_loop

_loop:
	cmp		rcx, r8
	je		_ret
	mov		dl, byte [rsi]
	mov		byte [rdi], dl
	cmp		byte [rsi], 0x0
	je		_ret
	inc		rdi
	inc		rsi
	inc		rcx
	jmp		_loop

_ret:
	pop		rdi
	mov		rax, rdi
	ret
