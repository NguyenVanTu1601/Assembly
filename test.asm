.model small
.stack
.data
.code  
main proc
    mov dx,7
    mov ax,dx
    mov bl,2
Lap:
    mov ax,dx
    div bl
    add bl,1
    cmp ah,0
    je noNt
    cmp bl,dl
    jb Lap
    mov cl , 1;
    jmp exit  
noNt:
    mov cl,0;

exit:
    mov ah,4ch
    int 21h
    
main endp
endp mail