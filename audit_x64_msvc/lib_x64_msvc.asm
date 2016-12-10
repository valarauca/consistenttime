; Disassembly of file: lib.o
; Fri Dec 09 19:48:08 2016
; Mode: 64 bits
; Syntax: MASM/ML64
; Instruction set: Pentium Pro, x64
option dotname

public ct_u8_eq
public ct_u16_eq
public ct_u32_eq
public ct_u64_eq
public ct_usize_eq
public ct_u8_slice_eq
public ct_u16_slice_eq
public ct_u32_slice_eq
public ct_u64_slice_eq
public ct_usize_slice_eq
public ct_select_u8
public ct_select_u16
public ct_select_u32
public ct_select_u64
public ct_select_usize
public ct_copy_u8
public ct_copy_u16
public ct_copy_u32
public ct_copy_u64
public ct_copy_usize

extern _ZN4core9panicking5panic17h53676c30b3bd95ebE: near
extern _ZN4core9panicking18panic_bounds_check17h19e9bbc59320a57eE: near


_text   SEGMENT DWORD 'CODE'                            ; section number 1

_text   ENDS

_data   SEGMENT DWORD 'DATA'                            ; section number 2

_data   ENDS

.bss    SEGMENT DWORD 'BSS'                             ; section number 3

.bss    ENDS

_text   SEGMENT PARA 'CODE'                             ; section number 4
;  Communal section not supported by MASM

ct_u8_eq PROC
        xor     ecx, edx                                ; 0000 _ 31. D1
        not     cl                                      ; 0002 _ F6. D1
        mov     eax, ecx                                ; 0004 _ 89. C8
        shr     al, 4                                   ; 0006 _ C0. E8, 04
        and     al, cl                                  ; 0009 _ 20. C8
        mov     ecx, eax                                ; 000B _ 89. C1
        shr     cl, 2                                   ; 000D _ C0. E9, 02
        and     cl, al                                  ; 0010 _ 20. C1
        mov     eax, ecx                                ; 0012 _ 89. C8
        shr     al, 1                                   ; 0014 _ D0. E8
        and     al, cl                                  ; 0016 _ 20. C8
        ret                                             ; 0018 _ C3
ct_u8_eq ENDP

_text   ENDS

.xdata  SEGMENT DWORD 'CONST'                           ; section number 5
;  Communal section not supported by MASM

        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0000 _ ........

.xdata  ENDS

_text   SEGMENT PARA 'CODE'                             ; section number 6
;  Communal section not supported by MASM

ct_u16_eq PROC
        xor     ecx, edx                                ; 0000 _ 31. D1
        not     ecx                                     ; 0002 _ F7. D1
        movzx   eax, ch                                 ; 0004 _ 0F B6. C5
        and     eax, ecx                                ; 0007 _ 21. C8
        mov     ecx, eax                                ; 0009 _ 89. C1
        and     ecx, 0F0H                               ; 000B _ 81. E1, 000000F0
        shr     ecx, 4                                  ; 0011 _ C1. E9, 04
        and     ecx, eax                                ; 0014 _ 21. C1
        mov     edx, ecx                                ; 0016 _ 89. CA
        and     edx, 0CH                                ; 0018 _ 83. E2, 0C
        shr     edx, 2                                  ; 001B _ C1. EA, 02
        and     edx, ecx                                ; 001E _ 21. CA
        mov     eax, edx                                ; 0020 _ 89. D0
        and     eax, 0EH                                ; 0022 _ 83. E0, 0E
        shr     eax, 1                                  ; 0025 _ D1. E8
        and     eax, edx                                ; 0027 _ 21. D0
        and     eax, 01H                                ; 0029 _ 83. E0, 01
        ret                                             ; 002C _ C3
ct_u16_eq ENDP

_text   ENDS

.xdata  SEGMENT DWORD 'CONST'                           ; section number 7
;  Communal section not supported by MASM

        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0000 _ ........

.xdata  ENDS

_text   SEGMENT PARA 'CODE'                             ; section number 8
;  Communal section not supported by MASM

ct_u32_eq PROC
        xor     ecx, edx                                ; 0000 _ 31. D1
        not     ecx                                     ; 0002 _ F7. D1
        mov     eax, ecx                                ; 0004 _ 89. C8
        shr     eax, 16                                 ; 0006 _ C1. E8, 10
        and     eax, ecx                                ; 0009 _ 21. C8
        mov     ecx, eax                                ; 000B _ 89. C1
        shr     ecx, 8                                  ; 000D _ C1. E9, 08
        and     ecx, eax                                ; 0010 _ 21. C1
        mov     eax, ecx                                ; 0012 _ 89. C8
        shr     eax, 4                                  ; 0014 _ C1. E8, 04
        and     eax, ecx                                ; 0017 _ 21. C8
        mov     ecx, eax                                ; 0019 _ 89. C1
        shr     ecx, 2                                  ; 001B _ C1. E9, 02
        and     ecx, eax                                ; 001E _ 21. C1
        mov     eax, ecx                                ; 0020 _ 89. C8
        shr     eax, 1                                  ; 0022 _ D1. E8
        and     eax, ecx                                ; 0024 _ 21. C8
        and     eax, 01H                                ; 0026 _ 83. E0, 01
        ret                                             ; 0029 _ C3
ct_u32_eq ENDP

_text   ENDS

.xdata  SEGMENT DWORD 'CONST'                           ; section number 9
;  Communal section not supported by MASM

        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0000 _ ........

.xdata  ENDS

_text   SEGMENT PARA 'CODE'                             ; section number 10
;  Communal section not supported by MASM

ct_u64_eq PROC
        xor     rcx, rdx                                ; 0000 _ 48: 31. D1
        not     rcx                                     ; 0003 _ 48: F7. D1
        mov     rax, rcx                                ; 0006 _ 48: 89. C8
        shr     rax, 32                                 ; 0009 _ 48: C1. E8, 20
        and     rax, rcx                                ; 000D _ 48: 21. C8
        mov     rcx, rax                                ; 0010 _ 48: 89. C1
        shr     rcx, 16                                 ; 0013 _ 48: C1. E9, 10
        and     rcx, rax                                ; 0017 _ 48: 21. C1
        mov     rax, rcx                                ; 001A _ 48: 89. C8
        shr     rax, 8                                  ; 001D _ 48: C1. E8, 08
        and     rax, rcx                                ; 0021 _ 48: 21. C8
        mov     rcx, rax                                ; 0024 _ 48: 89. C1
        shr     rcx, 4                                  ; 0027 _ 48: C1. E9, 04
        and     rcx, rax                                ; 002B _ 48: 21. C1
        mov     rdx, rcx                                ; 002E _ 48: 89. CA
        shr     rdx, 2                                  ; 0031 _ 48: C1. EA, 02
        and     edx, ecx                                ; 0035 _ 21. CA
        mov     eax, edx                                ; 0037 _ 89. D0
        shr     eax, 1                                  ; 0039 _ D1. E8
        and     eax, edx                                ; 003B _ 21. D0
        and     eax, 01H                                ; 003D _ 83. E0, 01
        ret                                             ; 0040 _ C3
