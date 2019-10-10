.model small
.stack 100h
.data
.code

main proc 
    mov [9876h],10
    mov [9877h],20
    mov [9878h],30
    mov [9879h],40
    mov [987Ah],50
    
    ; luu y viec tang si len 1 hoac 2 cung nhu lay so tu si trong cac truong hop 8 bit hoac 16 bit
   
    mov si,9876h
    mov ax,0
    mov cx,5
    Lap:
       mov bx,[si] 
       xor bh,bh  ;Do 5 o nho ltiep => 8bit => xoa ah/bh... ve 0
       inc si
       add ax,bx
       loop Lap
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