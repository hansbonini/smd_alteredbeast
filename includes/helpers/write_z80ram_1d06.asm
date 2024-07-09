write_z80ram_1d06:                      ; CODE XREF: ROM:00000F82   p
                                        ; ROM:00004D36   p ...
                tst.l   (dword_FFFE1A).w
                bne.s   locret_4B18
                move.w  #$100,(IO_Z80BUS).l
loc_4B00:                               ; CODE XREF: write_z80ram_1d06+16   j
                btst    #0,(IO_Z80BUS).l
                bne.s   loc_4B00
                move.b  d7,(byte_A01D06).l
                move.w  #0,(IO_Z80BUS).l
locret_4B18:                            ; CODE XREF: write_z80ram_1d06+4   j
                rts
; End of function write_z80ram_1d06
