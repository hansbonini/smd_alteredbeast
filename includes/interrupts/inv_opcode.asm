InvOpCode:                              ; DATA XREF: ROM:00000008   o
                                        ; ROM:0000000C   o ...
                move.w  #$100,(IO_Z80BUS).l
                nop
                rte
; End of function InvOpCode
