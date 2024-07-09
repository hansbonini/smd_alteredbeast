write_z80ram_1d03:                      ; CODE XREF: ROM:00004F52   j
                                        ; ROM:00008D12   j ...
                tst.w   (dword_FFFE1A).w
                bne.s   loc_4AEC
                move.w  #$100,(IO_Z80BUS).l
loc_4AD4:                               ; CODE XREF: write_z80ram_1d03+16   j
                btst    #0,(IO_Z80BUS).l
                bne.s   loc_4AD4
                move.b  d7,(byte_A01D03).l
                move.w  #0,(IO_Z80BUS).l
loc_4AEC:                               ; CODE XREF: write_z80ram_1d03+4   j
                move.b  d7,(dword_FFFE20).w
                rts
; End of function write_z80ram_1d03
