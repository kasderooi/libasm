BITS	64

extern		_ft_strlen
extern		_ft_strncpy
extern		_malloc

	section .text
	global	_ft_substr

_ft_substr:
	xor		rax, rax
	cmp		rdi, 0
	je		_fail		; if no str return 0
	push	rdi
	call	_ft_strlen
	pop		rdi
	mov		r8, rax		; len of str
	mov		r9, rsi		; start of copy
	cmp		r8, r9		; if len is smaller than start
	jl		_zero		; make amount to copy 0
	add		r9, rdx		; make total length
	cmp		r8, r9		; if total is bigger than strlen
	jl		_less
	mov		r9, rdx
	jmp		_work

_zero:					; if strlen is smaller than start, return empty str
	xor		rdi, rdi
	xor		rax, rax
	add		rdi, 1
	call	_malloc
	mov		byte [rax], 0
	ret

_less:					; if start + len < strlen, malloc strlen - start
	mov		r9, r8
	sub		r9, rsi

_work:
	push	rdi
	push	rsi
	push	rdx
	mov		rdi, r9
	push	r9
	add		rdi, 1		; amount to copy + 1
	call	_malloc
	pop		r9
	pop		rdx
	pop		rsi
	pop		rdi
	mov		r10, rsi	; move start position to r10
	mov		rsi, rdi	; move str into source register
	add		rsi, r10	; move to startposition in str
	mov		rdi, rax	; move allocated memory in destination register
	mov		rdx, r9		; move amount to copy into 3rd register
	push	r9
	call	_ft_strncpy
	pop		r9
	jmp		_ret

_fail:
	xor		rax, rax
	ret

_ret:
	mov		byte [rax + r9], 0
	ret
