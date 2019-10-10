.model small
.stack 100h
.data  
   Thongbao db 'Day da sap xep : ','$'
   xuongdong db 10,13,'$'
   Mang db 8,4,3,1,2,5,1
   Db '$'
.code
main proc 
    
    Start:
          mov ax, @data
          mov ds,ax
          mov ah,9
          mov dx, offset Thongbao
          int 21h
          mov dx,offset xuongdong
          int 21h
          mov bx,7
          mov dx, offset Mang   ; tro dx vao mang
          dec bx  
     Lap:
          mov si,dx ; si tro vao dau mang
          mov cx,bx ; khoi tao so lan lap
          mov di,si ; gia su pt 1 la max
          mov al,[di]  ; al = max 
     TimMax:
          inc si ; tro den ptu tiep theo
          cmp [si], al ; so sanh [si] voi max
          jb Tiep ; khong > max
          mov di,si ; > max di tro vao max
          mov al, [di] ; gan max vao al
     Tiep:
          Loop TimMax
          call doicho
          DEC bx
          JNZ Lap ; jnz:
     ;In mang
          mov bx,dx ; bx tro den dau mang
          mov cx,7
          mov ah,2 
      InMang:
          mov dl, [bx]
          add dl, 30h
          int 21h
          mov dl, ' '
          int 21h
          inc bx
          loop InMang
          
      Ketthuc:
          mov ah,4ch
          int 21h
          
          
          
main endp

    doicho proc
        push ax
        mov al,[si]
        xchg al,[di] 
        pop ax
        ret
        
    doicho endp
endp main