.model small
.stack 100h
.data
; cac bien trong bai
.code
main proc
     ; neu co bien thi su dung
     ; mov ax, @data
     ; mov ds,ax
     mov ax,15
     and ax,1011b
    
main endp
endp main