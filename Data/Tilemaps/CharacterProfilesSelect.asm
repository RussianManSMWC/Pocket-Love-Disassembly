;tilemaps used before you pick anyone

CharacterProfile_ChooseCharacterMessage_1E_41D5:
dw $9821
db 17
db 2
db "しりたい おんなのこ を えらんで"
db "ください             "

;unused tilemap data intended to be used at the bottom, but the game uses general A/B prompt string, rendering this redundant
CharacterProfile_AAndBPrompt_1E_41FB:
dw $9A00
db 20
db 2
db $02,"     A=けってい B=とりけし",$07

db $03
ds 18, $05
db $08

CharacterProfile_HaventMetAnyoneMessage_1E_4227:
dw $9882
db 15
db 1
db "だれとも しりあっていません。"