ct_u64_eq ENDP

_text   ENDS

.xdata  SEGMENT DWORD 'CONST'                           ; section number 11
;  Communal section not supported by MASM

        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0000 _ ........

.xdata  ENDS

_text   SEGMENT PARA 'CODE'                             ; section number 12
;  Communal section not supported by MASM

ct_usize_eq PROC
        xor     rcx, rdx                                ; 0000 _ 48: 31. D1
        not     rcx                                     ; 0003 _ 48: F7. D1
        mov     rax, rcx                                ; 0006 _ 48: 89. C8
        shr     rax, 32                                 ; 0009 _ 48: C1. E8, 20
        and     rax, rcx                                ; 000D _ 48: 21. C8
        mov     rcx, rax                                ; 0010 _ 48: 89. C1
        shr     rcx, 16                                 ; 0013 _ 48: C1. E9, 10
        and     rcx, rax                                ; 0017 _ 48: 21. C1
        mov     rax, rcx                                ; 001A _ 48: 89. C8
        shr     rax, 8                                  ; 001D _ 48: C1. E8, 08
        and     rax, rcx                                ; 0021 _ 48: 21. C8
        mov     rcx, rax                                ; 0024 _ 48: 89. C1
        shr     rcx, 4                                  ; 0027 _ 48: C1. E9, 04
        and     rcx, rax                                ; 002B _ 48: 21. C1
        mov     rdx, rcx                                ; 002E _ 48: 89. CA
        shr     rdx, 2                                  ; 0031 _ 48: C1. EA, 02
        and     edx, ecx                                ; 0035 _ 21. CA
        mov     eax, edx                                ; 0037 _ 89. D0
        shr     eax, 1                                  ; 0039 _ D1. E8
        and     eax, edx                                ; 003B _ 21. D0
        and     eax, 01H                                ; 003D _ 83. E0, 01
        ret                                             ; 0040 _ C3
ct_usize_eq ENDP

_text   ENDS

.xdata  SEGMENT DWORD 'CONST'                           ; section number 13
;  Communal section not supported by MASM

        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0000 _ ........

.xdata  ENDS

_text   SEGMENT PARA 'CODE'                             ; section number 14
;  Communal section not supported by MASM

ct_u8_slice_eq PROC
        sub     rsp, 40                                 ; 0000 _ 48: 83. EC, 28
        mov     r10, rdx                                ; 0004 _ 49: 89. D2
        cmp     r10, r9                                 ; 0007 _ 4D: 39. CA
        jnz     ?_003                                   ; 000A _ 75, 4A
        mov     r9b, -1                                 ; 000C _ 41: B1, FF
        test    r10, r10                                ; 000F _ 4D: 85. D2
        jz      ?_002                                   ; 0012 _ 74, 27
        xor     r9d, r9d                                ; 0014 _ 45: 31. C9
        xor     edx, edx                                ; 0017 _ 31. D2
; Filling space: 7H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 80H, 00H, 00H, 00H, 00H

ALIGN   8
?_001:  cmp     rdx, r10                                ; 0020 _ 4C: 39. D2
        jnc     ?_005                                   ; 0023 _ 73, 38
        movzx   eax, byte ptr [r8+rdx]                  ; 0025 _ 41: 0F B6. 04 10
        xor     al, byte ptr [rcx+rdx]                  ; 002A _ 32. 04 11
        inc     rdx                                     ; 002D _ 48: FF. C2
        or      r9b, al                                 ; 0030 _ 41: 08. C1
        cmp     rdx, r10                                ; 0033 _ 4C: 39. D2
        jc      ?_001                                   ; 0036 _ 72, E8
        not     r9b                                     ; 0038 _ 41: F6. D1
?_002:  mov     ecx, r9d                                ; 003B _ 44: 89. C9
        shr     cl, 4                                   ; 003E _ C0. E9, 04
        and     cl, r9b                                 ; 0041 _ 44: 20. C9
        mov     eax, ecx                                ; 0044 _ 89. C8
        shr     al, 2                                   ; 0046 _ C0. E8, 02
        and     al, cl                                  ; 0049 _ 20. C8
        mov     ecx, eax                                ; 004B _ 89. C1
        shr     cl, 1                                   ; 004D _ D0. E9
        test    cl, al                                  ; 004F _ 84. C1
        setne   al                                      ; 0051 _ 0F 95. C0
        jmp     ?_004                                   ; 0054 _ EB, 02

?_003:  xor     eax, eax                                ; 0056 _ 31. C0
?_004:  add     rsp, 40                                 ; 0058 _ 48: 83. C4, 28
        ret                                             ; 005C _ C3
ct_u8_slice_eq ENDP

?_005   LABEL NEAR
        lea     rcx, ptr [panic_bounds_check_loc2691]   ; 005D _ 48: 8D. 0D, 00000000(rel)
        mov     r8, r10                                 ; 0064 _ 4D: 89. D0
        call    _ZN4core9panicking18panic_bounds_check17h19e9bbc59320a57eE; 0067 _ E8, 00000000(rel)
        ud2                                             ; 006C _ 0F 0B

_text   ENDS

.xdata  SEGMENT DWORD 'CONST'                           ; section number 15
;  Communal section not supported by MASM

        db 01H, 04H, 01H, 00H, 04H, 42H, 00H, 00H       ; 0000 _ .....B..

.xdata  ENDS

_text   SEGMENT PARA 'CODE'                             ; section number 16
;  Communal section not supported by MASM

ct_u16_slice_eq PROC
        push    rbx                                     ; 0000 _ 53
        sub     rsp, 32                                 ; 0001 _ 48: 83. EC, 20
        mov     r10, rdx                                ; 0005 _ 49: 89. D2
        cmp     r10, r9                                 ; 0008 _ 4D: 39. CA
        jnz     ?_008                                   ; 000B _ 75, 57
