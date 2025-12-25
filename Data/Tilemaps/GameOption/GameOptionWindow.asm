OptionsWindow_1E_4294:
dw $9C00
db 20
db 10
db $01
ds 18, $04
db $06

db $02," どの しょりを しますか?    ",$07

db $02
ds 18, CHARVAL(" ")
db $07

db $02
ds 18, CHARVAL(" ")
db $07

db $02," し-でぃ- との りんく     ",$07
db $02," にっき を けす         ",$07

db $02
ds 18, CHARVAL(" ")
db $07

db $02
ds 18, CHARVAL(" ")
db $07

db $02,"     A=けってい B=とりけし",$07

db $03
ds 18, $05
db $08
