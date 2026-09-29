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
    mov cx, 0x0f48
    

    ;final del programa
    mov eax, 1
    int 0x80
