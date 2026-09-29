%include "../LIB/pc_iox.inc"

section .text
    global _start
    extern pBin_dw
_start:

    ;Inciso a)
    mov eax, 0x22446688
    ror eax, 4
    call pHex_dw
    mov al, 10
    call putchar

    ;inciso b)
    mov cx, 0x3F48
    shl cx, 3
    mov ax, cx
    call pHex_w
    mov al, 10
    call putchar

    ;inciso c)
    mov esi, 0x20D685F3 
    xor esi, 0x40042021
    mov eax, esi
    call pHex_dw
    mov al, 10
    call putchar
    
    ;inciso d)
    push esi
    ;inciso e)
    mov ch, 0xA7
    or ch, 0x48
    mov al, ch
    call pHex_b
    mov al, 10
    call putchar

    ;inciso f)
    mov bp, 0x67DA
    and bp, 0xBBAD
    mov ax, bp
    call pHex_w
    mov al, 10
    call putchar

    ;inciso g)
    shr bp, 3

    mov ax, bp
    call pHex_w
    mov al, 10
    call putchar
    
    ;inciso h)
    ;inciso i)
    ;inciso j)
    ;inciso k)

    ;final del programa
    mov eax, 1
    int 0x80
