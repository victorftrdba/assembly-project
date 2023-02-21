; Author: Victor Nogueira
; Run: nasm -f elf64 convert.asm && ld -o convert convert.o && ./convert
%include './lib.inc'

section .data
    v1 dw '105', LF, NULL

section .text

global _start

_start:
    call convert_value
    call show_value
    call exit_with_success

convert_value:
    lea esi, [v1]
    mov ecx, 0x3
    call string_to_int
    ret

show_value:
    call int_to_string
    call result
    ret

string_to_int:
    xor ebx, ebx
.next_digit:
    movzx eax, byte[esi]
    inc esi
    sub al, '0'
    imul ebx, 0xA
    add ebx, eax ; ebx = ebx * 0xA + eax
    loop .next_digit
    mov eax, ebx
    ret

int_to_string:
    lea esi, [BUFFER]
    add esi, 0x9
    mov byte[esi], 0xA
    mov ebx, 0xA
.next_digit:
    xor edx, edx
    div ebx
    add dl, '0'
    dec esi
    mov [esi], dl
    test eax, EAX
    jnz .next_digit
    ret