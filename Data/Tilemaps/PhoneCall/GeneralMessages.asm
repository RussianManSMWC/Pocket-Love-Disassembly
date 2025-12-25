DecidedToPhoneCallMessage_1E_47CD:
dw $982B
db 8
db 1
db "にでんわしよう!"

TypingPhoneNumberOnomatopoeia_1E_47D9:
dw $9841
db 8
db 1
db "ぴぽぱぴぷぺぱぴ"

;phone ringing onomatopoeia
PhoneRingOnomatopoeia1_1E_47E5:
dw $9861
db 7
db 1
db "とゅるるるるる"

PhoneRingOnomatopoeia2_1E_47F0:
dw $9881
db 7
db 1
db "とゅるるるるる"

PhoneCallSuccessMessage_1E_47FB:
dw $98E2
db 3
db 1
db "はい!"                                                    ;note: the exclamation mark gets overwritten by character name display

PhoneCallCharacterSpeakingMessage_1E_4802:
dw $98EF
db 2
db 1
db "です"

PhoneCallGreetingMessage_1E_4808:
dw $9921
db 14
db 1
db "もしもし      ですけど"