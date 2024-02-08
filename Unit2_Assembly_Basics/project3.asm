; Original Author: Paul Carter
; Updated by: Megan Avery Summer 2023
; 
; Purpose: skeleton file for writing an assembly program
; Updated by: Andrew Vaughan Spring 2024

%include "asm_io.inc"

; initialized data
segment .data
number_prompt db "Enter your favorite number: ", 0 ; Create a number prompt string to prompt the user for a number
number_entered db "Starting number: ", 0 ; Create a string to nicely display the user's number 
number_times10 db "Number * 10: ", 0 ; Create a string to nicely display the user's number multiplied by 10
number_times72 db "Number * 72: ", 0 ; Create a string to nicely display the user's number multiplied by 72


; uninitialized data
segment .bss
favorite_number resd 1 ; Create a uninitilized location in memory to store the user's entered number

segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha

	mov eax, number_prompt ; assign number_prompt memory location to a registry for usage
        call print_string ; used to print out the string within eax
        call read_int ; user input to store a number within eax
        call print_nl ; output a newline for formatting

        mov [favorite_number], eax ; assign the value entered in eax to favorite_number
        mov eax, number_entered ; assign the number_entered string to eax for output
        call print_string ; output string located at eax
        mov eax, [favorite_number] ; assign the value of favorite_number to eax for output
        call print_int ; output integer value located at eax
        call print_nl ; output a newline for formatting

        mov eax, number_times10 ; assign number_times10 to eax for output
        call print_string ; output string located at eax
        mov eax, [favorite_number] ; assign the value of favorite_number to eax for addition
        add eax, eax ; a + a = 2a
        mov ebx, eax ; save 2a for later addition in ebx
        add eax, eax ; 2a + 2a = 4a
        add eax, eax ; 4a + 4a = 8a
        add eax, ebx ; 8a + 2a = 10a
        call print_int ; output integer value located at eax after addition
        call print_nl ; output a newline for formatting

        mov eax, number_times72 ; assign number_times72 string to eax for output
        call print_string ; output string located at eax
        mov eax, [favorite_number] ; assign the value of favorite_number to eax for addition
        add eax, eax ; a + a = 2a
        add eax, eax ; 2a + 2a = 4a
        add eax, eax ; 4a + 4a = 8a
        mov ebx, eax ; save 8a for later addition in ebx
        add eax, eax ; 8a + 8a = 16a
        add eax, eax ; 16a + 16a = 32a
        add eax, eax ; 32a + 32a = 64a
        add eax, ebx ; 64a + 8a = 72a
        call print_int ; output integer value located at eax after addition

        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret


