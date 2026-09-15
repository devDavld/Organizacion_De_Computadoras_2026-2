%include "../LIB/pc_io.inc"

section .text
    global _start

_start:

    ; Mostrar cadena original
    mov edx, msg
    call puts

    ; Direccionamiento indirecto
    mov ebx, msg
    add ebx, 23
    mov byte [ebx], 'X'

    ; Mostrar cadena modificada
    mov edx, msg
    call puts

    mov eax, 1
    int 0x80


section .data

msg db 'abcdefghijklmnopqrstuvwxyz0123456789', 0xa, 0