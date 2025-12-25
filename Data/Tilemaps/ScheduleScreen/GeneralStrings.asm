ScheduleScreen_Workdays_1E_4028:
dw $9868
db 11
db 1
db "月 火 水 木 金 土"

ScheduleScreen_WorkStrings_1E_4037:
dw $98A0
db 8
db 3
db "かなりがんばる="
ds 8, CHARVAL(" ")
db "   がんばる="

ScheduleScreen_FreeDayStrings_1E_4053:
dw $98A0
db 8
db 3
db "     あさ="
ds 8, CHARVAL(" ")
db "     ひる="