; Disassembly of file: lib.o
; Fri Dec 09 23:15:24 2016
; Mode: 64 bits
; Syntax: YASM/NASM
; Instruction set: Pentium Pro, x64

default rel

global ct_u8_eq: function
global ct_u16_eq: function
global ct_u32_eq: function
global ct_u64_eq: function
global ct_usize_eq: function
global ct_u8_slice_eq: function
global ct_u16_slice_eq: function
global ct_u32_slice_eq: function
global ct_u64_slice_eq: function
global ct_usize_slice_eq: function
global ct_select_u8: function
global ct_select_u16: function
global ct_select_u32: function
global ct_select_u64: function
global ct_select_usize: function
global ct_copy_u8: function
global ct_copy_u16: function
global ct_copy_u32: function
global ct_copy_u64: function
global ct_copy_usize: function

extern _ZN4core9panicking5panic17h53676c30b3bd95ebE     ; near
extern _ZN4core9panicking18panic_bounds_check17h19e9bbc59320a57eE ; near


SECTION .text   align=4 execute                         ; section number 1, code


SECTION .data   align=4 noexecute                       ; section number 2, data


SECTION .bss    align=4 noexecute                       ; section number 3, bss


SECTION .text   align=16 execute                        ; section number 4, code
;  Communal section not supported by YASM

ct_u8_eq:; Function begin
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
; ct_u8_eq End of function


SECTION .xdata  align=4 noexecute                       ; section number 5, const
;  Communal section not supported by YASM

        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0000 _ ........


SECTION .text   align=16 execute                        ; section number 6, code
;  Communal section not supported by YASM

ct_u16_eq:; Function begin
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
; ct_u16_eq End of function


SECTION .xdata  align=4 noexecute                       ; section number 7, const
;  Communal section not supported by YASM

        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0000 _ ........


SECTION .text   align=16 execute                        ; section number 8, code
;  Communal section not supported by YASM

ct_u32_eq:; Function begin
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
; ct_u32_eq End of function


SECTION .xdata  align=4 noexecute                       ; section number 9, const
;  Communal section not supported by YASM

        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0000 _ ........


SECTION .text   align=16 execute                        ; section number 10, code
;  Communal section not supported by YASM

ct_u64_eq:; Function begin
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
; ct_u64_eq End of function


SECTION .xdata  align=4 noexecute                       ; section number 11, const
;  Communal section not supported by YASM

        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0000 _ ........


SECTION .text   align=16 execute                        ; section number 12, code
;  Communal section not supported by YASM

ct_usize_eq:; Function begin
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
; ct_usize_eq End of function


SECTION .xdata  align=4 noexecute                       ; section number 13, const
;  Communal section not supported by YASM

        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0000 _ ........


SECTION .text   align=16 execute                        ; section number 14, code
;  Communal section not supported by YASM

ct_u8_slice_eq:; Function begin
        sub     rsp, 40                                 ; 0000 _ 48: 83. EC, 28
        mov     r10, rdx                                ; 0004 _ 49: 89. D2
        cmp     r10, r9                                 ; 0007 _ 4D: 39. CA
        jnz     ?_002                                   ; 000A _ 75, 30
        test    r10, r10                                ; 000C _ 4D: 85. D2
        jz      ?_003                                   ; 000F _ 74, 2F
        xor     r9d, r9d                                ; 0011 _ 45: 31. C9
        xor     edx, edx                                ; 0014 _ 31. D2
; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16
?_001:  cmp     rdx, r10                                ; 0020 _ 4C: 39. D2
        jnc     ?_006                                   ; 0023 _ 73, 2D
        mov     al, byte [r8+rdx]                       ; 0025 _ 41: 8A. 04 10
        xor     al, byte [rcx+rdx]                      ; 0029 _ 32. 04 11
        inc     rdx                                     ; 002C _ 48: FF. C2
        or      al, r9b                                 ; 002F _ 44: 08. C8
        cmp     rdx, r10                                ; 0032 _ 4C: 39. D2
        mov     r9b, al                                 ; 0035 _ 41: 88. C1
        jc      ?_001                                   ; 0038 _ 72, E6
        jmp     ?_004                                   ; 003A _ EB, 06

?_002:  xor     eax, eax                                ; 003C _ 31. C0
        jmp     ?_005                                   ; 003E _ EB, 0C

?_003:  xor     eax, eax                                ; 0040 _ 31. C0
?_004:  movzx   ecx, al                                 ; 0042 _ 0F B6. C8
        xor     edx, edx                                ; 0045 _ 31. D2
        call    ct_u8_eq                                ; 0047 _ E8, 00000000(rel)
?_005:  nop                                             ; 004C _ 90
        add     rsp, 40                                 ; 004D _ 48: 83. C4, 28
        ret                                             ; 0051 _ C3
; ct_u8_slice_eq End of function

?_006:  ; Local function
        lea     rcx, [rel panic_bounds_check_loc2735]   ; 0052 _ 48: 8D. 0D, 00000000(rel)
        mov     r8, r10                                 ; 0059 _ 4D: 89. D0
        call    _ZN4core9panicking18panic_bounds_check17h19e9bbc59320a57eE; 005C _ E8, 00000000(rel)
        ud2                                             ; 0061 _ 0F 0B


SECTION .xdata  align=4 noexecute                       ; section number 15, const
;  Communal section not supported by YASM

        db 01H, 04H, 01H, 00H, 04H, 42H, 00H, 00H       ; 0000 _ .....B..


