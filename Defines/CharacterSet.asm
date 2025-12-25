;general character map that applies everywhere
NEWCHARMAP General
CHARMAP "あ",$09
CHARMAP "い",$0A
CHARMAP "う",$0B
CHARMAP "え",$0C
CHARMAP "お",$0D
CHARMAP "か",$0E
CHARMAP "き",$0F
CHARMAP "く",$10
CHARMAP "け",$11
CHARMAP "こ",$12
CHARMAP "さ",$13
CHARMAP "し",$14
CHARMAP "す",$15
CHARMAP "せ",$16
CHARMAP "そ",$17 ;I'm guessing this is supposed to be like what Wikipedia shows as an alternate version of the character, but the in-game visuals are only vagely similar
CHARMAP "た",$18
CHARMAP "ち",$19
CHARMAP "つ",$1A
CHARMAP "て",$1B
CHARMAP "と",$1C
CHARMAP "な",$1D
CHARMAP "に",$1E
CHARMAP "ぬ",$1F ;character size does no favors for this one
CHARMAP "ね",$20
CHARMAP "の",$21
CHARMAP "は",$22
CHARMAP "ひ",$23
CHARMAP "ふ",$24
CHARMAP "へ",$25
CHARMAP "ほ",$26
CHARMAP "ま",$27
CHARMAP "み",$28
CHARMAP "む",$29
CHARMAP "め",$2A
CHARMAP "も",$2B
CHARMAP "や",$2C
CHARMAP "ゆ",$2D
CHARMAP "よ",$2E
CHARMAP "ら",$2F
CHARMAP "り",$30
CHARMAP "る",$31
CHARMAP "れ",$32
CHARMAP "ろ",$33
CHARMAP "わ",$34
CHARMAP "を",$35
CHARMAP "ん",$36
CHARMAP "ゃ",$39
CHARMAP "ゅ",$3A
CHARMAP "ょ",$3B
CHARMAP "っ",$3C
CHARMAP "ぁ",$3D
CHARMAP "ぃ",$3E
CHARMAP "ぅ",$3F
CHARMAP "ぇ",$40
CHARMAP "ぉ",$41
CHARMAP "が",$42 ;doesn't really look like it
CHARMAP "ぎ",$43
CHARMAP "ぐ",$44
CHARMAP "げ",$45
CHARMAP "ご",$46
CHARMAP "ざ",$47
CHARMAP "じ",$48
CHARMAP "ず",$49
CHARMAP "ぜ",$4A
CHARMAP "ぞ",$4B
CHARMAP "だ",$4C
CHARMAP "ぢ",$4D
CHARMAP "づ",$4E
CHARMAP "で",$4F
CHARMAP "ど",$50
CHARMAP "ば",$51
CHARMAP "び",$52
CHARMAP "ぶ",$53
CHARMAP "べ",$54
CHARMAP "ぼ",$55
CHARMAP "ぱ",$56
CHARMAP "ぴ",$57
CHARMAP "ぷ",$58
CHARMAP "ぺ",$59
CHARMAP "ぽ",$5A
CHARMAP "ス",$5B ;a tiny amount of kanji
CHARMAP "セ",$5C
CHARMAP "ン",$5D
CHARMAP "月",$5E ;week days. this one is monday (also used for month e.g. 11月 - november)
CHARMAP "火",$5F
CHARMAP "水",$60
CHARMAP "木",$61
CHARMAP "金",$62
CHARMAP "土",$63
CHARMAP "日",$64 ;sunday (also used for day e.g. 31日 - 31st day of month)
CHARMAP "円",$79 ;currency (yen)

CHARMAP "、",$37
CHARMAP ",",$37 ;this is for convenience in case you're writing new text and don't want to use that weird character
CHARMAP "。",$38
CHARMAP "(",$65
CHARMAP ")",$66
CHARMAP "❤",$69 ;I love you! Source: dude, trust me.
CHARMAP "!",$6A
CHARMAP "?",$6B

CHARMAP "A",$6C
CHARMAP "B",$6D
CHARMAP "=",$6E
CHARMAP "0",$6F
CHARMAP "O",$6F ;the game uses this as both zero and letter O
CHARMAP "1",$70
CHARMAP "2",$71
CHARMAP "3",$72
CHARMAP "4",$73
CHARMAP "5",$74
CHARMAP "6",$75
CHARMAP "7",$76
CHARMAP "8",$77
CHARMAP "9",$78
CHARMAP "~",$7A
CHARMAP "-",$7B
CHARMAP "•",$7C
CHARMAP ".",$7C ;this is for convenience in case you're writing new text and don't want to use that weird character (this can also replace 。)
CHARMAP "/",$7D

NEWCHARMAP Text_Other, General
CHARMAP " ",$00 ;non-VN text generally uses $00 as empty space
CHARMAP "_",$80 ;only loaded and used for new game screens (note that the game doesn't actually use this as a background tile, but as a sprite, but it CAN be used as a BG tile)

;VN strings
NEWCHARMAP Text_VN, General
CHARMAP " ",$7F ;VN text uses $7F as empty space
CHARMAP "[2ndName]",TextCommand_GetPlayerName,PlayerString_SecondName ;faux commands that would print player's respective name
CHARMAP "[Name]",TextCommand_GetPlayerName,PlayerString_Name
CHARMAP "[NickName]",TextCommand_GetPlayerName,PlayerString_NickName