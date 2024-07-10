Reset:                                  ; DATA XREF: ROM:00000004   o
                move.b  (IO_PCBVER+1).l,d0
                andi.b  #$F,d0
                beq.s   loc_A5EA
                move.l  #'SEGA',(IO_TMSS).l
loc_A5EA:                               ; CODE XREF: Reset+A   j
                bsr.w   vdp_setup
                movea.l #RomEnd,a0
                move.l  (a0),d1
                addq.l  #1,d1
                movea.l #InvOpCode,a0
                sub.l   a0,d1
                asr.l   #1,d1
                move.w  d1,d2
                subq.w  #1,d2
                swap    d1
                moveq   #0,d0
loc_A60A:                               ; CODE XREF: Reset+38   j
                                        ; Reset+3C   j
                add.w   (a0)+,d0
                dbf     d2,loc_A60A
                dbf     d1,loc_A60A
                cmp.w   (Checksum).w,d0
                beq.s   loc_A632
                bsr.w   vdp_setup
loc_A61E:                               ; CODE XREF: Reset+5C   j
                move.l  #$C0000000,(VDP_CTRL).l ; DO_WRITE_TO_CRAM_AT_$0000_ADDR
                                        ; DO_OPERATION_WITHOUT_DMA
                move.w  #$E00,(VDP_DATA).l
                bra.s   loc_A61E
; ---------------------------------------------------------------------------
loc_A632:                               ; CODE XREF: Reset+44   j
                btst    #6,(IO_EXT_CTRL+1).l
                bne.w   loc_A668
                lea     (unk_FFFE00).w,a6
                moveq   #0,d7
                move.w  #$7F,d6
loc_A648:                               ; CODE XREF: Reset+76   j
                move.l  d7,(a6)+
                dbf     d6,loc_A648
                move.w  #CREDITS_3_LIVES_3,(LIVES).w
                lea     (BEAST).w,a6
                move.l  #3,(a6)+
                move.l  #$20001,(a6)+
                move.w  #0,(a6)+
loc_A668:                               ; CODE XREF: Reset+66   j
                move.l  #loc_A76A,(dword_FFB100).w
                lea     (unk_FFB000).w,a0
                move.w  #$F7F,d0
loc_A678:                               ; CODE XREF: Reset+A6   j
                clr.l   (a0)+
                dbf     d0,loc_A678
                jsr     (reset_z80).l
                bsr.w   init_joypad
                bsr.w   sub_44FC
                move.l  #$40000000,d7   ; DO_WRITE_TO_VRAM_AT_$0000_ADDR
                                        ; DO_OPERATION_WITHOUT_DMA
                move.w  #$1F,d6
                bsr.w   sub_4614
                andi    #$F8FF,sr
loc_A69E:                               ; CODE XREF: Reset+114   j
                                        ; Reset+13C   j
                cmpi.b  #$88,(word_FFB140+1).w
                bne.s   loc_A6EA
                tst.w   (dword_FFFE1A).w
                bne.s   loc_A6EA
                moveq   #0,d0
                btst    #1,(byte_FFB104).w
                bne.s   loc_A6BA
                move.w  (JOYPAD_STATE).w,d0
loc_A6BA:                               ; CODE XREF: Reset+E0   j
                btst    #2,(byte_FFB104).w
                bne.s   loc_A6C6
                or.w    (word_FFB146).w,d0
loc_A6C6:                               ; CODE XREF: Reset+EC   j
                btst    #7,d0
                beq.s   loc_A6DE
                lea     (unk_A01D09).l,a1
                not.b   (byte_FFB143).w
                beq.s   loc_A6DA
                subq.w  #1,a1
loc_A6DA:                               ; CODE XREF: Reset+102   j
                jsr     sub_488E(pc)
loc_A6DE:                               ; CODE XREF: Reset+F6   j
                tst.b   (byte_FFB143).w
                beq.s   loc_A6EA
                jsr     sub_A81A(pc)
                bra.s   loc_A69E
; ---------------------------------------------------------------------------
loc_A6EA:                               ; CODE XREF: Reset+D0   j
                                        ; Reset+D6   j ...
                clr.b   (byte_FFB143).w
                move.b  (word_FFB140).w,d0
                cmpi.b  #$FF,d0
                beq.w   loc_A702
                ori.w   #$FF00,d0
                move.w  d0,(word_FFB140).w
loc_A702:                               ; CODE XREF: Reset+122   j
                move.b  (word_FFB140+1).w,d0
                andi.l  #$7C,d0 ; '|'
                jsr     loc_A712(pc,d0.w)
                bra.s   loc_A69E
; End of function Reset
