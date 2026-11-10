section .text
global str_len
global str_mid
global clrBit

str_len:
    push ebp
    mov ebp, esp
    mov edx, [ebp+8]         
    mov eax, 0             
.ciclo:
    cmp byte [edx+eax], 0
    je _fin
    inc eax
    jmp .ciclo
_fin:
    pop ebp
    ret                       

