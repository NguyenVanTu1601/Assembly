.model small
.stack 100h
.data
 arr db 1,2,7,9,3,8,4
 max db ?
 .code
 main proc 
    ; dl chua gia tri, inra + 30h
    mov ax, @data
    mov ds,ax  
    lea si,arr
    mov max ,0
    Lap:
        mov dl,[si]
        inc si
        cmp dl, 1
        JB thoat
        cmp dl,9
        JA thoat
        cmp dl,max
        JA gan 
        JMP L
    gan:
        mov max, dl
    L:    
        JMP Lap
    thoat: 
        mov dl, max 
        add dl,30h
        mov ah,2
        int 21h
        mov ah,4ch
        int 21h
 main endp
 endp main
 