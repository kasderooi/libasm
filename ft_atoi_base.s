BITS	64

extern		_ft_strlen
default rel
	section	.text
	global	_ft_atoi_base

_ft_atoi_base:
	mov		rax, 0x0
	mov		rcx, 0x0
	push	rdi
	mov		rdi, rsi
	call	_ft_strlen
	mov		r10, rax
	pop		rdi
	mov		rax, 0x0

_loop:
	cmp		byte [rdi], 0x0
	je		_ret
	movzx	r8, byte [rdi]
	mov		rcx, 0x0
	push	rsi

_strchr:
	movzx	r9, byte [rsi]
	inc		rsi
	cmp		r8, r9
	je		_translate
	cmp		byte [rsi], 0x0
	je		_ret
	inc		rcx
	jmp		_strchr

_translate:
	mul		r10
	add		rax, rcx
	pop		rsi
	inc		rdi
	jmp		_loop

_ret:
	ret
