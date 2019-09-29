.model small
.stack 100h
.data 
tb1 db 'Nhap chuoi : $'
tb2 db 10,13,'In chuoi : $'
str db 100 dup('$')
.code

main proc 
    
    ; lay data
    mov ax, @data
    mov ds,ax
    
    ; in tb1
    mov ah,9
    lea dx,tb1
    int 21h 
    
    ; nhap chuoi
    mov ah,0AH
    lea dx, str
    int 21h
    
    ;in thong bao 2
    mov ah,9
    lea dx, tb2
    int 21h
    
    ; push chuoi vao stack
    mov bx,0
    lea si, str+1; 
    xor cx,cx
    mov cl,[si]
    inc si
    Lap1:
       mov ax, [si]
       inc si
       inc bx
       push ax ; push tu ax vao ngan xep thanh sp
       loop Lap1
    
    ; pop chuoi ra 
    xor cx,cx
    mov cx,bx
    Lap2:
        pop dx   ; pop vao dx
        mov ah,2
        int 21h
        Loop Lap2 
        
    ; thoat
    mov ah,4ch
    int 21h
    
    
main endp 
endp main