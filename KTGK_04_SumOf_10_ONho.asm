.model small
.stack 100h
.data
.code
main proc  
    mov [9876h], 10
    mov [9877h], 9
    mov [9878h], 8
    mov [9879h], 7
    mov [987Ah], 6
    mov [987Bh], 5
    mov [987Ch], 4
    mov [987Dh], 3
    mov [987Eh], 2
    mov [987Fh], 1
    mov [9880h], 0
    
    mov si, 9876h
    mov cx,10 
    mov ax,0
    Lap:
       mov bx,[si]
       inc si
       xor bh,bh
       add ax, bx
    loop lap
    
    call hienthi
    mov ah,4ch
    int 21h   
    
main endp
    hienthi proc
        mov bx,10
        mov cx,0
        chia:
           xor dx,dx
           cmp ax,0
           je ht
           div bx
           inc cx
           push dx
           jmp chia 
        ht:
           pop dx 
           add dx,30h
           xor dh,dh
           mov ah,2
           int 21h
           loop ht
        ret  
    hienthi endp
endp main