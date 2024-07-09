reset_z80:                              ; CODE XREF: Reset+AA   p
                                        ; ROM:screen_segalogo   p ...
                move.l  #$80000000,(dword_FFFE20).w
loc_48FA:                               ; CODE XREF: ROM:0000BAE4   p
                                        ; DATA XREF: ROM:0000BAE4   o
                move.w  #$100,(IO_Z80BUS).l ; Send the Z80 a bus request
                move.w  #0,(IO_Z80RES).l ; Disable the Z80 reset
                moveq   #9,d0
loc_490C:                               ; CODE XREF: reset_z80+1C   j
                nop
                dbf     d0,loc_490C
                move.w  #$100,(IO_Z80RES).l ; Reset the Z80
                bra.s   transfer_sounddriver_to_z80