; Note: Length-changing prefix causes delay on Intel processors
        mov     bx, 65535                               ; 000D _ 66: BB, FFFF
        test    r10, r10                                ; 0011 _ 4D: 85. D2
        jz      ?_007                                   ; 0014 _ 74, 24
        xor     ebx, ebx                                ; 0016 _ 31. DB
        xor     edx, edx                                ; 0018 _ 31. D2
; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_006:  cmp     rdx, r10                                ; 0020 _ 4C: 39. D2
        jnc     ?_010                                   ; 0023 _ 73, 47
        mov     ax, word ptr [r8+rdx*2]                 ; 0025 _ 66 41: 8B. 04 50
        xor     ax, word ptr [rcx+rdx*2]                ; 002A _ 66: 33. 04 51
        inc     rdx                                     ; 002E _ 48: FF. C2
        or      ebx, eax                                ; 0031 _ 09. C3
        cmp     rdx, r10                                ; 0033 _ 4C: 39. D2
        jc      ?_006                                   ; 0036 _ 72, E8
        not     ebx                                     ; 0038 _ F7. D3
?_007:  movzx   eax, bh                                 ; 003A _ 0F B6. C7
        and     eax, ebx                                ; 003D _ 21. D8
        mov     ecx, eax                                ; 003F _ 89. C1
        and     ecx, 0F0H                               ; 0041 _ 81. E1, 000000F0
        shr     ecx, 4                                  ; 0047 _ C1. E9, 04
        and     ecx, eax                                ; 004A _ 21. C1
        mov     edx, ecx                                ; 004C _ 89. CA
        and     edx, 0CH                                ; 004E _ 83. E2, 0C
        shr     edx, 2                                  ; 0051 _ C1. EA, 02
        and     edx, ecx                                ; 0054 _ 21. CA
        mov     eax, edx                                ; 0056 _ 89. D0
        and     eax, 0EH                                ; 0058 _ 83. E0, 0E
        shr     eax, 1                                  ; 005B _ D1. E8
        and     eax, edx                                ; 005D _ 21. D0
        and     eax, 01H                                ; 005F _ 83. E0, 01
        jmp     ?_009                                   ; 0062 _ EB, 02

?_008:  xor     eax, eax                                ; 0064 _ 31. C0
?_009:  add     rsp, 32                                 ; 0066 _ 48: 83. C4, 20
        pop     rbx                                     ; 006A _ 5B
        ret                                             ; 006B _ C3
ct_u16_slice_eq ENDP

?_010   LABEL NEAR
        lea     rcx, ptr [panic_bounds_check_loc2691]   ; 006C _ 48: 8D. 0D, 00000000(rel)
        mov     r8, r10                                 ; 0073 _ 4D: 89. D0
        call    _ZN4core9panicking18panic_bounds_check17h19e9bbc59320a57eE; 0076 _ E8, 00000000(rel)
        ud2                                             ; 007B _ 0F 0B

_text   ENDS

.xdata  SEGMENT DWORD 'CONST'                           ; section number 17
;  Communal section not supported by MASM

        db 01H, 05H, 02H, 00H, 05H, 32H, 01H, 30H       ; 0000 _ .....2.0

.xdata  ENDS

_text   SEGMENT PARA 'CODE'                             ; section number 18
;  Communal section not supported by MASM

ct_u32_slice_eq PROC
        sub     rsp, 40                                 ; 0000 _ 48: 83. EC, 28
        mov     r10, rdx                                ; 0004 _ 49: 89. D2
        cmp     r10, r9                                 ; 0007 _ 4D: 39. CA
        jnz     ?_013                                   ; 000A _ 75, 57
        mov     r9d, 4294967295                         ; 000C _ 41: B9, FFFFFFFF
        test    r10, r10                                ; 0012 _ 4D: 85. D2
        jz      ?_012                                   ; 0015 _ 74, 23
        xor     r9d, r9d                                ; 0017 _ 45: 31. C9
        xor     edx, edx                                ; 001A _ 31. D2
; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8
?_011:  cmp     rdx, r10                                ; 0020 _ 4C: 39. D2
        jnc     ?_015                                   ; 0023 _ 73, 45
        mov     eax, dword ptr [r8+rdx*4]               ; 0025 _ 41: 8B. 04 90
        xor     eax, dword ptr [rcx+rdx*4]              ; 0029 _ 33. 04 91
        inc     rdx                                     ; 002C _ 48: FF. C2
        or      r9d, eax                                ; 002F _ 41: 09. C1
        cmp     rdx, r10                                ; 0032 _ 4C: 39. D2
        jc      ?_011                                   ; 0035 _ 72, E9
        not     r9d                                     ; 0037 _ 41: F7. D1
?_012:  mov     ecx, r9d                                ; 003A _ 44: 89. C9
        shr     ecx, 16                                 ; 003D _ C1. E9, 10
        and     ecx, r9d                                ; 0040 _ 44: 21. C9
        mov     eax, ecx                                ; 0043 _ 89. C8
        shr     eax, 8                                  ; 0045 _ C1. E8, 08
        and     eax, ecx                                ; 0048 _ 21. C8
        mov     ecx, eax                                ; 004A _ 89. C1
        shr     ecx, 4                                  ; 004C _ C1. E9, 04
        and     ecx, eax                                ; 004F _ 21. C1
        mov     edx, ecx                                ; 0051 _ 89. CA
        shr     edx, 2                                  ; 0053 _ C1. EA, 02
        and     edx, ecx                                ; 0056 _ 21. CA
        mov     eax, edx                                ; 0058 _ 89. D0
        shr     eax, 1                                  ; 005A _ D1. E8
        and     eax, edx                                ; 005C _ 21. D0
        and     eax, 01H                                ; 005E _ 83. E0, 01
        jmp     ?_014                                   ; 0061 _ EB, 02

?_013:  xor     eax, eax                                ; 0063 _ 31. C0
?_014:  add     rsp, 40                                 ; 0065 _ 48: 83. C4, 28
        ret                                             ; 0069 _ C3
ct_u32_slice_eq ENDP

?_015   LABEL NEAR
        lea     rcx, ptr [panic_bounds_check_loc2691]   ; 006A _ 48: 8D. 0D, 00000000(rel)
        mov     r8, r10                                 ; 0071 _ 4D: 89. D0
        call    _ZN4core9panicking18panic_bounds_check17h19e9bbc59320a57eE; 0074 _ E8, 00000000(rel)
        ud2                                             ; 0079 _ 0F 0B

