IRQ1:                                   ; CODE XREF: IRQ1   j
                                        ; DATA XREF: ROM:00000064   o
                bra.s   IRQ1
; End of function IRQ1
; ---------------------------------------------------------------------------
aInt1:          dc.b 'int1'
