load_pal:                               ; CODE XREF: sub_A48:loc_A6E   p
                                        ; ROM:loc_F18   p ...
                bset    #0,(byte_FFB14A).w
; End of function load_pal
sub_47B6:                               ; CODE XREF: ROM:00008BE6   p
                                        ; ROM:00008C54   p ...
                moveq   #0,d0
                moveq   #0,d1
                move.b  (a6)+,d0
                lea     (word_FFB080).w,a1
                adda.w  d0,a1
                move.b  (a6)+,d0
loc_47C4:                               ; CODE XREF: sub_47B6+10   j
                move.w  (a6)+,(a1)+
                dbf     d0,loc_47C4
                rts
; End of function sub_47B6
