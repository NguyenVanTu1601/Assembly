.model small
.stack 100h
.data    

str db 'A','b','D','e','f'

.code
main proc
    ; khoi tao data 
     mov ax, @data
     mov ds,ax 
     mov es,ax
    ; lay ki tu
    lea di, str 
    Lap:
       mov dl,[di]
       CMP dl,0h
       JE thoat
       CMP dl,'a'
       JB LT1
       CMP dl,'z'
       JA LT1
       SUB dl,20h
       LT1: 
          mov ah,2
          inc di
          int 21h
          JMP Lap
       thoat:
          mov ah,4ch
          int 21h
main endp
endp main