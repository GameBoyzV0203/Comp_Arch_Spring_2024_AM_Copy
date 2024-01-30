; 
; Base Author:  Megan Avery Spring 2024
; Exercise Author: Andrew Vaughan
; 
; Purpose - to learn about the following:
; 	- comments
;	- dumping registers
;	- printing empty lines
;	- instructions: mov, add, sub, inc/dec

%include "asm_io.inc"

; initialized data
segment .data

; uninitialized data
segment .bss


segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha

	; dump_regs 1
        ; call print_nl
        
        ; mov eax, 0 ; makeing EAX = 0
        ; mov ah, 18 ; AH = 18 (base 10)
        ; mov al, 0BAH ; AL = 0xBA (base 16)
        ; dump_regs 2

        ; mov eax, 0BEEFCAFEH
        ; dump_regs 3

        ; mov eax, 3
        ; mov ebx, 4

        ; add eax, ebx ; eax += ebx, eax = 7
        ; dump_regs 1 ; dump registers

        ; mov eax, 40
        ; dump_regs 2

        ; call print_nl

        ; mov ebx, 2
        ; dump_regs 3

        ; call print_nl

        ; add eax, ebx
        ; dump_regs 4

        ; call print_nl

        ; mov eax, 10
        ; mov ebx, 4

        ; sub eax, ebx ; eax -= ebx (6)
        ; dump_regs 1
        ; call print_nl

        ; inc ebx
        ; dump_regs 2

        ; mov eax, 16
        ; dump_regs 1
        ; call print_nl

        ; mov ebx, 4
        ; dump_regs 2
        ; call print_nl

        ; sub eax, ebx
        ; dump_regs 3
        ; call print_nl

        ; mov ecx, eax

        ; inc ecx
        ; dump_regs 4
        ; call print_nl

        ; given 12 multiply by 4
        mov eax, 12 ; a
        add eax, eax ; 2a
        add eax, eax ; 2a + 2a = 4a

        ; given 4 multiply by 12
        ; 12 = 8 + 4
        mov eax, 4 ; a
        add eax, eax ; 2a
        add eax, eax ; 2a + 2a = 4a
        mov ebx, eax ; ebx = 4a

        add eax, eax ; 4a + 4a = 8a

        add eax, ebx ; 8a + 4a = 12a
        dump_regs 1

        ; first try
        ; mov ebx, 0

        ; add ebx, eax
        ; add ebx, eax
        ; add ebx, eax
        ; add ebx, eax

        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret


