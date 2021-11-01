BITS	64

extern		_malloc
extern		_ft_strcpy
extern		_ft_strlen

	section	.text
	global	_ft_strdup

_ft_strdup:
	mov		rsi, rdi
	push	rsi
	call	_ft_strlen
	mov		rdi, rax
	call	_malloc
	mov		rdi, rax
	pop		rsi
	call	_ft_strcpy
	ret
