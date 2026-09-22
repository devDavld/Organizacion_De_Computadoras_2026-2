%include "../LIB/pc_io.inc"

section .text
    global _start

_start:

    ; Mostrar cadena original
    mov edx, msg
    call puts

    ; Relativo a base mas indice con indice escalado
    mov ebx, msg
    mov esi, 4
    mov byte [ebx + esi*4 + 3], '%'

    ; Mostrar cadena modificada
    mov edx, msg
    call puts

    mov eax, 1
    int 0x80


section .data

msg db 'abcdefghijklmnopqrstuvwxyz0123456789', 0xa, 0