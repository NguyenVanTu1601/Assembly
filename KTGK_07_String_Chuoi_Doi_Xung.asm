.model small
.stack 100h
.data 
str db 100 dup('$') 

tb1 db 10,13,'Co doi xung $'
tb2 db 10,13,'Khong doi xung$'
.code
main proc
     mov ax, @data
     mov ds,ax
     
       
     ;nhap chuoi
     mov ah,0AH
     lea dx,str
     int 21h
     
     ; tro si vao dau str , bx vao cuoi str
     lea si,str+ 1
     mov cx,[si] ; lay do dai chuoi
     xor ch,ch  ; xoa ch do chuoi toi da 255 ktu = 8bit
     mov di,si  ; lay o nho cua si
     add di,cx  ; tro toi cuoi str
     inc si
     
     Start:
         mov dl,[di] 
         mov bl,[si] 
         cmp dl,bl
         je lap
         jmp httb2
         lap:
            inc si
            dec di
            loop Start
         
         httb1:
             lea dx,tb1
             mov ah,9
             int 21h
             jmp thoat
         httb2:
             lea dx,tb2
             mov ah,9
             int 21h
             jmp thoat
         thoat:
             mov ah,4ch
             int 21h
     
         
         
main endp
endp main