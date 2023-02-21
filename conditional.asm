; Author: Victor Nogueira
; Run: nasm -f elf64 conditional.asm && ld -o conditional conditional.o && ./conditional
%include './lib.inc'

section .data
    x dd 20
    y dd 10
    msg1 db 'X maior que Y', LF, NULL
    tam1 equ $- msg1
    msg2 db 'X menor que Y', LF, NULL
    tam2 equ $- msg2

section .text

global _start

_start:
    mov eax, DWORD[x]
    mov ebx, DWORD[y]
    ; if
    cmp eax, ebx
    jge maior
    mov ECX, msg2
    mov EDX, tam2
    jmp final

maior:
    mov ECX, msg1
    mov EDX, tam1

final:
    call exit_with_success

    mov eax, SYS_EXIT
    xor ebx, ebx ; mov ebx, RET_EXIT    AND OR XOR
    int SYS_CALL