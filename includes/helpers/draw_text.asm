draw_text:                              ; CODE XREF: ROM:0000BC00   p
                                        ; ROM:0000BF30   p ...
                move.w  (word_FFB106).w,d6
; End of function draw_text
sub_47F4:                               ; CODE XREF: ROM:0000BC0C   p
                move.l  (a6)+,d7
loc_47F6:                               ; CODE XREF: ROM:0000C0A6   p
                                        ; sub_C1EC+22   j
                                        ; DATA XREF: ...
                move.l  d7,(VDP_CTRL).l
loc_47FC:                               ; CODE XREF: sub_47F4+12   j
                move.b  (a6)+,d6
                beq.s   locret_4808
                move.w  d6,(VDP_DATA).l
                bra.s   loc_47FC
; ---------------------------------------------------------------------------
locret_4808:                            ; CODE XREF: sub_47F4+A   j
                rts
; End of function sub_47F4
