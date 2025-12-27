;sprite displayables... display data
SpriteDisplayableDataPointers_1D_6B0C:
dw ScheduleSelector_1D_6B8A
dw SidewayCursor_1D_6B92
dw SidewayCursorDupe_1D_6B96                                ;unused sprite (has identical data to the used one)
dw ProfileRuruna_1D_6B9A
dw ProfileMizuki_1D_6C0A
dw ProfileYumi_1D_6C76
dw ProfileMiri_1D_6CE2
dw ProfileMari_1D_6D4E
dw ProfileSuzune_1D_6DBA
dw ProfileMomoyo_1D_6E22
dw LovePointStage1Sprite_1D_6E9A                          ;relationship sprite displayables start here
dw LovePointStage2Sprite_1D_6EA2
dw LovePointStage3Sprite_1D_6EAA
dw LovePointStage4Sprite_1D_6EB2
dw LovePointStage5Sprite_1D_6EBA                          ;unused Love point stage sprite
dw LovePointStage6Sprite_1D_6EC2                          ;unused Love point stage sprite
dw LovePointStage7Sprite_1D_6ECA                          ;unused Love point stage sprite
dw LovePointStage8Sprite_1D_6ED2                          ;unused Love point stage sprite
dw FriendPointStage1Sprite_1D_6EDA
dw FriendPointStage2Sprite_1D_6EE2
dw FriendPointStage3Sprite_1D_6EEA
dw FriendPointStage4Sprite_1D_6EF2
dw FriendPointStage5Sprite_1D_6EFA                        ;unused Friend point stage sprite
dw FriendPointStage6Sprite_1D_6F02                        ;unused Friend point stage sprite
dw FriendPointStage7Sprite_1D_6F0A                        ;unused Friend point stage sprite
dw FriendPointStage8Sprite_1D_6F12                        ;unused Friend point stage sprite
dw InterestPointStage1Sprite_1D_6F1A
dw InterestPointStage2Sprite_1D_6F22
dw InterestPointStage3Sprite_1D_6F2A
dw InterestPointStage4Sprite_1D_6F32
dw InterestPointStage5Sprite_1D_6F3A                      ;unused Interest point stage sprite
dw InterestPointStage6Sprite_1D_6F42                      ;unused Interest point stage sprite
dw InterestPointStage7Sprite_1D_6F4A                      ;unused Interest point stage sprite
dw InterestPointStage8Sprite_1D_6F52                      ;unused Interest point stage sprite
dw MapWalkingSprite1_1D_6F5A
dw MapWalkingSprite2_1D_6F62
dw MapWalkingSprite3_1D_6F6A
dw MapWalkingSprite2_1D_6F62
dw CalendarBaseSprite1_1D_6F72
dw CalendarBaseSprite2_1D_6F92
dw CalendarBaseSprite3_1D_6FB2
dw CalendarBaseSprite4_1D_6FD2
dw CalendarDigitSprite_0_1D_6FF2
dw CalendarDigitSprite_1_1D_6FF6
dw CalendarDigitSprite_2_1D_6FFA
dw CalendarDigitSprite_3_1D_6FFE
dw CalendarDigitSprite_4_1D_7002
dw CalendarDigitSprite_5_1D_7006
dw CalendarDigitSprite_6_1D_700A
dw CalendarDigitSprite_7_1D_700E
dw CalendarDigitSprite_8_1D_7012
dw CalendarDigitSprite_9_1D_7016
dw TitleScreenHeart_1D_701A
dw CalendarDigitSprite_1_Centered_1D_703A                   ;unused duplicate (there's no centered 0)
dw CalendarDigitSprite_1_Centered_1D_703A
dw CalendarDigitSprite_2_Centered_1D_7042
dw CalendarDigitSprite_3_Centered_1D_704A
dw CalendarDigitSprite_4_Centered_1D_7052
dw CalendarDigitSprite_5_Centered_1D_705A
dw CalendarDigitSprite_6_Centered_1D_7062
dw CalendarDigitSprite_7_Centered_1D_706A
dw CalendarDigitSprite_8_Centered_1D_7072
dw CalendarDigitSprite_9_Centered_1D_707A

;sprite data.
;property bit 0 [4th byte] indicates the end of the image. if clear, keep drawing

;square cursor for making your schedule
ScheduleSelector_1D_6B8A:
db $10,$08,$04,$00
db $10,$10,$06,$01

;Generic sideway cursor used in many situations
SidewayCursor_1D_6B92:
db $00,$F8,$02,$01

;unused duplicate
SidewayCursorDupe_1D_6B96:
db $00,$F8,$02,$01

ProfileRuruna_1D_6B9A:
db $E2,$E0,$00,$00
db $F2,$E0,$02,$00
db $E0,$E8,$04,$00
db $F0,$E8,$06,$00
db $00,$E8,$08,$00
db $10,$E8,$0A,$00
db $E0,$F0,$0C,$00
db $F0,$F0,$0E,$00
db $00,$F0,$10,$00
db $10,$F0,$12,$00
db $E0,$F8,$14,$00
db $F0,$F8,$16,$00
db $00,$F8,$18,$00
db $10,$F8,$1A,$00
db $E0,$00,$1C,$00
db $F0,$00,$1E,$00
db $00,$00,$20,$00
db $10,$00,$22,$00
db $E0,$08,$24,$00
db $F0,$08,$26,$00
db $00,$08,$28,$00
db $10,$08,$2A,$00
db $E0,$10,$2C,$00
db $F0,$10,$2E,$00
db $00,$10,$30,$00
db $10,$10,$32,$00
db $F0,$18,$34,$00
db $10,$18,$36,$01

ProfileMizuki_1D_6C0A:
db $E0,$E0,$00,$00
db $E8,$E8,$02,$00
db $F8,$E8,$04,$00
db $10,$E8,$06,$00
db $E0,$F0,$08,$00
db $F0,$F0,$0A,$00
db $00,$F0,$0C,$00
db $10,$F0,$0E,$00
db $E0,$F8,$10,$00
db $F0,$F8,$12,$00
db $00,$F8,$14,$00
db $10,$F8,$16,$00
db $E0,$00,$18,$00
db $F0,$00,$1A,$00
db $00,$00,$1C,$00
db $10,$00,$1E,$00
db $E0,$08,$20,$00
db $F0,$08,$22,$00
db $00,$08,$24,$00
db $10,$08,$26,$00
db $E0,$10,$28,$00
db $F0,$10,$2A,$00
db $00,$10,$2C,$00
db $10,$10,$2E,$00
db $F0,$18,$30,$00
db $00,$18,$32,$00
db $10,$18,$34,$01

ProfileYumi_1D_6C76:
db $10,$E0,$00,$00
db $E0,$E8,$02,$00
db $F0,$E8,$04,$00
db $00,$E8,$06,$00
db $10,$E8,$08,$00
db $E0,$F0,$0A,$00
db $F0,$F0,$0C,$00
db $00,$F0,$0E,$00
db $10,$F0,$10,$00
db $E0,$F8,$12,$00
db $F0,$F8,$14,$00
db $00,$F8,$16,$00
db $10,$F8,$18,$00
db $E0,$00,$1A,$00
db $F0,$00,$1C,$00
db $00,$00,$1E,$00
db $10,$00,$20,$00
db $E0,$08,$22,$00
db $F0,$08,$24,$00
db $00,$08,$26,$00
db $10,$08,$28,$00
db $E0,$10,$2A,$00
db $F0,$10,$2C,$00
db $00,$10,$2E,$00
db $10,$10,$30,$00
db $E8,$18,$32,$00
db $F8,$18,$34,$01

ProfileMiri_1D_6CE2:
db $E0,$E0,$00,$00
db $10,$E0,$02,$00
db $E0,$E8,$04,$00
db $F0,$E8,$06,$00
db $00,$E8,$08,$00
db $10,$E8,$0A,$00
db $E0,$F0,$0C,$00
db $F0,$F0,$0E,$00
db $00,$F0,$10,$00
db $10,$F0,$12,$00
db $E0,$F8,$14,$00
db $F0,$F8,$16,$00
db $00,$F8,$18,$00
db $10,$F8,$1A,$00
db $E0,$00,$1C,$00
db $F0,$00,$1E,$00
db $00,$00,$20,$00
db $10,$00,$22,$00
db $E0,$08,$24,$00
db $F0,$08,$26,$00
db $00,$08,$28,$00
db $10,$08,$2A,$00
db $E0,$10,$2C,$00
db $F0,$10,$2E,$00
db $00,$10,$30,$00
db $10,$10,$32,$00
db $10,$18,$34,$01

ProfileMari_1D_6D4E:
db $00,$E0,$00,$00
db $10,$E0,$02,$00
db $E0,$E8,$04,$00
db $F0,$E8,$06,$00
db $00,$E8,$08,$00
db $10,$E8,$0A,$00
db $E0,$F0,$0C,$00
db $F0,$F0,$0E,$00
db $00,$F0,$10,$00
db $10,$F0,$12,$00
db $E0,$F8,$14,$00
db $F0,$F8,$16,$00
db $00,$F8,$18,$00
db $10,$F8,$1A,$00
db $E0,$00,$1C,$00
db $F0,$00,$1E,$00
db $00,$00,$20,$00
db $10,$00,$22,$00
db $E0,$08,$24,$00
db $F0,$08,$26,$00
db $00,$08,$28,$00
db $10,$08,$2A,$00
db $E0,$10,$2C,$00
db $F0,$10,$2E,$00
db $00,$10,$30,$00
db $10,$10,$32,$00
db $10,$18,$34,$01

ProfileSuzune_1D_6DBA:
db $F0,$E6,$00,$00
db $00,$E6,$02,$00
db $10,$E6,$04,$00
db $E0,$EE,$06,$00
db $F0,$EE,$08,$00
db $00,$EE,$0A,$00
db $10,$EE,$0C,$00
db $E0,$F6,$0E,$00
db $F0,$F6,$10,$00
db $00,$F6,$12,$00
db $10,$F6,$14,$00
db $E0,$FE,$16,$00
db $F0,$FE,$18,$00
db $00,$FE,$1A,$00
db $10,$FE,$1C,$00
db $E0,$06,$1E,$00
db $F0,$06,$20,$00
db $00,$06,$22,$00
db $10,$06,$24,$00
db $E0,$0E,$26,$00
db $F0,$0E,$28,$00
db $00,$0E,$2A,$00
db $10,$0E,$2C,$00
db $F0,$16,$2E,$00
db $00,$16,$30,$00
db $10,$16,$32,$01

ProfileMomoyo_1D_6E22:
db $E0,$E0,$00,$00
db $F0,$E0,$02,$00
db $00,$E0,$04,$00
db $E0,$E8,$06,$00
db $F0,$E8,$08,$00
db $00,$E8,$0A,$00
db $10,$E8,$0C,$00
db $E0,$F0,$0E,$00
db $F0,$F0,$10,$00
db $00,$F0,$12,$00
db $10,$F0,$14,$00
db $E0,$F8,$16,$00
db $F0,$F8,$18,$00
db $00,$F8,$1A,$00
db $10,$F8,$1C,$00
db $E0,$00,$1E,$00
db $F0,$00,$20,$00
db $00,$00,$22,$00
db $10,$00,$24,$00
db $E0,$08,$26,$00
db $F0,$08,$28,$00
db $00,$08,$2A,$00
db $10,$08,$2C,$00
db $E0,$10,$2E,$00
db $F0,$10,$30,$00
db $00,$10,$32,$00
db $10,$10,$34,$00
db $EB,$18,$36,$00
db $FB,$18,$38,$00
db $10,$18,$3A,$01

LovePointStage1Sprite_1D_6E9A:
db $00,$00,$40,$00
db $00,$08,$50,$01

LovePointStage2Sprite_1D_6EA2:
db $00,$00,$42,$00
db $00,$08,$52,$01

LovePointStage3Sprite_1D_6EAA:
db $00,$00,$44,$00
db $00,$08,$54,$01

LovePointStage4Sprite_1D_6EB2:
db $00,$00,$46,$00
db $00,$08,$56,$01

LovePointStage5Sprite_1D_6EBA:
db $00,$00,$48,$00
db $00,$08,$58,$01

LovePointStage6Sprite_1D_6EC2:
db $00,$00,$4A,$00
db $00,$08,$5A,$01

LovePointStage7Sprite_1D_6ECA:
db $00,$00,$4C,$00
db $00,$08,$5C,$01

LovePointStage8Sprite_1D_6ED2:
db $00,$00,$4E,$00
db $00,$08,$5E,$01

FriendPointStage1Sprite_1D_6EDA:
db $00,$00,$00,$00
db $00,$08,$10,$01

FriendPointStage2Sprite_1D_6EE2:
db $00,$00,$02,$00
db $00,$08,$12,$01

FriendPointStage3Sprite_1D_6EEA:
db $00,$00,$04,$00
db $00,$08,$14,$01

FriendPointStage4Sprite_1D_6EF2:
db $00,$00,$06,$00
db $00,$08,$16,$01

FriendPointStage5Sprite_1D_6EFA:
db $00,$00,$08,$00
db $00,$08,$18,$01

FriendPointStage6Sprite_1D_6F02:
db $00,$00,$0A,$00
db $00,$08,$1A,$01

FriendPointStage7Sprite_1D_6F0A:
db $00,$00,$0C,$00
db $00,$08,$1C,$01

FriendPointStage8Sprite_1D_6F12:
db $00,$00,$0E,$00
db $00,$08,$1E,$01

InterestPointStage1Sprite_1D_6F1A:
db $00,$00,$20,$00
db $00,$08,$30,$01

InterestPointStage2Sprite_1D_6F22:
db $00,$00,$22,$00
db $00,$08,$32,$01

InterestPointStage3Sprite_1D_6F2A:
db $00,$00,$24,$00
db $00,$08,$34,$01

InterestPointStage4Sprite_1D_6F32:
db $00,$00,$26,$00
db $00,$08,$36,$01

InterestPointStage5Sprite_1D_6F3A:
db $00,$00,$28,$00
db $00,$08,$38,$01

InterestPointStage6Sprite_1D_6F42:
db $00,$00,$2A,$00
db $00,$08,$3A,$01

InterestPointStage7Sprite_1D_6F4A:
db $00,$00,$2C,$00
db $00,$08,$3C,$01

InterestPointStage8Sprite_1D_6F52:
db $00,$00,$2E,$00
db $00,$08,$3E,$01

MapWalkingSprite1_1D_6F5A:
db $00,$04,$6E,$00
db $00,$0C,$70,$01

MapWalkingSprite2_1D_6F62:
db $00,$04,$72,$00
db $00,$0C,$74,$01

MapWalkingSprite3_1D_6F6A:
db $00,$04,$76,$00
db $00,$0C,$78,$01

CalendarBaseSprite1_1D_6F72:
db $00,$00,$40,$00
db $10,$00,$42,$00
db $00,$08,$44,$00
db $10,$08,$46,$00
db $00,$10,$44,$00
db $10,$10,$46,$00
db $00,$18,$48,$00
db $10,$18,$4A,$01

CalendarBaseSprite2_1D_6F92:
db $00,$00,$40,$00
db $10,$00,$4C,$00
db $00,$08,$44,$00
db $10,$08,$4E,$00
db $00,$10,$44,$00
db $10,$10,$50,$00
db $00,$18,$48,$00
db $10,$18,$52,$01

CalendarBaseSprite3_1D_6FB2:
db $00,$00,$54,$00
db $10,$00,$56,$00
db $00,$08,$58,$00
db $10,$08,$5A,$00
db $00,$10,$44,$00
db $10,$10,$5C,$00
db $00,$18,$48,$00
db $10,$18,$5E,$01

CalendarBaseSprite4_1D_6FD2:
db $00,$00,$60,$00
db $10,$00,$62,$00
db $00,$08,$64,$00
db $10,$08,$46,$00
db $00,$10,$66,$00
db $10,$10,$68,$00
db $00,$18,$6A,$00
db $10,$18,$6C,$01

CalendarDigitSprite_0_1D_6FF2:
db $00,$00,$08,$01

CalendarDigitSprite_1_1D_6FF6:
db $00,$00,$0A,$01

CalendarDigitSprite_2_1D_6FFA:
db $00,$00,$0C,$01

CalendarDigitSprite_3_1D_6FFE:
db $00,$00,$0E,$01

CalendarDigitSprite_4_1D_7002:
db $00,$00,$10,$01

CalendarDigitSprite_5_1D_7006:
db $00,$00,$12,$01

CalendarDigitSprite_6_1D_700A:
db $00,$00,$14,$01

CalendarDigitSprite_7_1D_700E:
db $00,$00,$16,$01

CalendarDigitSprite_8_1D_7012:
db $00,$00,$18,$01

CalendarDigitSprite_9_1D_7016:
db $00,$00,$1A,$01

TitleScreenHeart_1D_701A:
db $00,$02,$10,$80
db $10,$02,$12,$80
db $00,$0A,$14,$80
db $10,$0A,$16,$80
db $00,$12,$18,$80
db $10,$12,$1A,$80
db $00,$1A,$1C,$80
db $10,$1A,$1E,$81

;these are used for when the day is between 1 and 9
CalendarDigitSprite_1_Centered_1D_703A:
db $00,$00,$1C,$00
db $00,$08,$1E,$01

CalendarDigitSprite_2_Centered_1D_7042:
db $00,$00,$20,$00
db $00,$08,$22,$01

CalendarDigitSprite_3_Centered_1D_704A:
db $00,$00,$24,$00
db $00,$08,$26,$01

CalendarDigitSprite_4_Centered_1D_7052:
db $00,$00,$28,$00
db $00,$08,$2A,$01

CalendarDigitSprite_5_Centered_1D_705A:
db $00,$00,$2C,$00
db $00,$08,$2E,$01

CalendarDigitSprite_6_Centered_1D_7062:
db $00,$00,$30,$00
db $00,$08,$32,$01

CalendarDigitSprite_7_Centered_1D_706A:
db $00,$00,$34,$00
db $00,$08,$36,$01

CalendarDigitSprite_8_Centered_1D_7072:
db $00,$00,$38,$00
db $00,$08,$3A,$01

CalendarDigitSprite_9_Centered_1D_707A:
db $00,$00,$3C,$00
db $00,$08,$3E,$01