.model small
.stack 100h
.data
arr db 100 dup(?)
x dw ?
y dw ?
tb1 db 'Nhap so : $'
tb2 db 10,13, 'Chuyen nhi phan : $'

.code
main proc
    mov ax,@data
    mov ds,ax
    ; in thong bao
    mov ah,9
    lea dx,tb1
    int 21h
    ; khoi tao  
    mov x,0
    mov y,0
    mov bx,10
    
    call Nhap
   
    mov ah,9
    lea dx,tb2
    int 21h
    
    call chia
    call hienthi
     
    ; thoat
    mov ah,4ch
    int 21h
    
main endp
   Nhap proc       
       Lap:
           mov ah,1
           int 21h
           cmp al,13
           je thoat 
               sub al, 30h
               xor ah,ah
               mov y, ax
               mov ax,x
               mul bx
               add ax,y
               mov x, ax
               JMP Lap
           thoat: 
                ret         
   Nhap endp 
   
   
   
   Chia proc
       xor ax,ax
       xor dx,dx 
       xor bx,bx
       mov cx,0
       lea si, arr
       mov ax,x
       mov bx,2 
       Lapchia:
          cmp ax, 0
          mov dx, 0
          je thoatchia
          div bx
          inc cx  
          ;xor ah,ah ; Chua biet vi sao
          mov [si], dx
          inc si
          jmp Lapchia
          thoatchia:
              ret      
   Chia endp 
   
   Hienthi proc
          xor dx,dx
          dec si 
          Laphienthi:
              mov ah,2
              mov dx, [si]
              add dx,30h 
              int 21h
              dec si
              Loop Laphienthi
          ret
    
   Hienthi endp
   
   hienthi2 proc
           mov bx,10
           mov ax,x  ; sbc buoc phai trong thanh ghi ax
           mov cx,0
       chia2:
           mov dx, 0
           div bx   ; lay ax chia bx nguyen luu trong ax, du trong dx
           inc cx ; tang cx len 1
           push dx   ; vao sau ra truoc
           cmp al, 0
           je ht
           jmp chia2
       ht:
           pop dx ; lay dinh dua vao dx
           add dl, 30h ; chuyen so sang ma ascii de in
           mov ah,2
           int 21h
           dec cx
           cmp cx,0
           jne ht
           ret            
    hienthi2 endp
endp main