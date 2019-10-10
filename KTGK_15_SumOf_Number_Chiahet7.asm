.model small
.stack 100h
.data
   arr db 1,4,2,7,12,14,21,7,28,35
   Length equ 10
   
.code
main proc  
    
    mov ax, @data
    mov ds,ax
    
    lea si, arr
    mov cx,Length
    mov bl,7
    mov dx,0
    Start:
        xor ax,ax
        mov al,[si]
        div bl
        cmp ah,0
        ja Lap
        add dx,[si]
        Lap:
           inc si
           loop Start
           
    
    mov al,dl
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