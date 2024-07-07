IRQ3:                                   ; CODE XREF: IRQ3   j
                                        ; DATA XREF: ROM:0000006C   o
                bra.s   IRQ3
; End of function IRQ3
; ---------------------------------------------------------------------------
aInt3:          dc.b 'int3'
