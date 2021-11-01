BITS	64

extern	_ft_write
extern	_ft_strlen

	section	.text
	global	_ft_putstr

_ft_putstr:
	mov		rax, 0x0
	push	rdx
	mov		rdx, 0x0
	push	rsi
	push	rdi
	call	_ft_strlen
	pop		rdi
	add 	rdx, rax
	mov		rsi, rdi
	mov		rdi, 1
	call	_ft_write
	pop		rdx
	pop		rsi
	ret
