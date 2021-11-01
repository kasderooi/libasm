BITS 64

extern	_ft_putchar

	section	.text
	global	_ft_putnbr

_ft_putnbr:
	xor		rax, rax
	cmp		rdi, 2147483647
	jbe		_loop

_put_dash:
	cdq
	sub		eax, edi
	mov		edi, eax
	push	rdi
	mov		rdi, 0
	mov 	rdi, '-'
	call	_ft_putchar
	xor		rdi, rdi
	pop		rdi
	jmp		_loop

_loop:
	cmp		rdi, 10
	jnae	_put_dig
	mov		rax, 0
	mov		rax, rdi
	mov		rbx, 10
	mov		rdx, 0
	div		rbx
	mov		rdi, 0
	push	rdx
	mov		rdi, rax
	call	_ft_putnbr
	pop		rdx
	mov		rdi, rdx
	jmp		_put_dig

_put_dig:
	add		rdi, 48
	call	_ft_putchar
	ret
