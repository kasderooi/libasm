BITS	64

extern	_ft_countwords
extern	_ft_strlen
extern	_ft_strncpy
extern	_malloc
extern	_free

	section	.text
	global	_ft_split

_ft_split:
	xor		rax, rax		; clean rax
	cmp		rdi, 0			; if no str return immediately
	je		_fail
	push	rdi				; save the str
	push	rsi				; save the splitting char
	call	_ft_countwords
	add		rax, 1			; add 1 byte for 0 terminating char
	shl		rax, 3			; sizeof char*
	mov		rdi, rax
	call	_malloc
	cmp		rax, 0
	je		_fail
	mov		-24[rbp], rax	; save addres of malloc
	pop		rsi
	pop		rdi
	push	r12				; save these to use
	push	r13				; save these to use
	push	r14				; save these to use
	push	r15				; save these to use
	push	rbx				; save these to use
	xor		rbx, rbx
	mov		r15, rsi		; r15 is now the split char
	mov		r12, rdi		; r12 is point in string

_loop_space:
	cmp		byte [r12], 0		; if end of string return
	je		_ret
	cmp		byte [r12], r15b	; if split char prep next word
	jne		_prep_letter_count
	inc		r12					; try the next char
	jmp		_loop_space

_prep_letter_count:
	mov		r14, 0				; clean letter counter
	mov		r10, r12
	push	r10					; save start position of word
	jmp		_loop_letters

_loop_letters:
	cmp		byte [r12], 0		; if this is true, last word has found
	je		_make_substr
	cmp		byte [r12], r15b	; if this is true, word has found
	je		_make_substr
	inc		r12					; next char
	inc		r14					; letter counter
	jmp		_loop_letters

_make_substr:
	mov		rdi, r14			; amount to malloc
	add		rdi, 1				; +1 for 0 terminating char
	call	_malloc
	cmp		rax, 0
	je		_fail_free2
	pop		r10					; get the start pos of string
	mov		rdi, rax			; set dest
	mov		rsi, r10			; set source
	mov		rdx, r14			; set amount
	call	_ft_strncpy			; copy str amount of r14 into malloc memory
	mov		byte [rax + r14], 0	; set 0 terminating char
	mov		r13, -24[rbp]
	mov		rbx[r13], rax		; move new str address into char**
	add		rbx, 8
	jmp		_loop_space

_ret:
	mov		r13, -24[rbp]
	mov		word rbx[r13], 0	; 0 terminate last position of char** as to signal end of array
	pop		rbx					; restore value
	pop		r15					; restore value
	pop		r14					; restore value
	pop		r13					; restore value
	pop		r12					; restore value
	mov		rax, -24[rbp]		; return the adress to the first place of the array
	ret

_fail_free2:
	sub		rbx, 8
	cmp		rbx, 0
	jl		_fail_free1
	mov		r13, -24[rbp]
	mov		rdi, rbx[r13]
	call	_free
	jmp		_fail_free2

_fail_free1:
	mov		rdi, -24[rbp]
	call	_free

_fail:
	ret
