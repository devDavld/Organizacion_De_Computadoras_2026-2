section .text
   global suma
   global mystrcmp
   global mystrlen
   global getBit
   global setBit

   suma:
   push ebp
   mov ebp,esp
   mov edx,[ebp+8]
   mov eax,[ebp+12]
   add eax,edx
   pop ebp
   ret

   mystrcmp:
   push ebp
   mov ebp,esp
   mov edx,[ebp+8]         
   mov ecx,[ebp+12]        

   .ciclo:
    movzx eax,BYTE [edx]
    cmp al,BYTE [ecx]
    jne .distintas
    test al,al             
    je .iguales
    add edx,1
    add ecx,1
    jmp .ciclo

   .iguales:
    mov eax,0
    jmp .fin

   .distintas:
    mov eax,1

   .fin:
    pop ebp
    ret

   mystrlen:
   push ebp
   mov ebp,esp
   mov edx,[ebp+8]         
   mov eax,0                

   .ciclo:
    cmp BYTE [edx+eax],0
    je .fin
    add eax,1
    jmp .ciclo

   .fin:
    pop ebp
    ret

   getBit:
   push ebp
   mov ebp,esp
   mov eax,[ebp+12]        
   mov edx,[ebp+8]          
   mov ecx,eax
   sar edx,cl
   mov eax,edx
   and eax,1
   pop ebp
   ret

   setBit:
   push ebp
   mov ebp,esp
   mov ecx,[ebp+12]         
   mov eax,1
   shl eax,cl               
   or eax,[ebp+8]           
   pop ebp
   ret