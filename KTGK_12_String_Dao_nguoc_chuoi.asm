.model small
.stack 100h
.data
    str db 100 dup('$')
    tb1 db 10,13,'$'
.code

main proc
    mov ax,@data
    mov ds,ax
    
    mov si,offset str
    mov cx,0
    
    ;nhap 
    Nhap:
       mov ah,1
       int 21h 
       cmp al,13
       je xuongdong
       mov [si], al
       inc si
       inc cx
       jmp Nhap
    
    xuongdong:
        lea dx,tb1
        mov ah,9
        int 21h
    Hienthi:
       dec si
       mov dl, [si]
       ; doi chu hoa
       ;cmp dl, 'a'
       ;jb inra
       ;cmp dl,'z'
       ;ja inra
       ;sub dl,20h
       ; in ra
       ;inra: 
           mov ah,2
           int 21h
           loop Hienthi
    
main endp
endp main