_text   ENDS

.xdata  SEGMENT DWORD 'CONST'                           ; section number 19
;  Communal section not supported by MASM

        db 01H, 04H, 01H, 00H, 04H, 42H, 00H, 00H       ; 0000 _ .....B..

.xdata  ENDS

_text   SEGMENT PARA 'CODE'                             ; section number 20
;  Communal section not supported by MASM

ct_u64_slice_eq PROC
        sub     rsp, 40                                 ; 0000 _ 48: 83. EC, 28
        mov     r10, rdx                                ; 0004 _ 49: 89. D2
        cmp     r10, r9                                 ; 0007 _ 4D: 39. CA
        jnz     ?_018                                   ; 000A _ 75, 6B
        mov     r9, -1                                  ; 000C _ 49: C7. C1, FFFFFFFF
        test    r10, r10                                ; 0013 _ 4D: 85. D2
        jz      ?_017                                   ; 0016 _ 74, 23
        xor     r9d, r9d                                ; 0018 _ 45: 31. C9
        xor     edx, edx                                ; 001B _ 31. D2
; Filling space: 3H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 00H

ALIGN   8
?_016:  cmp     rdx, r10                                ; 0020 _ 4C: 39. D2
        jnc     ?_020                                   ; 0023 _ 73, 59
        mov     rax, qword ptr [r8+rdx*8]               ; 0025 _ 49: 8B. 04 D0
        xor     rax, qword ptr [rcx+rdx*8]              ; 0029 _ 48: 33. 04 D1
        inc     rdx                                     ; 002D _ 48: FF. C2
        or      r9, rax                                 ; 0030 _ 49: 09. C1
        cmp     rdx, r10                                ; 0033 _ 4C: 39. D2
        jc      ?_016                                   ; 0036 _ 72, E8
        not     r9                                      ; 0038 _ 49: F7. D1
?_017:  mov     rcx, r9                                 ; 003B _ 4C: 89. C9
        shr     rcx, 32                                 ; 003E _ 48: C1. E9, 20
        and     rcx, r9                                 ; 0042 _ 4C: 21. C9
        mov     rax, rcx                                ; 0045 _ 48: 89. C8
        shr     rax, 16                                 ; 0048 _ 48: C1. E8, 10
        and     rax, rcx                                ; 004C _ 48: 21. C8
        mov     rcx, rax                                ; 004F _ 48: 89. C1
        shr     rcx, 8                                  ; 0052 _ 48: C1. E9, 08
        and     rcx, rax                                ; 0056 _ 48: 21. C1
        mov     rax, rcx                                ; 0059 _ 48: 89. C8
        shr     rax, 4                                  ; 005C _ 48: C1. E8, 04
        and     rax, rcx                                ; 0060 _ 48: 21. C8
        mov     rcx, rax                                ; 0063 _ 48: 89. C1
        shr     rcx, 2                                  ; 0066 _ 48: C1. E9, 02
        and     ecx, eax                                ; 006A _ 21. C1
        mov     eax, ecx                                ; 006C _ 89. C8
        shr     eax, 1                                  ; 006E _ D1. E8
        and     eax, ecx                                ; 0070 _ 21. C8
        and     eax, 01H                                ; 0072 _ 83. E0, 01
        jmp     ?_019                                   ; 0075 _ EB, 02

?_018:  xor     eax, eax                                ; 0077 _ 31. C0
?_019:  add     rsp, 40                                 ; 0079 _ 48: 83. C4, 28
        ret                                             ; 007D _ C3
ct_u64_slice_eq ENDP

?_020   LABEL NEAR
        lea     rcx, ptr [panic_bounds_check_loc2691]   ; 007E _ 48: 8D. 0D, 00000000(rel)
        mov     r8, r10                                 ; 0085 _ 4D: 89. D0
        call    _ZN4core9panicking18panic_bounds_check17h19e9bbc59320a57eE; 0088 _ E8, 00000000(rel)
        ud2                                             ; 008D _ 0F 0B

_text   ENDS

.xdata  SEGMENT DWORD 'CONST'                           ; section number 21
;  Communal section not supported by MASM

        db 01H, 04H, 01H, 00H, 04H, 42H, 00H, 00H       ; 0000 _ .....B..

.xdata  ENDS

_text   SEGMENT PARA 'CODE'                             ; section number 22
;  Communal section not supported by MASM

ct_usize_slice_eq PROC
        sub     rsp, 40                                 ; 0000 _ 48: 83. EC, 28
        mov     r10, rdx                                ; 0004 _ 49: 89. D2
        cmp     r10, r9                                 ; 0007 _ 4D: 39. CA
        jnz     ?_023                                   ; 000A _ 75, 6B
        mov     r9, -1                                  ; 000C _ 49: C7. C1, FFFFFFFF
        test    r10, r10                                ; 0013 _ 4D: 85. D2
        jz      ?_022                                   ; 0016 _ 74, 23
        xor     r9d, r9d                                ; 0018 _ 45: 31. C9
        xor     edx, edx                                ; 001B _ 31. D2
; Filling space: 3H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 00H

ALIGN   8
?_021:  cmp     rdx, r10                                ; 0020 _ 4C: 39. D2
        jnc     ?_025                                   ; 0023 _ 73, 59
        mov     rax, qword ptr [r8+rdx*8]               ; 0025 _ 49: 8B. 04 D0
        xor     rax, qword ptr [rcx+rdx*8]              ; 0029 _ 48: 33. 04 D1
        inc     rdx                                     ; 002D _ 48: FF. C2
        or      r9, rax                                 ; 0030 _ 49: 09. C1
        cmp     rdx, r10                                ; 0033 _ 4C: 39. D2
        jc      ?_021                                   ; 0036 _ 72, E8
        not     r9                                      ; 0038 _ 49: F7. D1
