.model small
.stack 100h
.data
tb1 db "Nhap so : $"
tb2 db 10,13,"So fibonaci : $"
x dw ?
y dw ?
z dw ? ; luu vi tri so fibo can tim
.code
; chi co the tim toi da so fibo thu 24 do so 25 = 75025
; lon hon 16 bit = 65535 
main proc
     mov ax,@data
     mov ds,ax
     ; nhap
     mov ah,9
     lea dx, tb1
     int 21h
     call nhapso
     
     ; tim so fibo
     mov ah,9
     lea dx,tb2
     int 21h
     mov cx,2
     mov ax,1
     mov bx,1
     xor dx,dx
Fibo:    
     mov dx,ax ; luu a truoc khi thay doi chuyen thanh b sau khi cong
     add ax,bx
     add cx,1
     mov bx,dx
     cmp cx,x
     jb Fibo
     call hienthi
     ; thoat
     mov ah,4ch
     int 21h
     
main endp
     nhapso proc
          mov x,0  ; khoi tao x = 0
          mov y,0
          mov bx,10 ; co so 10 de nhan
     nhap:
          mov ah,1 ; nhap 1 so luu vao ax
          int 21h
          cmp al,13 ; nhap toi khi bam enter
          je thoat
          sub al,30h ;lay gia tri vua nhap do ma ascii va so lech nhau 30h
          xor ah,ah ;  xoa thanh ghi ah de lam tiep
          mov y,ax ; do y la bien 16 bit nen phai xoa ax tren
          mov ax,x
          mul bx
          add ax, y
          mov x, ax
          jmp nhap
      thoat:
          ret ; return chuong trinh chinh va thuc hien tiep cac leh   
    nhapso endp

     
     ; hien thi
     
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