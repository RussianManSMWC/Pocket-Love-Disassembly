;letter selection tilemap for name entries
NewGame_LetterSelectionTilemap_1D_6000:
dw $9880
db 20
db 12
db $02," "

;this is the functional part, as the game will refer to this when typing your names
InfoEntryScreen_CharacterMap_1D_6006:
db "あ か さ た な は ま や ら",$07
db $02," い き し ち に ひ み ",$7F," り",$07 ;uses VN space as one of the valid characters
db $02," う く す つ ぬ ふ む ゆ る",$07
db $02," え け せ て ね へ め ",$7F," れ",$07;uses VN space as one of the valid characters
db $02," お こ そ と の ほ も よ ろ",$07

db $02
ds 18, CHARVAL(" ")
db $07

db $02," わ ぁ っ が ざ だ ば ぱ ❤",$07
db $02," ",$7F," ぃ ゃ ぎ じ ぢ び ぴ !",$07;uses VN space as one of the valid characters
db $02," を ぅ ゅ ぐ ず づ ぶ ぷ ?",$07
db $02," ",$7F," ぇ ょ げ ぜ で べ ぺ ~",$07;uses VN space as one of the valid characters
db $02," ん ぉ ",$7F," ご ぞ ど ぼ ぽ -",$07;uses VN space as one of the valid characters
db $02,"               おわる",$07

EnterSecondNameStrings_1D_60F4:
dw $9822
db 17
db 2
db "みょうじ  を にゅうりょくして❤"
db "みょうじ =",$7F,$7F,$7F,$7F,"       " ;a bunch of VN spaces

EnterFirstNameStrings_1D_611A:
dw $9823
db 16
db 2
db "なまえ  を にゅうりょくして❤"
db "なまえ =           "

EnterNickNameStrings_1D_613E:
dw $9821
db 18
db 2
db "にっくね~む を にゅうりょくして❤"
db "にっくね~む=           "

EnterBirthMonthStrings_1D_6166:
dw $9821
db 18
db 2
db "うまれた月  を にゅうりょくして❤"
db "うまれた月  =  月       "

BirthMonthSelection_1D_618E:
dw $9882
db 3
db 12
db " 1月"
db " 2月"
db " 3月"
db " 4月"
db " 5月"
db " 6月"
db " 7月"
db " 8月"
db " 9月"
db "10月"
db "11月"
db "12月"

;used for birth date and blood type selections
ConfirmBirthInfoString_1D_61B6:
dw $99F0
db 3
db 1
db "おわる"

EnterBirthDayStrings_1D_61BD:
dw $9821
db 18
db 2
db "うまれた日  を にゅうりょくして❤"
db "うまれた日  =  日       "

BirthDaySelection_1Through10_1D_61E5:
dw $9882
db 3
db 10
db " 1日"
db " 2日"
db " 3日"
db " 4日"
db " 5日"
db " 6日"
db " 7日"
db " 8日"
db " 9日"
db "10日"

BirthDaySelection_11Through20_1D_6207:
dw $9888
db 3
db 10
db "11日"
db "12日"
db "13日"
db "14日"
db "15日"
db "16日"
db "17日"
db "18日"
db "19日"
db "20日"

;note: days 30 and 31 are added programmatically
BirthDaySelection_21Through29_1D_6229:
dw $988E
db 3
db 9
db "21日"
db "22日"
db "23日"
db "24日"
db "25日"
db "26日"
db "27日"
db "28日"
db "29日"

EnterBloodTypeStrings_1D_6248:
dw $9821
db 18
db 2
db "けつえきがた を にゅうりょくして❤"
db "けつえきがた =  がた      "

BloodTypeSelection_1D_6270:
dw $9882
db 4
db 4
db "A がた"
db "B がた"
db "ABがた"
db "O がた"

ConfirmBirthInfoString_1D_6284:
dw $9865
db 10
db 1
db "❤これで いいかな❤"

ConfirmBirthInfo_NameString_1D_6292:
dw $98C1
db 3
db 1
db "なまえ"

ConfirmBirthInfo_NickNameString_1D_6299:
dw $9901
db 6
db 1
db "にっくね~む"

ConfirmBirthInfo_BirthDateString_1D_62A3:
dw $9941
db 13
db 1
db "たんじょう日   月  日"

ConfirmBirthInfo_BloodTypeString_1D_62B4:
dw $9981
db 11
db 1
db "けつえきがた   がた"