?_022:  mov     rcx, r9                                 ; 003B _ 4C: 89. C9
        shr     rcx, 32                                 ; 003E _ 48: C1. E9, 20
        and     rcx, r9                                 ; 0042 _ 4C: 21. C9
        mov     rax, rcx                                ; 0045 _ 48: 89. C8
        shr     rax, 16                                 ; 0048 _ 48: C1. E8, 10
        and     rax, rcx                                ; 004C _ 48: 21. C8
        mov     rcx, rax                                ; 004F _ 48: 89. C1
        shr     rcx, 8                                  ; 0052 _ 48: C1. E9, 08
        and     rcx, rax                                ; 0056 _ 48: 21. C1
        mov     rax, rcx                                ; 0059 _ 48: 89. C8
        shr     rax, 4                                  ; 005C _ 48: C1. E8, 04
        and     rax, rcx                                ; 0060 _ 48: 21. C8
        mov     rcx, rax                                ; 0063 _ 48: 89. C1
        shr     rcx, 2                                  ; 0066 _ 48: C1. E9, 02
        and     ecx, eax                                ; 006A _ 21. C1
        mov     eax, ecx                                ; 006C _ 89. C8
        shr     eax, 1                                  ; 006E _ D1. E8
        and     eax, ecx                                ; 0070 _ 21. C8
        and     eax, 01H                                ; 0072 _ 83. E0, 01
        jmp     ?_024                                   ; 0075 _ EB, 02

?_023:  xor     eax, eax                                ; 0077 _ 31. C0
?_024:  add     rsp, 40                                 ; 0079 _ 48: 83. C4, 28
        ret                                             ; 007D _ C3
ct_usize_slice_eq ENDP

?_025   LABEL NEAR
        lea     rcx, ptr [panic_bounds_check_loc2691]   ; 007E _ 48: 8D. 0D, 00000000(rel)
        mov     r8, r10                                 ; 0085 _ 4D: 89. D0
        call    _ZN4core9panicking18panic_bounds_check17h19e9bbc59320a57eE; 0088 _ E8, 00000000(rel)
        ud2                                             ; 008D _ 0F 0B

_text   ENDS

.xdata  SEGMENT DWORD 'CONST'                           ; section number 23
;  Communal section not supported by MASM

        db 01H, 04H, 01H, 00H, 04H, 42H, 00H, 00H       ; 0000 _ .....B..

.xdata  ENDS

_text   SEGMENT PARA 'CODE'                             ; section number 24
;  Communal section not supported by MASM

ct_select_u8 PROC
        test    cl, cl                                  ; 0000 _ 84. C9
        cmove   edx, r8d                                ; 0002 _ 41: 0F 44. D0
        mov     eax, edx                                ; 0006 _ 89. D0
        ret                                             ; 0008 _ C3
ct_select_u8 ENDP

_text   ENDS

.xdata  SEGMENT DWORD 'CONST'                           ; section number 25
;  Communal section not supported by MASM

        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0000 _ ........

.xdata  ENDS

_text   SEGMENT PARA 'CODE'                             ; section number 26
;  Communal section not supported by MASM

ct_select_u16 PROC
        test    cl, cl                                  ; 0000 _ 84. C9
        cmovne  r8w, dx                                 ; 0002 _ 66 44: 0F 45. C2
        mov     eax, r8d                                ; 0007 _ 44: 89. C0
        ret                                             ; 000A _ C3
ct_select_u16 ENDP

_text   ENDS

.xdata  SEGMENT DWORD 'CONST'                           ; section number 27
;  Communal section not supported by MASM

        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0000 _ ........

.xdata  ENDS

_text   SEGMENT PARA 'CODE'                             ; section number 28
;  Communal section not supported by MASM

ct_select_u32 PROC
        test    cl, cl                                  ; 0000 _ 84. C9
        cmove   edx, r8d                                ; 0002 _ 41: 0F 44. D0
        mov     eax, edx                                ; 0006 _ 89. D0
        ret                                             ; 0008 _ C3
ct_select_u32 ENDP

_text   ENDS

.xdata  SEGMENT DWORD 'CONST'                           ; section number 29
;  Communal section not supported by MASM

        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0000 _ ........

.xdata  ENDS

_text   SEGMENT PARA 'CODE'                             ; section number 30
;  Communal section not supported by MASM

ct_select_u64 PROC
        test    cl, cl                                  ; 0000 _ 84. C9
        cmove   rdx, r8                                 ; 0002 _ 49: 0F 44. D0
        mov     rax, rdx                                ; 0006 _ 48: 89. D0
        ret                                             ; 0009 _ C3
ct_select_u64 ENDP

_text   ENDS

.xdata  SEGMENT DWORD 'CONST'                           ; section number 31
;  Communal section not supported by MASM

        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0000 _ ........

.xdata  ENDS

_text   SEGMENT PARA 'CODE'                             ; section number 32
;  Communal section not supported by MASM

ct_select_usize PROC
        test    cl, cl                                  ; 0000 _ 84. C9
        cmove   rdx, r8                                 ; 0002 _ 49: 0F 44. D0
        mov     rax, rdx                                ; 0006 _ 48: 89. D0
        ret                                             ; 0009 _ C3
ct_select_usize ENDP

_text   ENDS

.xdata  SEGMENT DWORD 'CONST'                           ; section number 33
;  Communal section not supported by MASM

        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0000 _ ........

.xdata  ENDS

_text   SEGMENT PARA 'CODE'                             ; section number 34
;  Communal section not supported by MASM

ct_copy_u8 PROC
        sub     rsp, 40                                 ; 0000 _ 48: 83. EC, 28
        mov     rax, rdx                                ; 0004 _ 48: 89. D0
        cmp     r8, qword ptr [rsp+50H]                 ; 0007 _ 4C: 3B. 44 24, 50
        jnz     ?_030                                   ; 000C _ 75, 52
        test    r8, r8                                  ; 000E _ 4D: 85. C0
        jz      ?_028                                   ; 0011 _ 74, 3A
        xor     edx, edx                                ; 0013 _ 31. D2
        test    cl, cl                                  ; 0015 _ 84. C9
        jz      ?_027                                   ; 0017 _ 74, 27
; Filling space: 7H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 80H, 00H, 00H, 00H, 00H

ALIGN   8
?_026:  cmp     rdx, r8                                 ; 0020 _ 4C: 39. C2
        jnc     ?_029                                   ; 0023 _ 73, 2D
        movzx   ecx, byte ptr [r9+rdx]                  ; 0025 _ 41: 0F B6. 0C 11
        mov     byte ptr [rax+rdx], cl                  ; 002A _ 88. 0C 10
        inc     rdx                                     ; 002D _ 48: FF. C2
        cmp     rdx, r8                                 ; 0030 _ 4C: 39. C2
        jc      ?_026                                   ; 0033 _ 72, EB
        jmp     ?_028                                   ; 0035 _ EB, 16

; Filling space: 9H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 84H, 00H, 00H, 00H, 00H
;       db 00H

