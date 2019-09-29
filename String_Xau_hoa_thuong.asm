.model small
.stack 100h
.data
tb1 db 'Nhap chuoi : $'
tb2 db 10,13,'Chuoi hoa : $'
tb3 db 10,13,'Chuoi thuong : $'
str db 100 dup('$')
.code
main proc 
    ; hien thong bao nhap
    mov ax, @data
    mov ds,ax
    mov ah,9
    lea dx,tb1
    int 21h
    
    ; nhap mang 
    call nhapmang
    
    ; Chuoi hoa
    mov ah,9
    lea dx,tb2
    int 21h
    call chuoihoa
    
    ; Chuoi thuong
    mov ah,9
    lea dx,tb3
    int 21h
    call chuoithuong 
    
    ; thoat
    mov ah,4ch
    int 21h
    
main endp

    
    nhapmang proc
            mov ah,0AH
            lea dx,str
            int 21h
            ret   
    nhapmang endp
    
    dem proc
        
        
    dem endp
    
    chuoihoa proc
            mov si, offset str + 1  ; vi tri luu so ki tu
            Xor cx,cx
            mov cl,[si] ; lay so luong ki tu cua chuoi
            inc si            
        Lap:
            mov ah,2
            mov dl,[si] ; si o vi tri str+2 chua ki tu dau tien
            CMP dl,'a'
            JB LT1
            CMP dl,'z'
            JA LT1
            SUB dl,20h
        LT1: 
            inc si
            int 21h
            loop Lap
            ret
    chuoihoa endp
                  
    chuoithuong proc
                lea SI, str + 1
                xor cx,cx
                mov cl,[si] 
                inc si            
            Lap2:
                mov ah,2
                mov dl,[si]
                CMP dl,'A'
                JB LT2
                CMP dl,'Z'
                JA LT2
                add dl,20h
            LT2: 
                inc si
                int 21h
                loop Lap2
                ret
    chuoithuong endp
endp main