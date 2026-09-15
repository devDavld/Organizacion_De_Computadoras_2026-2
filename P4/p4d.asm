%include "../LIB/pc_io.inc"

section .text
    global _start

_start:

    ; Mostrar cadena original
    mov edx, msg
    call puts

    ; Direccionamiento base mas indice
    mov ebx, msg
    mov esi, 25
    mov byte [ebx + esi], 'Z'

    ; Mostrar cadena modificada
    mov edx, msg
    call puts

    mov eax, 1
    int 0x80


section .data

msg db 'abcdefghijklmnopqrstuvwxyz0123456789', 0xa, 0