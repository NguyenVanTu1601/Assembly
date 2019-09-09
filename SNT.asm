; kiem tra snt
.model small
.stack 100h
.data
.code
main proc
    mov dx,19
    mov ax,dx
    mov bl,2
    mov cl,1
Lap:
    mov ax,dx
    div bl
    add bl,1
    cmp ah,0
    je noNt
    cmp bl,dl
    je exit
    jmp Lap
    
    
noNt:
    mov cl,0;

exit:
    mov ah,4ch
    int 21h
    
main endp
endp main