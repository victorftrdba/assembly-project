; Author: Victor Nogueira
; Run: nasm -f elf64 input.asm && ld -o input input.o && ./input

%include './lib.inc'

section .data
    msg db "Entre com seu nome: ", LF, NULL
    tam equ $- msg

section .bss
    nome resb 100

section .text

global _start

_start:
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, msg
    mov edx, tam
    int SYS_CALL

    mov eax, SYS_READ
    mov ebx, STD_IN
    mov ecx, nome
    mov edx, 0xA
    int SYS_CALL

    call exit_with_success