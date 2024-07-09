read_joypad:                            ; CODE XREF: VBLANK:loc_A7BC   p
                lea     (JOYPAD_STATE).w,a0
                lea     ((IO_CT1_DATA+1)).l,a1
                bsr.w   sub_484E
                lea     ((IO_CT2_DATA+1)).l,a1
; End of function read_joypad
sub_484E:                               ; CODE XREF: read_joypad+A   p
                move.b  #0,(a1)
                nop
                nop
                nop
                move.b  (a1),d1
                nop
                nop
                nop
                move.b  #$40,(a1) ; '@'
                asl.w   #2,d1
                move.w  d1,d2
                move.b  (a1),d0
                andi.w  #$30,d2 ; '0'
                beq.w   loc_4876
                move.w  #$FF,d1
loc_4876:                               ; CODE XREF: sub_484E+20   j
                andi.w  #$3F,d0 ; '?'
                andi.w  #$C0,d1
                or.w    d1,d0
                not.w   d0
                eor.b   d0,(a0)
                move.b  (a0),d1
                move.b  d0,(a0)+
                and.w   d1,d0
                move.b  d0,(a0)+
                rts
; End of function sub_484E
