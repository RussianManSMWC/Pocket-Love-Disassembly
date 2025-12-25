;calendar screen, weekdays
;monday through sunday graphics at the top
Calendar_Weekdays_1E_4073:
dw $9840
db 20
db 1
db $AA,$AB,$00,$AC,$AD,$00,$AE,$AF
db $00,$B0,$B1,$00,$B2,$B3,$00,$B4
db $B5,$00,$A8,$A9

;week days for the next month (Window layer)
Calendar_Weekdays_NextMonth_1E_408B:
dw $9C40
db 20
db 1
db $AA,$AB,$00,$AC,$AD,$00,$AE,$AF
db $00,$B0,$B1,$00,$B2,$B3,$00,$B4
db $B5,$00,$A8,$A9

Calendar_NextPageCursor_1E_40A3:
dw $9813
db 1
db 1
db $D1

Calendar_PreviousPageCursor_1E_40A8:
dw $9C00
db 1
db 1
db $DE