SECTION .text   align=16 execute                        ; section number 16, code
;  Communal section not supported by YASM

ct_u16_slice_eq:; Function begin
        sub     rsp, 40                                 ; 0000 _ 48: 83. EC, 28
        mov     r10, rdx                                ; 0004 _ 49: 89. D2
        cmp     r10, r9                                 ; 0007 _ 4D: 39. CA
        jnz     ?_009                                   ; 000A _ 75, 3A
        xor     r9d, r9d                                ; 000C _ 45: 31. C9
        test    r10, r10                                ; 000F _ 4D: 85. D2
        jz      ?_008                                   ; 0012 _ 74, 25
        xor     edx, edx                                ; 0014 _ 31. D2
; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16
?_007:  cmp     rdx, r10                                ; 0020 _ 4C: 39. D2
        jnc     ?_011                                   ; 0023 _ 73, 28
        mov     ax, word [r8+rdx*2]                     ; 0025 _ 66 41: 8B. 04 50
        xor     ax, word [rcx+rdx*2]                    ; 002A _ 66: 33. 04 51
        inc     rdx                                     ; 002E _ 48: FF. C2
        or      r9d, eax                                ; 0031 _ 41: 09. C1
        cmp     rdx, r10                                ; 0034 _ 4C: 39. D2
        jc      ?_007                                   ; 0037 _ 72, E7
?_008:  movzx   ecx, r9w                                ; 0039 _ 41: 0F B7. C9
        xor     edx, edx                                ; 003D _ 31. D2
        call    ct_u16_eq                               ; 003F _ E8, 00000000(rel)
        jmp     ?_010                                   ; 0044 _ EB, 02

?_009:  xor     eax, eax                                ; 0046 _ 31. C0
?_010:  add     rsp, 40                                 ; 0048 _ 48: 83. C4, 28
        ret                                             ; 004C _ C3
; ct_u16_slice_eq End of function

?_011:  ; Local function
        lea     rcx, [rel panic_bounds_check_loc2735]   ; 004D _ 48: 8D. 0D, 00000000(rel)
        mov     r8, r10                                 ; 0054 _ 4D: 89. D0
        call    _ZN4core9panicking18panic_bounds_check17h19e9bbc59320a57eE; 0057 _ E8, 00000000(rel)
        ud2                                             ; 005C _ 0F 0B


SECTION .xdata  align=4 noexecute                       ; section number 17, const
;  Communal section not supported by YASM

        db 01H, 04H, 01H, 00H, 04H, 42H, 00H, 00H       ; 0000 _ .....B..


SECTION .text   align=16 execute                        ; section number 18, code
;  Communal section not supported by YASM

ct_u32_slice_eq:; Function begin
        sub     rsp, 40                                 ; 0000 _ 48: 83. EC, 28
        mov     r10, rdx                                ; 0004 _ 49: 89. D2
        xor     eax, eax                                ; 0007 _ 31. C0
        cmp     r10, r9                                 ; 0009 _ 4D: 39. CA
        jnz     ?_014                                   ; 000C _ 75, 35
        test    r10, r10                                ; 000E _ 4D: 85. D2
        jz      ?_013                                   ; 0011 _ 74, 27
        xor     r9d, r9d                                ; 0013 _ 45: 31. C9
        xor     edx, edx                                ; 0016 _ 31. D2
; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16
?_012:  cmp     rdx, r10                                ; 0020 _ 4C: 39. D2
        jnc     ?_015                                   ; 0023 _ 73, 24
        mov     eax, dword [r8+rdx*4]                   ; 0025 _ 41: 8B. 04 90
        xor     eax, dword [rcx+rdx*4]                  ; 0029 _ 33. 04 91
        inc     rdx                                     ; 002C _ 48: FF. C2
        or      eax, r9d                                ; 002F _ 44: 09. C8
        cmp     rdx, r10                                ; 0032 _ 4C: 39. D2
        mov     r9d, eax                                ; 0035 _ 41: 89. C1
        jc      ?_012                                   ; 0038 _ 72, E6
?_013:  xor     edx, edx                                ; 003A _ 31. D2
        mov     ecx, eax                                ; 003C _ 89. C1
        call    ct_u32_eq                               ; 003E _ E8, 00000000(rel)
?_014:  nop                                             ; 0043 _ 90
        add     rsp, 40                                 ; 0044 _ 48: 83. C4, 28
        ret                                             ; 0048 _ C3
; ct_u32_slice_eq End of function

?_015:  ; Local function
        lea     rcx, [rel panic_bounds_check_loc2735]   ; 0049 _ 48: 8D. 0D, 00000000(rel)
        mov     r8, r10                                 ; 0050 _ 4D: 89. D0
        call    _ZN4core9panicking18panic_bounds_check17h19e9bbc59320a57eE; 0053 _ E8, 00000000(rel)
        ud2                                             ; 0058 _ 0F 0B


SECTION .xdata  align=4 noexecute                       ; section number 19, const
;  Communal section not supported by YASM

        db 01H, 04H, 01H, 00H, 04H, 42H, 00H, 00H       ; 0000 _ .....B..


SECTION .text   align=16 execute                        ; section number 20, code
;  Communal section not supported by YASM

