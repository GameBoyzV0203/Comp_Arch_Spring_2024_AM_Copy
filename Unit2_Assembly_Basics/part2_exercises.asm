; Base Author: Megan Avery Spring 2024
; Exercise Author: Andrew Vaughan
; 
; Purpose - to learn about the following:
;	-  directives (dx, resx, & times)
;	- printing ints and characters
;	- dumping memory
;	- printing strings
;	- reading chars and ints

%include "asm_io.inc"

age equ 30 ; defines a symbol called age that equals 30, cannot change later.
%define fav_number 34 ; macro

; initialized data
segment .data
string db "Hello World!", 0 ; string
fav_color db "purple", 0 ; string
letter db "A" ; character
number dd 95 ; integer
ascii dd 65 ; ascii 
number_prompt db "Enter a Number: ", 0
char_prompt db "Enter a character: ", 0



many_chars times 5 db "T"

; uninitialized data
segment .bss
fav_character resd 1
num_prompt resd 1
space_for_number resd 1
space_for_char resb 1

segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha

        mov dword [number], 116
        mov eax, [number]
        ;dump_regs 1

	;call print_int ; print number in base 10
        ;call print_nl

        ;mov al, [letter] 
        ; print_char

        ; mov eax, [ascii]
        ; call print_int
        ; call print_nl
        ; call print_char

        ; dump_mem 1, fav_color, 0

        ; mov eax, fav_color + 3
        ; call print_string

        ; mov eax, string
        ; call print_string
        ; call print_nl
        ; dump_mem 1, string, 0

        ; mov eax, fav_character
        ; call print_string
        ; call read_char
        ; call print_nl
        ; call print_char

        ; mov eax, number_prompt
        ; call print_string
        ; call read_int
        ; mov dword [space_for_number], eax

        ; mov eax, char_prompt
        ; call print_string
        ; call read_char
        ; call print_nl
        ; call print_char

        ; mov eax, char_prompt
        ; call print_string
        ; call read_char
        ; mov byte [space_for_char], al

        ; call read_int
        ; mov dword [space_for_number], eax

        dump_mem 1, many_chars, 0
        call print_nl
        dump_mem 2, many_chars + 3, 0

        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret


