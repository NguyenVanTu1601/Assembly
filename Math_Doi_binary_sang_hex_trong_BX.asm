.model small
.stack 100h
.data
   x db 4
.code
main proc  
    mov ax, @data
    mov ds,ax
    
    mov cl,4
    mov bx,0001101101011101b 
    call doihex
    call hienthi
    mov ah,4ch
    int 21h
main endp
    doihex proc
        lap:
        cmp x,0
        je thoat
        mov dx,0000000000001111b
        and dx,bx
        shr bx,cl
        dec x
        push dx 
        ;cmp dx,9
        ;ja in
        ;add dx,30h
        ;mov ah,2
        ;int 21h
        ;jmp l
        ;in:
           ;add dx,55
           ;mov ah,2
           ;int 21h
        l:
           jmp lap
        thoat:
            ret          
    doihex endp 
    
    hienthi proc    
           xor cx,cx
           mov cx,4 
           ht:
               xor dx,dx
               pop dx
               cmp dx,9
               ja ingt
               add dx,30h
               mov ah,2
               int 21h
               ingt:
                  add dx,55
                  mov ah,2
                  int 21h
               lo:
                  loop ht
            
    hienthi endp
    
endp main