ALIGN   16
?_027:  cmp     rdx, r8                                 ; 0040 _ 4C: 39. C2
        jnc     ?_029                                   ; 0043 _ 73, 0D
        inc     rdx                                     ; 0045 _ 48: FF. C2
        cmp     rdx, r8                                 ; 0048 _ 4C: 39. C2
        jc      ?_027                                   ; 004B _ 72, F3
?_028:  add     rsp, 40                                 ; 004D _ 48: 83. C4, 28
        ret                                             ; 0051 _ C3

?_029:  lea     rcx, ptr [panic_bounds_check_loc2694]   ; 0052 _ 48: 8D. 0D, 00000000(rel)
        call    _ZN4core9panicking18panic_bounds_check17h19e9bbc59320a57eE; 0059 _ E8, 00000000(rel)
        ud2                                             ; 005E _ 0F 0B
ct_copy_u8 ENDP

?_030   LABEL NEAR
        lea     rcx, ptr [_ZN3lib10ct_copy_u814_MSG_FILE_LINE17h64c7ea2d2318bf7eE]; 0060 _ 48: 8D. 0D, 00000000(rel)
        call    _ZN4core9panicking5panic17h53676c30b3bd95ebE; 0067 _ E8, 00000000(rel)
        ud2                                             ; 006C _ 0F 0B

_text   ENDS

.xdata  SEGMENT DWORD 'CONST'                           ; section number 35
;  Communal section not supported by MASM

        db 01H, 04H, 01H, 00H, 04H, 42H, 00H, 00H       ; 0000 _ .....B..

.xdata  ENDS

_text   SEGMENT PARA 'CODE'                             ; section number 36
;  Communal section not supported by MASM

ct_copy_u16 PROC
        sub     rsp, 40                                 ; 0000 _ 48: 83. EC, 28
        mov     rax, rdx                                ; 0004 _ 48: 89. D0
        cmp     r8, qword ptr [rsp+50H]                 ; 0007 _ 4C: 3B. 44 24, 50
        jnz     ?_035                                   ; 000C _ 75, 52
        test    r8, r8                                  ; 000E _ 4D: 85. C0
        jz      ?_033                                   ; 0011 _ 74, 3A
        xor     edx, edx                                ; 0013 _ 31. D2
        test    cl, cl                                  ; 0015 _ 84. C9
        jz      ?_032                                   ; 0017 _ 74, 27
; Filling space: 7H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 80H, 00H, 00H, 00H, 00H

ALIGN   8
?_031:  cmp     rdx, r8                                 ; 0020 _ 4C: 39. C2
        jnc     ?_034                                   ; 0023 _ 73, 2D
        movzx   ecx, word ptr [r9+rdx*2]                ; 0025 _ 41: 0F B7. 0C 51
        mov     word ptr [rax+rdx*2], cx                ; 002A _ 66: 89. 0C 50
        inc     rdx                                     ; 002E _ 48: FF. C2
        cmp     rdx, r8                                 ; 0031 _ 4C: 39. C2
        jc      ?_031                                   ; 0034 _ 72, EA
        jmp     ?_033                                   ; 0036 _ EB, 15

; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16
?_032:  cmp     rdx, r8                                 ; 0040 _ 4C: 39. C2
        jnc     ?_034                                   ; 0043 _ 73, 0D
        inc     rdx                                     ; 0045 _ 48: FF. C2
        cmp     rdx, r8                                 ; 0048 _ 4C: 39. C2
        jc      ?_032                                   ; 004B _ 72, F3
?_033:  add     rsp, 40                                 ; 004D _ 48: 83. C4, 28
        ret                                             ; 0051 _ C3

?_034:  lea     rcx, ptr [panic_bounds_check_loc2694]   ; 0052 _ 48: 8D. 0D, 00000000(rel)
        call    _ZN4core9panicking18panic_bounds_check17h19e9bbc59320a57eE; 0059 _ E8, 00000000(rel)
        ud2                                             ; 005E _ 0F 0B
ct_copy_u16 ENDP

?_035   LABEL NEAR
        lea     rcx, ptr [_ZN3lib11ct_copy_u1614_MSG_FILE_LINE17h0720c751c1c65958E]; 0060 _ 48: 8D. 0D, 00000000(rel)
        call    _ZN4core9panicking5panic17h53676c30b3bd95ebE; 0067 _ E8, 00000000(rel)
        ud2                                             ; 006C _ 0F 0B

_text   ENDS

.xdata  SEGMENT DWORD 'CONST'                           ; section number 37
;  Communal section not supported by MASM

        db 01H, 04H, 01H, 00H, 04H, 42H, 00H, 00H       ; 0000 _ .....B..

.xdata  ENDS

_text   SEGMENT PARA 'CODE'                             ; section number 38
;  Communal section not supported by MASM

ct_copy_u32 PROC
        sub     rsp, 40                                 ; 0000 _ 48: 83. EC, 28
        mov     rax, rdx                                ; 0004 _ 48: 89. D0
        cmp     r8, qword ptr [rsp+50H]                 ; 0007 _ 4C: 3B. 44 24, 50
        jnz     ?_040                                   ; 000C _ 75, 52
        test    r8, r8                                  ; 000E _ 4D: 85. C0
        jz      ?_038                                   ; 0011 _ 74, 3A
        xor     edx, edx                                ; 0013 _ 31. D2
        test    cl, cl                                  ; 0015 _ 84. C9
        jz      ?_037                                   ; 0017 _ 74, 27
; Filling space: 7H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 80H, 00H, 00H, 00H, 00H

ALIGN   8
?_036:  cmp     rdx, r8                                 ; 0020 _ 4C: 39. C2
        jnc     ?_039                                   ; 0023 _ 73, 2D
        mov     ecx, dword ptr [r9+rdx*4]               ; 0025 _ 41: 8B. 0C 91
        mov     dword ptr [rax+rdx*4], ecx              ; 0029 _ 89. 0C 90
        inc     rdx                                     ; 002C _ 48: FF. C2
        cmp     rdx, r8                                 ; 002F _ 4C: 39. C2
        jc      ?_036                                   ; 0032 _ 72, EC
        jmp     ?_038                                   ; 0034 _ EB, 17

; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16
?_037:  cmp     rdx, r8                                 ; 0040 _ 4C: 39. C2
        jnc     ?_039                                   ; 0043 _ 73, 0D
        inc     rdx                                     ; 0045 _ 48: FF. C2
        cmp     rdx, r8                                 ; 0048 _ 4C: 39. C2
        jc      ?_037                                   ; 004B _ 72, F3
