.model small
.stack 100h
.data
.code
main proc  
     ; add  
     ;mov al,9
     ;add al,5
     
     ; sub
     ;mov ah,6
     ;sub ah,4
     
     ; mul 
     ;mov bl,4 
     ;mov al,200
     ;mul bl
     ; kq phep nhan là 800 <-> 0320h tren ax
     
     ;div 
     ;mov ax, 2000
     ;mov bl,10
     ;div bl  ; chia cho thanh ghi 8 bit thuong trong al , du trong ah 
     
     ; div
     mov ax,20
     mov bx,7
     div bx ; chia cho thanh ghi 16 bit thuog trong ax , du trong dx
end main