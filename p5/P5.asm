%include "pc_iox.inc"

section	.text

	global _start       ;must be declared for using gcc

_start:                     ;tell linker entry point

	mov eax,0x1234ABCD
    call pHex_dw

	mov al,10	; cambio de linea
	call putchar

    mov ebx , 0x5C4B2A60; guarda el valor de ebx
    add ebx , 0x02207497

    mov eax, ebx
    call pHex_dw
    
    mov al,10	; cambio de linea
	call putchar

    push bx
    pop ax
    call pHex_w ;al quitar la de le indico que lo que imprimira es de 16 bits

    mov al,10	; cambio de linea
	call putchar
    

    mov eax, 1
    int 0x80