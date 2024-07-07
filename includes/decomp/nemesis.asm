nemesis_decomp:                         ; CODE XREF: ROM:0000BB90   p
                movem.l d0-d7/a0-a1/a3-a5,-(sp)
                lea     (loc_C328).l,a3
                lea     (VDP_DATA).l,a4
                bra.s   loc_C2B8
; ---------------------------------------------------------------------------
                movem.l d0-d7/a0-a1/a3-a5,-(sp)
                lea     (loc_C33E).l,a3
loc_C2B8:                               ; CODE XREF: nemesis_decomp+10   j
                lea     (unk_FFA000).w,a1
                move.w  (a0)+,d2
                add.w   d2,d2
                bcc.s   loc_C2C6
                adda.w  #$A,a3
loc_C2C6:                               ; CODE XREF: nemesis_decomp+24   j
                lsl.w   #2,d2
                movea.w d2,a5
                moveq   #8,d3
                moveq   #0,d2
                moveq   #0,d4
                bsr.w   sub_C358
                move.b  (a0)+,d5
                asl.w   #8,d5
                move.b  (a0)+,d5
                move.w  #$10,d6
loc_C2DE:                               ; CODE XREF: nemesis_decomp+7C   j
                moveq   #8,d0
                bsr.w   sub_C3BA
                cmpi.w  #$FC,d1
                bcc.s   loc_C31A
                add.w   d1,d1
                move.b  (a1,d1.w),d0
                ext.w   d0
                bsr.w   sub_C3CE
                move.b  1(a1,d1.w),d1
loc_C2FA:                               ; CODE XREF: nemesis_decomp+8A   j
                move.w  d1,d0
                andi.w  #$F,d1
                andi.w  #$F0,d0
                lsr.w   #4,d0
loc_C306:                               ; CODE XREF: nemesis_decomp:loc_C314   j
                lsl.l   #4,d4
                or.b    d1,d4
                subq.w  #1,d3
                bne.s   loc_C314
                jmp     (a3)
; ---------------------------------------------------------------------------
loc_C310:                               ; CODE XREF: ROM:0000C32E   j
                                        ; ROM:0000C33A   j ...
                moveq   #0,d4
                moveq   #8,d3
loc_C314:                               ; CODE XREF: nemesis_decomp+70   j
                dbf     d0,loc_C306
                bra.s   loc_C2DE
; ---------------------------------------------------------------------------
loc_C31A:                               ; CODE XREF: nemesis_decomp+4C   j
                moveq   #6,d0
                bsr.w   sub_C3CE
                moveq   #7,d0
                bsr.w   sub_C3CA
                bra.s   loc_C2FA
; End of function nemesis_decomp
; ---------------------------------------------------------------------------
loc_C328:                               ; DATA XREF: nemesis_decomp+4   o
                move.l  d4,(a4)
                subq.w  #1,a5
                move.w  a5,d4
                bne.s   loc_C310
                bra.s   loc_C352
; ---------------------------------------------------------------------------
                eor.l   d4,d2
                move.l  d2,(a4)
                subq.w  #1,a5
                move.w  a5,d4
                bne.s   loc_C310
                bra.s   loc_C352
; ---------------------------------------------------------------------------
loc_C33E:                               ; DATA XREF: nemesis_decomp+16   o
                move.l  d4,(a4)+
                subq.w  #1,a5
                move.w  a5,d4
                bne.s   loc_C310
                bra.s   loc_C352
; ---------------------------------------------------------------------------
                eor.l   d4,d2
                move.l  d2,(a4)+
                subq.w  #1,a5
                move.w  a5,d4
                bne.s   loc_C310
loc_C352:                               ; CODE XREF: ROM:0000C330   j
                                        ; ROM:0000C33C   j ...
                movem.l (sp)+,d0-d7/a0-a1/a3-a5
                rts
sub_C358:                               ; CODE XREF: nemesis_decomp+34   p
                move.b  (a0)+,d0
loc_C35A:                               ; CODE XREF: sub_C358+E   j
                cmpi.b  #$FF,d0
                bne.s   loc_C362
                rts
; ---------------------------------------------------------------------------
loc_C362:                               ; CODE XREF: sub_C358+6   j
                move.w  d0,d7
loc_C364:                               ; CODE XREF: sub_C358+34   j
                                        ; sub_C358:loc_C3A8   j
                move.b  (a0)+,d0
                bmi.s   loc_C35A
                move.b  d0,d1
                andi.w  #$F,d7
                andi.w  #$70,d1 ; 'p'
                or.w    d1,d7
                andi.w  #$F,d0
                move.b  d0,d1
                lsl.w   #8,d1
                or.w    d1,d7
                moveq   #8,d1
                sub.w   d0,d1
                bne.s   loc_C38E
                move.b  (a0)+,d0
                add.w   d0,d0
                move.w  d7,(a1,d0.w)
                bra.s   loc_C364
; ---------------------------------------------------------------------------
loc_C38E:                               ; CODE XREF: sub_C358+2A   j
                move.b  (a0)+,d0
                lsl.w   d1,d0
                add.w   d0,d0
                moveq   #1,d5
                lsl.w   d1,d5
                subq.w  #1,d5
                lea     (a1,d0.w),a1
loc_C39E:                               ; CODE XREF: sub_C358+48   j
                move.w  d7,(a1)+
                dbf     d5,loc_C39E
                lea     (unk_FFA000).w,a1
loc_C3A8:
                bra.s   loc_C364
; End of function sub_C358
; ---------------------------------------------------------------------------
                dc.w 1, 3, 7, $F, $1F, $3F, $7F, $FF
sub_C3BA:                               ; CODE XREF: nemesis_decomp+44   p
                                        ; sub_C3CA   p
                move.w  d6,d7
                sub.w   d0,d7
                move.w  d5,d1
                lsr.w   d7,d1
                add.w   d0,d0
                and.w   loc_C3A8(pc,d0.w),d1
                rts
; End of function sub_C3BA
sub_C3CA:                               ; CODE XREF: nemesis_decomp+86   p
                bsr.s   sub_C3BA
                lsr.w   #1,d0
; End of function sub_C3CA
sub_C3CE:                               ; CODE XREF: nemesis_decomp+56   p
                                        ; nemesis_decomp+80   p
                sub.w   d0,d6
                cmpi.w  #9,d6
                bcc.s   locret_C3DC
                addq.w  #8,d6
                asl.w   #8,d5
                move.b  (a0)+,d5
locret_C3DC:                            ; CODE XREF: sub_C3CE+6   j
                rts
; End of function sub_C3CE
