segard_decomp:                          ; CODE XREF: ROM:00008C08   p
                                        ; ROM:00008C20   p ...
                lea     (SEGARD_DECOMP_BUFFER).w,a4
                lea     (VDP_DATA).l,a5
loc_46FE:                               ; CODE XREF: segard_decomp+64   j
                moveq   #0,d0
                moveq   #0,d2
                move.b  (a0)+,d2
                beq.s   loc_4736
                bmi.s   locret_475A
                subq.w  #1,d2
loc_470A:                               ; CODE XREF: segard_decomp+38   j
                movea.l a4,a2
                move.b  (a0)+,d3
                move.b  (a0)+,d4
                lsl.w   #8,d4
                move.b  (a0)+,d4
                swap    d4
                move.b  (a0)+,d4
                lsl.w   #8,d4
                move.b  (a0)+,d4
                or.l    d4,d0
                moveq   #$1F,d7
loc_4720:                               ; CODE XREF: segard_decomp+34   j
                lsl.l   #1,d4
                bcc.s   loc_4726
                move.b  d3,(a2)
loc_4726:                               ; CODE XREF: segard_decomp+2E   j
                addq.w  #1,a2
                dbf     d7,loc_4720
                dbf     d2,loc_470A
                moveq   #$FFFFFFFF,d1
                eor.l   d0,d1
                beq.s   loc_4746
loc_4736:                               ; CODE XREF: segard_decomp+10   j
                movea.l a4,a3
                moveq   #$1F,d7
loc_473A:                               ; CODE XREF: segard_decomp+4E   j
                add.l   d0,d0
                bcs.s   loc_4740
                move.b  (a0)+,(a3)
loc_4740:                               ; CODE XREF: segard_decomp+48   j
                addq.w  #1,a3
                dbf     d7,loc_473A
loc_4746:                               ; CODE XREF: segard_decomp+40   j
                movea.l a4,a6
                move.l  (a6)+,(a5)
                move.l  (a6)+,(a5)
                move.l  (a6)+,(a5)
                move.l  (a6)+,(a5)
                move.l  (a6)+,(a5)
                move.l  (a6)+,(a5)
                move.l  (a6)+,(a5)
                move.l  (a6)+,(a5)
                bra.s   loc_46FE
; ---------------------------------------------------------------------------
locret_475A:                            ; CODE XREF: segard_decomp+12   j
                                        ; sub_475C+E   j
                rts
; End of function segard_decomp
