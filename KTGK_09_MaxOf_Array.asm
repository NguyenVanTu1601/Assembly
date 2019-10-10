.model small
.stack 100h
.data 
   arr db 1,2,5,4,1,2,6,7,8,9,5,2
   tb1 db 'Max cua mang = $'
   
.code
main proc 
     ;khoi tao
     mov ax,@data
     mov ds,ax
     
     ; gan max ban dau
     mov bl,0
     mov cx,12
     mov si, offset arr
     
     Start:
         mov dl, [si]
         cmp bl,dl
         jb doicho
         inc si
         jmp Lap
         doicho:
             mov bl, dl
             inc si
         Lap:
            loop Start
     mov dl,bl
     add dl,30h
     mov ah,2
     int 21h    
main endp
endp main