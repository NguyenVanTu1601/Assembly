.model small
.stack 100h
.data
   str db 100 dup('$')
   str2 db 100 dup('$')
   tb1 db 10,13,'$'
.code
main proc
    ; Bai toan doi chuoi sang chu hoa va luu vao o nho khac
    mov ax,@data
    mov ds,ax 
    mov es,ax
    
    ; nhap
    call Nhapchuoi
    
    ;doichuhoa
    lea si,str
    lea di,str2
    mov bl,cl  ; luu lai so ki tu vua nhap
    CLD ; dinh huong tien
    Start:
        LODSB
        cmp al,'a'
        jb gan
        cmp al,'z'
        ja gan
        sub al,20h
        gan:
           STOSB
        loop Start
     
    mov cl,bl
    
    
    ;hienthi
    call hienthichuoi
    
    thoat:
        mov ah,4ch
        int 21h
main endp

    Nhapchuoi proc
        mov si, offset str
        mov cx,0
        Nhap:
            mov ah,1
            int 21h
            cmp al,13
            je thoatnhap
            xor ah,ah
            mov [si],al
            inc si
            inc cx
            jmp Nhap
        thoatnhap:
            ret
    Nhapchuoi endp
   
    Hienthichuoi proc
            lea si, str2 
            lea dx,tb1
            mov ah,9
            int 21h
            
            ht:
               mov dl,[si]
               inc si
               mov ah,2
               int 21h
               loop ht
             ret  
     Hienthichuoi endp
           
    
endp main