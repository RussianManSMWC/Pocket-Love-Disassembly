DateTodayMessage_1E_4B04:
dw $99A1
db 4
db 1
db "きょうは"

DateCharacterNameTilemapLocation_1E_4B0C:
dw $99A5
db 1+CharacterName_MaxLength
db 1

DatePlaceWentToMessage_1E_4B10:
dw $99AE
db 1
db 1
db "と"

DateSpotNameYouWentToTilemapLocation_1E_4B15:
dw $99C1
db PlaceName_MaxLength
db 1

WentToDateSpotLastMessage_1E_4B19:
dw $99E1
db 7
db 1
db "で で~とだ!"

MapWhereToGoOnDateMessage_1E_4B24:
dw $99A1
db 14
db 1
db "それじゃ どこにいこうかな?"