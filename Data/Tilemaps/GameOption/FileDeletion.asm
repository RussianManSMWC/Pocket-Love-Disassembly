;chose delete option, show available save slots
DiarySelectionForDeleteStrings_1E_4360:
dw $9C21
db 18
db 8
db " どのにっきを けしますか     "

ds 18, CHARVAL(" ")
ds 18, CHARVAL(" ")

db " にっき 1            "
db " にっき 2            "
db " にっき 3            "

ds 18, CHARVAL(" ")

db "     A=けってい B=とりけし"