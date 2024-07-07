VBLANK:                                 ; DATA XREF: ROM:00000078   o
                movem.l d0-d7/a0-a6,-(sp)
                tst.w   (word_FFB198).w
                beq.s   loc_A782
                move.w  #$9202,(VDP_CTRL).l ; MOVE_WINDOW_VERT_LEFT
                                        ; MOVE_BY_2_CELLS
loc_A782:                               ; CODE XREF: VBLANK+8   j
                btst    #0,(byte_FFB154).w
                beq.s   loc_A7AA
                jsr     (sub_3F58).l
                move.l  #$94019340,d0   ; SET_LOWER_BYTE_OF_DMA_LEN_TO_$40
                                        ; SET_HIGHER_BYTE_OF_DMA_LEN_TO_$01
                move.l  #$96DC9500,d1   ; SET_LOWER_BYTE_OF_DMA_SRC_TO_$00
                                        ; SET_MIDDLE_BYTE_OF_DMA_SRC_TO_$DC
                move.w  #$977F,d2
                move.l  #$826800,d3
                jsr     (unk_FFF200).w
loc_A7AA:                               ; CODE XREF: VBLANK+18   j
                bsr.w   sub_47CC
                cmpi.b  #$88,(word_FFB140+1).w
                bne.s   loc_A7BC
                tst.b   (byte_FFB154).w
                beq.s   loc_A7C0
loc_A7BC:                               ; CODE XREF: VBLANK+44   j
                bsr.w   sub_483A
loc_A7C0:                               ; CODE XREF: VBLANK+4A   j
                btst    #1,(byte_FFB154).w
                beq.s   loc_A7DA
                move.b  (word_FFB140+1).w,d0
                btst    #7,d0
                beq.s   loc_A7DA
                andi.w  #$3C,d0 ; '<'
                jsr     loc_A7EA(pc,d0.w)
loc_A7DA:                               ; CODE XREF: VBLANK+56   j
                                        ; VBLANK+60   j
                clr.b   (byte_FFB154).w
                jsr     (sub_499A).l
                movem.l (sp)+,d0-d7/a0-a6
locret_A7E8:                            ; CODE XREF: ROM:loc_A7EA   j
                rte
; End of function VBLANK
