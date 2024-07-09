clear_vsram:                            ; CODE XREF: vdp_setup+38   p
                move.l  #$40000010,d7   ; DO_WRITE_TO_VSRAM_AT_$0000_ADDR
                                        ; DO_OPERATION_WITHOUT_DMA
                moveq   #$28,d6 ; '('
loc_4682:                               ; CODE XREF: vdp_setup+54   j
                moveq   #0,d5
                move.l  d7,(VDP_CTRL).l
loc_468A:                               ; CODE XREF: clear_vsram+16   j
                move.w  d5,(VDP_DATA).l
                dbf     d6,loc_468A
                rts
; End of function clear_vsram
