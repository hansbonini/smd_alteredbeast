play_sound:                             ; CODE XREF: VBLANK+6E   p
                tst.w   (dword_FFFE1A).w
                beq.s   locret_49DA
                bmi.s   load_pcm
                move.b  (unk_FFFE20).w,d0
                andi.w  #$7F,d0
                cmpi.w  #$F,d0
                bhi.s   loc_49B6
                move.b  bgm_list(pc,d0.w),(unk_FFFE20).w
loc_49B6:                               ; CODE XREF: play_sound+14   j
                move.w  #$100,(IO_Z80BUS).l ; Send the Z80 a bus request
loc_49BE:                               ; CODE XREF: play_sound+2C   j
                btst    #0,(IO_Z80BUS).l
                bne.s   loc_49BE
                tst.b   (byte_A0017F).l
                beq.w   transfer_sounddriver_to_z80
                move.w  #0,(IO_Z80BUS).l ; Give the Z80 the bus back
locret_49DA:                            ; CODE XREF: play_sound+4   j
                rts
