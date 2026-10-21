
%include "../LIB/pc_iox.inc"

%define N 5

section .bss
    vector1 resb N
    vector2 resb N
    producto_escalar resd 1

section .data
    mensaje_vector1 db 10, "Captura del vector 1", 10, 0
    mensaje_vector2 db 10, "Captura del vector 2", 10, 0
    mensaje_captura db "Introduce un numero del 0 al 9: ", 0
    mensaje_desplegar1 db 10, "Vector 1: ", 0
    mensaje_desplegar2 db 10, "Vector 2: ", 0
    mensaje_suma db 10, "Suma de los vectores: ", 0
    mensaje_producto db 10, "Producto escalar: ", 0
    mensaje_espacio db " ", 0

section .text
global _start

; inciso a)

CapturarVector:
    push eax
    push ecx
    push edx
    push esi

    mov edx, ebx

CapturarElemento:
    cmp ecx, 0
    je TerminarCaptura

    push ecx
    mov esi, mensaje_captura
    call ImprimirCadena
    call LeerDigito
    pop ecx

    mov [edx], al
    inc edx
    dec ecx
    jmp CapturarElemento

TerminarCaptura:
    pop esi
    pop edx
    pop ecx
    pop eax
    ret

; inciso b)

DesplegarVector:
    push eax
    push ecx
    push edx

    mov edx, ebx

DesplegarElemento:
    cmp ecx, 0
    je TerminarDespliegue

    mov al, [edx]
    call ImprimirByteHexadecimal

    push ecx
    push edx
    mov esi, mensaje_espacio
    call ImprimirCadena
    pop edx
    pop ecx

    inc edx
    dec ecx
    jmp DesplegarElemento

TerminarDespliegue:
    call SaltoLinea

    pop edx
    pop ecx
    pop eax
    ret

; inciso c)

SumarVectores:
    push eax
    push ecx
    push edx
    push esi

    mov esi, edx

SumarElemento:
    cmp ecx, 0
    je TerminarSuma

    mov al, [ebx]
    add al, [esi]
    mov [ebx], al

    inc ebx
    inc esi
    dec ecx
    jmp SumarElemento

TerminarSuma:
    pop esi
    pop edx
    pop ecx
    pop eax
    ret

; inciso d)

ProductoEscalar:
    push ebx
    push ecx
    push edx
    push esi
    push edi

    mov esi, ebx
    mov edi, edx
    xor eax, eax

CalcularProducto:
    cmp ecx, 0
    je TerminarProducto

    movzx edx, byte [esi]
    movzx ebx, byte [edi]
    imul edx, ebx
    add eax, edx

    inc esi
    inc edi
    dec ecx
    jmp CalcularProducto

TerminarProducto:
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret

ImprimirCadena:
    push eax
    push esi

ImprimirCaracter:
    lodsb
    cmp al, 0
    je TerminarCadena
    call putchar
    jmp ImprimirCaracter

TerminarCadena:
    pop esi
    pop eax
    ret

LeerDigito:
LeerCaracter:
    call getche
    cmp al, '0'
    jb LeerCaracter
    cmp al, '9'
    ja LeerCaracter
    sub al, '0'
    ret

ImprimirByteHexadecimal:
    push eax
    push ebx

    mov bl, al
    shr al, 4
    call ImprimirDigitoHexadecimal

    mov al, bl
    and al, 0Fh
    call ImprimirDigitoHexadecimal

    pop ebx
    pop eax
    ret

ImprimirDigitoHexadecimal:
    cmp al, 9
    jbe ImprimirDigitoNumerico
    add al, 7

ImprimirDigitoNumerico:
    add al, '0'
    call putchar
    ret

ImprimirNumeroHexadecimal:
    push eax
    push ebx
    push ecx

    mov ebx, eax
    mov ecx, 8

ImprimirDigitoNumero:
    rol ebx, 4
    mov eax, ebx
    and eax, 0Fh
    call ImprimirDigitoHexadecimal
    loop ImprimirDigitoNumero

    pop ecx
    pop ebx
    pop eax
    ret

SaltoLinea:
    push eax
    mov al, 10
    call putchar
    pop eax
    ret

; Programa principal

_start:
    mov esi, mensaje_vector1
    call ImprimirCadena

    mov ebx, vector1
    mov ecx, N
    call CapturarVector

    mov esi, mensaje_desplegar1
    call ImprimirCadena

    mov ebx, vector1
    mov ecx, N
    call DesplegarVector

    mov esi, mensaje_vector2
    call ImprimirCadena

    mov ebx, vector2
    mov ecx, N
    call CapturarVector

    mov esi, mensaje_desplegar2
    call ImprimirCadena

    mov ebx, vector2
    mov ecx, N
    call DesplegarVector

    mov ebx, vector1
    mov edx, vector2
    mov ecx, N
    call ProductoEscalar

    mov [producto_escalar], eax

    mov ebx, vector1
    mov edx, vector2
    mov ecx, N
    call SumarVectores

    mov esi, mensaje_suma
    call ImprimirCadena

    mov ebx, vector1
    mov ecx, N
    call DesplegarVector

    mov esi, mensaje_producto
    call ImprimirCadena

    mov eax, [producto_escalar]
    call ImprimirNumeroHexadecimal

    call SaltoLinea

    mov eax, 1
    int 0x80
