.model small
.stack 100h
.data              
arr db 5,2,6,4,7,5,8,6,0
.code
main proc
    mov ax, @data
    mov ds,ax
    lea si, arr 
    mov cx,8
    mov bl, 0
    
    Lap:
       mov dl,[si]
       add si,1
       CMP dl, bl
       JA in
       JMP L
       in:
          mov bl,dl
          
       L:
         loop Lap 
       
       mov dl,bl
       add dl,30h
       mov ah,2
       int 21h
main endp
endp main   

; si, di laf noi dung 1 o nho, thuong la 
; 8 bit <=> al,bl,cl,dl  
; de bl -> bx, dl -> dx se bi sai ko biet vi sao :))