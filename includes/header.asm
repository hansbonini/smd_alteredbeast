CopyRights:     dc.b 'SEGA MEGA DRIVE (C)SEGA 1989.JAN'
DomesticName:   dc.b $8F, $62, $89, $A4, $8B, $4C, $20, $20, $20, $20 ; '獣王記                                          '
                dc.b $20, $20, $20, $20, $20, $20, $20, $20, $20, $20
                dc.b $20, $20, $20, $20, $20, $20, $20, $20, $20, $20
                dc.b $20, $20, $20, $20, $20, $20, $20, $20, $20, $20
                dc.b $20, $20, $20, $20, $20, $20, $20, $20
OverseasName:   dc.b 'ALTERD BEAST                                    '
ProductCode:    dc.b 'GM 00054002-02'
Checksum:       dc.w $E89B              ; DATA XREF: Reset+40   r
Peripherials:   dc.b 'J               '
RomStart:       dc.l start
RomEnd:         dc.l end                ; DATA XREF: Reset+1A   o
RamStart:       dc.l M68K_RAM&$FFFFFF
RamEnd:         dc.l unk_FFFFFF&$FFFFFF
SramCode:       dc.b $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
ModemCode:      dc.b $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
Reserved:       dc.b $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
                dc.b $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
                dc.b $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
                dc.b $20
CountryCode:    dc.b 'JU              '
