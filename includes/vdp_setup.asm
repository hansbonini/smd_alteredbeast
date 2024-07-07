vdp_setup:                              ; CODE XREF: Reset:loc_A5EA   p
                                        ; Reset+46   p ...
                lea     (vdpregs_A892).l,a0
                moveq   #$10,d0
loc_A842:                               ; CODE XREF: vdp_setup+E   j
                move.w  (a0)+,(VDP_CTRL).l
                dbf     d0,loc_A842
                lea     (vdpregs_A892).l,a0
                lea     (unk_FFB10A).w,a1
                move.l  (a0)+,(a1)+
                move.l  (a0)+,(a1)+
                move.w  (a0)+,(a1)+
                move.l  #$C0000000,(VDP_CTRL).l ; DO_WRITE_TO_CRAM_AT_$0000_ADDR
                                        ; DO_OPERATION_WITHOUT_DMA
                move.w  #0,(VDP_DATA).l
loc_A86E:                               ; CODE XREF: ROM:00009236   p
                                        ; ROM:00009852   p ...
                bsr.w   sub_45BE
                bsr.w   sub_467A
                bsr.w   sub_45CC
                bsr.w   sub_45EE
                bsr.w   sub_45F8
                bsr.w   sub_4606
                move.l  #$40000000,d7   ; DO_WRITE_TO_VRAM_AT_$0000_ADDR
                                        ; DO_OPERATION_WITHOUT_DMA
                moveq   #$F,d6
                bra.w   loc_4682
; End of function vdp_setup
