;A relationship modifier offset, based on which item was gifted to the character.
;Each byte goes from Ruruna to Momoyo, then changes to the next gift. The last byte is always unused due to there only being 7 romance options.
;Gifts never take away relationship points, they either add or don't change.
RelationshipModifierLookup_PerGift_03_678D:
db $00,$00,$00,$00,$00,$00,$00,$00 ;Gift $00 \the first few items cannot be used as gifts.
db $00,$00,$00,$00,$00,$00,$00,$00 ;Gift $01 |
db $00,$00,$00,$00,$00,$00,$00,$00 ;Gift $02 |
db $00,$00,$00,$00,$00,$00,$00,$00 ;Gift $03 /
db $8D,$07,$8B,$8C,$07,$8C,$07,$00 ;Gift $04
db $8B,$00,$00,$8B,$00,$00,$00,$00 ;Gift $05
db $07,$89,$8A,$00,$07,$8A,$89,$00 ;Gift $06
db $8C,$00,$8A,$8A,$00,$07,$8A,$00 ;Gift $07
db $89,$07,$89,$89,$8A,$89,$89,$00 ;Gift $08
db $00,$13,$13,$00,$00,$00,$00,$00 ;Gift $09
db $8A,$00,$89,$89,$00,$89,$00,$00 ;Gift $0A
db $8C,$00,$8C,$8C,$8C,$13,$0D,$00 ;Gift $0B
db $89,$07,$07,$8A,$00,$89,$00,$00 ;Gift $0C
db $8A,$89,$07,$00,$89,$89,$89,$00 ;Gift $0D
db $00,$0D,$19,$00,$00,$00,$13,$00 ;Gift $0E
db $00,$00,$00,$00,$00,$00,$8A,$00 ;Gift $0F
db $89,$00,$00,$8B,$00,$89,$00,$00 ;Gift $10
db $00,$00,$00,$8A,$00,$00,$00,$00 ;Gift $11
db $00,$00,$00,$0D,$00,$8A,$00,$00 ;Gift $12
db $00,$00,$8A,$8C,$07,$8A,$0D,$00 ;Gift $13
db $00,$00,$00,$8A,$0D,$00,$8D,$00 ;Gift $14
db $00,$00,$00,$8A,$00,$07,$00,$00 ;Gift $15
db $89,$00,$89,$89,$89,$07,$89,$00 ;Gift $16
db $89,$00,$89,$89,$8A,$89,$07,$00 ;Gift $17
db $07,$19,$13,$00,$0D,$8C,$8E,$00 ;Gift $18
db $00,$00,$8F,$7E,$00,$00,$81,$00 ;Gift $19
.end
