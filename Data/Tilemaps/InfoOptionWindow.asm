InfoOptionWindow_1E_40AD:
dw $9C00
db 20
db 10

db $01
ds 18, $04
db $06

db $02,"しりたい じょうほう を えらんで ",$07
db $02,"ください              ",$07

db $02
ds 18, CHARVAL(" ")
db $07

db $02," たうんじょうほう         ",$07
db $02," しょじひん            ",$07
db $02," おんなのこのじょうほう      ",$07

db $02
ds 18, CHARVAL(" ")
db $07

db $02,"     A=けってい B=とりけし",$07

db $03
ds 18, $05
db $08