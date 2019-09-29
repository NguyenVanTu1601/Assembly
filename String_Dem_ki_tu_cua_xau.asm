.model small
.stack 100h
.data 
str db 100 dup('$')
tb1 db 'Nhap chuoi : $' 
tb2 db 10,13, 'Do dai chuoi: $'
.code  
; chuoi co < 10 ki tu

main proc
    mov ax,@data
    mov ds,ax 
    mov bx,0
    ; nhap chuoi
    mov ah,9
    lea dx,tb1
    int 21h
     
    mov ah,0AH
    lea dx,str
    int 21h
    
    ; Tinh do dai
    lea si, str+1
    xor cx,cx
    mov cl, [si]
    inc si
 Lap:   
    inc bx
    inc si
    loop lap
    
    ; in do dai 
    mov ah,9
    lea dx, tb2
    int 21h
    
    
    mov ah,2
    add bx, 30h ; chuyen sang dang ki tu de in
    mov dx,bx
    int 21h
    
main endp
endp main