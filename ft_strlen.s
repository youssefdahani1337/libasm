[BITS 64]

[default rel]


	section .text

	global ft_strlen

ft_strlen:

	xor rax, rax

	.loop:

	cmp BYTE  [rdi + rax], 0
	je .done
	inc rax
	jmp .loop

.done:
	ret

