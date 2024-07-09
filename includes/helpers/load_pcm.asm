load_pcm:                               ; CODE XREF: play_bgm+6   j
                bclr    #7,(dword_FFFE1A).w
                move.w  (dword_FFFE1A).w,d0
                add.w   d0,d0
                add.w   (dword_FFFE1A).w,d0
                add.w   d0,d0
                lea     loc_4A46+4(pc,d0.w),a5
                move.w  (a5)+,d0
                movea.l (a5),a5
                move.w  (word_FFFE1E).w,d7
                move.w  #$100,(IO_Z80BUS).l
loc_4A12:                               ; CODE XREF: play_bgm+80   j
                btst    #0,(IO_Z80BUS).l
                bne.s   loc_4A12
                lea     (Z80_RAM).l,a6
loc_4A22:                               ; CODE XREF: play_bgm+A8   j
                move.b  (a5)+,(a6)+
                move.b  (a5)+,(a6)+
                move.b  (a5)+,(a6)+
                move.b  (a5)+,(a6)+
                move.b  (a5)+,(a6)+
                move.b  (a5)+,(a6)+
                move.b  (a5)+,(a6)+
                move.b  (a5)+,(a6)+
                move.b  (a5)+,(a6)+
                move.b  (a5)+,(a6)+
                move.b  (a5)+,(a6)+
                move.b  (a5)+,(a6)+
                move.b  (a5)+,(a6)+
                move.b  (a5)+,(a6)+
                move.b  (a5)+,(a6)+
                move.b  (a5)+,(a6)+
                dbf     d0,loc_4A22
loc_4A46:                               ; DATA XREF: play_bgm+64   o
                move.b  d7,(byte_A0017F).l
                bra.w   loc_4978
; End of function play_bgm
; ---------------------------------------------------------------------------
dacdriver_list: dc.w $1C4               ; entries.size
                dc.l pcm_1              ; entries.offset
                dc.w $1E8               ; entries.size
                dc.l pcm_2              ; entries.offset
                dc.w $1F6               ; entries.size
                dc.l pcm_3              ; entries.offset
                dc.w $1F8               ; entries.size
                dc.l pcm_4              ; entries.offset
                dc.w $1D3               ; entries.size
                dc.l pcm_5              ; entries.offset
                dc.w $1F8               ; entries.size
                dc.l pcm_6              ; entries.offset
