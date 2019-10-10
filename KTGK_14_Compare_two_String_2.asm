.model small
.stack 100h
.data 
    str1 db 'Nguyen$'
    str2 db 'Nguxen$'
    tb1 db 10,13,'Hai chuoi bang nhau$'
    tb2 db 10,13,'Hai chuoi khac nhau$'
    
.code
main proc
    mov ax, @data
    mov ds,ax
    
    lea si,str1
    lea di,str2
    
    Start:
        mov bl,[si]
        mov dl,[di]
        cmp bl,'$'
        je ktra1
        cmp dl,'$'
        je ktra2
        inc si
        inc di
        cmp bl,dl
        je lap
        jmp thongbao2
    
        Lap:
           jmp Start
        ktra1:
            cmp dl, '$'
            je thongbao
            jmp thongbao2
        ktra2:
            cmp bl, '$'
            je thongbao
            jmp thongbao2    
        thongbao:
            lea dx,tb1
            mov ah,9
            int 21h
            jmp thoat 
        thongbao2:
            lea dx,tb2
            mov ah,9
            int 21h    
        thoat:
            mov ah,4ch
            int 21h
main endp
endp main