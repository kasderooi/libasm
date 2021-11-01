BITS	64

extern		_ft_strlen
	section	.text
	global	_ft_strchr

_strchr:
	mov		rax, 0x0
	cmp		byte [rdi], 0x0
	je		_ret_NULL
	mov		al, byte[rsi]

_loop:
	cmp		byte [rdi], al
	je		_ret_ptr
	cmp		byte [rdi], 0x0
	je		_ret_NULL
	inc		rdi
	jmp		_loop

_ret_ptr:
	mov		rax, rdi
	ret

_ret_NULL:
	mov		rax, 0x0
	ret
