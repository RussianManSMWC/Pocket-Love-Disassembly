;stat thresholds for each romance option, determines how successful the date invitation is going to be
;respective stats are smart, fit, style, skill, sense
StatThresholdsForDating_1E_534F:
db 36, 16, 76, 136, 56                                      ;stat checks for Ruruna. values Skill. if you fail, that's a skill issue.
db 84, 144, 44, 24, 64                                      ;stat checks for Mizuki. values Fit. if you fail, you need to touch grass. literally. give me 50 pushups!
db 52, 92, 152, 32, 72                                      ;stat checks for Yumi. values Style. if you fail, you're lame fr fr
db 160, 40, 100, 60, 80                                     ;stat checks for Miri. values Smart. if you fail, go back cave, read book.
db 56, 96, 116, 76, 176                                     ;stat checks for Mari. values Sense. if you fail, you need to get your five senses checked.
db 124, 104, 160, 60, 40                                    ;stat checks for Momoyo. values Style. if you fail, you have no style, you have no grace. but maybe you do have a funny face.
db 60, 80, 40, 160, 100                                     ;stat checks for Suzune. values Skill. if you fail, git gud at stat raising.

;likelyhood of a character turning up. 0 - instant fail, 1 - 1/4 chance, 2 - 1/2 chance, 3 - 3/4 chance, 4 - instant success
;based on amount of stat checks passed (from 0 to all 5) + chosen item.
CharacterDateInvitationSuccessRates_1E_5372:
db $00,$01,$02,$03,$04,$04                                  ;no item. you need to get at least 4 stats past the threshold to get a guaranteed date
db $01,$02,$02,$03,$04,$04                                  ;bell that fits in your pocket (just like this game!)
db $01,$02,$03,$04,$04,$04                                  ;PHS
db $02,$03,$04,$04,$04,$04                                  ;phone
db $03,$04,$04,$04,$04,$04                                  ;last thingamajig