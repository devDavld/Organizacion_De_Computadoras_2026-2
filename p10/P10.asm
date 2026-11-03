global pBin8b
global pBin16b
global pBin32b
global pBin64b

section .text
pBin8b: push ebp
    mov ebp, esp
    movzx edx, byte [ebp + 8]
    mov ecx, 7

ciclo8:
    bt edx, ecx
    jnc cero8
    mov al, '1'
    call my_putchar
    jmp sig8

cero8:
    mov al, '0'
    call my_putchar

sig8:
    dec ecx
    cmp ecx, -1
    jne ciclo8

    pop ebp
    ret

pBin16b:
    push ebp
    mov ebp, esp
    movzx edx, word[ebp+8]
    mov ecx, 15
ciclo16:
    bt edx, ecx
    jnc cero16
    mov al, '1'
    call my_putchar
    jmp sig16

cero16:
    mov al, '0'
    call my_putchar

sig16:
    dec ecx
    cmp ecx, -1
    jne ciclo16

    pop ebp
    ret

pBin32b:
    push ebp
    mov ebp, esp
    mov edx, [ebp+8]
    mov ecx, 31
ciclo32:
    bt edx, ecx
    jnc cero32
    mov al, '1'
    call my_putchar
    jmp sig32

cero32:
    mov al, '0'
    call my_putchar

sig32:
    dec ecx
    cmp ecx, -1
    jne ciclo32

    pop ebp
    ret

pBin64b:
    push ebp
    mov ebp, esp

    ; Parte alta de 32 bits
    mov edx, [ebp + 12]
    mov ecx, 31

ciclo64a:
    bt edx, ecx
    jnc cero64a
    mov al, '1'
    call my_putchar
    jmp sig64a

cero64a:
    mov al, '0'
    call my_putchar

sig64a:
    dec ecx
    cmp ecx, -1
    jne ciclo64a

    ; Parte baja de 32 bits
    mov edx, [ebp + 8]
    mov ecx, 31

ciclo64b:
    bt edx, ecx
    jnc cero64b
    mov al, '1'
    call my_putchar
    jmp sig64b

cero64b:
    mov al, '0'
    call my_putchar

sig64b:
    dec ecx
    cmp ecx, -1
    jne ciclo64b

    pop ebp
    ret




my_putchar: pushad                 ; salvar todos los registros
                        push eax              ; salvar EAX -- meter el caracter a la pila
                        mov eax,4            ; seleccionar el tipo llamada al sistema --> write (sys_write)
                        mov ebx,1            ;  seleccionar la salida a pantalla ---> File descriptor 1 - standard output
                        mov ecx,esp        ; ECX debe apuntar a la cadena, en este caso un caracter que está en la pila
                        mov edx,1            ; EDX debe tener la longitud de la cadena, en este caso uno solo caracter
                        int 80h                 ; llamar al sistema (escritura al standard output -- pantalla)
                        pop eax                ; recuperar EXA 
                        popad                  ; recuperar todos los registros
                        ret
    