?_038:  add     rsp, 40                                 ; 004D _ 48: 83. C4, 28
        ret                                             ; 0051 _ C3

?_039:  lea     rcx, ptr [panic_bounds_check_loc2694]   ; 0052 _ 48: 8D. 0D, 00000000(rel)
        call    _ZN4core9panicking18panic_bounds_check17h19e9bbc59320a57eE; 0059 _ E8, 00000000(rel)
        ud2                                             ; 005E _ 0F 0B
ct_copy_u32 ENDP

?_040   LABEL NEAR
        lea     rcx, ptr [_ZN3lib11ct_copy_u3214_MSG_FILE_LINE17h97069ea755197a67E]; 0060 _ 48: 8D. 0D, 00000000(rel)
        call    _ZN4core9panicking5panic17h53676c30b3bd95ebE; 0067 _ E8, 00000000(rel)
        ud2                                             ; 006C _ 0F 0B

_text   ENDS

.xdata  SEGMENT DWORD 'CONST'                           ; section number 39
;  Communal section not supported by MASM

        db 01H, 04H, 01H, 00H, 04H, 42H, 00H, 00H       ; 0000 _ .....B..

.xdata  ENDS

_text   SEGMENT PARA 'CODE'                             ; section number 40
;  Communal section not supported by MASM

ct_copy_u64 PROC
        sub     rsp, 40                                 ; 0000 _ 48: 83. EC, 28
        mov     rax, rdx                                ; 0004 _ 48: 89. D0
        cmp     r8, qword ptr [rsp+50H]                 ; 0007 _ 4C: 3B. 44 24, 50
        jnz     ?_045                                   ; 000C _ 75, 52
        test    r8, r8                                  ; 000E _ 4D: 85. C0
        jz      ?_043                                   ; 0011 _ 74, 3A
        xor     edx, edx                                ; 0013 _ 31. D2
        test    cl, cl                                  ; 0015 _ 84. C9
        jz      ?_042                                   ; 0017 _ 74, 27
; Filling space: 7H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 80H, 00H, 00H, 00H, 00H

ALIGN   8
?_041:  cmp     rdx, r8                                 ; 0020 _ 4C: 39. C2
        jnc     ?_044                                   ; 0023 _ 73, 2D
        mov     rcx, qword ptr [r9+rdx*8]               ; 0025 _ 49: 8B. 0C D1
        mov     qword ptr [rax+rdx*8], rcx              ; 0029 _ 48: 89. 0C D0
        inc     rdx                                     ; 002D _ 48: FF. C2
        cmp     rdx, r8                                 ; 0030 _ 4C: 39. C2
        jc      ?_041                                   ; 0033 _ 72, EB
        jmp     ?_043                                   ; 0035 _ EB, 16

; Filling space: 9H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 84H, 00H, 00H, 00H, 00H
;       db 00H

ALIGN   16
?_042:  cmp     rdx, r8                                 ; 0040 _ 4C: 39. C2
        jnc     ?_044                                   ; 0043 _ 73, 0D
        inc     rdx                                     ; 0045 _ 48: FF. C2
        cmp     rdx, r8                                 ; 0048 _ 4C: 39. C2
        jc      ?_042                                   ; 004B _ 72, F3
?_043:  add     rsp, 40                                 ; 004D _ 48: 83. C4, 28
        ret                                             ; 0051 _ C3

?_044:  lea     rcx, ptr [panic_bounds_check_loc2694]   ; 0052 _ 48: 8D. 0D, 00000000(rel)
        call    _ZN4core9panicking18panic_bounds_check17h19e9bbc59320a57eE; 0059 _ E8, 00000000(rel)
        ud2                                             ; 005E _ 0F 0B
ct_copy_u64 ENDP

?_045   LABEL NEAR
        lea     rcx, ptr [_ZN3lib11ct_copy_u6414_MSG_FILE_LINE17h681d4127c3bafbb0E]; 0060 _ 48: 8D. 0D, 00000000(rel)
        call    _ZN4core9panicking5panic17h53676c30b3bd95ebE; 0067 _ E8, 00000000(rel)
        ud2                                             ; 006C _ 0F 0B

_text   ENDS

.xdata  SEGMENT DWORD 'CONST'                           ; section number 41
;  Communal section not supported by MASM

        db 01H, 04H, 01H, 00H, 04H, 42H, 00H, 00H       ; 0000 _ .....B..

.xdata  ENDS

_text   SEGMENT PARA 'CODE'                             ; section number 42
;  Communal section not supported by MASM

ct_copy_usize PROC
        sub     rsp, 40                                 ; 0000 _ 48: 83. EC, 28
        mov     rax, rdx                                ; 0004 _ 48: 89. D0
        cmp     r8, qword ptr [rsp+50H]                 ; 0007 _ 4C: 3B. 44 24, 50
        jnz     ?_050                                   ; 000C _ 75, 52
        test    r8, r8                                  ; 000E _ 4D: 85. C0
        jz      ?_048                                   ; 0011 _ 74, 3A
        xor     edx, edx                                ; 0013 _ 31. D2
        test    cl, cl                                  ; 0015 _ 84. C9
        jz      ?_047                                   ; 0017 _ 74, 27
; Filling space: 7H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 80H, 00H, 00H, 00H, 00H

ALIGN   8
?_046:  cmp     rdx, r8                                 ; 0020 _ 4C: 39. C2
        jnc     ?_049                                   ; 0023 _ 73, 2D
        mov     rcx, qword ptr [r9+rdx*8]               ; 0025 _ 49: 8B. 0C D1
        mov     qword ptr [rax+rdx*8], rcx              ; 0029 _ 48: 89. 0C D0
        inc     rdx                                     ; 002D _ 48: FF. C2
        cmp     rdx, r8                                 ; 0030 _ 4C: 39. C2
        jc      ?_046                                   ; 0033 _ 72, EB
        jmp     ?_048                                   ; 0035 _ EB, 16

; Filling space: 9H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 84H, 00H, 00H, 00H, 00H
;       db 00H

ALIGN   16
?_047:  cmp     rdx, r8                                 ; 0040 _ 4C: 39. C2
        jnc     ?_049                                   ; 0043 _ 73, 0D
        inc     rdx                                     ; 0045 _ 48: FF. C2
        cmp     rdx, r8                                 ; 0048 _ 4C: 39. C2
        jc      ?_047                                   ; 004B _ 72, F3
