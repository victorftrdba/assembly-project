; Author: Victor Nogueira
; Run: nasm -f elf64 hello.asm && ld -o hello hello.o && ./hello
%include './lib.inc'

section .data
    msg db 'Hello World!', LF ; Use 0xA to print a new line, remember that 0xA is a new char on our string
    tam equ $- msg
    msg2 db 'I am Victor', LF ; Use 0xA to print a new line, remember that 0xA is a new char on our string
    tam2 equ $- msg2

section .text

global _start

_start:
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, msg
    mov edx, tam
    int SYS_CALL

    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, msg2
    mov edx, tam2
    int SYS_CALL

    call exit_with_success