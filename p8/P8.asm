%include "../LIB/pc_iox.inc"
section .data 
    msg_a db "Inserta el tamaño del vector",0
    msg_ab db "Inserta el valor del siguiente vector en un rango del 0 al 10 "
section .bss
    N.equ resb 10 
    N resb 1
section	.text  
    global _start
    
_start:
    ;Inciso a 
    
    mov ebx,msg_a
    call putchar
    call getche
    mov N.equ,eax  
    call Capturavector
    


    Capturavector, msg_ab
    mov ebx,msg_a
    call putchar
    call getche
    for mov N.equ,eax  
        N.equ
        loop eb
    call Capturavector


    ;inciso b)
    d_muestra:
        mov  al, [N.equ + esi] ; lee uno por uno
            call putchar
            call salto_linea         
            inc  esi
            cmp  esi, N
            jb   d_muestra

    salto_linea:
        push eax
        mov  al, 10
        call putchar
        pop  eax
        ret