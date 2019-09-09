; Tinh giai thua
; vd tinh 6!
; 6 luu trong bl , gia tri tra ve bx 
; de tinh tot thi nhan tu be toi lon
; neu so <= 6 thi nhan vs thanh bl duoc
; nhung neu so >= 7 nhan bang ax,bx
.model small
.stack 100h
.data
.code
main proc 
    mov ax,1
    mov bx,1
    mov cx,7
lap:
    mul bx
    add bx,1
    loop lap
luu:
    mov bx,ax
        
main endp
endp main