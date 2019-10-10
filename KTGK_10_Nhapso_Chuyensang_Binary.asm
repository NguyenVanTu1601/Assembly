.model small
.stack
.data
   x dw ?
   y dw ?
   tb1 db 'Nhap so: $'
   tb2 db 10,13,'So nhi phan :$'
   
.code
main proc  
    mov ax, @data
    mov ds, ax
    
    lea dx,tb1
    mov ah,9
    int 21h
    call nhapso

    mov ax,x
    mov bx,2 
    mov cx, 0 
    
Chia:
    mov dx,0
    cmp ax,0
    JE tb    
    div bx
    inc cx 
    push dx
    JMP Chia
    
    tb:
       lea dx,tb2
       mov ah,9
       int 21h
    in: 
       POP dx
       call inkt
       Loop in 
       
    mov ah, 4ch
    int 21h
       
main endp 
    inkt proc
        add dx,30h
        mov ah,2
        int 21h
        ret
        
    inkt endp
    
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
    
endp main