.model  small
.stack 100h
.data
str1 db 'a','b','c','r','d','f','j'
str2 db 100 dup(?)
.code
main proc
    mov ax,@data
    mov ds,ax
    mov es,ax 
    
    lea si, str1
    lea di, str2
    
    CLD     ; dinh huong tien >< STD dinh huong lui
    MOV CX,7
    Lap:
       LODSB
       sub al, 20h
       STOSB
       Loop Lap
       
   lea si, str2 
   Mov cx,7
   Lap2:
      mov dl, [si]
      inc si
      mov ah,2
      int 21h 
      Loop Lap2
      
      
main endp
endp main
