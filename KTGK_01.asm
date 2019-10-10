.model small
.stack 100h
.data  

.code
main proc
    
    mov si,9876
    mov cx,10
    mov ax,0
    lap:
        add ax,[si] 
        inc si
    loop lap 
    
    call hienthi 
    
    mov ah,4ch
    int 21h
main endp
    hienthi proc
           mov bx,10
           mov cx,0
       chia:
           mov dx, 0
           div bx   ; lay ax chia bx nguyen luu trong ax, du trong dx
           inc cx ; tang cx len 1
           push dx   ; vao sau ra truoc
           cmp al, 0
           je ht
           jmp chia
       ht:
           pop dx ; lay dinh dua vao dx
           add dl, 30h ; chuyen so sang ma ascii de in
           mov ah,2
           int 21h
           dec cx
           cmp cx,0
           jne ht
           ret            
    hienthi endp
endp main