.model small
.stack 100h
.data
tb1 db "Nhap so thu nhat :$"
tb2 db 10,13,"Nhap so thu hai :$"
tb3 db 10,13,"UCLN = $"
tb4 db 10,13,"Tich = $" 

x dw ?
y dw ?
z dw ?
t dw ?
.code
main proc
    
    mov ax, @data
    mov ds,ax
    ; nhap so thu nhat
    mov ah,9
    lea dx,tb1
    int 21h
    call nhapso
    mov ax,x
    mov z,ax
    ; nhap so thu 2
    mov ah,9
    lea dx,tb2
    int 21h
    call nhapso
    mov ax,x
    mov t,ax
    ; tinh tich 2 so luu trong x
    mov ax,z
    mul t
    mov x,ax
    
    ; tinh UCLN luu trong y
    ; thuat toan - lien tiep
    mov ah,9
    lea dx,tb3
    int 21h
lap:    
    mov ax,z
    cmp ax,t
    je ucln
    cmp ax,t
    ja tru_ax
    cmp ax,t
    jb tru_t
    
tru_ax:
    sub ax,t  ; z = z - t
    mov z, ax
    jmp lap
tru_t:
    mov ax, t ; t = t - z
    mov bx, z
    sub ax, bx
    mov t, ax
    mov z,bx
    jmp lap
             
ucln:
    mov ax, z ; z = t -> ucln 
    mov y, ax
    call hienthi
    
     ; Tinh BCNN
    mov ah,9
    lea dx,tb4
    int 21h
    ;//////////////////////////////////////////
    ; bi loi ko biet ly do
    mov ax,x
    ;div y
    mul y
    call hienthi
   
    ; dung chuong trinh
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
          cmp al,13   ; nhap toi khi bam enter
          je thoat
          sub al,30h  ;lay gia tri vua nhap do ma ascii va so lech nhau 30h
          xor ah,ah   ;  xoa thanh ghi ah de lam tiep
          mov y,ax    ; y chua kq vua nhap
          mov ax,x    ; gan lai kq lan tinh trc cho ax
          mul bx      ; nhan 10
          add ax, y   ; cong so vua nhap
          mov x, ax   ; chuyen lai ve x de tinh cho lan sau
          jmp nhap
      thoat:
          ret ; return chuong trinh chinh va thuc hien tiep cac leh   
    nhapso endp
    
    hienthi proc
           mov bx,10
           mov cx,0
       chia:
           mov dx, 0
           div bx   ; lay ax chia bx nguyen luu trong ax, du trong dx
           inc cx ; tang cx len 1
           push dx   ; vao sau ra truoc , dx luu du
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