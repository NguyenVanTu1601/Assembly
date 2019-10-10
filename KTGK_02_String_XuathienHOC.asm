.model small
.stack 100h
.data                 
  
  str db 100 dup('$') 
  tb db 'Nhap chuoi: $'
  tb1 db 10,13,'Co xuat hien $'
  tb2 db 10,13,'Khong xuat hien $'
.code
main proc
main endp  
     mov ax,@data
     mov ds,ax 
     
     ; nhap chuoi 
      mov ah,0AH
      lea dx,str
      int 21h
      
     ;
     lea si, str+1
     xor cx,cx
     mov cl, [si]
     inc si  ; vi tri ki tu  dau chuoi  
     
     ; kiem tra
     
     lap:
         cmp [si], 'h'
         je ktra1
         inc si
         cmp cl,0
         je intb2
         loop lap
         ktra1:
            inc si
            cmp [si],'o'
            je ktra2
            cmp cl,0
            je intb2
            loop lap
         ktra2:
            inc si
            cmp [si],'c'
            je intb1
            cmp cl,0
            je intb2
            loop lap 
            
         intb1:
             mov ah,9
             lea dx,tb1
             int 21h 
             jmp thoat
         intb2:
             mov ah,9
             lea dx,tb2
             int 21h 
         thoat:
             mov ah,4ch
             int 21h
     
endp main     
