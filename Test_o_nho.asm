
; tinh va luu 10 so fibo vao cac o nho bat dau tu 9810h
.model small
.stack 100h
.data 
tb1 db 10,13, '$'
arr dw 1256,2458,778,415,378,978,878,678

.code
main proc 
    
    mov ax, @data
    mov ds,ax
    
    mov cx,7
    lea si, arr 
    mov bx,0
    lap:
       xor dx,dx
       mov dx,[si] 
       add si,2
       ;xor dh,dh 
       cmp dx,bx
       ja gan
       jmp re
       
       gan: 
          mov bx,dx
          
       re:
          loop lap
    
    ; in
    mov ax, bx
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