ct_u64_slice_eq:; Function begin
        sub     rsp, 40                                 ; 0000 _ 48: 83. EC, 28
        mov     r10, rdx                                ; 0004 _ 49: 89. D2
        cmp     r10, r9                                 ; 0007 _ 4D: 39. CA
        jnz     ?_018                                   ; 000A _ 75, 3B
        xor     eax, eax                                ; 000C _ 31. C0
        test    r10, r10                                ; 000E _ 4D: 85. D2
        jz      ?_017                                   ; 0011 _ 74, 28
        xor     r9d, r9d                                ; 0013 _ 45: 31. C9
        xor     edx, edx                                ; 0016 _ 31. D2
; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16
?_016:  cmp     rdx, r10                                ; 0020 _ 4C: 39. D2
        jnc     ?_020                                   ; 0023 _ 73, 29
        mov     rax, qword [r8+rdx*8]                   ; 0025 _ 49: 8B. 04 D0
        xor     rax, qword [rcx+rdx*8]                  ; 0029 _ 48: 33. 04 D1
        inc     rdx                                     ; 002D _ 48: FF. C2
        or      rax, r9                                 ; 0030 _ 4C: 09. C8
        cmp     rdx, r10                                ; 0033 _ 4C: 39. D2
        mov     r9, rax                                 ; 0036 _ 49: 89. C1
        jc      ?_016                                   ; 0039 _ 72, E5
?_017:  xor     edx, edx                                ; 003B _ 31. D2
        mov     rcx, rax                                ; 003D _ 48: 89. C1
        call    ct_u64_eq                               ; 0040 _ E8, 00000000(rel)
        jmp     ?_019                                   ; 0045 _ EB, 02

?_018:  xor     eax, eax                                ; 0047 _ 31. C0
?_019:  add     rsp, 40                                 ; 0049 _ 48: 83. C4, 28
        ret                                             ; 004D _ C3
; ct_u64_slice_eq End of function

?_020:  ; Local function
        lea     rcx, [rel panic_bounds_check_loc2735]   ; 004E _ 48: 8D. 0D, 00000000(rel)
        mov     r8, r10                                 ; 0055 _ 4D: 89. D0
        call    _ZN4core9panicking18panic_bounds_check17h19e9bbc59320a57eE; 0058 _ E8, 00000000(rel)
        ud2                                             ; 005D _ 0F 0B


SECTION .xdata  align=4 noexecute                       ; section number 21, const
;  Communal section not supported by YASM

        db 01H, 04H, 01H, 00H, 04H, 42H, 00H, 00H       ; 0000 _ .....B..


SECTION .text   align=16 execute                        ; section number 22, code
;  Communal section not supported by YASM

ct_usize_slice_eq:; Function begin
        sub     rsp, 40                                 ; 0000 _ 48: 83. EC, 28
        mov     r10, rdx                                ; 0004 _ 49: 89. D2
        cmp     r10, r9                                 ; 0007 _ 4D: 39. CA
        jnz     ?_023                                   ; 000A _ 75, 3B
        xor     eax, eax                                ; 000C _ 31. C0
        test    r10, r10                                ; 000E _ 4D: 85. D2
        jz      ?_022                                   ; 0011 _ 74, 28
        xor     r9d, r9d                                ; 0013 _ 45: 31. C9
        xor     edx, edx                                ; 0016 _ 31. D2
; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16
?_021:  cmp     rdx, r10                                ; 0020 _ 4C: 39. D2
        jnc     ?_025                                   ; 0023 _ 73, 29
        mov     rax, qword [r8+rdx*8]                   ; 0025 _ 49: 8B. 04 D0
        xor     rax, qword [rcx+rdx*8]                  ; 0029 _ 48: 33. 04 D1
        inc     rdx                                     ; 002D _ 48: FF. C2
        or      rax, r9                                 ; 0030 _ 4C: 09. C8
        cmp     rdx, r10                                ; 0033 _ 4C: 39. D2
        mov     r9, rax                                 ; 0036 _ 49: 89. C1
        jc      ?_021                                   ; 0039 _ 72, E5
?_022:  xor     edx, edx                                ; 003B _ 31. D2
        mov     rcx, rax                                ; 003D _ 48: 89. C1
        call    ct_usize_eq                             ; 0040 _ E8, 00000000(rel)
        jmp     ?_024                                   ; 0045 _ EB, 02

?_023:  xor     eax, eax                                ; 0047 _ 31. C0
?_024:  add     rsp, 40                                 ; 0049 _ 48: 83. C4, 28
        ret                                             ; 004D _ C3
; ct_usize_slice_eq End of function

?_025:  ; Local function
        lea     rcx, [rel panic_bounds_check_loc2735]   ; 004E _ 48: 8D. 0D, 00000000(rel)
        mov     r8, r10                                 ; 0055 _ 4D: 89. D0
        call    _ZN4core9panicking18panic_bounds_check17h19e9bbc59320a57eE; 0058 _ E8, 00000000(rel)
        ud2                                             ; 005D _ 0F 0B


SECTION .xdata  align=4 noexecute                       ; section number 23, const
;  Communal section not supported by YASM

        db 01H, 04H, 01H, 00H, 04H, 42H, 00H, 00H       ; 0000 _ .....B..


SECTION .text   align=16 execute                        ; section number 24, code
;  Communal section not supported by YASM

ct_select_u8:; Function begin
        test    cl, cl                                  ; 0000 _ 84. C9
        cmove   edx, r8d                                ; 0002 _ 41: 0F 44. D0
        mov     eax, edx                                ; 0006 _ 89. D0
        ret                                             ; 0008 _ C3
; ct_select_u8 End of function


