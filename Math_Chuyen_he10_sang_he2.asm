.model small
.stack
.data
.code
main proc  
    mov ax, @data
    mov ds, ax
    
    mov bx,2
    mov ax,20
    mov cx, 0
Chia:
    cmp ax,0
    JE in    
    div bx
    inc cx 
    xor ah,ah 
    push dx
    JMP Chia
    in: 
       POP dx
       call inkt
       Loop in
    mov ah, 4ch
    int 21h
       
main endp 
    inkt proc
        add dx,30h
        mov ah,2
        int 21h
        ret
        
    inkt endp
    
endp main