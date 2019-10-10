.model small
.stack 100h
.data 

array db 100 dup(?)

.code  
; nhap so vao mang
main proc
    mov ax, @data
    mov ds,ax
    
    mov cx,0
    lea si, array
    
    lap:
        mov ah,1
        int 21h
        xor ah,ah
        cmp al,13
        je hienthi
        mov [si],al
        inc si
        inc cx
        jmp lap
    
     hienthi:
        lea si,array
        la:
           mov dx, [si]
           xor dh,dh
           inc si
           mov ah,2
           int 21h
           mov dl,' '
           mov ah,2
           int 21h 
           loop la
           
     mov ah,4ch
     int 21h     
main endp
endp main