SECTION .xdata  align=4 noexecute                       ; section number 25, const
;  Communal section not supported by YASM

        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0000 _ ........


SECTION .text   align=16 execute                        ; section number 26, code
;  Communal section not supported by YASM

ct_select_u16:; Function begin
        test    cl, cl                                  ; 0000 _ 84. C9
        cmovne  r8w, dx                                 ; 0002 _ 66 44: 0F 45. C2
        mov     eax, r8d                                ; 0007 _ 44: 89. C0
        ret                                             ; 000A _ C3
; ct_select_u16 End of function


SECTION .xdata  align=4 noexecute                       ; section number 27, const
;  Communal section not supported by YASM

        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0000 _ ........


SECTION .text   align=16 execute                        ; section number 28, code
;  Communal section not supported by YASM

ct_select_u32:; Function begin
        test    cl, cl                                  ; 0000 _ 84. C9
        cmove   edx, r8d                                ; 0002 _ 41: 0F 44. D0
        mov     eax, edx                                ; 0006 _ 89. D0
        ret                                             ; 0008 _ C3
; ct_select_u32 End of function


SECTION .xdata  align=4 noexecute                       ; section number 29, const
;  Communal section not supported by YASM

        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0000 _ ........


SECTION .text   align=16 execute                        ; section number 30, code
;  Communal section not supported by YASM

ct_select_u64:; Function begin
        test    cl, cl                                  ; 0000 _ 84. C9
        cmove   rdx, r8                                 ; 0002 _ 49: 0F 44. D0
        mov     rax, rdx                                ; 0006 _ 48: 89. D0
        ret                                             ; 0009 _ C3
; ct_select_u64 End of function


SECTION .xdata  align=4 noexecute                       ; section number 31, const
;  Communal section not supported by YASM

        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0000 _ ........


SECTION .text   align=16 execute                        ; section number 32, code
;  Communal section not supported by YASM

ct_select_usize:; Function begin
        test    cl, cl                                  ; 0000 _ 84. C9
        cmove   rdx, r8                                 ; 0002 _ 49: 0F 44. D0
        mov     rax, rdx                                ; 0006 _ 48: 89. D0
        ret                                             ; 0009 _ C3
; ct_select_usize End of function


SECTION .xdata  align=4 noexecute                       ; section number 33, const
;  Communal section not supported by YASM

        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0000 _ ........


SECTION .text   align=16 execute                        ; section number 34, code
;  Communal section not supported by YASM

ct_copy_u8:; Function begin
        push    r15                                     ; 0000 _ 41: 57
        push    r14                                     ; 0002 _ 41: 56
        push    rsi                                     ; 0004 _ 56
        push    rdi                                     ; 0005 _ 57
        push    rbp                                     ; 0006 _ 55
        push    rbx                                     ; 0007 _ 53
        sub     rsp, 40                                 ; 0008 _ 48: 83. EC, 28
        mov     r14, r9                                 ; 000C _ 4D: 89. CE
        mov     rsi, r8                                 ; 000F _ 4C: 89. C6
        mov     rbx, rdx                                ; 0012 _ 48: 89. D3
        cmp     rsi, qword [rsp+80H]                    ; 0015 _ 48: 3B. B4 24, 00000080
        jnz     ?_029                                   ; 001D _ 75, 58
        test    rsi, rsi                                ; 001F _ 48: 85. F6
        jz      ?_027                                   ; 0022 _ 74, 32
        xor     edi, edi                                ; 0024 _ 31. FF
        movzx   r15d, cl                                ; 0026 _ 44: 0F B6. F9
; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_026:  cmp     rdi, rsi                                ; 0030 _ 48: 39. F7
        jnc     ?_028                                   ; 0033 _ 73, 2E
        lea     rbp, [rdi+1H]                           ; 0035 _ 48: 8D. 6F, 01
        movzx   r8d, byte [rbx+rdi]                     ; 0039 _ 44: 0F B6. 04 3B
        movzx   edx, byte [r14+rdi]                     ; 003E _ 41: 0F B6. 14 3E
        mov     ecx, r15d                               ; 0043 _ 44: 89. F9
        call    ct_select_u8                            ; 0046 _ E8, 00000000(rel)
        mov     byte [rbx+rdi], al                      ; 004B _ 88. 04 3B
        cmp     rbp, rsi                                ; 004E _ 48: 39. F5
        mov     rdi, rbp                                ; 0051 _ 48: 89. EF
        jc      ?_026                                   ; 0054 _ 72, DA
?_027:  add     rsp, 40                                 ; 0056 _ 48: 83. C4, 28
        pop     rbx                                     ; 005A _ 5B
        pop     rbp                                     ; 005B _ 5D
        pop     rdi                                     ; 005C _ 5F
        pop     rsi                                     ; 005D _ 5E
        pop     r14                                     ; 005E _ 41: 5E
        pop     r15                                     ; 0060 _ 41: 5F
        ret                                             ; 0062 _ C3

?_028:  lea     rcx, [rel panic_bounds_check_loc2737]   ; 0063 _ 48: 8D. 0D, 00000000(rel)
        mov     rdx, rdi                                ; 006A _ 48: 89. FA
        mov     r8, rsi                                 ; 006D _ 49: 89. F0
        call    _ZN4core9panicking18panic_bounds_check17h19e9bbc59320a57eE; 0070 _ E8, 00000000(rel)
        ud2                                             ; 0075 _ 0F 0B
; ct_copy_u8 End of function

