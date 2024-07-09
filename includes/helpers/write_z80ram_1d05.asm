write_z80ram_1d05:                      ; CODE XREF: ROM:00000382   p
                                        ; ROM:0000039C   p ...
                tst.l   (dword_FFFE1A).w
                bne.s   locret_4B40
                move.w  #$100,(IO_Z80BUS).l
loc_4B28:                               ; CODE XREF: write_z80ram_1d05+16   j
                btst    #0,(IO_Z80BUS).l
                bne.s   loc_4B28
                move.b  d7,(byte_A01D05).l
                move.w  #0,(IO_Z80BUS).l
locret_4B40:                            ; CODE XREF: write_z80ram_1d05+4   j
                rts
; End of function write_z80ram_1d05
