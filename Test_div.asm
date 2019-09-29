.model small
.stack 100h
.data
.code
main proc
    mov ax,100
    mov bx,4 
    mov cx,0
    Lap: 
    mov dx,0
    cmp ax, 0
    je in
    div bx 
    inc cx
    push dx
    JMP lap
    in: 
       pop dx
       add dx,30h
       mov ah,2
       int 21h
       loop in
       
    thoat: mov ah,4ch
           int 21h
    main endp 

endp main