?_029:  ; Local function
        lea     rcx, [rel _ZN3lib10ct_copy_u814_MSG_FILE_LINE17h64c7ea2d2318bf7eE]; 0077 _ 48: 8D. 0D, 00000000(rel)
        call    _ZN4core9panicking5panic17h53676c30b3bd95ebE; 007E _ E8, 00000000(rel)
        ud2                                             ; 0083 _ 0F 0B


SECTION .xdata  align=4 noexecute                       ; section number 35, const
;  Communal section not supported by YASM

        db 01H, 0CH, 07H, 00H, 0CH, 42H, 08H, 30H       ; 0000 _ .....B.0
        db 07H, 50H, 06H, 70H, 05H, 60H, 04H, 0E0H      ; 0008 _ .P.p.`..
        db 02H, 0F0H, 00H, 00H                          ; 0010 _ ....


SECTION .text   align=16 execute                        ; section number 36, code
;  Communal section not supported by YASM

ct_copy_u16:; Function begin
        push    r15                                     ; 0000 _ 41: 57
        push    r14                                     ; 0002 _ 41: 56
        push    rsi                                     ; 0004 _ 56
        push    rdi                                     ; 0005 _ 57
        push    rbp                                     ; 0006 _ 55
        push    rbx                                     ; 0007 _ 53
        sub     rsp, 40                                 ; 0008 _ 48: 83. EC, 28
        mov     r14, r9                                 ; 000C _ 4D: 89. CE
        mov     rsi, r8                                 ; 000F _ 4C: 89. C6
        mov     rbx, rdx                                ; 0012 _ 48: 89. D3
        cmp     rsi, qword [rsp+80H]                    ; 0015 _ 48: 3B. B4 24, 00000080
        jnz     ?_033                                   ; 001D _ 75, 59
        test    rsi, rsi                                ; 001F _ 48: 85. F6
        jz      ?_031                                   ; 0022 _ 74, 33
        xor     edi, edi                                ; 0024 _ 31. FF
        movzx   r15d, cl                                ; 0026 _ 44: 0F B6. F9
; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_030:  cmp     rdi, rsi                                ; 0030 _ 48: 39. F7
        jnc     ?_032                                   ; 0033 _ 73, 2F
        lea     rbp, [rdi+1H]                           ; 0035 _ 48: 8D. 6F, 01
        movzx   r8d, word [rbx+rdi*2]                   ; 0039 _ 44: 0F B7. 04 7B
        movzx   edx, word [r14+rdi*2]                   ; 003E _ 41: 0F B7. 14 7E
        mov     ecx, r15d                               ; 0043 _ 44: 89. F9
        call    ct_select_u16                           ; 0046 _ E8, 00000000(rel)
        mov     word [rbx+rdi*2], ax                    ; 004B _ 66: 89. 04 7B
        cmp     rbp, rsi                                ; 004F _ 48: 39. F5
        mov     rdi, rbp                                ; 0052 _ 48: 89. EF
        jc      ?_030                                   ; 0055 _ 72, D9
?_031:  add     rsp, 40                                 ; 0057 _ 48: 83. C4, 28
        pop     rbx                                     ; 005B _ 5B
        pop     rbp                                     ; 005C _ 5D
        pop     rdi                                     ; 005D _ 5F
        pop     rsi                                     ; 005E _ 5E
        pop     r14                                     ; 005F _ 41: 5E
        pop     r15                                     ; 0061 _ 41: 5F
        ret                                             ; 0063 _ C3

?_032:  lea     rcx, [rel panic_bounds_check_loc2737]   ; 0064 _ 48: 8D. 0D, 00000000(rel)
        mov     rdx, rdi                                ; 006B _ 48: 89. FA
        mov     r8, rsi                                 ; 006E _ 49: 89. F0
        call    _ZN4core9panicking18panic_bounds_check17h19e9bbc59320a57eE; 0071 _ E8, 00000000(rel)
        ud2                                             ; 0076 _ 0F 0B
; ct_copy_u16 End of function

?_033:  ; Local function
        lea     rcx, [rel _ZN3lib11ct_copy_u1614_MSG_FILE_LINE17h0720c751c1c65958E]; 0078 _ 48: 8D. 0D, 00000000(rel)
        call    _ZN4core9panicking5panic17h53676c30b3bd95ebE; 007F _ E8, 00000000(rel)
        ud2                                             ; 0084 _ 0F 0B


SECTION .xdata  align=4 noexecute                       ; section number 37, const
;  Communal section not supported by YASM

        db 01H, 0CH, 07H, 00H, 0CH, 42H, 08H, 30H       ; 0000 _ .....B.0
        db 07H, 50H, 06H, 70H, 05H, 60H, 04H, 0E0H      ; 0008 _ .P.p.`..
        db 02H, 0F0H, 00H, 00H                          ; 0010 _ ....


SECTION .text   align=16 execute                        ; section number 38, code
;  Communal section not supported by YASM

