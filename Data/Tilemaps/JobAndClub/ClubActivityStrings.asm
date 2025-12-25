ConfirmClubApplicationMessage_1E_4404:
dw $992B
db 7
db 2
db "くらぶかつどう"
db "しますか?  "

ClubApplicationWindowTilemap_1E_4416:
dw $9C00
db 20
db 10
db $01
ds 18, $04
db $06

db $02," くらぶを えらんで ください   ",$07

db $02
ds 18, CHARVAL(" ")
db $07

db $02,"ぶんかけい    たいいくかいけい ",$07
db $02," いご       やきゅう    ",$07
db $02," しゅげい     ばすけっと   ",$07
db $02," えいかいわ    さっか-    ",$07

db $02
ds 18, CHARVAL(" ")
db $07

db $02,"     A=けってい B=とりけし",$07

db $03
ds 18, $05
db $08

CantHaveJobAndClubMessage_1E_44E2:
dw $992B
db 8
db 4
db "あるばいと と "
db "くらぶかつどうは"
db "どうじに    "
db "できません   "

ClubActivityOptionStrings_1E_4506:
dw $994B
db 7
db 2
db " このくらぶを"
db " やめる   "

ConfirmLeavingClubMessage_1E_4518:
dw $992B
db 8
db 2
db "     ぶを "
db "たいぶしますか?"

AppliedToClubMessage_1E_452C:
dw $9C81
db 18
db 1
db "     ぶ に"
db " にゅうぶしました。"

QuitClubMessage_1E_4542:
dw $992B
db 8
db 2
db "     ぶ を"
db "たいぶしました。"