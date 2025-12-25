;Note: drawn specifically at the schedule screen, VN sections draw it in a different manner
;top (time, money display)
ScheduleScreen_StatusBar_1E_5BB7:
dw $9800
db 20
db 3
db $01
ds 18, $04
db $06

db $02,"  月  日( )        円",$07

db $03
ds 18, $05
db $08