ct_copy_u32:; Function begin
        push    r15                                     ; 0000 _ 41: 57
        push    r14                                     ; 0002 _ 41: 56
        push    rsi                                     ; 0004 _ 56
        push    rdi                                     ; 0005 _ 57
        push    rbp                                     ; 0006 _ 55
        push    rbx                                     ; 0007 _ 53
        sub     rsp, 40                                 ; 0008 _ 48: 83. EC, 28
        mov     r14, r9                                 ; 000C _ 4D: 89. CE
        mov     rsi, r8                                 ; 000F _ 4C: 89. C6
        mov     rbx, rdx                                ; 0012 _ 48: 89. D3
        cmp     rsi, qword [rsp+80H]                    ; 0015 _ 48: 3B. B4 24, 00000080
        jnz     ?_037                                   ; 001D _ 75, 56
        test    rsi, rsi                                ; 001F _ 48: 85. F6
        jz      ?_035                                   ; 0022 _ 74, 30
        xor     edi, edi                                ; 0024 _ 31. FF
        movzx   r15d, cl                                ; 0026 _ 44: 0F B6. F9
; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_034:  cmp     rdi, rsi                                ; 0030 _ 48: 39. F7
        jnc     ?_036                                   ; 0033 _ 73, 2C
        lea     rbp, [rdi+1H]                           ; 0035 _ 48: 8D. 6F, 01
        mov     edx, dword [r14+rdi*4]                  ; 0039 _ 41: 8B. 14 BE
        mov     r8d, dword [rbx+rdi*4]                  ; 003D _ 44: 8B. 04 BB
        mov     ecx, r15d                               ; 0041 _ 44: 89. F9
        call    ct_select_u32                           ; 0044 _ E8, 00000000(rel)
        mov     dword [rbx+rdi*4], eax                  ; 0049 _ 89. 04 BB
        cmp     rbp, rsi                                ; 004C _ 48: 39. F5
        mov     rdi, rbp                                ; 004F _ 48: 89. EF
        jc      ?_034                                   ; 0052 _ 72, DC
?_035:  add     rsp, 40                                 ; 0054 _ 48: 83. C4, 28
        pop     rbx                                     ; 0058 _ 5B
        pop     rbp                                     ; 0059 _ 5D
        pop     rdi                                     ; 005A _ 5F
        pop     rsi                                     ; 005B _ 5E
        pop     r14                                     ; 005C _ 41: 5E
        pop     r15                                     ; 005E _ 41: 5F
        ret                                             ; 0060 _ C3

?_036:  lea     rcx, [rel panic_bounds_check_loc2737]   ; 0061 _ 48: 8D. 0D, 00000000(rel)
        mov     rdx, rdi                                ; 0068 _ 48: 89. FA
        mov     r8, rsi                                 ; 006B _ 49: 89. F0
        call    _ZN4core9panicking18panic_bounds_check17h19e9bbc59320a57eE; 006E _ E8, 00000000(rel)
        ud2                                             ; 0073 _ 0F 0B
; ct_copy_u32 End of function

?_037:  ; Local function
        lea     rcx, [rel _ZN3lib11ct_copy_u3214_MSG_FILE_LINE17h97069ea755197a67E]; 0075 _ 48: 8D. 0D, 00000000(rel)
        call    _ZN4core9panicking5panic17h53676c30b3bd95ebE; 007C _ E8, 00000000(rel)
        ud2                                             ; 0081 _ 0F 0B


SECTION .xdata  align=4 noexecute                       ; section number 39, const
;  Communal section not supported by YASM

        db 01H, 0CH, 07H, 00H, 0CH, 42H, 08H, 30H       ; 0000 _ .....B.0
        db 07H, 50H, 06H, 70H, 05H, 60H, 04H, 0E0H      ; 0008 _ .P.p.`..
        db 02H, 0F0H, 00H, 00H                          ; 0010 _ ....


SECTION .text   align=16 execute                        ; section number 40, code
;  Communal section not supported by YASM

ct_copy_u64:; Function begin
        push    r15                                     ; 0000 _ 41: 57
        push    r14                                     ; 0002 _ 41: 56
        push    rsi                                     ; 0004 _ 56
        push    rdi                                     ; 0005 _ 57
        push    rbp                                     ; 0006 _ 55
        push    rbx                                     ; 0007 _ 53
        sub     rsp, 40                                 ; 0008 _ 48: 83. EC, 28
        mov     r14, r9                                 ; 000C _ 4D: 89. CE
        mov     rsi, r8                                 ; 000F _ 4C: 89. C6
        mov     rbx, rdx                                ; 0012 _ 48: 89. D3
        cmp     rsi, qword [rsp+80H]                    ; 0015 _ 48: 3B. B4 24, 00000080
        jnz     ?_041                                   ; 001D _ 75, 57
        test    rsi, rsi                                ; 001F _ 48: 85. F6
        jz      ?_039                                   ; 0022 _ 74, 31
        xor     edi, edi                                ; 0024 _ 31. FF
        movzx   r15d, cl                                ; 0026 _ 44: 0F B6. F9
; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_038:  cmp     rdi, rsi                                ; 0030 _ 48: 39. F7
        jnc     ?_040                                   ; 0033 _ 73, 2D
        lea     rbp, [rdi+1H]                           ; 0035 _ 48: 8D. 6F, 01
        mov     rdx, qword [r14+rdi*8]                  ; 0039 _ 49: 8B. 14 FE
        mov     r8, qword [rbx+rdi*8]                   ; 003D _ 4C: 8B. 04 FB
        mov     ecx, r15d                               ; 0041 _ 44: 89. F9
        call    ct_select_u64                           ; 0044 _ E8, 00000000(rel)
        mov     qword [rbx+rdi*8], rax                  ; 0049 _ 48: 89. 04 FB
        cmp     rbp, rsi                                ; 004D _ 48: 39. F5
        mov     rdi, rbp                                ; 0050 _ 48: 89. EF
        jc      ?_038                                   ; 0053 _ 72, DB
?_039:  add     rsp, 40                                 ; 0055 _ 48: 83. C4, 28
        pop     rbx                                     ; 0059 _ 5B
        pop     rbp                                     ; 005A _ 5D
        pop     rdi                                     ; 005B _ 5F
        pop     rsi                                     ; 005C _ 5E
        pop     r14                                     ; 005D _ 41: 5E
        pop     r15                                     ; 005F _ 41: 5F
        ret                                             ; 0061 _ C3

?_040:  lea     rcx, [rel panic_bounds_check_loc2737]   ; 0062 _ 48: 8D. 0D, 00000000(rel)
        mov     rdx, rdi                                ; 0069 _ 48: 89. FA
        mov     r8, rsi                                 ; 006C _ 49: 89. F0
        call    _ZN4core9panicking18panic_bounds_check17h19e9bbc59320a57eE; 006F _ E8, 00000000(rel)
        ud2                                             ; 0074 _ 0F 0B
; ct_copy_u64 End of function

?_041:  ; Local function
        lea     rcx, [rel _ZN3lib11ct_copy_u6414_MSG_FILE_LINE17h681d4127c3bafbb0E]; 0076 _ 48: 8D. 0D, 00000000(rel)
        call    _ZN4core9panicking5panic17h53676c30b3bd95ebE; 007D _ E8, 00000000(rel)
        ud2                                             ; 0082 _ 0F 0B


SECTION .xdata  align=4 noexecute                       ; section number 41, const
;  Communal section not supported by YASM

        db 01H, 0CH, 07H, 00H, 0CH, 42H, 08H, 30H       ; 0000 _ .....B.0
        db 07H, 50H, 06H, 70H, 05H, 60H, 04H, 0E0H      ; 0008 _ .P.p.`..
        db 02H, 0F0H, 00H, 00H                          ; 0010 _ ....


