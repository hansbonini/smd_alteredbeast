;
; +-------------------------------------------------------------------------+
; |      This file was generated by The Interactive Disassembler (IDA)      |
; |           Copyright (c) 2023 Hex-Rays, <support@hex-rays.com>           |
; +-------------------------------------------------------------------------+
;
; Input SHA256 : 545F7C76FB5BD9B268FE1FC62A8310A90A3E00872B86AB475D09FFF98ABB3A74
; Input MD5    : 8FBB20569C0C1B3EC37DF655648DE824
; Input CRC32  : 4441EE1B
; Processor       : z80 []
; Target assembler: Zilog Macro Assembler
; ===========================================================================
; Segment type: Pure code
; Main segment
; =============== S U B R O U T I N E =======================================

YM2612_A0 EQU $4000
YM2612_D0 EQU $4001
PCM_ID EQU $017F
STACK EQU $1FFF

start:
                di
                ld      sp, STACK
                ld      a, 1
                ld      (PCM_ID), a
                ld      hl, pcm_audio
                ld      bc, pcm_audio_end-pcm_audio
                ld      a, 32h ; '2'
                ld      ($1D0F), a
                jp      loc_68
; ---------------------------------------------------------------------------
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                reti
; ---------------------------------------------------------------------------
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                retn
; ---------------------------------------------------------------------------

loc_68:                                 ; CODE XREF: start+14↑j
                call    sub_A6
                push    bc
                ld      a, 80h
                ld      c, 2Bh ; '+'
                call    sub_9B
                pop     bc
                ld      a, ($1D0F)

loc_77:                                 ; CODE XREF: start+8C↓j
                push    bc
                ld      b, a

loc_79:                                 ; CODE XREF: start:loc_79↓j
                djnz    $
                pop     bc
                push    af
                push    bc
                ld      a, (hl)
                ld      c, 2Ah ; '*'
                call    sub_9B
                pop     bc
                inc     hl
                dec     bc
                ld      a, b
                or      c
                jr      z, loc_8E
                pop     af
                jr      loc_77
; ---------------------------------------------------------------------------

loc_8E:                                 ; CODE XREF: start+89↑j
                xor     a
                ld      c, 2Bh ; '+'
                call    sub_9B

loc_94:                                 ; CODE XREF: start+98↓j
                xor     a
                ld      (PCM_ID), a
                jp      loc_94
; End of function start


; =============== S U B R O U T I N E =======================================


sub_9B:                                 ; CODE XREF: start+70↑p
                                        ; start+81↑p ...
                push    af
                ld      a, c
                ld      (YM2612_A0), a
                pop     af
                nop
                ld      (YM2612_D0), a
                ret
; End of function sub_9B


; =============== S U B R O U T I N E =======================================


sub_A6:                                 ; CODE XREF: start:loc_68↑p
                push    hl
                push    de
                push    bc
                ld      b, 7
                xor     a
                ld      c, 28h ; '('

loc_AE:                                 ; CODE XREF: sub_A6+C↓j
                call    sub_9B
                inc     a
                djnz    loc_AE
                pop     bc
                pop     de
                pop     hl
                ret
; End of function sub_A6

; ---------------------------------------------------------------------------
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
; ---------------------------------------------------------------------------
byte_17F:       db 0                    ; DATA XREF: start+6↑w
                                        ; start+95↑w
pcm_audio:                              ; DATA XREF: start+9↑o
                INCBIN "audio/pcm/0001CF56.pcm"
pcm_audio_end:
