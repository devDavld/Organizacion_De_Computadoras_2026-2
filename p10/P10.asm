global pBin8b
global pBin16b

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
    