.model small
.stack 100h
.data 
nhan db "Hello Tu$"
.code
main proc
     ; ham ngat ah loai 1
     ; de nhap 1 kitu tu ban phim
     ; mov ah,1
     ; int 21h
     
     ; ham ngat ah loai 2
     ; de in ra 1 ki tu
     ;mov ah,2
     ;mov dl, 42h ; ma ascii  tuong duong viec mov bl ,42h ... move dl,bl
     ;int 21h
     
     ; ham ngat loai 9
     ; de in ra 1 chuoi ki tu
     ; can khai bao chuoi ki tu ( nhan db "Chuoi$" ) tren .code
     ;mov ax, @data
     ;mov ds,ax
     ;mov ah,9  
     ;lea dx,nhan
     ;int 21h    
     
     ; ham ngat ah, 4ch
     ; dung chuong trinh
     mov ah,4ch
     int 21h
     
main endp
end main

