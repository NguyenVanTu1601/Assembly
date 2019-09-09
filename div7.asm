; kiem tra 1 so co chia het cho 7 ko, co thi cl = 1 va ngc lai                                                                                                                                         
.model samll
.stack 100h
.data
nhap db "Nhap so can kiem tra:$"
.code
main proc
    
    mov dx, 14
    mov ax,dx
    mov bl,7
    div bl;
    cmp ah,0
    je ghi
    mov cl,0
    jmp exit
 ghi: 
    mov cl,1
 exit: mov ah,4ch
       int 21h
main endp
endp main
