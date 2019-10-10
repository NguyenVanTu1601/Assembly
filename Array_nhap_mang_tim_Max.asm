.model small
.stack 100h
.data
tb1 db 'Nhap mang 5 ptu : $'
tb2 db 10,13, 'Max cua mang : $'  
tb3 db 10,13, '$'
x dw ?
y dw ?
array dw 10 dup (?)
.code
main proc 
      ; lay data
      mov ax, @data
      mov ds,ax
      
      ; thong bao nhap
      lea dx,tb1
      mov ah,9
      int 21h
      
      ; tao con tro de gan vao mang
      lea si,array
      
      ; nhap
      mov cx,5
      nhapmang:
         call nhapso
         lea dx,tb3
         mov ah,9
         int 21h
         Loop nhapmang
         
      ; hienthi mang vua nhap
      mov cx,5
      lea si, array
      hienthiso:
          push cx ; giu gia tri cx do vao hienthi no bij thay doi
          call hienthi
          lea dx,tb3
          mov ah,9
          int 21h
          pop cx  ; gan lai cx
          Loop hienthiso
      
      ; thoat
      mov ah,4ch
      int 21h
    
main endp
    nhapso proc
          mov x,0
          mov y,0
          mov bx,10
          nhap:
              mov ah,1
              int 21h
              cmp al,13
              je thoat
              xor ah,ah
              mov y,ax
              mov ax,x
              mul bx
              add ax,y
              mov x,ax
              JMP nhap
              
          thoat:
             mov ax,x
             mov [si], ax
             inc si
             ret
    nhapso endp 
    
    hienthi proc
           mov bx,10
           mov ax,[si]
           xor ah,ah
           inc si
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