SECTION .text   align=16 execute                        ; section number 42, code
;  Communal section not supported by YASM

ct_copy_usize:; Function begin
        push    r15                                     ; 0000 _ 41: 57
        push    r14                                     ; 0002 _ 41: 56
        push    rsi                                     ; 0004 _ 56
        push    rdi                                     ; 0005 _ 57
        push    rbp                                     ; 0006 _ 55
        push    rbx                                     ; 0007 _ 53
        sub     rsp, 40                                 ; 0008 _ 48: 83. EC, 28
        mov     r14, r9                                 ; 000C _ 4D: 89. CE
        mov     rsi, r8                                 ; 000F _ 4C: 89. C6
        mov     rbx, rdx                                ; 0012 _ 48: 89. D3
        cmp     rsi, qword [rsp+80H]                    ; 0015 _ 48: 3B. B4 24, 00000080
        jnz     ?_045                                   ; 001D _ 75, 57
        test    rsi, rsi                                ; 001F _ 48: 85. F6
        jz      ?_043                                   ; 0022 _ 74, 31
        xor     edi, edi                                ; 0024 _ 31. FF
        movzx   r15d, cl                                ; 0026 _ 44: 0F B6. F9
; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_042:  cmp     rdi, rsi                                ; 0030 _ 48: 39. F7
        jnc     ?_044                                   ; 0033 _ 73, 2D
        lea     rbp, [rdi+1H]                           ; 0035 _ 48: 8D. 6F, 01
        mov     rdx, qword [r14+rdi*8]                  ; 0039 _ 49: 8B. 14 FE
        mov     r8, qword [rbx+rdi*8]                   ; 003D _ 4C: 8B. 04 FB
        mov     ecx, r15d                               ; 0041 _ 44: 89. F9
        call    ct_select_usize                         ; 0044 _ E8, 00000000(rel)
        mov     qword [rbx+rdi*8], rax                  ; 0049 _ 48: 89. 04 FB
        cmp     rbp, rsi                                ; 004D _ 48: 39. F5
        mov     rdi, rbp                                ; 0050 _ 48: 89. EF
        jc      ?_042                                   ; 0053 _ 72, DB
?_043:  add     rsp, 40                                 ; 0055 _ 48: 83. C4, 28
        pop     rbx                                     ; 0059 _ 5B
        pop     rbp                                     ; 005A _ 5D
        pop     rdi                                     ; 005B _ 5F
        pop     rsi                                     ; 005C _ 5E
        pop     r14                                     ; 005D _ 41: 5E
        pop     r15                                     ; 005F _ 41: 5F
        ret                                             ; 0061 _ C3

?_044:  lea     rcx, [rel panic_bounds_check_loc2737]   ; 0062 _ 48: 8D. 0D, 00000000(rel)
        mov     rdx, rdi                                ; 0069 _ 48: 89. FA
        mov     r8, rsi                                 ; 006C _ 49: 89. F0
        call    _ZN4core9panicking18panic_bounds_check17h19e9bbc59320a57eE; 006F _ E8, 00000000(rel)
        ud2                                             ; 0074 _ 0F 0B
; ct_copy_usize End of function

?_045:  ; Local function
        lea     rcx, [rel _ZN3lib13ct_copy_usize14_MSG_FILE_LINE17h6013818c7296816eE]; 0076 _ 48: 8D. 0D, 00000000(rel)
        call    _ZN4core9panicking5panic17h53676c30b3bd95ebE; 007D _ E8, 00000000(rel)
        ud2                                             ; 0082 _ 0F 0B


