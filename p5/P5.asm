%include "pc_iox.inc"

section	.text

	global _start       ;must be declared for using gcc

_start:                     ;tell linker entry point
    
	mov eax,0x1234ABCD
    call pHex_dw

	mov al,10	; cambio de linea
	call putchar
    ;Inciso a)
    mov ebx , 0x5C4B2A60; guarda el valor de ebx
    add ebx , 0x02207497

    mov eax, ebx
    call pHex_dw
    
    mov al,10	; cambio de linea
	call putchar

    ;Inciso b)
    push bx
    pop ax
    call pHex_w ;al quitar la ¨d¨ le indico que lo que imprimira es de 16 bits

    mov al,10	; cambio de linea
	call putchar

    ;Inciso c)
    mov al,bl
    mov cl, 8
    mul cl
    mov [N], ax      
    mov ax, [N]    
    call pHex_w      

    mov al, 10
    call putchar
    
    ;Inciso d)
    mov ax, [N] 
    inc ax
    call pHex_w      

    mov al, 10
    call putchar

    ;Inciso e)
    mov bl,bx
    div bl
    call pHex_w 


    ;Final del programa
    mov eax, 1
    int 0x80

section .data
N dw 0  