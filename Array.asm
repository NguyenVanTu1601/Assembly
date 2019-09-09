.model small
.stack 100h
.data
tb db 'Mang so nguyen: $'
arr db 1,2,3,4,5,6,7

.code
     main proc
        mov ax,@data
        mov ds,ax
        mov ah,9
        lea dx,tb
        int 21h
        
        lea dx, arr
        mov cx,7
        mov di, dx
        mov bl,0 ; tinh tong cac so trong mang
        
        lap:
           mov dl,[di]
           add dl,30h ; chuyen ve dang so de in
           mov ah,2
           int 21h
           sub dl,30h
           add bl,dl
           inc di
           mov dl, ' '
           int 21h
           loop lap
         mov ah,4ch
         int 21h
     main endp
     endp main
       