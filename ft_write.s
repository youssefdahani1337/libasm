[BITS 64]

default rel


	section .text
	global ft_write
extern __errno_location

ft_write:

	push rbp
	mov rbp, rsp

	mov rax, 1 ; the number of write syscall
	syscall

	cmp rax, 0
	jl .error

	pop rbp
	ret
.error:
	neg rax
	push rax

	call __errno_location wrt ..plt ; call the __errno_location to get the address of the erno
	pop rdi ;get the return of the write syscall
	mov [rax], edi
	mov rax, -1
	pop rbp
	ret
