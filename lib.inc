segment .data
    LF          equ 0xA ; line feed
    NULL        equ 0xD ; null / string end
    SYS_CALL    equ 0x80 ; send info to OS

    ; EAX
    SYS_EXIT    equ 0x1 ; exit
    SYS_READ    equ 0x3 ; read
    SYS_WRITE   equ 0x4 ; write

    ; EBX
    RET_EXIT    equ 0x0 ; success
    STD_IN      equ 0x0 ; standard input
    STD_OUT     equ 0x1 ; standard output
    
    TAM_BUFFER equ 0xA

segment .bss
    BUFFER resb 0x1

segment .text

result:
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, BUFFER
    mov edx, TAM_BUFFER
    int SYS_CALL
    ret

exit_with_success:
    mov eax, SYS_EXIT
    mov ebx, RET_EXIT
    int SYS_CALL