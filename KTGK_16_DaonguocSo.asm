.model small
.stack 100h
.data
   arr db 100 dup(?)
.code
main proc
    mov ax,12345
    mov bx,10
    mov cx,0
    lea si,arr
    Lap:
       mov dx,0
       cmp ax,0
       je hienthi
       div bx
       inc cx
       mov [si],dx
       inc si
       jmp Lap
       
    Hienthi:
        mov si, offset arr
        inso:
            mov dx,[si]
            inc si
            xor dh,dh
            add dl,30h
            mov ah,2
            int 21h
            loop inso
        
    exit:
        mov ah,4ch
        int 21h
       
       
main endp
endp main