.model small
.stack 100h
.data 
tb1 dw 'Nhap 1 ki tu : $'
tb2 dw 10,13,'Ki tu sau khi chuyen : $' 
kitu db ?

.code
main proc
    ; dua data vao
     mov ax, @data
     mov ds, ax
    ; hien thong bao
    lea dx,tb1
    mov ah,9
    int 21h
    ; nhap
    mov ah,1
    int 21h 
    mov kitu, al
    CMP kitu,'a'
    jb hien
    CMP kitu,'z'
    JA hien
    sub kitu,20h  
    hien:  
    lea dx,tb2
    mov ah,9
    int 21h
    xor dx,dx
    mov dl,kitu
    mov ah,2
    int 21h 
     
    
main endp
endp main