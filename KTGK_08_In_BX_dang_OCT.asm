.model small
.stack 100h
.data
   x db 6
.code
main proc
    ; khoi tao data 
    mov ax, @data
    mov ds,ax
    
    ; khoi tao gia tri
    mov cl,3
    mov bx,1111001101010001b 
    Start:  
        cmp x, 0
        je hienthi
        dec x
        mov dx,0000000000000111b
        and dx,bx
        shr bx,cl
        xor dh,dh
        push dx
        jmp Start    
    
    Hienthi:
        xor ch,ch
        mov cl,6
        ht: 
            pop dx
            xor dh,dh
            add dl,30h
            mov ah,2
            int 21h
            loop ht
    
    thoat:
        mov ah,4ch
        int 21h
    
    
main endp
endp main