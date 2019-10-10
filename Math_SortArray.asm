.Model small
.stack 100h
.data
    List_count equ 10
    list db 1,4,0,3,7,2,8,6,2,5
    crlf db 10,13,'$'
    
.code
       ;Sort a list
main proc
     
     mov ax, @data
     mov ds,ax
     
     mov cx, list_count
     lea si, list
     call printList
     
     lea si, list    ;si point to list
     mov bl,1        ; main counter
     MainLoop:
         mov al,[si]
         mov di,si
         mov bh,bl   ;sub-counter
         mov dx,di   ; dx to store min possition
         SubLoop:
             inc di
             inc bh
             cmp al,[di] 
             jle NotMin
             mov al,[di]
             mov dx,di
             NotMin:
                cmp bh, List_count
                je ExitSub
                jmp SubLoop
             ExitSub:
                ;swap the position if mon is different from first place  
                mov di,dx
                cmp si,di
                je NoSwap
                call swapMemLocation
                NoSwap:
                   inc bl
                   cmp bl,List_Count
                   je ExitMain
                   inc si
                   jmp MainLoop
                ExitMain:
                   ;print a new line char
                   lea dx, crlf
                   call printString
                   
                   ;print the sorted list
                   mov cx, List_Count
                   lea si,list
                   call printList
                   
                   ; end program
                   mov ah,4ch
                   int 21h
main endp 

    ;---------------------------------
    ; swap the value of 2 memory locations
    ;input si point to the 1st memory location
    ;      di points to 2nd memory location
    
    swapMemLocation proc
        push ax
        mov al,[si]
        mov ah,[di]
        mov [si],ah
        mov [di],al
        pop ax
        ret
     swapMemLocation endp
    
    ;----------------------------------
    ;print the list
    ;input Si to store the start address of the list
    ;      cx to store the number of elements 
    
    printList proc
        push dx
        StartPrint:
            mov dl,[si]
            call printSingleDigit
            inc si
            loop StartPrint
            pop dx
            ret
    printList endp
    
    
    ;---------------------------------
    ; print a string ending with $
    ;input Dx to point to String
    
    printString proc
        push ax
        mov ah,9
        int 21h
        pop ax
        ret
    printString endp
    
    ;---------------------------
    ; prov to print out a single digit number
    ;input dl to contain the digit to print
    
    printSingleDigit proc
        push ax
        add dl,'0'
        mov ah,2
        int 21h
        pop ax
        ret
    printSingleDigit endp
    
           
endp main