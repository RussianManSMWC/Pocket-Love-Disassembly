;activity
ActivityEffect_WorkHard_1E_5EA2:
dw StudyActivityEffect_WorkHard_1E_608A                     ;studying
dw GroomingActivityEffect_WorkHard_1E_60AE                  ;look after your appearance
dw GoClubActivityEffect_WorkHard_1E_60D2                    ;club (separate pointers)
dw KaraokeActivityEffect_WorkHard_1E_61AA                   ;karaoke
dw GameActivityEffect_WorkHard_1E_61CE                      ;play vidya gams
dw JobActivityEffect_WorkHard_1E_61F2                       ;work
dw RelaxActivityEffect_WorkHard_1E_6216                     ;relax (I'm aware that it sounds silly that you "work hard" at relaxation)

;club
ClubActivityEffect_WorkHard_1E_5EB0:
dw GoClubActivityEffect_WorkHard_1E_60D2                    ;can't have club value of 0 (that would indicate no club)
dw GoClubActivityEffect_WorkHard_1E_60D2
dw HandicraftsClubActivityEffect_WorkHard_1E_60F6
dw EnglishClubActivityEffect_WorkHard_1E_611A
dw BaseballClubActivityEffect_WorkHard_1E_613E
dw BasketballClubActivityEffect_WorkHard_1E_6162
dw SoccerClubActivityEffect_WorkHard_1E_6186

;same as above but for when you're not working hard (later day)
ActivityEffect_JustWork_1E_5EBE:
dw StudyActivityEffect_JustWork_1E_5EDA
dw GroomingActivityEffect_JustWork_1E_5EFE
dw GoClubActivityEffect_JustWork_1E_5F22
dw KaraokeActivityEffect_JustWork_1E_5FFA
dw GameActivityEffect_JustWork_1E_601E
dw JobActivityEffect_JustWork_1E_6042
dw RelaxActivityEffect_JustWork_1E_6066

ClubActivityEffect_JustWork_1E_5ECC:
dw GoClubActivityEffect_JustWork_1E_5F22
dw GoClubActivityEffect_JustWork_1E_5F22
dw HandicraftsClubActivityEffect_JustWork_1E_5F46
dw EnglishClubActivityEffect_JustWork_1E_5F6A
dw BaseballClubActivityEffect_JustWork_1E_5F8E
dw BasketballClubActivityEffect_JustWork_1E_5FB2
dw SoccerClubActivityEffect_JustWork_1E_5FD6

;first 7 pairs of bytes are stat effects, either increase or decrease
;depending on the frame counter, the stat distribution will differ, creating a "random" element
;after that, one byte for adding cash
;the rest are character affection points
;if bit 7 is set, it'll substract (value*%01111111)+1
StudyActivityEffect_JustWork_1E_5EDA:
db $02,$01                                                  ;smart
db $00,$00                                                  ;fit
db $00,$00                                                  ;cool
db $00,$00                                                  ;skill
db $00,$00                                                  ;sense
db $80,$00                                                  ;energy
db $00,$00                                                  ;attitude (not affected by any of the activities... makes you wonder why this is even here)

db $00                                                      ;cash

db $00,$01,$00                                              ;Ruruna
db $00,$00,$00                                              ;Mizuki
db $00,$80,$00                                              ;Yumi
db $00,$01,$00                                              ;Miri
db $00,$80,$00                                              ;Mari
db $00,$01,$00                                              ;Suzune
db $00,$00,$00                                              ;Momoyo

GroomingActivityEffect_JustWork_1E_5EFE:
db $80,$00
db $00,$00
db $02,$01
db $00,$00
db $00,$00
db $00,$00
db $00,$00

db $00

db $00,$01,$00
db $00,$80,$00
db $00,$01,$00
db $00,$80,$00
db $00,$01,$00
db $00,$80,$00
db $00,$01,$00

GoClubActivityEffect_JustWork_1E_5F22:
db $02,$01
db $00,$00
db $00,$00
db $00,$01
db $00,$00
db $00,$00
db $00,$00

db $00

db $00,$01,$00
db $00,$80,$00
db $00,$80,$00
db $00,$01,$00
db $00,$80,$00
db $00,$01,$00
db $00,$00,$00

HandicraftsClubActivityEffect_JustWork_1E_5F46:
db $00,$00
db $00,$00
db $01,$02
db $02,$01
db $00,$00
db $00,$00
db $00,$00

db $00

db $00,$01,$00
db $00,$80,$00
db $00,$80,$00
db $00,$01,$00
db $00,$80,$00
db $00,$01,$00
db $00,$80,$00

EnglishClubActivityEffect_JustWork_1E_5F6A:
db $02,$01
db $00,$00
db $00,$00
db $00,$00
db $00,$00
db $80,$00
db $00,$00

db $00

db $00,$01,$00
db $00,$80,$00
db $00,$00,$00
db $00,$01,$00
db $00,$80,$00
db $00,$01,$00
db $00,$00,$00

BaseballClubActivityEffect_JustWork_1E_5F8E:
db $80,$00
db $02,$01
db $80,$00
db $00,$00
db $00,$00
db $00,$80
db $00,$00

db $00

db $00,$80,$00
db $00,$01,$00
db $00,$01,$00
db $00,$80,$00
db $00,$00,$00
db $00,$01,$00
db $00,$01,$00

BasketballClubActivityEffect_JustWork_1E_5FB2:
db $00,$00
db $01,$02
db $01,$00
db $00,$00
db $00,$00
db $00,$00
db $00,$00

db $00

db $00,$00,$00
db $00,$01,$00
db $00,$01,$00
db $00,$80,$00
db $00,$01,$00
db $00,$80,$00
db $00,$80,$00

SoccerClubActivityEffect_JustWork_1E_5FD6:
db $80,$00
db $02,$01
db $00,$01
db $00,$00
db $00,$00
db $00,$80
db $00,$00

db $00

db $00,$80,$00
db $00,$01,$00
db $00,$01,$00
db $00,$00,$00
db $00,$01,$00
db $00,$80,$00
db $00,$00,$00

KaraokeActivityEffect_JustWork_1E_5FFA:
db $00,$00
db $00,$00
db $01,$02
db $00,$00
db $02,$01
db $00,$00
db $00,$00

db $00

db $00,$00,$00
db $00,$80,$00
db $00,$01,$00
db $00,$80,$00
db $00,$01,$00
db $00,$80,$00
db $00,$01,$00

GameActivityEffect_JustWork_1E_601E:
db $80,$00
db $00,$00
db $80,$00
db $02,$01
db $01,$00
db $00,$00
db $00,$00

db $00

db $00,$80,$00
db $00,$80,$00
db $00,$01,$00
db $00,$01,$00
db $00,$01,$00
db $00,$80,$00
db $00,$01,$00

JobActivityEffect_JustWork_1E_6042:
db $80,$81
db $00,$00
db $02,$01
db $01,$02
db $00,$00
db $80,$00
db $00,$00

db $08

db $00,$00,$00
db $00,$01,$00
db $00,$01,$00
db $00,$00,$00
db $00,$80,$00
db $00,$01,$00
db $00,$80,$00

RelaxActivityEffect_JustWork_1E_6066:
db $00,$00
db $00,$00
db $80,$00
db $00,$00
db $00,$00
db $02,$01
db $00,$00

db $00

db $00,$01,$00
db $00,$00,$00
db $00,$00,$00
db $00,$00,$00
db $00,$80,$00
db $00,$01,$00
db $00,$80,$00

StudyActivityEffect_WorkHard_1E_608A:
db $03,$02
db $80,$00
db $00,$00
db $01,$00
db $80,$00
db $81,$80
db $00,$00

db $01                                                      ;100 yen for regular activities

db $00,$01,$00
db $00,$00,$00
db $80,$81,$00                                              ;Yumi don't like that
db $01,$02,$00                                              ;Miri likes when you study
db $80,$81,$00                                              ;Mari will remember that
db $01,$02,$00                                              ;Suzune likes when you study
db $00,$01,$00

GroomingActivityEffect_WorkHard_1E_60AE:
db $81,$00                                                  ;you become dumber when you style your hair
db $00,$00
db $03,$02
db $00,$00
db $01,$00
db $80,$80
db $00,$00

db $01

db $00,$01,$00
db $80,$81,$00                                              ;Mizuki doesn't care about appearances
db $01,$02,$00                                              ;Yumi ❤ your hair. This is the part where you're supposed to blush.
db $80,$81,$00                                              ;Miri doesn't care about appearances.
db $01,$02,$00                                              ;Mari will remember that (positively)
db $00,$80,$00
db $00,$01,$00

;some smart club I assume
GoClubActivityEffect_WorkHard_1E_60D2:
db $06,$04
db $00,$00
db $00,$00
db $02,$04
db $00,$00
db $83,$81
db $00,$00

db $01

db $00,$01,$00
db $80,$81,$00
db $80,$81,$00
db $02,$02,$00                                              ;Miri likes that
db $00,$80,$00
db $01,$02,$00
db $00,$80,$00

HandicraftsClubActivityEffect_WorkHard_1E_60F6:
db $00,$00
db $81,$00
db $02,$00
db $06,$04
db $00,$00
db $83,$83
db $00,$00

db $01

db $02,$02,$00
db $80,$81,$00
db $00,$80,$00
db $01,$02,$00
db $80,$81,$00
db $01,$02,$00
db $80,$81,$00

EnglishClubActivityEffect_WorkHard_1E_611A:
db $04,$06
db $00,$00
db $02,$00
db $81,$00
db $00,$00
db $84,$86                                                  ;sooo relaxing...
db $00,$00

db $01

db $00,$01,$00
db $00,$00,$00
db $00,$01,$00
db $01,$02,$00
db $80,$81,$00
db $01,$02,$00
db $80,$81,$00

BaseballClubActivityEffect_WorkHard_1E_613E:
db $81,$83
db $06,$04
db $81,$00
db $00,$00
db $81,$00
db $81,$81
db $00,$00

db $01

db $80,$81,$00
db $01,$02,$00
db $01,$02,$00
db $80,$81,$00
db $00,$00,$00
db $00,$01,$00
db $01,$01,$00

BasketballClubActivityEffect_WorkHard_1E_6162:
db $81,$00
db $06,$04
db $02,$02
db $00,$00
db $81,$00
db $81,$83
db $00,$00

db $01

db $00,$01,$00
db $01,$02,$00
db $00,$01,$00
db $80,$81,$00
db $01,$02,$00
db $80,$81,$00
db $00,$80,$00

SoccerClubActivityEffect_WorkHard_1E_6186:
db $83,$85
db $06,$04
db $02,$04
db $00,$00
db $81,$00
db $81,$81
db $00,$00

db $01

db $80,$81,$00
db $01,$02,$00
db $01,$02,$00
db $00,$00,$00
db $00,$01,$00
db $80,$81,$00
db $00,$01,$00

;Karaoke
KaraokeActivityEffect_WorkHard_1E_61AA:
db $81,$81
db $01,$02
db $02,$01
db $00,$00
db $03,$03
db $80,$80
db $00,$00

db $01

db $00,$80,$00
db $80,$81,$00
db $01,$02,$00                                              ;Yumi likes when you Karaoke.
db $80,$81,$00
db $01,$02,$00                                              ;Mari likes when you Karaoke.
db $80,$81,$00
db $01,$02,$00                                              ;Momoyo likes when you Karaoke.

GameActivityEffect_WorkHard_1E_61CE:
db $81,$80
db $01,$00
db $82,$80
db $03,$02
db $00,$00
db $81,$82                                                  ;playing games sure is hard!
db $00,$00

db $01

db $80,$81,$00
db $00,$80,$00
db $01,$02,$00
db $00,$01,$00
db $01,$02,$00
db $00,$80,$00
db $01,$02,$00

JobActivityEffect_WorkHard_1E_61F2:
db $81,$83
db $02,$04
db $02,$00
db $02,$00
db $81,$00
db $85,$83
db $00,$00

db 15                                                       ;it's not much but it's honest work

db $00,$01,$00
db $00,$01,$00
db $01,$02,$00                                              ;Yumi likes when you work.
db $00,$00,$00
db $00,$80,$00
db $00,$01,$00
db $00,$80,$00

RelaxActivityEffect_WorkHard_1E_6216:
db $00,$00
db $00,$00
db $80,$81
db $80,$01
db $00,$00
db $04,$03
db $00,$00

db $00

db $00,$80,$00
db $00,$01,$00
db $00,$01,$00
db $00,$80,$00
db $00,$80,$00
db $00,$02,$00                                              ;Suzune likes it when you relax?
db $00,$01,$00