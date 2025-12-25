Tilemap_LoadFileWindow_1D_69FE:
dw $9C00
db 20
db 10
db $01
ds 18, $04
db $06

db $02," どのにっきで つづけますか?   ",$07

db $02
ds 18, CHARVAL(" ")
db $07

db $02," にっき1             ",$07
db $02,"    月  日       円  ",$07
db $02," にっき2             ",$07
db $02,"    月  日       円  ",$07
db $02," にっき3             ",$07
db $02,"    月  日       円  ",$07

db $03
ds 18, $05
db $08

;displayed at the title screen's save select if the respective save file is not used
EmptySaveFile1Tilemap_1D_6ACA:
dw $9C81
db 18
db 1
db "  この で~たは つかえません  "

EmptySaveFile2Tilemap_1D_6AE0:
dw $9CC1
db 18
db 1
db "  この で~たは つかえません  "

EmptySaveFile3Tilemap_1D_6AF6:
dw $9D01
db 18
db 1
db "  この で~たは つかえません  "