%define TAM_TRIANGULO 4         
%define N_DATOS       10

extern getche
extern puts
extern putchar

section .data
; ---- inciso a)
msg_a_pide  db "a) Escribe una letra minuscula (a..z): ", 0
msg_a_menor db "El caracter es MENOR a 'm'.", 10, 0
msg_a_noes  db "El caracter NO es menor a 'm' (es 'm' o mayor).", 10, 0
msg_a_inv   db "Caracter fuera del rango 'a'..'z'.", 10, 0
; ---- inciso b)
msg_b_pide  db "b) Escribe un caracter ('0'..'9' o 'A'..'Z'): ", 0
msg_b_num   db "El caracter es un NUMERO.", 10, 0
msg_b_let   db "El caracter es una LETRA.", 10, 0
msg_b_inv   db "Caracter fuera de los rangos '0'..'9' y 'A'..'Z'.", 10, 0
; ---- inciso c)
msg_c       db "c) Triangulo de asteriscos (CX = ", '0' + TAM_TRIANGULO % 10, "):", 10, 0
; ---- inciso d)
msg_d_pide  db "d) Escribe 10 caracteres: ", 0
msg_d_datos db "Datos capturados", 10, 0

section .bss
arreglo resb N_DATOS             

section .text
global _start

_start:
; a) Leer 'a'..'z' e indicar si es menor a 'm'
        mov  edx, msg_a_pide
        call puts
        call getche              
        call salto_linea

        cmp  al, 'a'
        jb   a_invalido          
        cmp  al, 'z'
        ja   a_invalido          
        cmp  al, 'm'
        jb   a_menor             
        mov  edx, msg_a_noes
        jmp  a_fin
a_menor:
        mov  edx, msg_a_menor
        jmp  a_fin
a_invalido:
        mov  edx, msg_a_inv
a_fin:
        call puts
        call salto_linea

; b) Leer '0'..'9' o 'A'..'Z' e indicar si es letra o numero
        mov  edx, msg_b_pide
        call puts
        call getche
        call salto_linea

        cmp  al, '0'
        jb   b_invalido          
        cmp  al, '9'
        jbe  b_numero            
        cmp  al, 'A'
        jb   b_invalido         
        cmp  al, 'Z'
        jbe  b_letra            
b_invalido:
        mov  edx, msg_b_inv
        jmp  b_fin
b_numero:
        mov  edx, msg_b_num
        jmp  b_fin
b_letra:
        mov  edx, msg_b_let
b_fin:
        call puts
        call salto_linea

; c) Triangulo de asteriscos, tamano = CX (0..10)

        mov  edx, msg_c
        call puts

        xor  ecx, ecx            
        mov  cx, TAM_TRIANGULO   
        movzx ebx, cx            
        cmp  ebx, 0
        je   c_fin               
        cmp  ebx, 10
        ja   c_fin               

        mov  esi, 1              
c_sube:                          
        call fila_asteriscos
        inc  esi
        cmp  esi, ebx
        jbe  c_sube

        mov  esi, ebx
        dec  esi                 
c_baja:
        cmp  esi, 0
        je   c_fin
        call fila_asteriscos
        dec  esi
        jmp  c_baja
c_fin:
        call salto_linea


; d) Capturar 10 caracteres en un arreglo y mostrarlos en columna
        mov  edx, msg_d_pide
        call puts

        mov  esi, 0              ; indice
d_captura:
        call getche              ; AL = caracter (con eco)
        mov  [arreglo + esi], al
        inc  esi
        cmp  esi, N_DATOS
        jb   d_captura
        call salto_linea

        mov  edx, msg_d_datos
        call puts

        mov  esi, 0
d_muestra:
        mov  al, [arreglo + esi] ; lee uno por uno
        call putchar
        call salto_linea         
        inc  esi
        cmp  esi, N_DATOS
        jb   d_muestra

; ---- salir (sys_exit)
        mov  eax, 1
        xor  ebx, ebx
        int  0x80


fila_asteriscos:
        push ecx
        push eax
        mov  ecx, esi
.sig:
        mov  al, '*'
        call putchar
        loop .sig
        mov  al, 10
        call putchar
        pop  eax
        pop  ecx
        ret


salto_linea:
        push eax
        mov  al, 10
        call putchar
        pop  eax
        ret