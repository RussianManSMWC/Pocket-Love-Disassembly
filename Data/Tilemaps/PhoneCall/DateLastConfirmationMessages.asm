PhoneCallDateConfirmationOnceMoreMessage_1E_4980:
dw $9821
db 18
db 1
db "それじゃ もう1かい かくにんするよ"

PhoneCallConfirmationTimeMessage_1E_4996:
dw $9841
db 13
db 1
db "で~との日にちと じかんは"

;Day and month are dynamically filled in
PhoneCallConfirmationPlannedDayTemplate_1E_49A7:
dw $9863
db 8
db 1
db "月  日   で"

PhoneCallConfirmationEarlyDay_1E_49B3:
dw $9868
db 2
db 1
db "あさ"

PhoneCallConfirmationLaterDay_1E_49B9:
dw $9868
db 2
db 1
db "ひる"

PhoneCallConfirmationLocationMessage_1E_49BF:
dw $9881
db 4
db 1
db "ばしょは"

PhoneCallConfirmationSpotInShoppingCenter_1E_49C7:
dw $98A1
db 17
db 1
db "こいがはら しょっぴんぐせんた~の"

PhoneCallConfirmationLocationTilemapPosition_1E_49DC:
dw $98C1
db PlaceName_MaxLength
db 1

PhoneCallConfirmationQuestionMessage_1E_49E0:
dw $98E1
db 7
db 1
db "で いいよね?"

PhoneCallConfirmationCharacterNameTilemapPosition_1E_49EB:
dw $9921
db 2+CharacterName_MaxLength
db 1

PhoneCallCharacterAgreesToDateMessage_1E_49EF:
dw $9942
db 8
db 1
db "うん わかった!"

PhoneCallCharacterLooksForwardToDateMessage_1E_49FB:
dw $9962
db 13
db 1
db "で~と たのしみにしてる!"

PhoneCallDateConversationEnd_1E_4A0C:
dw $9982
db 7
db 1
db "それじゃ また"

PuttingDownPhoneOnomatopoeia_DateCall_1E_4A17:
dw $99C1
db 3
db 1
db "かちゃ"

DatePlanConversationFinish_1E_4A1E:
dw $9A01
db 17
db 1
db "よし! で~とのやくそくを したぞ"