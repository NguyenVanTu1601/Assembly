.model small
.stack 100h
.data 
tb1 db 'Nhap cac so: $'
tb2 db 10,13,' Day so vua nhap: $'
arr dw 100 dup(?) 
sltp dw 0
tong dw 0
.code
    main proc
        mov ax, @data
        mov ds,ax
        mov ah,9
        lea dx,tb1
        int 21h
        ; nhap so
        call nhap
        ; hien so
        
        mov ah,9
        lea dx,tb2
        int 21h
        call hien
        ; thoat 
        mov ah,4ch
        int 21h
        
    main endp 
    
        nhap proc
            lea bx, arr    
        lap:
            mov ah,1
            int 21h
            cmp al,13
            je thoat 
            inc sltp
            mov [bx], ax
            add bx,1
            jmp lap
         thoat:
            ret     
        nhap endp 
        
        hien proc
            lea bx,arr
            mov cx, sltp
        lap2:   
             
            mov dx,[bx]
            mov ah,2
            int 21h
            mov dx, ' '
            int 21h
            add bx,1 
            loop Lap2
            ret
         hien endp
    endp main