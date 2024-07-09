loc_4924:                               ; CODE XREF: reset_z80+3A   j
                btst    #0,(IO_Z80BUS).l
                bne.s   loc_4924
transfer_sounddriver_to_z80:            ; CODE XREF: reset_z80+28   j
                                        ; play_bgm+34   j
                clr.l   (dword_FFFE1A).w
                clr.w   (word_FFFE26).w
                lea     (z80snd_driver).l,a5
                lea     (Z80_RAM).l,a6
                move.w  #$1CB,d0
loc_4946:                               ; CODE XREF: reset_z80+74   j
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
                dbf     d0,loc_4946
                lea     (byte_A01D03).l,a6
                lea     (dword_FFFE20).w,a5
                move.b  (a5),(a6)+
                move.b  (a5),(a6)+
loc_4978:                               ; CODE XREF: play_bgm+B2   j
                move.w  #0,(IO_Z80RES).l ; Disable the Z80 reset
                move.w  #0,(IO_Z80BUS).l ; Give the Z80 the bus back
                moveq   #9,d0
loc_498A:                               ; CODE XREF: reset_z80+9A   j
                nop
                dbf     d0,loc_498A
                move.w  #$100,(IO_Z80RES).l ; Reset the Z80
                rts
; End of function reset_z80
