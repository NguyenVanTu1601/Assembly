.model small
.stack 100h
.data  
tb1 dw " Nhap 1 ki tu : $"
tb2 dw 10,13,"Ki tu hoa : $"
char db ?
.code
main proc
     mov ax,@data
     mov ds, ax
     ; Thong bao nhap ki tu
     lea dx, tb1
     mov ah,9
     int 21h
     
     ; Nhap ki tu luu vao bien char
     mov ah,1
     int 21h 
     sub al,20h
     mov char, al
     
     ; hien thong bao xuat chua hoa
     lea dx,tb2
     mov ah,9
     int 21h
     
     ; hien chu hoa
     mov ah,2
     mov dl, char
     int 21h
     
     ; ket thuc
     mov ah,4ch
     int 21h
    
main endp
endp main