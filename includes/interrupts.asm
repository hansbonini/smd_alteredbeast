; Processor       : 68020
; Target assembler: 680x0 Assembler in MRI compatible mode
; This file should be compiled with "as -M"
; ===========================================================================
; Segment type: Pure code
; segment "ROM"
; ROM segment
start:          dc.l unk_FFFE00&$FFFFFF ; DATA XREF: ROM:RomStart   o
                                        ; sub_A8E8+8   r
                dc.l Reset
                dc.l InvOpCode
                dc.l InvOpCode
off_10:         dc.l InvOpCode
off_14:         dc.l Reserv3F
off_18:         dc.l Reserv3F
off_1C:         dc.l Reserv3F           ; DATA XREF: sub_3B46:loc_3BAA   w
off_20:         dc.l Reserv3F
                dc.l Reserv3F
                dc.l Reserv3F
                dc.l Reserv3F
                dc.l Reserv3F
                dc.l Reserv3F
                dc.l Reserv3F
                dc.l Reserv3F
                dc.l Reserv3F
                dc.l Reserv3F
                dc.l Reserv3F
                dc.l Reserv3F
off_50:         dc.l Reserv3F
                dc.l Reserv3F
                dc.l Reserv3F
                dc.l Reserv3F
off_60:         dc.l Reserv3F
                dc.l IRQ1
off_68:         dc.l EXT
                dc.l IRQ3
                dc.l HBLANK
                dc.l IRQ5
                dc.l VBLANK
                dc.l IRQ7
off_80:         dc.l Trap15
                dc.l Trap15
                dc.l Trap15
off_8C:         dc.l Trap15
                dc.l Trap15
                dc.l Trap15
                dc.l Trap15
                dc.l Trap15
                dc.l Trap15
off_A4:         dc.l Trap15
                dc.l Trap15
off_AC:         dc.l Trap15
                dc.l Trap15
                dc.l Trap15
                dc.l Trap15
                dc.l Trap15
                dc.l Reserv3F
                dc.l Reserv3F
                dc.l Reserv3F
                dc.l Reserv3F
                dc.l Reserv3F
                dc.l Reserv3F
                dc.l Reserv3F
                dc.l Reserv3F
                dc.l Reserv3F
                dc.l Reserv3F
                dc.l Reserv3F
                dc.l Reserv3F
                dc.l Reserv3F
                dc.l Reserv3F
                dc.l Reserv3F
off_FC:         dc.l Reserv3F
