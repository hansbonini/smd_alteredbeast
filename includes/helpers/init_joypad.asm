init_joypad:                            ; CODE XREF: Reset+B0   p
                moveq   #$40,d0 ; '@'
                move.b  d0,(IO_CT1_CTRL+1).l
                move.b  d0,(IO_CT2_CTRL+1).l
                move.b  d0,(IO_EXT_CTRL+1).l
                rts
; End of function init_joypad