?_048:  add     rsp, 40                                 ; 004D _ 48: 83. C4, 28
        ret                                             ; 0051 _ C3

?_049:  lea     rcx, ptr [panic_bounds_check_loc2694]   ; 0052 _ 48: 8D. 0D, 00000000(rel)
        call    _ZN4core9panicking18panic_bounds_check17h19e9bbc59320a57eE; 0059 _ E8, 00000000(rel)
        ud2                                             ; 005E _ 0F 0B
ct_copy_usize ENDP

?_050   LABEL NEAR
        lea     rcx, ptr [_ZN3lib13ct_copy_usize14_MSG_FILE_LINE17h6013818c7296816eE]; 0060 _ 48: 8D. 0D, 00000000(rel)
        call    _ZN4core9panicking5panic17h53676c30b3bd95ebE; 0067 _ E8, 00000000(rel)
        ud2                                             ; 006C _ 0F 0B

_text   ENDS

.xdata  SEGMENT DWORD 'CONST'                           ; section number 43
;  Communal section not supported by MASM

        db 01H, 04H, 01H, 00H, 04H, 42H, 00H, 00H       ; 0000 _ .....B..

.xdata  ENDS

.rdata  SEGMENT BYTE 'CONST'                            ; section number 44
;  Communal section not supported by MASM

str2690 label byte
        db 6CH, 69H, 62H, 2EH, 72H, 73H                 ; 0000 _ lib.rs

.rdata  ENDS

.rdata  SEGMENT ALIGN(8) 'CONST'                        ; section number 45
;  Communal section not supported by MASM

panic_bounds_check_loc2691 label byte
        dq str2690                                      ; 0000 _ 0000000000000000 (d)
        dq 0000000000000006H                            ; 0008 _ 0000000000000006 
        dq 00000000000000C5H                            ; 0010 _ 00000000000000C5 

.rdata  ENDS

.rdata  SEGMENT ALIGN(8) 'CONST'                        ; section number 46
;  Communal section not supported by MASM

panic_bounds_check_loc2694 label byte
        dq str2690                                      ; 0000 _ 0000000000000000 (d)
        dq 0000000000000006H                            ; 0008 _ 0000000000000006 
        dq 000000000000012AH                            ; 0010 _ 000000000000012A 

.rdata  ENDS

.rdata  SEGMENT PARA 'CONST'                            ; section number 47
;  Communal section not supported by MASM

str2695 label byte
        db 43H, 6FH, 6EH, 73H, 69H, 73H, 74H, 65H       ; 0000 _ Consiste
        db 6EH, 74H, 20H, 54H, 69H, 6DH, 65H, 3AH       ; 0008 _ nt Time:
        db 20H, 41H, 74H, 74H, 65H, 6DH, 70H, 74H       ; 0010 _  Attempt
        db 65H, 64H, 20H, 74H, 6FH, 20H, 63H, 6FH       ; 0018 _ ed to co
        db 70H, 79H, 20H, 62H, 65H, 74H, 77H, 65H       ; 0020 _ py betwe
        db 65H, 6EH, 20H, 6EH, 6FH, 6EH, 2DH, 65H       ; 0028 _ en non-e
        db 71H, 75H, 61H, 6CH, 20H, 6CH, 65H, 6EH       ; 0030 _ qual len
        db 73H                                          ; 0038 _ s

.rdata  ENDS

.rdata  SEGMENT ALIGN(8) 'CONST'                        ; section number 48
;  Communal section not supported by MASM

_ZN3lib10ct_copy_u814_MSG_FILE_LINE17h64c7ea2d2318bf7eE label byte
        dq str2695                                      ; 0000 _ 0000000000000000 (d)
        dq 0000000000000039H                            ; 0008 _ 0000000000000039 
        dq str2690                                      ; 0010 _ 0000000000000000 (d)
        dq 0000000000000006H                            ; 0018 _ 0000000000000006 
        dq 0000000000000144H                            ; 0020 _ 0000000000000144 

.rdata  ENDS

.rdata  SEGMENT ALIGN(8) 'CONST'                        ; section number 49
;  Communal section not supported by MASM

_ZN3lib11ct_copy_u1614_MSG_FILE_LINE17h0720c751c1c65958E label byte
        dq str2695                                      ; 0000 _ 0000000000000000 (d)
        dq 0000000000000039H                            ; 0008 _ 0000000000000039 
        dq str2690                                      ; 0010 _ 0000000000000000 (d)
        dq 0000000000000006H                            ; 0018 _ 0000000000000006 
        dq 0000000000000146H                            ; 0020 _ 0000000000000146 

.rdata  ENDS

.rdata  SEGMENT ALIGN(8) 'CONST'                        ; section number 50
;  Communal section not supported by MASM

_ZN3lib11ct_copy_u3214_MSG_FILE_LINE17h97069ea755197a67E label byte
        dq str2695                                      ; 0000 _ 0000000000000000 (d)
        dq 0000000000000039H                            ; 0008 _ 0000000000000039 
        dq str2690                                      ; 0010 _ 0000000000000000 (d)
        dq 0000000000000006H                            ; 0018 _ 0000000000000006 
        dq 0000000000000148H                            ; 0020 _ 0000000000000148 

.rdata  ENDS

.rdata  SEGMENT ALIGN(8) 'CONST'                        ; section number 51
;  Communal section not supported by MASM

_ZN3lib11ct_copy_u6414_MSG_FILE_LINE17h681d4127c3bafbb0E label byte
        dq str2695                                      ; 0000 _ 0000000000000000 (d)
        dq 0000000000000039H                            ; 0008 _ 0000000000000039 
        dq str2690                                      ; 0010 _ 0000000000000000 (d)
        dq 0000000000000006H                            ; 0018 _ 0000000000000006 
        dq 000000000000014AH                            ; 0020 _ 000000000000014A 

.rdata  ENDS

.rdata  SEGMENT ALIGN(8) 'CONST'                        ; section number 52
;  Communal section not supported by MASM

_ZN3lib13ct_copy_usize14_MSG_FILE_LINE17h6013818c7296816eE label byte
        dq str2695                                      ; 0000 _ 0000000000000000 (d)
        dq 0000000000000039H                            ; 0008 _ 0000000000000039 
        dq str2690                                      ; 0010 _ 0000000000000000 (d)
        dq 0000000000000006H                            ; 0018 _ 0000000000000006 
        dq 000000000000014CH                            ; 0020 _ 000000000000014C 

.rdata  ENDS

END