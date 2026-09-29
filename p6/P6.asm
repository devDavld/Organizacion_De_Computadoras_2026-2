%include "../LIB/pc_iox.inc"

section .text
    global _start

_start:
    ;Inciso a)
    mov eax, 0x22446688
    ror eax, 4

    call pHex_dw

    mov al, 10
    call putchar

    ;inciso b)
    mov cx, 0x3F48
    shl cx, 1
    mov ax, cx

    call pHex_w
    mov al, 10
    call putchar
    ;inciso c)
    mov esi, 0x20D685F3 
    
    ;inciso d)
    ;inciso e)
    ;inciso f)
    ;inciso g)
    ;inciso h)
    ;inciso i)
    ;inciso j)
    ;inciso k)
    push esi
    ;final del programa
    mov eax, 1
    int 0x80
