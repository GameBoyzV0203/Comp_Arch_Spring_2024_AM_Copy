%include "asm_io.inc"

segment .data: ; Initialized data - Strings and values
number_prompt db "Enter your favorite number: ", 0 ; Create a number prompt string to prompt the user for a number

segment .bss: ; Uninitialized data - User input
favorite_number resb 1

segment .text:
    global asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha

        mov eax, number_prompt ; assign number_prompt memory location to a registry for usage
        call print_string ;

        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret