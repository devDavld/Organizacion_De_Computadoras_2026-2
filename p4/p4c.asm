%include "../LIB/pc_io.inc"

section .text
    global _start

_start:

    ; Mostrar cadena original
    mov edx, msg
    call puts

    ; Direccionamiento relativo a registro
    mov ebx, msg
    mov byte [ebx + 26], '@'

    ; Mostrar cadena modificada
    mov edx, msg
    call puts

    mov eax, 1
    int 0x80


section .data

msg db 'abcdefghijklmnopqrstuvwxyz0123456789', 0xa, 0