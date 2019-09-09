; Chuong trinh tinh tong cac so tu 1 toi 255 su dung loop
.model small
.stack 100h
.data
.code
main proc
     mov cx, 255
     mov ax,0
  Lap:
     add ax, cx
     loop Lap
     
    
end main
    