SECTION .xdata  align=4 noexecute                       ; section number 43, const
;  Communal section not supported by YASM

        db 01H, 0CH, 07H, 00H, 0CH, 42H, 08H, 30H       ; 0000 _ .....B.0
        db 07H, 50H, 06H, 70H, 05H, 60H, 04H, 0E0H      ; 0008 _ .P.p.`..
        db 02H, 0F0H, 00H, 00H                          ; 0010 _ ....


SECTION .rdata  align=1 noexecute                       ; section number 44, const
;  Communal section not supported by YASM

str2734:                                                ; byte
        db 6CH, 69H, 62H, 2EH, 72H, 73H                 ; 0000 _ lib.rs


SECTION .rdata  align=8 noexecute                       ; section number 45, const
;  Communal section not supported by YASM

panic_bounds_check_loc2735:                             ; byte
        dq str2734                                      ; 0000 _ 0000000000000000 (d)
        dq 0000000000000006H                            ; 0008 _ 0000000000000006 
        dq 00000000000000CFH                            ; 0010 _ 00000000000000CF 


SECTION .rdata  align=8 noexecute                       ; section number 46, const
;  Communal section not supported by YASM

panic_bounds_check_loc2737:                             ; byte
        dq str2734                                      ; 0000 _ 0000000000000000 (d)
        dq 0000000000000006H                            ; 0008 _ 0000000000000006 
        dq 0000000000000136H                            ; 0010 _ 0000000000000136 


SECTION .rdata  align=16 noexecute                      ; section number 47, const
;  Communal section not supported by YASM

str2740:                                                ; byte
        db 43H, 6FH, 6EH, 73H, 69H, 73H, 74H, 65H       ; 0000 _ Consiste
        db 6EH, 74H, 20H, 54H, 69H, 6DH, 65H, 3AH       ; 0008 _ nt Time:
        db 20H, 41H, 74H, 74H, 65H, 6DH, 70H, 74H       ; 0010 _  Attempt
        db 65H, 64H, 20H, 74H, 6FH, 20H, 63H, 6FH       ; 0018 _ ed to co
        db 70H, 79H, 20H, 62H, 65H, 74H, 77H, 65H       ; 0020 _ py betwe
        db 65H, 6EH, 20H, 6EH, 6FH, 6EH, 2DH, 65H       ; 0028 _ en non-e
        db 71H, 75H, 61H, 6CH, 20H, 6CH, 65H, 6EH       ; 0030 _ qual len
        db 73H                                          ; 0038 _ s


SECTION .rdata  align=8 noexecute                       ; section number 48, const
;  Communal section not supported by YASM

_ZN3lib10ct_copy_u814_MSG_FILE_LINE17h64c7ea2d2318bf7eE: ; byte
        dq str2740                                      ; 0000 _ 0000000000000000 (d)
        dq 0000000000000039H                            ; 0008 _ 0000000000000039 
        dq str2734                                      ; 0010 _ 0000000000000000 (d)
        dq 0000000000000006H                            ; 0018 _ 0000000000000006 
        dq 0000000000000152H                            ; 0020 _ 0000000000000152 


SECTION .rdata  align=8 noexecute                       ; section number 49, const
;  Communal section not supported by YASM

_ZN3lib11ct_copy_u1614_MSG_FILE_LINE17h0720c751c1c65958E: ; byte
        dq str2740                                      ; 0000 _ 0000000000000000 (d)
        dq 0000000000000039H                            ; 0008 _ 0000000000000039 
        dq str2734                                      ; 0010 _ 0000000000000000 (d)
        dq 0000000000000006H                            ; 0018 _ 0000000000000006 
        dq 0000000000000154H                            ; 0020 _ 0000000000000154 


SECTION .rdata  align=8 noexecute                       ; section number 50, const
;  Communal section not supported by YASM

_ZN3lib11ct_copy_u3214_MSG_FILE_LINE17h97069ea755197a67E: ; byte
        dq str2740                                      ; 0000 _ 0000000000000000 (d)
        dq 0000000000000039H                            ; 0008 _ 0000000000000039 
        dq str2734                                      ; 0010 _ 0000000000000000 (d)
        dq 0000000000000006H                            ; 0018 _ 0000000000000006 
        dq 0000000000000156H                            ; 0020 _ 0000000000000156 


SECTION .rdata  align=8 noexecute                       ; section number 51, const
;  Communal section not supported by YASM

_ZN3lib11ct_copy_u6414_MSG_FILE_LINE17h681d4127c3bafbb0E: ; byte
        dq str2740                                      ; 0000 _ 0000000000000000 (d)
        dq 0000000000000039H                            ; 0008 _ 0000000000000039 
        dq str2734                                      ; 0010 _ 0000000000000000 (d)
        dq 0000000000000006H                            ; 0018 _ 0000000000000006 
        dq 0000000000000158H                            ; 0020 _ 0000000000000158 


SECTION .rdata  align=8 noexecute                       ; section number 52, const
;  Communal section not supported by YASM

_ZN3lib13ct_copy_usize14_MSG_FILE_LINE17h6013818c7296816eE: ; byte
        dq str2740                                      ; 0000 _ 0000000000000000 (d)
        dq 0000000000000039H                            ; 0008 _ 0000000000000039 
        dq str2734                                      ; 0010 _ 0000000000000000 (d)
        dq 0000000000000006H                            ; 0018 _ 0000000000000006 
        dq 000000000000015AH                            ; 0020 _ 000000000000015A 


