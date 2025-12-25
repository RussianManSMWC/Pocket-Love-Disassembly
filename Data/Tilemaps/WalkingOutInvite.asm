WhomToInviteOnWalkMessage_1E_4CAD:
dw $9821
db 11
db 1
db "だれを さそおうかな?"

WhatItemToUseOnWalkMessage_1E_4CBC:
dw $9821
db 11
db 1
db "どれを つかおうかな?"

;watch out, these item names' length is less than ItemName_MaxLength! An automatic way to detect length is to be implemented... eventually.
ItemNamesForCharacterInviteOnWalk_1E_4CCB:
dw $9882
db ItemName_MaxLength-8 ;9 characters long by default
db 5
db "でんわ      "
db "ぽけっと•べる  "
db "ぴ~•えいち•えす"
db "けいたいでんわ  "
db "じょうほうつ~る "
.end

ContactCharacterOnWalkMessage_1E_4CFC:
dw $9821
db 11
db 1
db "よし れんらくしよう!"

WillTheyComeMessage_1E_4D0B:
dw $9841
db 9
db 1
db "きてくれるかなぁ?"

WaitDot1_1E_4D18:
dw $9861
db 1
db 1
db "•"

WaitDot2_1E_4D1D:
dw $9881
db 1
db 1
db "•"

WaitDot3_1E_4D22:
dw $98A1
db 1
db 1
db "•"

ThirtyMinutesLaterString_1E_4D27:
dw $98C1
db 5
db 1
db "30ぷんご"

CharacterDidntComeMessage_1E_4D30:
dw $9901
db 13
db 1
db "だめだった みたいだ•••"

;unused message for when the character does come
CharacterCameMessage_1E_4D41:
dw $9901
db 9
db 1
db "あ! きてくれた!"