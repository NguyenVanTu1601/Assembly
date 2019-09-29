.model small
.stack 100h
.data
.code
main proc
     mov ax,@data
     mov ds,ax
       
     mov bx,11110111011101b
     mov cx,0
     mov ax,0
     
     Lap:
        cmp cx,16
        JE thoat
        inc cx
        ROL bx,1
        JNC Next
        INC ax
        Next: JMP Lap
        
        thoat:
            xor dx,dx
            mov dx,ax 
            call hienthi
            
            mov ah,4ch
            int 21h
main endp 
    hienthi proc
        mov cx, 0
        mov bx, 10
        
        Chia:
            mov dx,0
            cmp ax,0
            je ht
            div bx
            inc cx
            push dx
            jmp chia
            ht:
               xor dx,dx
               pop dx 
               add dx,30h
               mov ah,2
               int 21h
            loop ht
            
    hienthi endp
endp main