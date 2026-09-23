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
    push bx              ;guarda BX en la pila

    mov ax, bx
    call pHex_w          ;imprime BX en 16 bits

    mov al,10
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
    inc word [N]
    mov ax, [N]
    call pHex_w

    mov al, 10
    call putchar

    ;Inciso e)
    mov ax, bx
    mov cl, 0xFF
    div cl              

    mov dl, ah          ; guardamos residuo
    mov dh, al          ; guardamos cociente

    mov al, dh
    call pHex_b

    mov al, 10
    call putchar

    mov al, dl
    call pHex_b

    mov al, 10
    call putchar

    ;Inciso f)
    mov ax, [N]
    mov dh, 0
    add ax, dx

    mov [N], ax       

    call pHex_w

    mov al, 10
    call putchar

    ;Inciso g)
    dec word [N]      

    pushfd

    mov ax, [N]
    call pHex_w

    mov al, 10
    call putchar

    pop eax
    call pHex_dw

    mov al, 10
    call putchar

    ;Inciso h)
    pop ax
    call pHex_w

    mov al, 10
    call putchar

    ;Final del programa
    mov eax, 1
    int 0x80

section .data
N dw 0  