HBLANK:                                 ; DATA XREF: ROM:00000070   o
                movem.l d0/a0,-(sp)
                movea.l (dword_FFB100).w,a0
                jmp     (a0)
; End of function HBLANK
