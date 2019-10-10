.model
.stack 100h
.data 
tb db 10,13, 'Nhap chuoi: $'
tb1 db 10,13, 'Co xuat hien $'
tb2 db 10,13, 'Khong xuat hien $'
str db 100 dup('$')
.code
; Nhap vao 1 chuoi, kiem tra xem cos xuat hien chuoi
; 'muoi' hay khong
main proc
     ; khoi tao
     mov ax, @data
     mov ds,ax
      
     ;tb nhap
     lea dx,tb 
     mov ah,9
     int 21h  
     
     ; nhap chuoi
      mov ah,0AH
      lea dx,str
      int 21h
     
     ; tro vao dau chuoi
     lea si, str+1
     xor cx,cx
     mov cl,[si]
     inc si
     
     ;kiem tra
     lap:
         cmp [si], 'm'
         je sosanh1
         cmp cl,0
         je hienthi2
         inc si
         loop lap
          
         sosanh1:
            inc si
            cmp [si],'u'
            je sosanh2
            cmp cl,0
            je  hienthi2
            jmp lap
         sosanh2:
            inc si
            cmp [si],'o'
            je sosanh3
            cmp cl,0
            je  hienthi2
            jmp lap
         sosanh3:
            inc si
            cmp [si],'i'
            je hienthi1
            cmp cl,0
            je  hienthi2
            jmp lap
         
     hienthi1:
         lea dx,tb1
         mov ah,9
         int 21h
         jmp thoat
     hienthi2:
         lea dx,tb2
         mov ah,9
         int 21h
         jmp thoat
     
     thoat:
         mov ah,4ch
         int 21h
     
     
main endp
endp main