BITS	64

	section	.text
	global	_ft_countwords

_ft_countwords:
	xor		rax, rax
	cmp		sil, 0
	je		_fail
	cmp		rdi, 0
	je		_fail

_loop_space:
	cmp		byte [rdi], 0
	je		_ret
	cmp		byte [rdi], sil
	jne		_count
	inc		rdi
	jmp		_loop_space

_count:
	inc		rax
	jmp		_loop_letters

_loop_letters:
	cmp		byte [rdi], 0
	je		_ret
	cmp		byte [rdi], sil
	je		_loop_space
	inc		rdi
	jmp		_loop_letters

_ret:
	ret

_fail:
	sub		rax, 1
	ret
