.model small
.stack 100h
.data

    str1 db 'Nguyen Van Trung$'
    str2 db 'Nguyen Van Tung $'
    tb1 db 10,13,'Hai chuoi bang nhap $'
    tb2 db 10,13,'Chuoi 1 > Chuoi 2 $'
    tb3 db 10,13,'Chuoi 1 < Chuoi 2 $'
    
.code
main proc  
    ; Khoi tao
    mov ax,@data
    mov ds,ax 
    
    ;Kiem tra
    lea si, str1
    mov di, offset str2
    Start:
        mov dl,[si]
        mov bl,[di]
        cmp dl,'$'   ; neu dl het thi ktra bl. Neu bl cung het thif = nhau
        je ktra1
        cmp bl,'$'   ; tuong tu ben tren
        je ktra2
        inc di
        inc si
        cmp bl,dl    ; Neu bl,dl chua het va bang nhau thi lap
        je Start
        cmp bl,dl
        ja thongbao3
        jmp thongbao2
        
        ktra1:
           cmp bl,'$'
           je thongbao1
           jmp thongbao2 
        ktra2:
           cmp dl,'$'
           je thongbao1
           jmp thongbao3   
        thongbao1:
            lea dx,tb1
            mov ah,9
            int 21h
            jmp thoat
        thongbao2:
            lea dx,tb2
            mov ah,9
            int 21h
            jmp thoat
        thongbao3:
            lea dx,tb3
            mov ah,9
            int 21h
        thoat:
           mov ah,4ch
           int 21h
    
    
     
main endp
endp main