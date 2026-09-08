bits 64

global _start

section .multiboot
align 8

mb2_header:
    dd 0xE85250D6
    dd 0
    dd mb2_header_end - mb2_header
    dd -(0xE85250D6 + 0 + (mb2_header_end - mb2_header))

    dw 0
    dw 0
    dd 8

mb2_header_end:

section .text

_start:
    cli
    hlt
