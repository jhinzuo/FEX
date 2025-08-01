%ifdef CONFIG
{
  "RegData": {
    "RAX": "1"
  }
}
%endif

; Test fsin(+infinity) = Invalid Operation (should set bit 0 of status word)
; Load positive infinity: exponent all 1s, mantissa 0x8000000000000000
mov rax, 0x8000000000000000
mov [rel .pos_inf], rax
mov ax, 0x7FFF
mov [rel .pos_inf + 8], ax

fld tword [rel .pos_inf]
fsin

fstsw ax
and rax, 1

hlt

.pos_inf:
dq 0
dw 0
