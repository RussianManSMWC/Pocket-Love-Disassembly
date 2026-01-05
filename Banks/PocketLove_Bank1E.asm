;PRG ROM $78000-$7BFFF

SECTION "bank 1E", ROMX, BANK[$1E]

SETCHARMAP Text_Other

include "Data/Tilemaps/ScheduleScreen/WorkWeekOpenerString.asm"
include "Data/Tilemaps/ScheduleScreen/MakeSchedule_OffDayEarly.asm"
include "Data/Tilemaps/ScheduleScreen/GeneralStrings.asm"

;clears the entire window layer
TilemapClear_WindowLayer_1E_406F:
dw $9C00
db 20
db 18

include "Data/Tilemaps/CalendarScreen.asm"

include "Data/Tilemaps/InfoOptionWindow.asm"

include "Data/Tilemaps/TownInfo/TownInfoGeneral.asm"

include "Data/Tilemaps/InventoryScreen.asm"

include "Data/Tilemaps/CharacterProfilesSelect.asm"

include "Data/Tilemaps/RelationshipScreenGeneral.asm"

include "Data/Tilemaps/SaveOptionStrings.asm"

include "Data/Tilemaps/GameOption/GameOptionWindow.asm"
include "Data/Tilemaps/GameOption/FileDeletion.asm"

include "Data/Tilemaps/ScheduleScreen/MakeSchedule_ConfirmSelection.asm"

include "Data/Tilemaps/JobAndClub/ClubActivityStrings.asm"
include "Data/Tilemaps/JobAndClub/PartTimeJobActivityStrings.asm"

include "Data/Tilemaps/CharacterNames.asm"

include "Data/Tilemaps/ScheduleScreen/MakeSchedule_OffDayLater.asm"
include "Data/Tilemaps/ScheduleScreen/MakeSchedule_WorkWeek.asm"

include "Data/Tilemaps/QuitGameMessage.asm"

include "Data/Tilemaps/JobAndClub/WorkAtClubOrJobStrings.asm"

include "Data/Tilemaps/Map/MapWhereToMessage.asm"

;Looks like this message is unused. It tells you you don't have planned dates, which probably means you were to be able to check them?
TilemapData_1E_4681:
dw $992B
db 8
db 3
db "いまは で~との"
db "やくそくは   "
db "していません  "

include "Data/Tilemaps/Map/ShoppingCenterStrings.asm"

TilemapClearData_InventoryContents_1E_476B:
dw $9882
db 17
db 10

include "Data/Tilemaps/Map/ShoppingCenter_BuyingItemStrings.asm"

include "Data/Tilemaps/PhoneCall/OptionStrings.asm"
include "Data/Tilemaps/PhoneCall/GeneralMessages.asm"
include "Data/Tilemaps/PhoneCall/DateProposalMessages.asm"
include "Data/Tilemaps/PhoneCall/CharacterSpeakingTilemapPositions.asm"
include "Data/Tilemaps/PhoneCall/DatePlanner.asm"

AButtonPrompt_1E_48F5:
dw $9A06
db 6
db 1
db "A=けってい"

include "Data/Tilemaps/PhoneCall/DatePickedTimeMessages.asm"
include "Data/Tilemaps/PhoneCall/DatePickedPlaceMessages.asm"
include "Data/Tilemaps/PhoneCall/DateLastConfirmationMessages.asm"
include "Data/Tilemaps/PhoneCall/DateTooManDates.asm"

include "Data/Tilemaps/PhoneCall/GiftStartConversation.asm"
include "Data/Tilemaps/PhoneCall/GiftOptions.asm"
include "Data/Tilemaps/PhoneCall/GiftLastMessages.asm"

include "Data/Tilemaps/Map/MapDateMessages.asm"

include "Data/Tilemaps/GameOption/CDLink.asm"
include "Data/Tilemaps/GameOption/FileDeletion_SelectedSave.asm"

;page values are filled manually
Tilemap_PageCount_1E_4BFE:
dw $9830
db 3
db 1
db " / "

include "Data/Tilemaps/TownInfo/TownInfoDontHave.asm"

include "Data/Tilemaps/ScheduleScreen/OffDayOpenerString.asm"

;Seems to be an unused message.
TilemapData_1E_4C2C:
dw $992B
db 8
db 2
db "なにも     "
db "おきなかった••"

include "Data/Tilemaps/ScheduleScreen/PlayerExhaustedMessages.asm"

include "Data/Tilemaps/WalkingOutInvite.asm"

;due to how the calendar is laid out, june has a shared spot for 23rd and 30th day. draw special tiles for that
Tilemap_Calendar_JuneSharedWeekend_1E_4D4E:
dw $99E0
db 2
db 2
db $E0,$E2
db $E1,$E3

;window layer
Tilemap_Calendar_JuneSharedWeekend_NextMonth_1E_4D56:
dw $9DE0
db 2
db 2
db $E0,$E2
db $E1,$E3

TilemapClear_Calendar_NextMonthCursor_1E_4D5E:
dw $9813
db 1
db 1

include "Data/Tilemaps/PhoneCall/DateCantPromiseAnyMore.asm"

WhatWillYouWorkOnWeekdayTilemapPosition_1E_4D7A:
dw $992B
db 1
db 1

include "Data/Tilemaps/JobAndClub/AvailableOnSpecificDays.asm"

ScheduleScreen_OptionNameTilemap_1E_4D90:
dw $99AD
db ScheduleScreenOptionName_MaxLength
db 1

include "Data/Text/ScheduleScreenOptions.asm"

;clears the entire screen
TilemapClearData_FullScreen_1E_4E0C:
dw $9800
db 20
db 18

;clear tiles for schedule display
TilemapClearData_1E_4E10:
dw $9860
db 20
db 5

Tilemap_FullSizeInfoBoxTop_1E_4E14:
dw $9800
db 20
db 1
db $01
ds 18, $04
db $06

Tilemap_FullSizeInfoBoxLeft_1E_4E2C:
dw $9820
db 1
db 16
ds 16, $02

Tilemap_FullSizeInfoBoxLeft_1E_4E40:
dw $9833
db 1
db 16
ds 16, $07

TilemapClear_MapMessageBox_1E_4E54:
dw $9980
db 20
db 6

MapMessageBox_Top_1E_4E58:
dw $9980
db 20
db 1
db $01
ds 18, $04
db $06

MapMessageBox_Left_1E_4E70:
dw $99A0
db 1
db 4
ds 4, $02

MapMessageBox_Right_1E_4E78:
dw $99B3
db 1
db 4
ds 4, $07

;places bottom of the info box... at the bottom. of the screen.
InfoBoxFullWidthBottom_1E_4E80:
dw $9A20
db 20
db 1
db $03
ds 18, $05
db $08

;action info box - bottom right where all the action happens (player choice, calendar animation etc)
ScheduleScreen_ActionInfoBoxTop_1E_4E98:
dw $990A
db 10
db 1
db $01
ds 8, $04
db $06

ScheduleScreen_ActionInfoBoxLeft_1E_4EA6:
dw $992A
db 1
db 8
ds 8, $02

ScheduleScreen_ActionInfoBoxRight_1E_4EB2:
dw $9933
db 1
db 8
ds 8, $07

ScheduleScreen_ActionInfoBoxBottom_1E_4EBE:
dw $9A2A
db 10
db 1
db $03
ds 8, $05
db $08

AAndBPromptStacked_1E_4ECC:
dw $99ED
db 6
db 2
db "A=けってい"
db "B=とりけし"

AAndBPrompt_1E_4EDC:
dw $9A07
db 12
db 1
db "A=けっていB=とりけし"

AAndBPromptWindow_1E_4EEC:
dw $9D06
db 13
db 1
db "A=けってい B=とりけし"

include "Data/Text/ClubNames.asm"

include "Data/Tilemaps/CharacterProfiles.asm"

include "Data/Tilemaps/RelationshipScreenCharacterFacesAndArrows.asm"

include "Data/CharacterInvitationThresholds.asm"

include "Data/AvailableMapSpots_PhoneCall.asm"

;clears the inside of the action info box
TilemapClear_ScheduleScreen_ActionInfoBox_1E_5465:
dw $992B
db 8
db 8

TilemapClear_WindowContents_1E_5469:
dw $9C21
db 18
db 8

;clears the insides of the full size info box
TilemapClear_FullSizeInfoBox_1E_546D:
dw $9821
db 18
db 16

;used for advance symbol blinking animation used in many situations outside of dialogue parts
MessageBlinkingCursorTilemapData_1E_5471:
dw $9A12
db 1
db 1
db $67

include "Data/EventData/EventsPerDay.asm"

;this is where the names of locations will be drawn when on the map
SelectedMapSpotNameTilemapLocation_1E_5576:
dw $99A1
db PlaceName_MaxLength
db 1

include "Data/Text/LocationNames.asm"

Map_PlayerXPosPerLocation_1E_57A3:
db $00,$10,$50,$50,$48,$10,$68,$00
db $68,$68,$68,$68,$68,$68,$68,$08
db $78,$88,$40,$78,$90,$20,$80,$10
db $50,$70,$28,$28,$28,$18

Map_PlayerYPosPerLocation_1E_57C1:
db $00,$50,$30,$18,$50,$10,$28,$00
db $28,$28,$28,$28,$28,$28,$28,$38
db $30,$48,$28,$18,$20,$28,$58,$10
db $48,$20,$18,$18,$18,$08

include "Data/AvailableMapSpots_WalkingOut.asm"

;item prices
ItemPrices_1E_587E:
dw 5000
dw 10000
dw 20000
dw 35000
dw 6000
dw 3000
dw 2500
dw 4000
dw 2500
dw 8000
dw 2000
dw 8000
dw 2000
dw 1000
dw 10000
dw 2000
dw 3000
dw 2500
dw 5000
dw 5000
dw 7500
dw 2000
dw 2000
dw 2000
dw 10000
dw 50000
dw 500
dw 500
dw 500
dw 500
dw 500
dw 500
dw 500
dw 500
dw 500

;which items get a 50% discount for each month
;two items per month
DiscountedItemsPerMonth_1E_58C4:
db $00,$00                                                  ;\unplayable months
db $00,$00                                                  ;|
db $00,$00                                                  ;/
db $07,$08
db $01,$0F
db $06,$17
db $0D,$12
db $05,$13
db $02,$04
db $0B,$0C
db $0E,$18
db $09,$19

;item name positions in player's inventory
ItemNameStringPositionPointers_1E_58DC:
dw DATA_1E_58F4
dw DATA_1E_58F8
dw DATA_1E_58FC
dw DATA_1E_5900
dw DATA_1E_5904

ItemPriceStringPositionPointers_1E_58E6:
dw DATA_1E_5908
dw DATA_1E_590C
dw DATA_1E_5910
dw DATA_1E_5914
dw DATA_1E_5918

;unused tilemap data
dw $9853
db 6
db 1

DATA_1E_58F4:
dw $9882
db ItemName_MaxLength
db 1

DATA_1E_58F8:
dw $98C2
db ItemName_MaxLength
db 1

DATA_1E_58FC:
dw $9902
db ItemName_MaxLength
db 1

DATA_1E_5900:
dw $9942
db ItemName_MaxLength
db 1

DATA_1E_5904:
dw $9982
db ItemName_MaxLength
db 1

DATA_1E_5908:
dw $98A2
db 6
db 1

DATA_1E_590C:
dw $98E2
db 6
db 1

DATA_1E_5910:
dw $9922
db 6
db 1

DATA_1E_5914:
dw $9962
db 6
db 1

DATA_1E_5918:
dw $99A2
db 6
db 1

include "Data/Text/ItemNames.asm"

include "Data/Tilemaps/ScheduleScreen/StatusBar.asm"
include "Data/Tilemaps/ScheduleScreen/StatWindow.asm"
include "Data/Tilemaps/ScheduleScreen/TimePassingWindow.asm"

;icon tile data for schedule
ActivityIconTileData_1E_5CC7:
db $C0,$D0
db $C1,$D1

db $E0,$F0
db $E1,$F1

db $C2,$D2
db $C3,$D3

db $E2,$F2
db $E3,$F3

db $C4,$D4
db $C5,$D5

db $E4,$F4
db $E5,$F5

db $C6,$D6
db $C7,$D7

db $EC,$FC
db $ED,$FD

db $CE,$DE
db $CF,$DF

db $CC,$DC
db $CD,$DD

db $E6,$F6
db $E7,$F7

db $C8,$D8
db $C9,$D9

db $E8,$F8
db $E9,$F9

db $CA,$DA
db $CB,$DB

db $EA,$FA
db $EB,$FB

db $EE,$FE
db $EF,$FF

;no icon
db $00,$00
db $00,$00

include "Data/Tilemaps/Map/MapImage.asm"

;what month is determined dynamically
Calendar_CurrentMonthNumberTilemapLocation_1E_5DFF:
dw $9808
db 4
db 2

Calendar_NextMonthNumbeTilemapLocation_1E_5E03:
dw $9C08
db 4
db 2

;tiles used to construct month number in the calendar screen
MonthNumberTiles_1E_5E07:
db $00,$00,$90,$92                                          ;4 (reminder that the game starts in april)
db $00,$00,$91,$93

db $00,$00,$94,$96                                          ;5
db $00,$00,$95,$97

db $00,$00,$98,$9A                                          ;6
db $00,$00,$99,$9B

db $00,$00,$9C,$9E                                          ;7
db $00,$00,$9D,$9F

db $00,$00,$A0,$A2                                          ;8
db $00,$00,$A1,$A3

db $00,$00,$A4,$A6                                          ;9
db $00,$00,$A5,$A7

db $84,$86,$80,$82                                          ;10
db $85,$87,$81,$83

db $84,$86,$84,$86                                          ;11
db $85,$87,$85,$87

db $84,$86,$88,$8A                                          ;12
db $85,$87,$89,$8B

;from which day of the week current month's days count starts
Calendar_MonthStartingWeekday_1E_5E4F:
db Weekday_Wednesday
db Weekday_Saturday
db Weekday_Saturday
db Weekday_Tuesday
db Weekday_Thursday
db Weekday_Sunday
db Weekday_Tuesday
db Weekday_Friday
db Weekday_Monday
db Weekday_Wednesday
db Weekday_Saturday
db Weekday_Monday
db Weekday_Thursday                                         ;next year would've started with thursday, but the game ends on december 25

;how many days are in each month + 1 (to determine where the next month begins)
Calendar_MonthDuration_1E_5E5C:
db 31+1
db 29+1
db 31+1
db 30+1
db 31+1
db 30+1
db 31+1
db 31+1
db 30+1
db 31+1
db 30+1
db 31+1
db 31+1

;overall starting day for each month
Calendar_MonthStartingDay_1E_5E69:
db 0
db 0
db 0
db 0
db 17                                                       ;game starts with 17th of april, which means may starts 17 days after
db 17 + 31
db 17 + 31 + 30
db 17 + 31 + 30 + 31
db 17 + 31 + 30 + 31 + 31
db 17 + 31 + 30 + 31 + 31 + 30
db 17 + 31 + 30 + 31 + 31 + 30 + 31
db 17 + 31 + 30 + 31 + 31 + 30 + 31 + 30
db 0

;calendar icons
Calendar_IconTilemapPointers_1E_5E76:
dw CalendarIconTilemap_Date_1E_5E86                         ;0 is no icon (unused duplicate)
dw CalendarIconTilemap_Date_1E_5E86
dw CalendarIconTilemap_Club_1E_5E8A
dw CalendarIconTilemap_Exam_1E_5E8E
dw CalendarIconTilemap_SchoolTrip_1E_5E92
dw CalendarIconTilemap_1E_5E96
dw CalendarIconTilemap_1E_5E9A
dw CalendarIconTilemap_Job_1E_5E9E

CalendarIconTilemap_Date_1E_5E86:
db $B6,$B8
db $B7,$B9

CalendarIconTilemap_Club_1E_5E8A:
db $BE,$C0
db $BF,$C1

CalendarIconTilemap_Exam_1E_5E8E:
db $BA,$BC
db $BB,$BD

CalendarIconTilemap_SchoolTrip_1E_5E92:
db $D2,$D4
db $D3,$D5

;sports event or something idk
CalendarIconTilemap_1E_5E96:
db $D6,$D8
db $D7,$D9

;shrine?
CalendarIconTilemap_1E_5E9A:
db $DA,$DC
db $DB,$DD

CalendarIconTilemap_Job_1E_5E9E:
db $C2,$C4
db $C3,$C5

include "Data/ActivityEffects.asm"

include "Data/Tilemaps/TownInfo/TownInfo.asm"

;some unknown unused data
UNKNOWN_1E_65AA:
db $01,$FF,$7F,$17,$12,$2C,$01,$00
db $00,$3B,$03,$14,$00,$00,$00,$00

Wait8VBlanks_1E_65BA:
LD B, $08                                                   ;

LOOP_1E_65BC:
CALL WaitForVBlank_1E_65C3                                  ;
DEC B                                                       ;
JR NZ, LOOP_1E_65BC                                         ;
RET                                                         ;

WaitForVBlank_1E_65C3:
HALT                                                        ;
LD A, [VBlankHitFlag]                                       ;
AND A                                                       ;
JR Z, WaitForVBlank_1E_65C3                                 ;

XOR A                                                       ;
LD [VBlankHitFlag], A                                       ;
RET                                                         ;

;input A - 8-bit number to get digit display data from (used for day and month display)
ExtractDateDigits_1E_65CF:
LD [$D230], A
CP 99                                                       ;check if date value is somehow above 99
JR NZ, CODE_1E_65DF                                         ;

LD A, $80                                                   ;would display two $80 tiles, which are garbage (they would be underscores in new game screens, but thats in a different bank).
LD [TEMP_ARRAY], A                                          ;a safe guard?
LD [TEMP_ARRAY+1], A                                        ;
RET                                                         ;

CODE_1E_65DF:
CP 9                                                        ;check if it's not above 9
JR NC, CODE_1E_65F0                                         ;

XOR A                                                       ;There Is No Tens
LD [TEMP_ARRAY], A                                          ;

LD A, [$D230]
ADD A, CHARVAL("1")                                         ;
LD [TEMP_ARRAY+1], A                                        ;will display ones
RET                                                         ;

CODE_1E_65F0:
CP 19                                                       ;check if it's not above 20
JR NC, CODE_1E_6604                                         ;

LD A, CHARVAL("1")                                          ;tens will be one
LD [TEMP_ARRAY], A                                          ;

LD A, [$D230]
SUB 10                                                      ;get rid of ten
ADD A, CHARVAL("1")                                         ;
LD [TEMP_ARRAY+1], A                                        ;resulting ones
RET                                                         ;

CODE_1E_6604:
CP 29                                                       ;check if above 30 or not
JR NC, CODE_1E_6618                                         ;

LD A, CHARVAL("2")                                          ;tens will be 2
LD [TEMP_ARRAY], A                                          ;

LD A, [$D230]
SUB 20                                                      ;get rid of tens
ADD A, CHARVAL("1")                                         ;
LD [TEMP_ARRAY+1], A                                        ;resulting ones
RET                                                         ;

CODE_1E_6618:
LD A, CHARVAL("3")                                          ;tens equals 3
LD [TEMP_ARRAY], A                                          ;

LD A, [$D230]
SUB 30                                                      ;get rid of tens
ADD A, CHARVAL("1")                                         ;
LD [TEMP_ARRAY+1], A                                        ;resulting ones
RET                                                         ;

;stores player's name into TEMP_ARRAY
;input PlayerStringType to determine what name to fetch
GetPlayerStringFromSaveFile_1E_6628:
LD DE, TEMP_ARRAY                                           ;
LD HL, CurrentSave_PlayerSecondName                         ;
LD A, [PlayerStringType]                                    ;
SLA A                                                       ;
SLA A                                                       ;
SLA A                                                       ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;

LD B, 6                                                     ;6 tiles
LD C, $00                                                   ;

LOOP_1E_663F:
LD A, [HL+]                                                 ;
CP CHARVAL(" ")                                             ;I'm guessing the loop was supposed to end prematurely if encountered empty space but they didn't finish this...?
LD [DE], A                                                  ;

INC DE                                                      ;
DEC B                                                       ;
JR NZ, LOOP_1E_663F                                         ;
RET                                                         ;

DrawFullScreenInfoBox_1E_6648:
CALL WaitForVBlank_1E_65C3                                  ;

LD HL, TilemapClearData_FullScreen_1E_4E0C                  ;
CALL ClearTilemap_1E_79F0                                   ;

LD HL, Tilemap_FullSizeInfoBoxTop_1E_4E14                   ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, Tilemap_FullSizeInfoBoxLeft_1E_4E2C                  ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, Tilemap_FullSizeInfoBoxLeft_1E_4E40                  ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, InfoBoxFullWidthBottom_1E_4E80                       ;
JP DrawFromTilemap_1E_79B0                                  ;

ClearFullSizeInfoBoxContents_1E_6669:
LD HL, TilemapClear_FullSizeInfoBox_1E_546D                 ;
JP ClearTilemap_1E_79F0                                     ;

DrawMapScreen_TextBox_1E_666F:
LD HL, TilemapClear_MapMessageBox_1E_4E54
CALL ClearTilemap_1E_79F0                                   ;

LD HL, MapMessageBox_Top_1E_4E58                            ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, MapMessageBox_Left_1E_4E70                           ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, MapMessageBox_Right_1E_4E78                          ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, InfoBoxFullWidthBottom_1E_4E80                       ;
JP DrawFromTilemap_1E_79B0                                  ;

DrawScheduleScreen_ActionInfoBox_1E_668D:
LD HL, TilemapClear_ScheduleScreen_ActionInfoBox_1E_5465    ;
CALL ClearTilemap_1E_79F0                                   ;

LD HL, ScheduleScreen_ActionInfoBoxTop_1E_4E98              ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, ScheduleScreen_ActionInfoBoxLeft_1E_4EA6             ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, ScheduleScreen_ActionInfoBoxRight_1E_4EB2            ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, ScheduleScreen_ActionInfoBoxBottom_1E_4EBE           ;
JP DrawFromTilemap_1E_79B0                                  ;

;spawn cursor for e.g. options window
DrawSidewayCursor_WindowLayer_1E_66AB:
LD A, SpriteDisplayable_SidewayCursor                       ;
LD [SpriteDisplayables_ID+1], A                             ;

LD A, $18                                                   ;
LD [SpriteDisplayables_XPos+1], A                           ;

LD A, $68                                                   ;
LD [SpriteDisplayables_YPos+1], A                           ;
RET                                                         ;

;A different version placing it where options are in schedule screen
DrawSidewayCursor_ActionWindow_1E_66BB:
LD A, SpriteDisplayable_SidewayCursor                       ;
LD [SpriteDisplayables_ID+1], A                             ;

LD A, $68                                                   ;
LD [SpriteDisplayables_XPos+1], A                           ;

LD A, $50                                                   ;
LD [SpriteDisplayables_YPos+1], A                           ;
RET                                                         ;

;Third version, with an added bonus of clearing a couple of variables
DrawSidewayCursor_SeparateScreen_1E_66CB:
LD A, SpriteDisplayable_SidewayCursor                       ;
LD [SpriteDisplayables_ID+1], A                             ;

LD A, $18                                                   ;
LD [SpriteDisplayables_XPos+1], A                           ;

LD A, $28                                                   ;
LD [SpriteDisplayables_YPos+1], A                           ;

XOR A                                                       ;
LD [SelectedOption], A                                      ;
LD [GenericStateChangeIndicator], A                         ;
RET                                                         ;

;generic "player pressed A button" code
GenericAButtonResponse_1E_66E2:
LD A, SFX_Confirm                                           ;
LD [SoundQueue], A                                          ;confirmed selection with A

LD A, GenericStateChange_Confirm                            ;
LD [GenericStateChangeIndicator], A                         ;
RET                                                         ;

;generic "player pressed B button" code
GenericBButtonResponse_1E_66ED:
LD A, SFX_Cancel                                            ;
LD [SoundQueue], A                                          ;

LD A, GenericStateChange_Cancel                             ;
LD [GenericStateChangeIndicator], A                         ;
RET                                                         ;

Wait35Frames_1E_66F8:
LD B, 35                                                    ;

LOOP_1E_66FA:
PUSH BC                                                     ;
CALL RandomizeForStats_1E_7A2F                              ;apparently the RNG value that is used for stat distribution is shaken during waits
POP BC                                                      ;
CALL WaitForVBlank_1E_65C3                                  ;

DEC B                                                       ;
JR NZ, LOOP_1E_66FA                                         ;
RET                                                         ;

Wait50Frames_1E_6706:
LD B, 50                                                    ;you can lower this to make the messages go by faster

LOOP_1E_6708:
PUSH BC                                                     ;
CALL RandomizeForStats_1E_7A2F
POP BC                                                      ;
CALL WaitForVBlank_1E_65C3                                  ;
DEC B                                                       ;
JR NZ, LOOP_1E_6708                                         ;
RET                                                         ;

DrawDotsForCharacterDateDecision_1E_6714:
LD C, 8                                                     ;8 dots

LOOP_1E_6716:
CALL Wait35Frames_1E_66F8                                   ;wait in anticipation for the answer
PUSH BC                                                     ;
LD HL, TEMP_ARRAY                                           ;
CALL DrawFromTilemap_1E_79B0                                ;draw the dot
POP BC                                                      ;
DEC C                                                       ;
JR Z, CODE_1E_6730                                          ;if all dots are drawn, escape

LD HL, TEMP_ARRAY                                           ;
LD E, [HL]                                                  ;
INC HL                                                      ;
LD D, [HL]                                                  ;
INC DE                                                      ;next VRAM tile
LD [HL], D                                                  ;
DEC HL                                                      ;
LD [HL], E                                                  ;
JR LOOP_1E_6716                                             ;

CODE_1E_6730:
JP Wait35Frames_1E_66F8                                     ;

;calculates which characters have the most relationship points for the final choice
CalculateTop3CharacterRleationships_1E_6733:
LD HL, CalculatedRelationshipArray                          ;
LD B, $17                                                   ;
XOR A                                                       ;clear the array

LOOP_1E_6739:
LD [HL+], A                                                 ;
DEC B                                                       ;
JR NZ, LOOP_1E_6739                                         ;
LD [CurrentCharacterCount], A                               ;

LD HL, CurrentSave_CharacterRelationship                    ;
LD DE, CalculatedRelationshipArray                          ;

LOOP_1E_6746:
PUSH DE                                                     ;
LD C, [HL]                                                  ;get friendship points
INC HL                                                      ;
LD B, $00                                                   ;high byte is always 0
INC HL                                                      ;

LD E, [HL]                                                  ;get interest points
INC HL                                                      ;
LD D, $00                                                   ;high byte is zero
INC HL                                                      ;

PUSH HL                                                     ;
PUSH DE                                                     ;get interest points we got earlier
POP HL                                                      ;pop them into different registers for calculation

ADD HL, BC                                                  ;combine friendship and interest points

PUSH HL                                                     ;remember the calculation result so far
POP BC                                                      ;
POP HL                                                      ;

LD E, [HL]                                                  ;get love points ❤
INC HL                                                      ;
LD D, $00                                                   ;high byte is, you guessed it, 0
INC HL                                                      ;

PUSH HL                                                     ;
PUSH DE                                                     ;push love points we got
POP HL                                                      ;pop it as HL
PUSH DE                                                     ;push the love points once more

ADD HL, BC                                                  ;add calculated friendship + interest to love points
POP BC                                                      ;pop love points
ADD HL, BC                                                  ;add love points on top of previous calculation, which means love points are twice as valuable

PUSH HL                                                     ;
POP BC                                                      ;
POP HL                                                      ;
POP DE                                                      ;

LD A, C                                                     ;
LD [DE], A                                                  ;store relationship result

INC DE                                                      ;
LD A, B                                                     ;
LD [DE], A                                                  ;high byte of the calculation
INC DE                                                      ;

LD A, [CurrentCharacterCount]                               ;
INC A                                                       ;
LD [CurrentCharacterCount], A                               ;
CP $07                                                      ;
JR NZ, LOOP_1E_6746                                         ;loop until got all characters

LD B, $00                                                   ;
LD DE, CalculatedRelationshipArray                          ;

LOOP_1E_677E:
PUSH BC                                                     ;
LD A, [DE]                                                  ;get calculated total relationship value
LD C, A                                                     ;
INC DE                                                      ;

LD A, [DE]                                                  ;
LD B, A                                                     ;
INC DE                                                      ;

LD HL, CalculatedRelationship_Highest1
CALL CheckIfCurrentRelationshipIsHigher_1E_681C             ;
JR NC, CODE_1E_67C1                                         ;skip right over if less or equal

LD A, [CalculatedRelationship_Highest2]                     ;shift over slots. second place goes into third
LD [CalculatedRelationship_Highest3], A

LD A, [CalculatedRelationship_Highest2+1]                   ;
LD [CalculatedRelationship_Highest3+1], A                   ;

LD A, [CalculatedRelationship_TopCharacter2]                ;
LD [CalculatedRelationship_TopCharacter3], A                ;

LD A, [CalculatedRelationship_Highest1]                     ;first place goes into second
LD [CalculatedRelationship_Highest2], A

LD A, [CalculatedRelationship_Highest1+1]                   ;
LD [CalculatedRelationship_Highest2+1], A                   ;

LD A, [CalculatedRelationship_TopCharacter1]                ;
LD [CalculatedRelationship_TopCharacter2], A                ;

LD A, C                                                     ;
LD [CalculatedRelationship_Highest1], A                     ;

LD A, B                                                     ;
LD [CalculatedRelationship_Highest1+1], A                   ;

POP BC                                                      ;
LD A, B                                                     ;
LD [CalculatedRelationship_TopCharacter1], A                ;this character becomes numba 1
JP CODE_1E_6802                                             ;

CODE_1E_67C1:
LD HL, CalculatedRelationship_Highest2                      ;
CALL CheckIfCurrentRelationshipIsHigher_1E_681C             ;
JR NC, CODE_1E_67EA                                         ;

LD A, [CalculatedRelationship_Highest2]                     ;shift second highest value into third now that we found a value higher than that
LD [CalculatedRelationship_Highest3], A                     ;

LD A, [CalculatedRelationship_Highest2+1]                   ;
LD [CalculatedRelationship_Highest3+1], A                   ;

LD A, [CalculatedRelationship_TopCharacter2]                ;
LD [CalculatedRelationship_TopCharacter3], A                ;

LD A, C                                                     ;
LD [CalculatedRelationship_Highest2], A                     ;

LD A, B                                                     ;
LD [CalculatedRelationship_Highest2+1], A                   ;

POP BC
LD A, B                                                     ;
LD [CalculatedRelationship_TopCharacter2], A                ;Character is the top!
JR CODE_1E_6802                                             ;

CODE_1E_67EA:
LD HL, CalculatedRelationship_Highest3                      ;
CALL CheckIfCurrentRelationshipIsHigher_1E_681C             ;
JR NC, CODE_1E_6801                                         ;

LD A, C                                                     ;
LD [CalculatedRelationship_Highest3], A                     ;

LD A, B                                                     ;
LD [CalculatedRelationship_Highest3+1], A                   ;

POP BC                                                      ;
LD A, B                                                     ;
LD [CalculatedRelationship_TopCharacter3], A                ;That's respectable!
JR CODE_1E_6802                                             ;

CODE_1E_6801:
POP BC                                                      ;not above any of the top 3 values

CODE_1E_6802:
INC B                                                       ;
LD A, B                                                     ;
CP $07                                                      ;
JP NZ, LOOP_1E_677E                                         ;

LD A, [CalculatedRelationship_TopCharacter1]                ;
LD [TopCharacterRelationships_FirstChar], A                 ;

LD A, [CalculatedRelationship_TopCharacter2]                ;
LD [TopCharacterRelationships_SecondChar], A                ;

LD A, [CalculatedRelationship_TopCharacter3]                ;
LD [TopCharacterRelationships_ThirdChar], A                 ;
RET                                                         ;

;input HL - top value to compare
;input BC - the current relationship value to compare
CheckIfCurrentRelationshipIsHigher_1E_681C:
INC HL                                                      ;
LD A, [HL-]                                                 ;
CP B                                                        ;check if high byte matches
JR Z, CODE_1E_6822                                          ;
RET                                                         ;

CODE_1E_6822:
LD A, [HL]                                                  ;
CP C                                                        ;check if low byte matches
JR Z, CODE_1E_6827                                          ;if completely equal, it's not higher
RET                                                         ;

CODE_1E_6827:
SCF                                                         ;
RET                                                         ;

;combs through player's inventory 
CheckPlayerInventory_1E_6829:
XOR A                                                       ;
LD [PlayerHasItemsFlag], A                                  ;
LD [PlayerInventoryItemAmount], A                           ;
LD [UnobtainedItemCount], A                                 ;

LD DE, PlayerInventoryArray                                 ;
LD B, 36                                                    ;

LOOP_1E_6838:
LD [DE], A                                                  ;initialize array by clearing all bytes
INC DE                                                      ;
DEC B                                                       ;
JR NZ, LOOP_1E_6838                                         ;

LD HL, CurrentSave_PlayerInventory                          ;
LD DE, PlayerInventoryArray                                 ;
LD B, 4                                                     ;go through the first 4 bytes

LOOP_1E_6845:
LD A, [HL+]                                                 ;
PUSH BC                                                     ;
LD C, A                                                     ;

PUSH HL                                                     ;
PUSH DE                                                     ;
POP HL                                                      ;
LD B, 8                                                     ;each byte is 8 bits long

LOOP_1E_684D:
SRL C                                                       ;bit test
JR C, CODE_1E_685B                                          ;if bit is clear, item is in player's posession

LD A, [UnobtainedItemCount]                                 ;
INC A                                                       ;amount of items not in player's inventory
LD [UnobtainedItemCount], A                                 ;

XOR A                                                       ;this item is not player's inventory
JR CODE_1E_6867                                             ;

CODE_1E_685B:
LD A, [PlayerInventoryItemAmount]                           ;
INC A                                                       ;amount of items in player's inventory
LD [PlayerInventoryItemAmount], A                           ;

LD A, $01                                                   ;
LD [PlayerHasItemsFlag], A                                  ;player has something in their inventory

CODE_1E_6867:
LD [HL+], A                                                 ;
DEC B                                                       ;
JR NZ, LOOP_1E_684D                                         ;next bit

PUSH HL                                                     ;
POP DE                                                      ;
POP HL                                                      ;
POP BC                                                      ;
DEC B                                                       ;
JR NZ, LOOP_1E_6845                                         ;next set of bits

LD A, [HL+]                                                 ;last items byte
LD C, A                                                     ;
PUSH DE                                                     ;
POP HL                                                      ;
LD B, $03                                                   ;only check first 3 bits

LOOP_1E_6878:
SRL C                                                       ;
JR C, CODE_1E_6886                                          ;

LD A, [UnobtainedItemCount]                                 ;
INC A                                                       ;
LD [UnobtainedItemCount], A                                 ;

XOR A                                                       ;
JR CODE_1E_6892                                             ;

CODE_1E_6886:
LD A, [PlayerInventoryItemAmount]                           ;
INC A                                                       ;
LD [PlayerInventoryItemAmount], A                           ;

LD A, $01                                                   ;
LD [PlayerHasItemsFlag], A                                  ;indicate that the player has item(s)

CODE_1E_6892:
LD [HL+], A                                                 ;
DEC B                                                       ;
JR NZ, LOOP_1E_6878                                         ;

LD C, $00                                                   ;calculate amount of obtained item pages
LD A, [PlayerInventoryItemAmount]                           ;

LOOP_1E_689B:
CP $00                                                      ;check if amount of items is 0
JR Z, CODE_1E_68A9                                          ;
CP $05                                                      ;check if amount of remaining items is less than 5
JR C, CODE_1E_68A8                                          ;
SUB $05                                                     ;-5 items
INC C                                                       ;+1 inventory page
JR LOOP_1E_689B                                             ;

CODE_1E_68A8:
INC C                                                       ;

CODE_1E_68A9:
LD A, C                                                     ;
LD [InventoryObtainedItemsMaxPages], A                      ;

LD C, $00                                                   ;calculate amount of unobtained item pages
LD A, [UnobtainedItemCount]                                 ;

LOOP_1E_68B2:
CP $00                                                      ;check if amount of items is 0
JR Z, CODE_1E_68C0                                          ;
CP $05                                                      ;check if amount of remaining items is less than 5
JR C, CODE_1E_68BF                                          ;
SUB $05                                                     ;-5 items
INC C                                                       ;+1 unobtained items page
JR LOOP_1E_68B2                                             ;

CODE_1E_68BF:
INC C                                                       ;

CODE_1E_68C0:
LD A, C                                                     ;
LD [InventoryUnobtainedItemsMaxPages], A                    ;
RET                                                         ;

PerformActivity_WorkWeek_1E_68C5:
LD A, [CurrentDayOfTheWeek]                                 ;
LD C, A                                                     ;
LD B, $00                                                   ;

LD HL, CurrentSave_ScheduledActivities                      ;
ADD HL, BC                                                  ;
LD A, [HL]                                                  ;
LD [CurrentDayScheduledOption_EarlyDay], A                  ;

LD C, $07                                                   ;
ADD HL, BC                                                  ;
LD A, [HL]                                                  ;
LD [CurrentDayScheduledOption_LaterDay], A                  ;option that happens later the same day

LD A, [CurrentDayScheduledOption_EarlyDay]                  ;
CP ScheduleOption_Club                                      ;check if selected schedule option was club
JR Z, CODE_1E_68E9                                          ;use club effect values if true

LD A, [CurrentDayScheduledOption_EarlyDay]                  ;
LD HL, ActivityEffect_WorkHard_1E_5EA2                      ;
JR CODE_1E_68EF                                             ;

CODE_1E_68E9:
LD A, [CurrentSave_SelectedJobOrClub]                       ;
LD HL, ClubActivityEffect_WorkHard_1E_5EB0                  ;

CODE_1E_68EF:
CALL ApplyActivityEffect_1E_6946                            ;

LD A, [CurrentDayScheduledOption_LaterDay]                  ;
CP ScheduleOption_Club                                      ;still check for club
JR Z, CODE_1E_6901                                          ;

LD A, [CurrentDayScheduledOption_LaterDay]                  ;
LD HL, ActivityEffect_JustWork_1E_5EBE                      ;
JR CODE_1E_6907                                             ;

CODE_1E_6901:
LD A, [CurrentSave_SelectedJobOrClub]                       ;club activities to just do
LD HL, ClubActivityEffect_JustWork_1E_5ECC                  ;

CODE_1E_6907:
CALL ApplyActivityEffect_1E_6946                            ;
RET                                                         ;

GetOffDayActivity_1E_690B:
LD A, [DayOffTime]                                          ;check if morning or no
CP $00                                                      ;
JR NZ, CODE_1E_6916                                         ;

LD A, [CurrentSave_DayOffActivities]                        ;
RET                                                         ;

CODE_1E_6916:
LD A, [CurrentSave_DayOffActivities+1]                      ;
RET                                                         ;

ScheduleOffDayActivity_1E_691A:
PUSH AF                                                     ;
LD A, [DayOffTime]                                          ;
CP $00                                                      ;
JR NZ, CODE_1E_6927                                         ;
POP AF                                                      ;
LD [CurrentSave_DayOffActivities], A                        ;store activity as early day
RET                                                         ;

CODE_1E_6927:
POP AF                                                      ;
LD [CurrentSave_DayOffActivities+1], A                      ;store activity as later in the day
RET                                                         ;

;perform activity (apparently you work hard regardless of time of the day)
PerformActivity_OffDay_1E_692C:
CALL GetOffDayActivity_1E_690B                              ;
CP ScheduleOption_GoingOut                                  ;options from going out onward don't affect stats in any way
JR NC, RETURN_1E_6945                                       ;
CP ScheduleOption_Club                                      ;
JR Z, CODE_1E_693C                                          ;

LD HL, ActivityEffect_WorkHard_1E_5EA2                      ;
JR CODE_1E_6942                                             ;

CODE_1E_693C:
LD A, [CurrentSave_SelectedJobOrClub]                       ;
LD HL, ClubActivityEffect_WorkHard_1E_5EB0                  ;

CODE_1E_6942:
CALL ApplyActivityEffect_1E_6946                            ;

RETURN_1E_6945:
RET                                                         ;

;Input:
;A - offset for the pointer
;HL - pointer
;Affects stats, money, relationships
ApplyActivityEffect_1E_6946:
PUSH HL                                                     ;
PUSH AF                                                     ;
LD HL, CurrentSave_SmartStat                                ;
LD DE, TEMP_ARRAY                                           ;
LD B, 5                                                     ;

LOOP_1E_6950:
LD A, [HL+]                                                 ;
LD [DE], A                                                  ;copy current stats into this array (remember what the stats were before)
INC HL                                                      ;skip high byte
INC DE                                                      ;
DEC B                                                       ;
JR NZ, LOOP_1E_6950                                         ;

POP AF                                                      ;
POP HL                                                      ;
SLA A                                                       ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;
LD E, [HL]                                                  ;

INC HL                                                      ;
LD D, [HL]                                                  ;

LD HL, CurrentSave_SmartStat                                ;
LD B, 7                                                     ;

LOOP_1E_6967:
CALL RandomizeForStats_1E_7A2F                              ;
JR C, CODE_1E_6970                                          ;

LD A, [DE]                                                  ;get first value
INC DE                                                      ;
JR CODE_1E_6972                                             ;

CODE_1E_6970:
INC DE                                                      ;
LD A, [DE]                                                  ;get second value

CODE_1E_6972:
INC DE                                                      ;

LD C, A                                                     ;
CP $80                                                      ;check if bit 7 is enabled
JR NC, CODE_1E_6981                                         ;substract

LD A, [HL]                                                  ;
ADD A, C                                                    ;
JR NC, CODE_1E_697E                                         ;check if about to overflow

LD A, 255                                                  ;cap

CODE_1E_697E:
LD [HL], A                                                  ;
JR CODE_1E_698A                                             ;

CODE_1E_6981:
SUB $7F                                                     ;substract at least 1 point
LD C, A                                                     ;

LD A, [HL]                                                  ;
SUB C                                                       ;
JR NC, CODE_1E_6989                                         ;check if underflow

XOR A                                                       ;prevent that

CODE_1E_6989:
LD [HL], A                                                  ;

CODE_1E_698A:
INC HL                                                      ;
INC HL                                                      ;next stat
DEC B                                                       ;
JR NZ, LOOP_1E_6967                                         ;

LD A, [DE]                                                  ;cash that is added to player's account
INC DE                                                      ;
CALL CashTimes100_1E_69C3                                   ;

LD A, [HL]                                                  ;
ADD A, C                                                    ;
LD [HL+], A                                                 ;

LD A, [HL]                                                  ;
ADC A, B                                                    ;
LD [HL], A                                                  ;
JR NC, CODE_1E_69A0                                         ;check if cash overflow

LD A, $FF                                                   ;fix overflow
LD [HL-], A                                                 ;
LD [HL+], A                                                 ;

CODE_1E_69A0:
INC HL                                                      ;

LD B, 3*7                                                   ;now affect characters' perception

LOOP_1E_69A3:
LD A, [DE]                                                  ;
INC DE                                                      ;
LD C, A                                                     ;
CP $80                                                      ;substract if bit 7 is set
JR NC, CODE_1E_69B3                                         ;

LD A, [HL]                                                  ;
ADD A, C                                                    ;
JR NC, CODE_1E_69B0                                         ;

LD A, 255                                                   ;they can like you a lot, but no more than the 8-bit limit

CODE_1E_69B0:
LD [HL+], A                                                 ;
JR CODE_1E_69BC                                             ;

CODE_1E_69B3:
SUB $7F                                                     ;substract at least 1 point
LD C, A                                                     ;

LD A, [HL]                                                  ;
SUB C                                                       ;
JR NC, CODE_1E_69BB                                         ;

XOR A                                                       ;you're no fun

CODE_1E_69BB:
LD [HL+], A                                                 ;

CODE_1E_69BC:
INC HL                                                      ;
DEC B                                                       ;next set of relationship values
JR NZ, LOOP_1E_69A3                                         ;
JP CheckStatAndClubProgression_1E_69E9                      ;

;related to adding cash. some kinda convoluted calculation (times 100)
CashTimes100_1E_69C3:
LD C, A
LD B, $00
PUSH HL
SLA C                                                       ;input<<2
RL B

SLA C
RL B

PUSH BC
SLA C                                                       ;then shift 3 more times
RL B

SLA C
RL B

SLA C
RL B
PUSH BC
SLA C                                                       ;and once more
RL B
POP HL
ADD HL, BC

POP BC
ADD HL, BC

PUSH HL
POP BC
POP HL
RET

;can enable some events based on stats and jobs you have
;TEMP_ARRAY - stats before changing to new ones
CheckStatAndClubProgression_1E_69E9:
LD A, [CurrentSave_StyleStat]                               ;
LD C, A                                                     ;
LD A, [TEMP_ARRAY+2]                                        ;
CALL CheckStatStageProgress_1E_6B0F                         ;
JR NC, CODE_1E_69FD                                         ;

LD A, [CurrentSave_StatProgressEventBits]                   ;
OR StatProgressBit_Style                                    ;Yumi can check your style
LD [CurrentSave_StatProgressEventBits], A                   ;

CODE_1E_69FD:
LD A, [CurrentSave_SkillStat]                               ;
LD C, A                                                     ;
LD A, [TEMP_ARRAY+3]                                        ;
CALL CheckStatStageProgress_1E_6B0F                         ;
JR NC, CODE_1E_6A18                                         ;

LD A, [CurrentSave_SelectedJobOrClub]                       ;
CP ClubOrJob_HandicraftsClub                                ;
JR NZ, CODE_1E_6A18                                         ;requires you to be in handicrafts club. Did you accept Ruruna's invitation or apply on your own?

LD A, [CurrentSave_StatProgressEventBits]                   ;
OR StatProgressBit_SkillHandicrafts                         ;Ruruna can admire your handicraft skills
LD [CurrentSave_StatProgressEventBits], A                   ;

CODE_1E_6A18:
LD A, [CurrentSave_FitStat]                                 ;
LD C, A                                                     ;
LD A, [TEMP_ARRAY+1]                                        ;
CALL CheckStatStageProgress_1E_6B0F                         ;
JR NC, CODE_1E_6A2C                                         ;

LD A, [CurrentSave_StatProgressEventBits]                   ;
OR StatProgressBit_Fit                                      ;Mizuki can check your muscle
LD [CurrentSave_StatProgressEventBits], A                   ;

CODE_1E_6A2C:
LD A, [CurrentSave_SmartStat]                               ;
LD C, A                                                     ;
LD A, [TEMP_ARRAY]                                          ;
CALL CheckStatStageProgress_1E_6B0F                         ;
JR NC, CODE_1E_6A40                                         ;

LD A, [CurrentSave_StatProgressEventBits]                   ;
OR StatProgressBit_Smart                                    ;Miri can track your progress in the world of knowledge
LD [CurrentSave_StatProgressEventBits], A                   ;

CODE_1E_6A40:
LD A, [CurrentSave_FitStat]                                 ;This looks like a mistake and supposed to check for smart stat, given that the respective event checks for brains, not brawn.
LD C, A                                                     ;
LD A, [TEMP_ARRAY+1]                                        ;
CALL CheckStatStageProgress_1E_6B0F                         ;
JR NC, CODE_1E_6A5B                                         ;

LD A, [CurrentSave_SelectedJobOrClub]                       ;
CP ClubOrJob_GoClub                                         ;requires you to be in Go The Board Game club
JR NZ, CODE_1E_6A5B                                         ;

LD A, [CurrentSave_StatProgressEventBits]                   ;
OR StatProgressBit_SmartGo                                  ;Miri can check your fit. Nope, actually she checks your smart stat.
LD [CurrentSave_StatProgressEventBits], A                   ;

CODE_1E_6A5B:
LD A, [CurrentSave_SenseStat]                               ;
LD C, A                                                     ;
LD A, [TEMP_ARRAY+4]                                        ;
CALL CheckStatStageProgress_1E_6B0F                         ;
JR NC, CODE_1E_6A6F                                         ;

LD A, [CurrentSave_StatProgressEventBits]                   ;
OR StatProgressBit_Sense                                    ;Mari will comment on your singing
LD [CurrentSave_StatProgressEventBits], A                   ;

;Check if you're in one of the sports clubs
CODE_1E_6A6F:
LD A, [CurrentSave_SelectedJobOrClub]                       ;
CP ClubOrJob_BaseballClub                                   ;
JR Z, CODE_1E_6A7D                                          ;
CP ClubOrJob_BasketballClub                                 ;
JR Z, CODE_1E_6A7D                                          ;
CP ClubOrJob_SoccerClub                                     ;
RET NZ                                                      ;return if not in any club

CODE_1E_6A7D:
SUB ClubOrJob_BaseballClub                                  ;
SLA A                                                       ;times 2
LD [SportsClubIndex], A                                     ;

LD HL, ClubPracticeDays_1E_6AE3                             ;
LD A, [CurrentSave_DaysPassed]                              ;
LD C, A                                                     ;
LD B, 4                                                     ;

LOOP_1E_6A8D:
LD A, [HL+]                                                 ;check if the current day matches with the day the match happens
CP C                                                        ;
JR NZ, CODE_1E_6AA0                                         ;

LD HL, SportsClubEventBits                                  ;
LD A, [SportsClubIndex]                                     ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;

LD A, [HL]                                                  ;
OR %00000001                                                ;
LD [HL], A                                                  ;
RET                                                         ;

CODE_1E_6AA0:
DEC B                                                       ;
JR NZ, LOOP_1E_6A8D                                         ;

LD A, [CurrentSave_DaysPassed]                              ;check the day of national tournament
CP 89                                                       ;
JR NZ, CODE_1E_6AB9                                         ;

LD HL, SportsClubEventBits                                  ;
LD A, [SportsClubIndex]                                     ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;

LD A, [HL]                                                  ;
OR %00000010                                                ;
LD [HL], A                                                  ;
RET                                                         ;

CODE_1E_6AB9:
LD A, [CurrentSave_DaysPassed]                              ;tournament can happen on specific day
CP 117                                                      ;
JR NZ, RETURN_1E_6AE2                                       ;

LD HL, SportsClubForTournamentBits_1E_6AE7                  ;
LD A, [SportsClubIndex]                                     ;
SRL A                                                       ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;
LD A, [HL]                                                  ;
LD C, A                                                     ;

LD A, [CurrentSave_SportsClubTournamentBits]                ;check if the bit matches with the club you're in (in case you change clubs?)
AND C                                                       ;
JR Z, RETURN_1E_6AE2                                        ;it's set if you pass a moderate strength check

LD HL, SportsClubEventBits                                  ;
LD A, [SportsClubIndex]                                     ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;

LD A, [HL]                                                  ;you advance into the big leagues or whatever equivalent this game has
OR %00000100                                                ;
LD [HL], A                                                  ;

RETURN_1E_6AE2:
RET                                                         ;

ClubPracticeDays_1E_6AE3:
db 40, 103, 166, 222
.end

;Baseball, basketball, soccer, respectively
SportsClubForTournamentBits_1E_6AE7:
db %00000100,%00001000,%00010000

;Miri-exclusive date event check (probably would've been used for other characters if there were more specific events)
CheckForSpecialDateEvent_1E_6AEA:
LD A, [CharacterOnADate]                                    ;
CP CharProp_Character_Miri                                  ;
JR NZ, RETURN_1E_6B0E                                       ;

LD A, [CurrentSave_DaysPassed]                              ;this must be close to the game ending
CP 253                                                      ;
JR NZ, RETURN_1E_6B0E                                       ;

LD A, [CurrentDateSpot_Miri]                                ;
CP MapSpot_School                                           ;
JR NZ, RETURN_1E_6B0E                                       ;only school invite works

LD A, [CurrentSave_CurrentTimeOfDay]                        ;must be at the morning
CP $00                                                      ;
JR NZ, RETURN_1E_6B0E                                       ;

LD A, [SpecialDateEventBits]                                ;
OR %00000001                                                ;
LD [SpecialDateEventBits], A                                ;

RETURN_1E_6B0E:
RET                                                         ;

;input:
;C - new stat value
;A - previous stat value
;output:
;carry - reach threshold fail flag
;used to determine if the player got over some thresholds to enable related events
CheckStatStageProgress_1E_6B0F:
CP 64                                                       ;check if stat was already above 64
JR NC, CODE_1E_6B1A                                         ;

LD A, C                                                     ;check if just got at or above 64
CP 64                                                       ;
JR NC, CODE_1E_6B30                                         ;
JR CODE_1E_6B2E                                             ;

CODE_1E_6B1A:
CP 128                                                      ;
JR NC, CODE_1E_6B25                                         ;

LD A, C                                                     ;did we just get to 128 or above?
CP 128                                                      ;
JR NC, CODE_1E_6B30                                         ;
JR CODE_1E_6B2E                                             ;

CODE_1E_6B25:
CP 192                                                      ;did we get to 192 or above?
JR NC, CODE_1E_6B2E                                         ;

LD A, C                                                     ;
CP 192                                                      ;
JR NC, CODE_1E_6B30                                         ;

CODE_1E_6B2E:
XOR A                                                       ;nothing happens
RET                                                         ;

CODE_1E_6B30:
SCF                                                         ;trigger stat progress event
RET                                                         ;

CheckExtraDateSpotAvailability_1E_6B32:
LD A, [SelectedDateDaySlot]                                 ;
CP 97                                                       ;
JR NZ, CODE_1E_6B4C                                         ;

LD A, [SelectedDateDayTime]                                 ;
CP $00                                                      ;
RET Z                                                       ;can only attend it at lunch time

LD A, [DateSpotAmount]                                      ;
INC A                                                       ;
LD [DateSpotAmount], A                                      ;+1 date spot

LD A, MapSpot_1A                                            ;this area becomes available on specific date
LD [DateSpotArray+21], A                                    ;
RET                                                         ;

CODE_1E_6B4C:
LD A, [SelectedDateDaySlot]                                 ;
CP 132                                                      ;
RET NZ                                                      ;

LD A, [SelectedDateDayTime]                                 ;
CP $00                                                      ;
RET Z                                                       ;

LD A, [DateSpotAmount]                                      ;
INC A                                                       ;
LD [DateSpotAmount], A                                      ;

LD A, MapSpot_Fireworks                                     ;this area also becomes available on specific date
LD [DateSpotArray+21], A                                    ;
RET                                                         ;

;prepare an array of items that can be given
;In this context, items refer to gift options only
CheckPlayerInventoryForGifts_1E_6B65:
XOR A                                                       ;
LD [PlayerHasItemsFlag], A                                  ;
LD [PlayerInventoryItemAmount], A                           ;

LD HL, PlayerInventoryArray                                 ;
LD B, 4                                                     ;skip over the first 4 items, they won't count as gifts
XOR A                                                       ;

CODE_1E_6B72:
LD [HL+], A                                                 ;
DEC B                                                       ;
JR NZ, CODE_1E_6B72                                         ;

LD B, 22                                                    ;the 22 items after that will be counted as gifts

LOOP_1E_6B78:
LD A, [HL+]                                                 ;
CP $00                                                      ;
JR Z, CODE_1E_6B89                                          ;

LD A, $01                                                   ;player has at least one gift item
LD [PlayerHasItemsFlag], A                                  ;

LD A, [PlayerInventoryItemAmount]                           ;amount of GIFT items
INC A                                                       ;
LD [PlayerInventoryItemAmount], A                           ;+1

CODE_1E_6B89:
DEC B                                                       ;
JR NZ, LOOP_1E_6B78                                         ;

LD B, 9                                                     ;the last 9 items (which are monthly town info items)
XOR A                                                       ;they are not for gifting

CODE_1E_6B8F:
LD [HL+], A                                                 ;
DEC B                                                       ;
JR NZ, CODE_1E_6B8F                                         ;

LD C, $00                                                   ;
LD A, [PlayerInventoryItemAmount]                           ;

LOOP_1E_6B98:
CP $00                                                      ;
JR Z, CODE_1E_6BA6                                          ;
CP $05                                                      ;
JR C, CODE_1E_6BA5                                          ;
SUB $05                                                     ;
INC C                                                       ;+1 page for every 5 items
JR LOOP_1E_6B98                                             ;

CODE_1E_6BA5:
INC C                                                       ;+1 page

CODE_1E_6BA6:
LD A, C                                                     ;
LD [InventoryObtainedItemsMaxPages], A                      ;
CP $00                                                      ;if player obtained zero gift items, still display as having 1 max page
JR NZ, RETURN_1E_6BB3                                       ;

LD A, $01                                                   ;
LD [InventoryObtainedItemsMaxPages], A                      ;will display 1 max page

RETURN_1E_6BB3:
RET                                                         ;

GetTheAmountOfAvailableMapLocations_1E_6BB4:
LD HL, AmountOfAvailableSpots_MapScreen_1E_57DF             ;
LD A, [CurrentMonth]                                        ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;
LD A, [HL]                                                  ;
LD [AmountOfAvailableMapSpots], A                           ;
RET                                                         ;

CheckDatingConditions_1E_6BC3:
LD A, [CurrentSave_CurrentTimeOfDay]                        ;
CP $00                                                      ;
JR Z, CODE_1E_6BD4                                          ;if its morning time, check if you should go on a date

LD A, [NotGoingOutOnDateFlag]                               ;
CP $01                                                      ;
JR Z, CODE_1E_6BD4                                          ;if not going out, check if you should go on a planned date

LD A, $02                                                   ;walking out with some BODY
RET                                                         ;

CODE_1E_6BD4:
LD HL, CurrentSave_PlannedDatesArray                        ;
LD B, 10                                                    ;

CODE_1E_6BD9:
LD A, [HL]                                                  ;date occupied?
CP $FF                                                      ;
JR Z, CODE_1E_6C2D                                          ;

PUSH HL                                                     ;
INC HL                                                      ;
INC HL                                                      ;

LD A, [HL]                                                  ;
LD C, A                                                     ;

LD A, [CurrentSave_DaysPassed]                              ;
CP C                                                        ;
JR NZ, CODE_1E_6C2C                                         ;check if date matches

INC HL                                                      ;
INC HL                                                      ;

LD A, [HL]                                                  ;check if the time of the day matches
LD C, A                                                     ;
LD A, [DayOffTime]                                          ;
CP C                                                        ;
JR NZ, CODE_1E_6C2C                                         ;

POP HL                                                      ;
PUSH HL                                                     ;
CALL CheckIfPlayerIsTired_1E_7D7A                           ;
JR C, CODE_1E_6C36                                          ;check if has become tired/is already tired

XOR A                                                       ;not tired anymore thankfully, can go on a date
LD [CurrentSave_PlayerTiredFlag], A                         ;

POP HL                                                      ;
PUSH HL                                                     ;
LD A, [HL]                                                  ;
LD [CharacterOnADate], A                                    ;
LD [SelectedCharacterForDateOrGift], A                      ;

LD DE, $0005                                                ;
ADD HL, DE                                                  ;now get the date spot

LD A, [HL]                                                  ;
PUSH AF                                                     ;

LD HL, CurrentDateSpotStorage                               ;get where you're supposed to meet
LD A, [CharacterOnADate]                                    ;
SLA A                                                       ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;

POP AF                                                      ;
LD [HL], A                                                  ;
LD [ChosenMapSpot], A                                       ;
LD [CurrentlyChosenDateSpot], A                             ;
POP HL                                                      ;

LD A, $FF                                                   ;this date slot becomes free now
LD [HL+], A                                                 ;
INC HL                                                      ;
LD [HL+], A                                                 ;
INC HL                                                      ;
LD [HL+], A                                                 ;

LD A, $01                                                   ;transition to map screen to the promised date
RET                                                         ;

CODE_1E_6C2C:
POP HL                                                      ;

CODE_1E_6C2D:
LD DE, $0006                                                ;next slot
ADD HL, DE                                                  ;
DEC B                                                       ;
JR NZ, CODE_1E_6BD9                                         ;
XOR A                                                       ;
RET                                                         ;

CODE_1E_6C36:
POP HL                                                      ;
LD A, $03                                                   ;cannot go on date
RET                                                         ;

DrawGiftChoiceGeneralStrings_1E_6C3A:
CALL ClearFullSizeInfoBoxContents_1E_6669                   ;

LD HL, WhichGiftToPickMessage_1E_4A81                       ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, ChooseNoPresentOption_1E_4A94                        ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, AButtonPrompt_1E_48F5                                ;
CALL DrawFromTilemap_1E_79B0                                ;
RET                                                         ;

DrawPlayerMessagesAfterPickingGift_1E_6C50:
CALL ClearFullSizeInfoBoxContents_1E_6669                   ;

LD HL, GoToParkForGiftMessage_1E_4AA4                       ;
CALL DrawFromTilemap_1E_79B0                                ;

CALL Wait50Frames_1E_6706                                   ;

LD HL, WaitAtParkForGiftMessage_1E_4ABA                     ;
CALL DrawFromTilemap_1E_79B0                                ;

CALL Wait50Frames_1E_6706                                   ;

LD A, [SelectedCharacterForDateOrGift]                      ;
LD [SelectedOption], A                                      ;?
RET                                                         ;

DrawCharacterMessagesAfterPickingGift_1E_6C6C:
LD HL, CharacterAgreeingToMeetForGiftMessage_1E_4ACD        ;
CALL DrawFromTilemap_1E_79B0                                ;

CALL Wait50Frames_1E_6706                                   ;

LD HL, CharacterLookingForwardForGiftMessage_1E_4AD8        ;
CALL DrawFromTilemap_1E_79B0                                ;

CALL Wait50Frames_1E_6706                                   ;

LD HL, PuttingDownPhoneOnomatopoeia_GiftCall_1E_4AE7        ;
CALL DrawFromTilemap_1E_79B0                                ;

CALL Wait50Frames_1E_6706                                   ;

LD HL, GiveGiftConversationFinish_1E_4AEE                   ;
JP DrawFromTilemap_1E_79B0                                  ;

BoughtItemProcedure_1E_6C8D:
LD HL, CurrentSave_Cash                                     ;
LD E, [HL]                                                  ;
INC HL                                                      ;
LD D, [HL]                                                  ;

LD A, [ItemPrice]                                           ;substract item price from player's cash
LD C, A                                                     ;
LD A, E                                                     ;
SUB C                                                       ;
LD E, A                                                     ;
DEC HL                                                      ;

LD A, [ItemPrice+1]                                         ;
LD C, A                                                     ;
LD A, D                                                     ;
SBC A, C                                                    ;
LD D, A                                                     ;

LD HL, CurrentSave_Cash                                     ;store resulting money
LD [HL], E                                                  ;
INC HL                                                      ;
LD [HL], D                                                  ;

LD HL, CurrentItemDisplayArray                              ;
LD A, [SelectedOption]                                      ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;

LD A, [HL]                                                  ;
LD B, A                                                     ;
AND $07                                                     ;
LD E, A                                                     ;
LD A, B                                                     ;
SRL A                                                       ;
SRL A                                                       ;
SRL A                                                       ;

LD HL, CurrentSave_PlayerInventory                          ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;
LD A, [HL]                                                  ;

LD C, A                                                     ;
LD B, E                                                     ;
INC B                                                       ;
LD A, %00000001                                             ;start from bit 0

LOOP_1E_6CCB:
DEC B                                                       ;
JR Z, CODE_1E_6CD2                                          ;

SLA A                                                       ;next bit
JR LOOP_1E_6CCB                                             ;

CODE_1E_6CD2:
OR C                                                        ;
LD [HL], A                                                  ;enable that item bit
RET                                                         ;

;HL - data to transfer from
;DE - data to transfer to
;B - amount of bytes to transfer
;amount of data to transfer is 8-bit in this one
CopyData8Bit_1E_6CD5:
LD A, [HL+]                                                 ;
LD [DE], A                                                  ;

INC DE                                                      ;
DEC B                                                       ;
JR NZ, CopyData8Bit_1E_6CD5                                 ;
RET                                                         ;

HandleFadingIn_1E_6CDC:
LD A, $40                                                   ;
LD B, $40                                                   ;
CALL FadeColors_1E_6D2F                                     ;

LD A, $50                                                   ;
LD B, $50                                                   ;
CALL FadeColors_1E_6D2F                                     ;

LD A, $90                                                   ;
LD B, $90                                                   ;
CALL FadeColors_1E_6D2F                                     ;

LD A, $94                                                   ;
LD B, $90                                                   ;
CALL FadeColors_1E_6D2F                                     ;

LD A, $A4                                                   ;
LD B, $A0                                                   ;
CALL FadeColors_1E_6D2F                                     ;

LD A, $E4                                                   ;
LD B, $E0                                                   ;
JP FadeColors_1E_6D2F                                       ;

HandleFadingOut_1E_6D06:
LD A, $A4                                                   ;
LD B, $A0                                                   ;
CALL FadeColors_1E_6D2F                                     ;

LD A, $94                                                   ;
LD B, $90                                                   ;
CALL FadeColors_1E_6D2F                                     ;

LD A, $90                                                   ;
LD B, $90                                                   ;
CALL FadeColors_1E_6D2F                                     ;

LD A, $50                                                   ;
LD B, $50                                                   ;
CALL FadeColors_1E_6D2F                                     ;

LD A, $40                                                   ;
LD B, $40                                                   ;
CALL FadeColors_1E_6D2F                                     ;

XOR A                                                       ;
LD B, $00                                                   ;
JP FadeColors_1E_6D2F                                       ;yeah...

;A - palette value for BG and SP1 palette
;B - palette value for SP0 palette
FadeColors_1E_6D2F:
LDH [Reg_BackgroundPalette], A                              ;
LDH [Reg_SpritePalette1], A                                 ;
LD A, B                                                     ;
LDH [Reg_SpritePalette0], A                                 ;

LD B, 2                                                     ;wait 2 frames

LOOP_1E_6D38:
CALL WaitForVBlank_1E_65C3                                  ;
DEC B                                                       ;
JR NZ, LOOP_1E_6D38                                         ;
RET                                                         ;

SaveToSaveFile_1E_6D3F:
LD A, $0A                                                   ;
LD [MBC1RAMAccessToggle], A                                 ;

LD A, $01                                                   ;
LD [MBC1BankingMode], A                                     ;

XOR A                                                       ;
LD [MBC1RAMBank], A                                         ;

LD A, [SelectedOption]                                      ;
LD HL, SaveFileDataPointers_1E_6DA4                         ;
SLA A                                                       ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;
LD E, [HL]                                                  ;get save RAM position
INC HL                                                      ;
LD D, [HL]                                                  ;
LD BC, SaveFileSize

XOR A                                                       ;
LD [SaveFileChecksum], A                                    ;
LD [SaveFileChecksum+1], A                                  ;

LD HL, CurrentSave_PlayerSecondName                         ;

LOOP_1E_6D69:
LD A, [HL+]                                                 ;
LD [DE], A                                                  ;save this
INC DE                                                      ;
PUSH BC                                                     ;
LD C, A                                                     ;adds contents of the RAM for checksum
LD A, [SaveFileChecksum]                                    ;
ADD A, C                                                    ;
LD [SaveFileChecksum], A                                    ;

LD A, [SaveFileChecksum+1]                                  ;
ADC A, $00                                                  ;
LD [SaveFileChecksum+1], A                                  ;

POP BC                                                      ;
DEC BC                                                      ;
LD A, C                                                     ;
OR B                                                        ;
JR NZ, LOOP_1E_6D69                                         ;keep saving until all is done

LD A, [SaveFileChecksum]                                    ;store checksum to the SRAM
LD [DE], A                                                  ;
INC A                                                       ;
LD L, A                                                     ;

INC DE                                                      ;
LD A, [SaveFileChecksum+1]                                  ;
LD [DE], A                                                  ;
INC A                                                       ;
LD H, A                                                     ;

INC DE                                                      ;
LD A, L                                                     ;
LD [DE], A                                                  ;more checksum stuff
INC L

INC DE                                                      ;
LD A, H                                                     ;
LD [DE], A                                                  ;
INC H                                                       ;

INC DE                                                      ;
LD A, L                                                     ;
LD [DE], A                                                  ;

INC DE                                                      ;
LD A, H                                                     ;
LD [DE], A                                                  ;

LD A, $49                                                   ;done with writing
LD [MBC1RAMAccessToggle], A                                 ;
RET                                                         ;

SaveFileDataPointers_1E_6DA4:
dw $A001
dw $A801
dw $B001

SetOffDayFlag_1E_6DAA:
LD A, [CurrentSave_DaysPassed]                              ;
LD C, A                                                     ;
LD B, $00                                                   ;

LD HL, EventPerDay_1E_5476                                  ;
ADD HL, BC                                                  ;
LD A, [HL]                                                  ;

LD [CurrentDayEvent], A                                     ;
CP Event_OffDay                                             ;check for day off
JR Z, CODE_1E_6DBD                                          ;

XOR A                                                       ;

CODE_1E_6DBD:
LD [DayOffFlag], A                                          ;
RET                                                         ;

MarkDaysOffOnWorkWeekSchedule_1E_6DC1:
LD DE, CurrentSave_ScheduledActivities                      ;
LD A, [CurrentSave_DaysPassed]                              ;
LD C, A                                                     ;
LD B, $00                                                   ;
LD HL, EventPerDay_1E_5476                                  ;
ADD HL, BC                                                  ;
LD B, 7                                                     ;

LOOP_1E_6DD0:
LD A, [HL+]                                                 ;check if one of the days in current work week is a day off (holiday)
CP Event_OffDay                                             ;
JR Z, CODE_1E_6DD9                                          ;

LD A, ScheduleOption_None                                   ;
JR CODE_1E_6DDB                                             ;

CODE_1E_6DD9:
LD A, ScheduleOption_DayOff                                 ;mark that as day off

CODE_1E_6DDB:
LD [DE], A                                                  ;
INC DE                                                      ;
DEC B                                                       ;
JR NZ, LOOP_1E_6DD0                                         ;

LD HL, CurrentSave_ScheduledActivities                      ;
LD B, 7                                                     ;

LOOP_1E_6DE5:
LD A, [HL+]                                                 ;copy same "schedule" into second row (which means empty spots and off days)
LD [DE], A                                                  ;
INC DE                                                      ;
DEC B                                                       ;
JR NZ, LOOP_1E_6DE5                                         ;

LD A, ScheduleOption_DayOff                                 ;mark the end of the week as a weekend
LD [CurrentSave_ScheduledActivities+6], A                   ;
LD [CurrentSave_ScheduledActivities+13], A                  ;

XOR A                                                       ;
LD [$D245], A
JP CancelLastScheduleSelection_1E_6ECE                      ;

DrawOffDayScheduleMessage_1E_6DFA:
LD A, [DayOffTime]                                          ;
CP $00                                                      ;
JR NZ, CODE_1E_6E06                                         ;

LD HL, ScheduleScreen_MakeScheduleOffDayEarlyMessage_1E_4014;day just started message
JR CODE_1E_6E09                                             ;

CODE_1E_6E06:
LD HL, ScheduleScreen_MakeScheduleOffDayLaterMessage_1E_45FA;

CODE_1E_6E09:
CALL DrawFromTilemap_1E_79B0                                ;
JP ScheduleScreen_DrawAAndBButtonPrompts_1E_799E            ;

;spawn schedule selector sprite display
SpawnScheduleSelectorSprite_1E_6E0F:
CALL InitSpriteDisplayables_1E_6E21                         ;

;LD A, SpriteDisplayable_ScheduleSelector
XOR A                                                       ;
LD [SpriteDisplayables_ID], A                               ;

LD A, $40                                                   ;
LD [SpriteDisplayables_XPos], A                             ;

LD A, $20                                                   ;
LD [SpriteDisplayables_YPos], A                             ;
RET                                                         ;

;clear all sprite displayables' slots
InitSpriteDisplayables_1E_6E21:
LD A, SpriteDisplayable_None                                ;
LD B, 10                                                    ;
LD HL, SpriteDisplayables_ID                                ;

LOOP_1E_6E28:
LD [HL+], A                                                 ;
DEC B                                                       ;
JR NZ, LOOP_1E_6E28                                         ;
RET                                                         ;

HandleScheduleScreenFunctionality_1E_6E2D:
CALL PlaceScheduleSelectorSprite_1E_6E97                    ;

LD A, [JoypadInputPress]                                    ;
BitTest JoypadInput_A, A                                    ;
JP NZ, GenericAButtonResponse_1E_66E2                       ;

BitTest JoypadInput_B, A                                    ;
JP NZ, GenericBButtonResponse_1E_66ED                       ;

BitTest JoypadInput_Up, A                                   ;
JP NZ, PressedUp_1E_6E48                                    ;

BitTest JoypadInput_Down, A                                 ;
JP NZ, PressedDown_1E_6E70                                  ;
RET                                                         ;

PressedUp_1E_6E48:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, [ScheduleScreen_PickedOption]                         ;
DEC A                                                       ;
CP $FF                                                      ;
JR NZ, CODE_1E_6E57                                         ;

LD A, ScheduleOption_Exit                                   ;wrap-around to game quit option

CODE_1E_6E57:
LD [ScheduleScreen_PickedOption], A                         ;

LD A, [HolidayOrWeekendFlag]                                ;check if its a day off
CP $00                                                      ;
JR NZ, CODE_1E_6E6D                                         ;

LD A, [ScheduleScreen_PickedOption]                         ;check if picked option would be a phone call
CP ScheduleOption_PhoneCall                                 ;
JR NZ, CODE_1E_6E6D                                         ;

LD A, ScheduleOption_Relax                                  ;
LD [ScheduleScreen_PickedOption], A                         ;phone call and walking out cannot be selected on work week

CODE_1E_6E6D:
JP DrawSelectedScheduleScreenOptionIconAndName_1E_6F02      ;

PressedDown_1E_6E70:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, [ScheduleScreen_PickedOption]                         ;
INC A                                                       ;
CP ScheduleOption_DayOff                                    ;check if went over all available options
JR NZ, CODE_1E_6E7E                                         ;

XOR A                                                       ;loop around

CODE_1E_6E7E:
LD [ScheduleScreen_PickedOption], A                         ;

LD A, [HolidayOrWeekendFlag]                                ;
CP $00                                                      ;
JR NZ, CODE_1E_6E94                                         ;

LD A, [ScheduleScreen_PickedOption]                         ;
CP ScheduleOption_GoingOut                                  ;
JR NZ, CODE_1E_6E6D                                         ;

LD A, ScheduleOption_Relationships                          ;
LD [ScheduleScreen_PickedOption], A                         ;skip over walking out and phone call options, not available on work weeks

CODE_1E_6E94:
JP DrawSelectedScheduleScreenOptionIconAndName_1E_6F02      ;

;probably places the schedule selector sprite correctly
PlaceScheduleSelectorSprite_1E_6E97:
LD A, [ScheduleScreen_CurrentSelectionIndex]                ;
CP $07                                                      ;
JR C, CODE_1E_6EA0                                          ;
SUB $07                                                     ;

CODE_1E_6EA0:
SLA A                                                       ;
SLA A                                                       ;
SLA A                                                       ;
SLA A                                                       ;
ADD A, $40                                                  ;
LD [SpriteDisplayables_XPos], A                             ;

LD A, [ScheduleScreen_CurrentSelectionIndex]                ;
CP $07                                                      ;
JR C, CODE_1E_6EB8                                          ;

LD A, $30                                                   ;
JR CODE_1E_6EBA                                             ;

CODE_1E_6EB8:
LD A, $20                                                   ;

CODE_1E_6EBA:
LD [SpriteDisplayables_YPos], A                             ;
RET                                                         ;

WalkThroughSchedule_1E_6EBE:
LD A, [ScheduleScreen_CurrentSelectionIndex]                ;
INC A                                                       ;
LD [ScheduleScreen_CurrentSelectionIndex], A                ;next selection
CP $0E                                                      ;
RET NC                                                      ;

CALL CheckIfEncounteredDayOff_1E_6EF4                       ;
JR Z, WalkThroughSchedule_1E_6EBE                           ;
RET                                                         ;

CancelLastScheduleSelection_1E_6ECE:
LD A, [ScheduleScreen_CurrentSelectionIndex]                ;
CP $00                                                      ;
JR Z, CODE_1E_6EE0                                          ;can't back any further than the very first selection

DEC A                                                       ;
LD [ScheduleScreen_CurrentSelectionIndex], A                ;

CALL CheckIfEncounteredDayOff_1E_6EF4                       ;
JR Z, CancelLastScheduleSelection_1E_6ECE                   ;if encountered a day off, skip over that
JR CODE_1E_6EE6                                             ;

CODE_1E_6EE0:
CALL CheckIfEncounteredDayOff_1E_6EF4                       ;
CALL Z, WalkThroughSchedule_1E_6EBE                         ;if the first slot was a day off, skip forward until the first valid slot

CODE_1E_6EE6:
LD A, [ScheduleScreen_CurrentSelectionIndex]                ;
LD C, A                                                     ;
LD B, $00                                                   ;
LD HL, CurrentSave_ScheduledActivities                      ;
ADD HL, BC                                                  ;

LD A, ScheduleOption_None                                   ;
LD [HL], A                                                  ;become not filled in
RET                                                         ;

CheckIfEncounteredDayOff_1E_6EF4:
LD A, [ScheduleScreen_CurrentSelectionIndex]                ;
LD C, A                                                     ;
LD B, $00                                                   ;
LD HL, CurrentSave_ScheduledActivities                      ;
ADD HL, BC                                                  ;
LD A, [HL]                                                  ;
CP ScheduleOption_DayOff                                    ;
RET                                                         ;

DrawSelectedScheduleScreenOptionIconAndName_1E_6F02:
LD A, [ScheduleScreen_PickedOption]                         ;
CP $FF                                                      ;
JR Z, CODE_1E_6F10                                          ;

LD C, A                                                     ;
LD HL, SelectedScheduleScreenOptionTilemapPosition_1E_6F36  ;
CALL DrawScheduleIcon_1E_6FA8                               ;

CODE_1E_6F10:
LD HL, ScheduleScreen_OptionNameTilemap_1E_4D90             ;
CALL StoreTilemapLocationToRAM_1E_7333                      ;

LD HL, ScheduleScreen_OptionNames_1E_4D94                   ;
LD A, [ScheduleScreen_PickedOption]                         ;
SLA A                                                       ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;

LD E, [HL]                                                  ;
INC HL                                                      ;
LD D, [HL]                                                  ;
LD HL, DynamicTilemapArray+4                                ;

LD B, ScheduleScreenOptionName_MaxLength                    ;

LOOP_1E_6F2A:
LD A, [DE]                                                  ;
LD [HL+], A                                                 ;
INC DE                                                      ;
DEC B                                                       ;
JR NZ, LOOP_1E_6F2A                                         ;

LD HL, DynamicTilemapArray                                  ;
JP DrawFromTilemap_1E_79B0                                  ;display the name of the currently selected option

SelectedScheduleScreenOptionTilemapPosition_1E_6F36:
dw $998B
db 2
db 2

DrawScheduleScreenElements_1E_6F3A:
LD A, [HolidayOrWeekendFlag]                                ;
CP $00                                                      ;
JR NZ, CODE_1E_6F65                                         ;

LD HL, ScheduleScreen_Workdays_1E_4028                      ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, ScheduleScreen_WorkStrings_1E_4037                   ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, IconBaseTilemapData_EarlyDay_1E_6FCA                 ;
CALL StoreTilemapLocationToRAM_1E_7333                      ;

LD HL, CurrentSave_ScheduledActivities                      ;
CALL DrawWorkweekScheduleIcons_6F8B                         ;

LD HL, IconBaseTilemapData_LateDay_1E_6FCE                  ;
CALL StoreTilemapLocationToRAM_1E_7333                      ;

LD HL, CurrentSave_ScheduledActivities+7                    ;activities for the latter half of the day
JP DrawWorkweekScheduleIcons_6F8B                           ;

;off day schedule screen stuffs
CODE_1E_6F65:
LD HL, ScheduleScreen_FreeDayStrings_1E_4053                ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, IconBaseTilemapData_EarlyDay_1E_6FCA                 ;

LD A, [CurrentSave_DayOffActivities]                        ;
CP ScheduleOption_None                                      ;
JR NZ, CODE_1E_6F77                                         ;

LD A, ScheduleOption_Empty                                  ;

CODE_1E_6F77:
LD C, A                                                     ;
CALL DrawScheduleIcon_1E_6FA8                               ;

LD HL, IconBaseTilemapData_LateDay_1E_6FCE                  ;
LD A, [CurrentSave_DayOffActivities+1]                      ;
CP ScheduleOption_None                                      ;
JR NZ, CODE_1E_6F87                                         ;

LD A, ScheduleOption_Empty                                  ;

CODE_1E_6F87:
LD C, A                                                     ;
JP DrawScheduleIcon_1E_6FA8                                 ;

DrawWorkweekScheduleIcons_6F8B:
LD B, 7                                                     ;7 days in a week (this results in drawing "off day" icons out of bounds, since work week is 6 days)

LOOP_1E_6F8D:
LD A, [HL+]                                                 ;
CP ScheduleOption_None                                      ;
JR NZ, CODE_1E_6F94                                         ;

LD A, ScheduleOption_Empty                                  ;draw nothing if the spot is empty

CODE_1E_6F94:
LD C, A                                                     ;
PUSH HL                                                     ;
PUSH BC                                                     ;
CALL ScheduleScreen_DrawActivityIcon_1E_6FAB                ;

LD A, [DynamicTilemapArray]                                 ;next 16x16 slot
ADD A, $02                                                  ;
LD [DynamicTilemapArray], A                                 ;

POP BC                                                      ;
POP HL                                                      ;
DEC B                                                       ;
JR NZ, LOOP_1E_6F8D                                         ;
RET                                                         ;

DrawScheduleIcon_1E_6FA8:
CALL StoreTilemapLocationToRAM_1E_7333                      ;

;display an icon for schedule
;input C - icon value
ScheduleScreen_DrawActivityIcon_1E_6FAB:
LD A, C                                                     ;
SLA A                                                       ;
SLA A                                                       ;input times 4 for 16x16 icon

LD HL, ActivityIconTileData_1E_5CC7                         ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;
PUSH HL                                                     ;
POP DE                                                      ;
LD HL, DynamicTilemapArray+4                                ;
LD B, 4                                                     ;

LOOP_1E_6FBE:
LD A, [DE]                                                  ;
LD [HL+], A                                                 ;store icon tiles
INC DE                                                      ;
DEC B                                                       ;
JR NZ, LOOP_1E_6FBE                                         ;

LD HL, DynamicTilemapArray                                  ;
JP DrawFromTilemap_1E_79B0                                  ;

;starting VRAM and size
IconBaseTilemapData_EarlyDay_1E_6FCA:
dw $9888
db 2
db 2

IconBaseTilemapData_LateDay_1E_6FCE:
dw $98C8
db 2
db 2

HandleCalendarScreenFunctionality_1E_6FD2:
LD A, [JoypadInputPress]                                    ;
BitTest JoypadInput_B, A                                    ;
JR NZ, PressedB_1E_6FE4                                     ;

BitTest JoypadInput_Left, A                                 ;
JP NZ, PressedLeft_1E_6FEF                                  ;

BitTest JoypadInput_Right, A                                ;
JP NZ, PressedRight_1E_7016                                 ;
RET                                                         ;

PressedB_1E_6FE4:
LD A, SFX_Cancel                                            ;
LD [SoundQueue], A                                          ;quit calendar SFX

LD A, GenericStateChange_Refresh                            ;
LD [GenericStateChangeIndicator], A                         ;
RET                                                         ;

PressedLeft_1E_6FEF:
LD A, [Calendar_CurrentPage]                                ;check if we're already in current month page
CP $00                                                      ;
JR NZ, CODE_1E_6FF7                                         ;if not, go back
RET                                                         ;

CODE_1E_6FF7:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

XOR A                                                       ;
LD [Calendar_CurrentPage], A                                ;

LOOP_1E_7000:
CALL WaitForVBlank_1E_65C3                                  ;

LD A, [Reg_WindowXPosition]                                 ;scroll window right
ADD A, $04                                                  ;
LD [Reg_WindowXPosition], A                                 ;
CP $A5                                                      ;
JR C, LOOP_1E_7000                                          ;check if far enough

LDH A, [Reg_LCDControlAndRender]                            ;make sure window display is disabled as well
AND ~(LCDWindowTilemapSelect|LCDWindowDisplay)              ;
LDH [Reg_LCDControlAndRender], A                            ;
RET                                                         ;

PressedRight_1E_7016:
LD A, [CurrentMonth]                                        ;
CP Month_December                                           ;check if current month is december
RET Z                                                       ;can't check next month

LD A, [Calendar_CurrentPage]                                ;
CP $01                                                      ;check if we're already in next month page
JR NZ, CODE_1E_7024                                         ;
RET                                                         ;

CODE_1E_7024:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, $01                                                   ;
LD [Calendar_CurrentPage], A                                ;

LDH A, [Reg_LCDControlAndRender]                            ;
OR LCDWindowTilemapSelect|LCDWindowDisplay                  ;enable window
LDH [Reg_LCDControlAndRender], A                            ;

LD A, $A5                                                   ;
LD [Reg_WindowXPosition], A                                 ;

XOR A                                                       ;
LD [Reg_WindowYPosition], A                                 ;

LOOP_1E_703D:
CALL WaitForVBlank_1E_65C3                                  ;

LD A, [Reg_WindowXPosition]                                 ;
SUB $04                                                     ;
LD [Reg_WindowXPosition], A                                 ;
CP $07                                                      ;check if scrolled far enough to the left
JR NC, LOOP_1E_703D                                         ;

LD A, $07                                                   ;fix its position
LD [Reg_WindowXPosition], A                                 ;
RET                                                         ;

HandleInfoWindowFunctionality_1E_7052:
LD A, [JoypadInputPress]                                    ;
BitTest JoypadInput_A, A                                    ;
JP NZ, GenericAButtonResponse_1E_66E2                       ;confirmed selection

BitTest JoypadInput_B, A                                    ;
JP NZ, GenericBButtonResponse_1E_66ED                       ;quit info window

BitTest JoypadInput_Up, A                                   ;
JP NZ, PressedUp_1E_706A                                    ;

BitTest JoypadInput_Down, A                                 ;
JP NZ, PressedDown_1E_7083                                  ;
RET                                                         ;

PressedUp_1E_706A:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, [SelectedOption]                                      ;
CP $00                                                      ;handle wrap-around if pressed up when at the first option
JR NZ, CODE_1E_707D                                         ;

LD A, $02                                                   ;go to last option
LD [SelectedOption], A                                      ;
JR CODE_1E_7094                                             ;

CODE_1E_707D:
DEC A                                                       ;
LD [SelectedOption], A                                      ;
JR CODE_1E_7094                                             ;

PressedDown_1E_7083:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, [SelectedOption]                                      ;
INC A                                                       ;
CP $03                                                      ;
JR NZ, CODE_1E_7091                                         ;

XOR A                                                       ;

CODE_1E_7091:
LD [SelectedOption], A                                      ;

CODE_1E_7094:
JP UpdateCursorYPos_Window_1E_7097                          ;???

UpdateCursorYPos_Window_1E_7097:
LD A, [SelectedOption]                                      ;
SLA A                                                       ;
SLA A                                                       ;
SLA A                                                       ;
ADD A, $68                                                  ;
LD [SpriteDisplayables_YPos+1], A                           ;set cursor sprite
RET                                                         ;

HandleSaveWindowFunctionality_1E_70A6:
LD A, [JoypadInputPress]                                    ;
BitTest JoypadInput_A, A                                    ;
JP NZ, GenericAButtonResponse_1E_66E2                       ;player saved their game into selected diary

BitTest JoypadInput_B, A                                    ;
JP NZ, GenericBButtonResponse_1E_66ED                       ;backed out of the save window

BitTest JoypadInput_Up, A                                   ;
JP NZ, PressedUp_1E_70BE                                    ;change selection

BitTest JoypadInput_Down, A                                 ;
JP NZ, PressedDown_1E_70D7                                  ;change selection
RET                                                         ;

PressedUp_1E_70BE:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, [SelectedOption]                                      ;
CP 0                                                        ;
JR NZ, CODE_1E_70D1                                         ;

LD A, $02                                                   ;wrap-around
LD [SelectedOption], A                                      ;
JR CODE_1E_70E8                                             ;

CODE_1E_70D1:
DEC A                                                       ;previous diary
LD [SelectedOption], A                                      ;
JR CODE_1E_70E8                                             ;

PressedDown_1E_70D7:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, [SelectedOption]                                      ;
INC A                                                       ;next diary
CP 3                                                        ;there are only 3 save slots max
JR NZ, CODE_1E_70E5                                         ;wrap around if necessary

XOR A                                                       ;

CODE_1E_70E5:
LD [SelectedOption], A                                      ;

CODE_1E_70E8:
JP CODE_1E_70EB                                             ;

;Generic code for changing cursor's position when it's on the action window in schedule select screen
CODE_1E_70EB:
LD A, [SelectedOption]                                      ;
SLA A                                                       ;
SLA A                                                       ;
SLA A                                                       ;
ADD A, $50                                                  ;update cursor's position based on selected diary
LD [SpriteDisplayables_YPos+1], A                           ;
RET                                                         ;

HandleOptionsWindowFunctionality_1E_70FA:
LD A, [JoypadInputPress]                                    ;
BitTest JoypadInput_A, A                                    ;
JP NZ, GenericAButtonResponse_1E_66E2                       ;

BitTest JoypadInput_B, A                                    ;
JP NZ, GenericBButtonResponse_1E_66ED                       ;

BitTest JoypadInput_Up, A                                   ;
JP NZ, PressedUp_1E_7112                                    ;

BitTest JoypadInput_Down, A                                 ;
JP NZ, PressedDown_1E_712B                                  ;
RET                                                         ;

PressedUp_1E_7112:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, [SelectedOption]                                      ;
CP $00                                                      ;standard wrap-around check
JR NZ, CODE_1E_7125                                         ;

LD A, $01                                                   ;
LD [SelectedOption], A                                      ;
JR CODE_1E_713C                                             ;

CODE_1E_7125:
DEC A                                                       ;
LD [SelectedOption], A                                      ;
JR CODE_1E_713C                                             ;

PressedDown_1E_712B:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, [SelectedOption]                                      ;
INC A                                                       ;
CP $02                                                      ;
JR NZ, CODE_1E_7139                                         ;
XOR A                                                       ;

CODE_1E_7139:
LD [SelectedOption], A                                      ;

CODE_1E_713C:
JP UpdateCursorYPos_Window_1E_7097                          ;

;club selector handler
HandleClubApplicationWindowFunctionality_1E_713F:
LD A, [JoypadInputPress]                                    ;
BitTest JoypadInput_A, A                                    ;
JR NZ, PressedA_1E_7160                                     ;

BitTest JoypadInput_B, A                                    ;
JP NZ, GenericBButtonResponse_1E_66ED                       ;

BitTest JoypadInput_Up, A                                   ;
JP NZ, PressedUp_1E_716A                                    ;

BitTest JoypadInput_Down, A                                 ;
JP NZ, PressedDown_1E_717E                                  ;

BitTest JoypadInput_Left, A                                 ;
JP NZ, PressedLeftOrRight_1E_7191                           ;

BitTest JoypadInput_Right, A                                ;
JP NZ, PressedLeftOrRight_1E_7191                           ;
RET                                                         ;

PressedA_1E_7160:
LD A, [SelectedClub]                                        ;
INC A                                                       ;
LD [CurrentSave_SelectedJobOrClub], A                       ;
JP GenericAButtonResponse_1E_66E2                           ;

PressedUp_1E_716A:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, [SelectedOption_Vertical]                             ;
DEC A                                                       ;
CP $FF                                                      ;
JR NZ, CODE_1E_7179                                         ;

LD A, 2                                                     ;

CODE_1E_7179:
LD [SelectedOption_Vertical], A                             ;
JR CODE_1E_719E                                             ;

PressedDown_1E_717E:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, [SelectedOption_Vertical]                             ;
INC A                                                       ;
CP 3                                                        ;
JR NZ, CODE_1E_718C                                         ;

XOR A                                                       ;wrap-around if going beyond the three opttions

CODE_1E_718C:
LD [SelectedOption_Vertical], A                             ;
JR CODE_1E_719E                                             ;

PressedLeftOrRight_1E_7191:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, [SelectedOption_Horizontal]                           ;
XOR $01                                                     ;flip horizontal option
LD [SelectedOption_Horizontal], A                           ;

;calculate currently selected club and cursor potsition
CODE_1E_719E:
LD A, [SelectedOption_Horizontal]                           ;horizontal option adds +3
LD B, A                                                     ;
SLA A                                                       ;
ADD A, B                                                    ;
LD B, A

LD A, [SelectedOption]                                      ;and vertical option addition
ADD A, B                                                    ;
LD [SelectedClub], A                                        ;

LD A, [SelectedOption]                                      ;position cursor vertically
SLA A                                                       ;
SLA A                                                       ;
SLA A                                                       ;
ADD A, $68                                                  ;
LD [SpriteDisplayables_YPos+1], A                           ;

LD A, [SelectedOption_Horizontal]                           ;position cursor horizontally
CP $00                                                      ;
JR NZ, CODE_1E_71C6                                         ;

LD A, $18                                                   ;left position
JR CODE_1E_71C8                                             ;

CODE_1E_71C6:
LD A, $60                                                   ;right position

CODE_1E_71C8:
LD [SpriteDisplayables_XPos+1], A                           ;
RET                                                         ;

HandleClubOrJobActivityOptionsFunctionality_1E_71CC:
LD A, [JoypadInputPress]                                    ;
BitTest JoypadInput_A, A                                    ;
JP NZ, GenericAButtonResponse_1E_66E2                       ;

BitTest JoypadInput_B, A                                    ;
JP NZ, GenericBButtonResponse_1E_66ED                       ;

BitTest JoypadInput_Up, A                                   ;
JP NZ, PressedUp_1E_71E4                                    ;

BitTest JoypadInput_Down, A                                 ;
JP NZ, PressedDown_1E_71F8                                  ;
RET                                                         ;

PressedUp_1E_71E4:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, [SelectedOption]                                      ;
DEC A                                                       ;
CP $FF                                                      ;
JR NZ, CODE_1E_71F3                                         ;

LD A, $01                                                   ;

CODE_1E_71F3:
LD [SelectedOption], A                                      ;
JR CODE_1E_7209                                             ;

PressedDown_1E_71F8:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, [SelectedOption]                                      ;
INC A                                                       ;
CP $02                                                      ;
JR NZ, CODE_1E_7206                                         ;

XOR A                                                       ;

CODE_1E_7206:
LD [SelectedOption], A                                      ;

CODE_1E_7209:
JP CODE_1E_70EB                                             ;

CheckClubOrJobSelectionTime_1E_720C:
LD A, [HolidayOrWeekendFlag]                                ;
CP $01                                                      ;
JR Z, CODE_1E_7228                                          ;automatically pass if done on weekend or holiday

LD A, [ScheduleScreen_CurrentSelectionIndex]                ;
CP Weekday_Wednesday                                        ;can do on wednesday
JR Z, CODE_1E_7228                                          ;
CP Weekday_Saturday                                         ;
JR Z, CODE_1E_7228                                          ;
CP Weekday_Wednesday+7                                      ;wednesday, late day
JR Z, CODE_1E_7228                                          ;
CP Weekday_Saturday+7                                       ;saturday, late day
JR Z, CODE_1E_7228                                          ;

SCF                                                         ;can't do
RET                                                         ;

CODE_1E_7228:
XOR A                                                       ;can do
RET                                                         ;

RemoveClubOrJobActivityFromSchedule_1E_722A:
LD A, [HolidayOrWeekendFlag]                                ;
CP $01                                                      ;
RET Z                                                       ;nothing happens when it's a day off

LD C, $00                                                   ;
LD HL, CurrentSave_ScheduledActivities                      ;

CODE_1E_7235:
LD A, [HL]                                                  ;check if one of the scheduled activities was.......
CP ScheduleOption_Club                                      ;
JR Z, CODE_1E_723E                                          ;club, replace alredy scheduled ones (if applicable)
CP ScheduleOption_Job                                       ;job
JR NZ, CODE_1E_7252                                         ;

CODE_1E_723E:
LD A, C                                                     ;drop you at the last point where the club activity was selected
LD [ScheduleScreen_CurrentSelectionIndex], A                ;

LOOP_1E_7242:
LD A, [HL]                                                  ;
CP ScheduleOption_DayOff                                    ;check if the day when the club is supposed to happen lines up with a holiday
JR Z, CODE_1E_724A                                          ;

LD A, ScheduleOption_None                                   ;empty
LD [HL], A                                                  ;

CODE_1E_724A:
INC C                                                       ;
INC HL                                                      ;
LD A, $0E                                                   ;
CP C                                                        ;
JR NZ, LOOP_1E_7242                                         ;
RET                                                         ;

CODE_1E_7252:
INC C                                                       ;
INC HL                                                      ;
LD A, $0E                                                   ;
CP C                                                        ;
JR NZ, CODE_1E_7235                                         ;
RET

DrawClubNameForMessage_1E_725A:
LD DE, DynamicTilemapArray                                  ;
LD B, 2                                                     ;get VRAM where to draw club name

LOOP_1E_725F:
LD A, [HL+]                                                 ;
LD [DE], A                                                  ;
INC DE                                                      ;
DEC B                                                       ;
JR NZ, LOOP_1E_725F                                         ;

LD A, 5                                                     ;club name is 5 characters max
LD [DE], A                                                  ;
INC DE                                                      ;
LD A, 1                                                     ;one line
LD [DE], A                                                  ;
INC DE                                                      ;
LD HL, CurrentSave_SelectedJobOrClub                        ;
LD A, [HL]                                                  ;
DEC A                                                       ;

LD B, A                                                     ;
SLA A                                                       ;
SLA A                                                       ;
ADD A, B                                                    ;times 5
LD C, A                                                     ;
LD B, $00                                                   ;
LD HL, ClubNames_1E_4EFD                                    ;
ADD HL, BC                                                  ;

LD B, 5                                                     ;

LOOP_1E_7281:
LD A, [HL+]                                                 ;club name
LD [DE], A                                                  ;
INC DE                                                      ;
DEC B                                                       ;
JR NZ, LOOP_1E_7281                                         ;

LD HL, DynamicTilemapArray                                  ;
JP DrawFromTilemap_1E_79B0                                  ;draw the club name

HandleInventoryScreenFunctionality_1E_728D:
LD A, [JoypadInputPress]                                    ;
BitTest JoypadInput_B, A                                    ;
JP NZ, GenericBButtonResponse_1E_66ED                       ;

BitTest JoypadInput_Left, A                                 ;
JP NZ, PressedLeft_1E_72A0                                  ;

BitTest JoypadInput_Right, A                                ;
JP NZ, PressedRight_1E_72AE                                 ;
RET                                                         ;

PressedLeft_1E_72A0:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, [CurrentSelectionPage]                                ;
DEC A                                                       ;
CP $FF                                                      ;
JR NZ, CODE_1E_72BE                                         ;check if we're on the first page
RET                                                         ;return

PressedRight_1E_72AE:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, [InventoryObtainedItemsMaxPages]                      ;
LD C, A                                                     ;
LD A, [CurrentSelectionPage]                                ;
INC A                                                       ;
CP C                                                        ;check if we're on the last page
JR Z, RETURN_1E_72CC                                        ;return

CODE_1E_72BE:
LD [CurrentSelectionPage], A                                ;

LD A, [PlayerInventoryItemAmount]                           ;check for amount of items. seems redundant, we can't get here if we have zero items
CP $00                                                      ;
RET Z                                                       ;

LD A, $01                                                   ;
LD [ChangedSelectionPageFlag], A                            ;update page number we're on

RETURN_1E_72CC:
RET                                                         ;

DrawCharacterNameOptions_1E_72CD:
LD HL, CharacterNameList_1E_45BE                            ;by default all names are drawn, but respective strings will be ereased if you haven't met that character
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, CurrentSave_MetCharacterBits                         ;
LD A, [HL]                                                  ;
LD C, A                                                     ;
CP $00                                                      ;
JR Z, CODE_1E_7313                                          ;if you have met no one, erase character names

LD HL, CharacterNameListTilemapStart_1E_732F                ;
CALL StoreTilemapLocationToRAM_1E_7333                      ;

LD HL, TEMP_ARRAY                                           ;
LD B, 7                                                     ;

CODE_1E_72E7:
SRL C                                                       ;
JR NC, CODE_1E_72F0                                         ;check if the bit is set or clear

LD A, $01                                                   ;you have met this character
LD [HL+], A                                                 ;
JR CODE_1E_72FC                                             ;

CODE_1E_72F0:
XOR A                                                       ;have not met this character
LD [HL+], A

PUSH HL                                                     ;
PUSH BC                                                     ;
LD HL, DynamicTilemapArray                                  ;
CALL ClearTilemap_1E_79F0                                   ;remove their name
POP BC                                                      ;
POP HL                                                      ;

CODE_1E_72FC:
LD DE, DynamicTilemapArray                                  ;
LD A, [DE]                                                  ;
ADD A, $20                                                  ;next character's name
LD [DE], A                                                  ;
PUSH AF                                                     ;
INC DE                                                      ;
POP AF                                                      ;
LD A, [DE]                                                  ;
ADC A, $00                                                  ;
LD [DE], A                                                  ;

DEC B                                                       ;
JR NZ, CODE_1E_72E7                                         ;

LD A, $01
LD [CursorSpriteEnabler], A                                 ;
RET                                                         ;

CODE_1E_7313:
LD HL, CharacterNameList_1E_45BE                            ;
CALL ClearTilemap_1E_79F0                                   ;

LD HL, CharacterProfile_HaventMetAnyoneMessage_1E_4227      ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, TEMP_ARRAY                                           ;
LD B, $07                                                   ;

LOOP_1E_7324:
XOR A                                                       ;
LD [HL+], A                                                 ;
DEC B                                                       ;
JR NZ, LOOP_1E_7324                                         ;

LD A, $FF                                                   ;
LD [CursorSpriteEnabler], A                                 ;
RET                                                         ;

CharacterNameListTilemapStart_1E_732F:
dw $9882
db 8                                                        ;character name length
db 1

;store 4 bytes from HL into DynamicTilemapArray
StoreTilemapLocationToRAM_1E_7333:
LD DE, DynamicTilemapArray                                  ;
LD B, $04                                                   ;tilemap info is 4 bytes long

LOOP_1E_7338:
LD A, [HL+]                                                 ;
LD [DE], A                                                  ;
INC DE                                                      ;
DEC B                                                       ;
JR NZ, LOOP_1E_7338                                         ;
RET                                                         ;

RelationshipViewer_DrawCharactersAndRelationships_1E_733F:
LD HL, CurrentSave_MetCharacterBits                         ;
LD A, [HL]                                                  ;
LD C, A                                                     ;
LD HL, TEMP_ARRAY                                           ;
LD B, 7                                                     ;7 characters you can meet around the universe of Pocket Love for the Game Boy

LOOP_1E_7349:
SRL C                                                       ;check if met that character
JR NC, CODE_1E_7351                                         ;

LD A, $01                                                   ;flag indicating that we met the character
JR CODE_1E_7352                                             ;

CODE_1E_7351:
XOR A                                                       ;didn't meet the character

CODE_1E_7352:
LD [HL+], A                                                 ;

DEC B                                                       ;next character bit
JR NZ, LOOP_1E_7349                                         ;

LD HL, TEMP_ARRAY                                           ;
LD B, $00                                                   ;

LOOP_1E_735B:
LD A, [HL+]                                                 ;
CP $00                                                      ;
JR Z, CODE_1E_7384                                          ;if didn't meet that character, don't draw relationship between then and player

PUSH HL                                                     ;
PUSH BC                                                     ;
LD HL, RelationshipViewer_CharacterImagePointers_1E_5333    ;
LD A, B                                                     ;
SLA A                                                       ;
LD C, A                                                     ;
LD B, $00                                                   ;
PUSH BC                                                     ;
ADD HL, BC                                                  ;

LD C, [HL]                                                  ;
INC HL                                                      ;
LD B, [HL]                                                  ;
PUSH BC                                                     ;
POP HL                                                      ;
CALL DrawFromTilemap_1E_79B0                                ;draw character's face and name

LD HL, RelationshipViewer_ArrowImagePointers_1E_5341        ;
POP BC                                                      ;
ADD HL, BC                                                  ;calculate pointer

LD C, [HL]                                                  ;\get image pointer
INC HL                                                      ;|
LD B, [HL]                                                  ;/
PUSH BC                                                     ;
POP HL                                                      ;pop BC as HL
CALL DrawFromTilemap_1E_79B0                                ;draw arrow between character and player
POP BC                                                      ;
POP HL                                                      ;

CODE_1E_7384:
INC B                                                       ;
LD A, B                                                     ;
CP 7                                                        ;went through all 7 romance candidate characters?
JR NZ, LOOP_1E_735B                                         ;

;spawn sprite displayables that the type of relationship.
;checks which relationship type has the highest value and displays that.
LD E, LOW(TEMP_ARRAY)                                       ;
LD D, HIGH(TEMP_ARRAY)                                      ;
LD HL, CurrentSave_CharacterRelationship                    ;
LD B, $00                                                   ;

LOOP_1E_7393:
LD A, [DE]                                                  ;
INC DE                                                      ;
CP $00                                                      ;
JR Z, CODE_1E_73DC                                          ;if didn't meet this character, move on

LD A, [HL+]                                                 ;first relationship value
INC HL                                                      ;

LD C, [HL]                                                  ;second relationship value
INC HL                                                      ;
INC HL                                                      ;
CP C                                                        ;check if first value higher than second one
JR C, CODE_1E_73A6                                          ;

LD C, A                                                     ;

LD A, SpriteDisplayable_FriendStage1-SpriteDisplayable_LoveStage1 ;base for star sprites
JR CODE_1E_73A8                                             ;

CODE_1E_73A6:
LD A, SpriteDisplayable_InterestStage1-SpriteDisplayable_LoveStage1 ;base for exclamation mark sprites                                              

CODE_1E_73A8:
LD [BaseRelationshipSpriteDisplayable], A                   ;

LD A, [HL+]                                                 ;third value
INC HL                                                      ;
CP C                                                        ;
JR C, CODE_1E_73B5                                          ;

LD C, A                                                     ;

;LD A, SpriteDisplayable_LoveStage1-SpriteDisplayable_LoveStage1
XOR A                                                       ;base for heart sprites
LD [BaseRelationshipSpriteDisplayable], A                   ;

CODE_1E_73B5:
PUSH HL                                                     ;
PUSH DE                                                     ;
PUSH BC                                                     ;

LD A, [BaseRelationshipSpriteDisplayable]                   ;
ADD A, SpriteDisplayable_LoveStage1                         ;base ID for relationship sprite displayables
LD B, A                                                     ;

LD A, C                                                     ;C - relationship value
SRL A                                                       ;shift left 6 times, this makes it so only 4 stages of relationships can be displayed, despite there being sprites for 8. 
SRL A                                                       ;removing one SRL would make it possible to see all relationship sprites
SRL A                                                       ;
SRL A                                                       ;
SRL A                                                       ;
SRL A                                                       ;
ADD A, B                                                    ;plus base = resulting sprite displayable ID
POP BC                                                      ;
PUSH BC                                                     ;
LD C, A                                                     ;

LD HL, SpriteDisplayables_ID+2                              ;
LD E, B                                                     ;
LD D, $00                                                   ;
ADD HL, DE                                                  ;
LD [HL], C                                                  ;store ID

POP BC                                                      ;
POP DE                                                      ;
POP HL                                                      ;
JR CODE_1E_73EF                                             ;

CODE_1E_73DC:
PUSH HL                                                     ;
PUSH DE                                                     ;
LD HL, SpriteDisplayables_ID+2                              ;
LD E, B                                                     ;
LD D, $00                                                   ;
ADD HL, DE                                                  ;
LD [HL], SpriteDisplayable_None                             ;This sprite displayable should not appear. What should I do if it does...?

POP DE                                                      ;
POP HL                                                      ;

INC HL                                                      ;next character's relationship values
INC HL                                                      ;
INC HL                                                      ;
INC HL                                                      ;
INC HL                                                      ;
INC HL                                                      ;

CODE_1E_73EF:
INC B                                                       ;
LD A, B                                                     ;
CP 7                                                        ;
JR NZ, LOOP_1E_7393                                         ;loop until went through all 7 characters

LD DE, SpriteDisplayables_XPos+2                            ;
LD HL, RelationshipViewer_RelationshipSpriteXPos_1E_7418    ;
LD B, $00                                                   ;

LOOP_1E_73FD:
LD A, [HL+]                                                 ;place the sprite where the arrow is horizontally
LD [DE], A                                                  ;
INC DE                                                      ;

INC B                                                       ;
LD A, B                                                     ;
CP 7                                                        ;
JR NZ, LOOP_1E_73FD                                         ;

LD DE, SpriteDisplayables_YPos+2                            ;
LD HL, RelationshipViewer_RelationshipSpriteYPos_1E_741F    ;
LD B, $00                                                   ;

LOOP_1E_740E:
LD A, [HL+]                                                 ;place the sprite where the arrow is vertically
LD [DE], A                                                  ;
INC DE                                                      ;

INC B                                                       ;
LD A, B                                                     ;
CP 7                                                        ;
JR NZ, LOOP_1E_740E                                         ;
RET                                                         ;

;relationship sprite x-position for each character
RelationshipViewer_RelationshipSpriteXPos_1E_7418:
db $54,$6C,$6C,$3C,$3C,$54,$3C

;relationship sprite y-position for each character
RelationshipViewer_RelationshipSpriteYPos_1E_741F:
db $3C,$3C,$54,$3C,$54,$6C,$6C

HandleCharacterSelectFunctionality_1E_7426:
LD A, [JoypadInputPress]                                    ;
BitTest JoypadInput_A, A                                    ;
JR NZ, PressedA_1E_743D                                     ;

BitTest JoypadInput_B, A                                    ;
JP NZ, GenericBButtonResponse_1E_66ED                       ;

BitTest JoypadInput_Up, A                                   ;
JP NZ, PressedUp_1E_7447                                    ;

BitTest JoypadInput_Down, A                                 ;
JP NZ, PressedDown_1E_746E                                  ;
RET                                                         ;

PressedA_1E_743D:
LD A, [CursorSpriteEnabler]                                 ;check if cursor wasn't enabled
CP $FF                                                      ;
JR Z, RETURN_1E_7497                                        ;nothing happens
JP GenericAButtonResponse_1E_66E2                           ;

PressedUp_1E_7447:
LD A, [CursorSpriteEnabler]                                 ;if cursor not enabled, nothing happens
CP $FF                                                      ;
JR Z, RETURN_1E_7497                                        ;

LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, [SelectedOption]                                      ;
DEC A                                                       ;
CP $FF                                                      ;
JR NZ, CODE_1E_745D                                         ;
LD A, $06                                                   ;

CODE_1E_745D:
LD [SelectedOption], A                                      ;
LD HL, TEMP_ARRAY                                           ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;
LD A, [HL]                                                  ;
CP $00                                                      ;skip over characters you haven't met if applicable
JR NZ, CODE_1E_7494                                         ;
JR PressedUp_1E_7447                                        ;

PressedDown_1E_746E:
LD A, [CursorSpriteEnabler]                                 ;if cursor wasn't enabled, nothing happens still
CP $FF                                                      ;
JR Z, RETURN_1E_7497                                        ;

LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, [SelectedOption]                                      ;
INC A                                                       ;
CP $07                                                      ;
JR NZ, CODE_1E_7483                                         ;

XOR A                                                       ;

CODE_1E_7483:
LD [SelectedOption], A                                      ;
LD HL, TEMP_ARRAY                                           ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;
LD A, [HL]                                                  ;
CP $00                                                      ;
JR NZ, CODE_1E_7494                                         ;
JR PressedDown_1E_746E                                      ;

CODE_1E_7494:
CALL UpdateCursorYPos_SeparateScreen_1E_7498                ;

RETURN_1E_7497:
RET                                                         ;

;Generic code for updating cursor sprite when on a separate screen
UpdateCursorYPos_SeparateScreen_1E_7498:
LD A, [SelectedOption]                                      ;
SLA A                                                       ;
SLA A                                                       ;
SLA A                                                       ;
ADD A, $28                                                  ;
LD [SpriteDisplayables_YPos+1], A                           ;
RET                                                         ;

HandleCharacterProfileFunctionality_1E_74A7:
LD A, [JoypadInputPress]                                    ;
BitTest JoypadInput_B, A                                    ;
JP NZ, GenericBButtonResponse_1E_66ED                       ;

BitTest JoypadInput_Left, A                                 ;
JP NZ, CODE_1E_74BA                                         ;

BitTest JoypadInput_Right, A                                ;
JP NZ, CODE_1E_74CC                                         ;
RET                                                         ;

CODE_1E_74BA:
LD A, [CharacterProfile_CurrentPage]                        ;
CP $00                                                      ;
RET Z                                                       ;

LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

XOR A                                                       ;
LD [CharacterProfile_CurrentPage], A                        ;
JP DrawCharacterProfile_FirstPageInfo_1E_74DF               ;

CODE_1E_74CC:
LD A, [CharacterProfile_CurrentPage]                        ;
CP $01                                                      ;
RET Z                                                       ;

LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, $01                                                   ;
LD [CharacterProfile_CurrentPage], A                        ;
JP DrawCharacterProfile_SecondPageInfo_1E_7507              ;

DrawCharacterProfile_FirstPageInfo_1E_74DF:
LD HL, TilemapClear_CharacterProfileInfo_1E_4F6D            ;
CALL ClearTilemap_1E_79F0                                   ;

LD HL, CharacterProfile_FavoriteThingsString_1E_4F48        ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, CharacterProfile_FavoritePlacesString_1E_4F51        ;
CALL DrawFromTilemap_1E_79B0                                ;

LD A, [SelectedOption]                                      ;
SLA A                                                       ;
LD C, A                                                     ;
LD B, $00                                                   ;
PUSH BC                                                     ;
LD HL, CharacterProfile_FaveThingsPointers_1E_5248          ;
CALL DrawCharacterProfileInfo_1E_75A1                       ;
POP BC                                                      ;
LD HL, CharacterProfile_FavePlacesPointers_1E_5256          ;
JP DrawCharacterProfileInfo_1E_75A1                         ;

DrawCharacterProfile_SecondPageInfo_1E_7507:
LD HL, TilemapClear_CharacterProfileInfo_1E_4F6D            ;
CALL ClearTilemap_1E_79F0                                   ;

LD HL, CharacterProfile_HobbyString_1E_4F5B                 ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, CharacterProfile_PhoneNumberString_1E_4F62           ;
CALL DrawFromTilemap_1E_79B0                                ;

LD A, [SelectedOption]                                      ;
SLA A                                                       ;
LD C, A                                                     ;
LD B, $00                                                   ;
PUSH BC                                                     ;
LD HL, CharacterProfile_HobbiesPointers_1E_5264             ;
CALL DrawCharacterProfileInfo_1E_75A1                       ;
POP BC                                                      ;
LD HL, CharacterProfile_PhoneNumberPointers_1E_5272         ;
JP DrawCharacterProfileInfo_1E_75A1                         ;

;on the map screen
AnimateWalkingSprite_1E_752F:
LD A, [FrameCounter8Bit]                                    ;
SRL A                                                       ;
SRL A                                                       ;
SRL A                                                       ;
AND $03                                                     ;
ADD A, SpriteDisplayable_MapWalkingSprite1                  ;
LD [SpriteDisplayables_ID+2], A                             ;
RET                                                         ;

LoadCharacterProfileVisuals_1E_7540:
LD HL, TilemapClear_FullSizeInfoBox_1E_546D                 ;
CALL ClearTilemap_1E_79F0                                   ;

LD HL, CharacterProfile_LeftAndRightControlsString_1E_4F1B  ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, CharacterProfile_NameString_1E_4F2D                  ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, CharacterProfile_BirthDateString_1E_4F34             ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, CharacterProfile_BloodtypeString_1E_4F3E             ;
CALL DrawFromTilemap_1E_79B0                                ;

LD A, [SelectedOption]                                      ;
SLA A                                                       ;
LD C, A                                                     ;
LD B, $00                                                   ;
PUSH BC                                                     ;
LD HL, CharacterProfile_NamePointers_1E_521E                ;
CALL DrawCharacterProfileInfo_1E_75A1                       ;
POP BC                                                      ;
PUSH BC                                                     ;
LD HL, CharacterProfile_BirthdatePointers_1E_522C           ;
CALL DrawCharacterProfileInfo_1E_75A1                       ;
POP BC                                                      ;
LD HL, CharacterProfile_BloodtypePointers_1E_523A           ;
CALL DrawCharacterProfileInfo_1E_75A1                       ;
CALL DrawCharacterProfile_FirstPageInfo_1E_74DF             ;

XOR A                                                       ;
LD [GenericStateChangeIndicator], A                         ;
LD [CharacterProfile_CurrentPage], A                        ;

LD A, $FF                                                   ;
LD [SpriteDisplayables_ID], A                               ;
LD [SpriteDisplayables_ID+1], A                             ;

LD A, [SelectedOption]                                      ;
ADD A, SpriteDisplayable_ProfileRuruna                      ;display selected character as sprite displayable, starting with Ruruna
LD [SpriteDisplayables_ID+2], A                             ;

LD A, $30                                                   ;
LD [SpriteDisplayables_XPos+2], A                           ;

LD A, $38                                                   ;
LD [SpriteDisplayables_YPos+2], A                           ;
RET                                                         ;

DrawCharacterProfileInfo_1E_75A1:
ADD HL, BC                                                  ;
LD E, [HL]                                                  ;
INC HL                                                      ;
LD D, [HL]                                                  ;
PUSH DE                                                     ;
POP HL                                                      ;
JP DrawFromTilemap_1E_79B0                                  ;

HandleShoppingCenterInitialChoiceFunctionality_1E_75AA:
LD A, [JoypadInputPress]                                    ;
BitTest JoypadInput_A, A                                    ;
JP NZ, GenericAButtonResponse_1E_66E2                       ;

BitTest JoypadInput_B, A                                    ;
JP NZ, GenericBButtonResponse_1E_66ED                       ;

BitTest JoypadInput_Up, A                                   ;
JR NZ, PressedUpOrDown_1E_75C0                              ;

BitTest JoypadInput_Down, A                                 ;
JR NZ, PressedUpOrDown_1E_75C0                              ;
RET                                                         ;

PressedUpOrDown_1E_75C0:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, [SelectedOption]                                      ;
XOR $01                                                     ;flip between the two options
LD [SelectedOption], A                                      ;

CALL UpdateCursorYPos_SeparateScreen_1E_7498                ;
RET                                                         ;

HandleShoppingCenterWalkingChoiceFunctionality_1E_75D1:
LD A, [JoypadInputPress]                                    ;
BitTest JoypadInput_A, A                                    ;
JR NZ, PressedA_1E_75E6                                     ;

BitTest JoypadInput_B, A                                    ;
JP NZ, GenericBButtonResponse_1E_66ED                       ;

BitTest JoypadInput_Up, A                                   ;
JR NZ, PressedUp_1E_75F1                                    ;

BitTest JoypadInput_Down, A                                 ;
JR NZ, PressedDown_1E_7605                                  ;
RET                                                         ;

;Walk to the selected location in the shopping center
PressedA_1E_75E6:
LD A, [SelectedOption]                                      ;
ADD A, MapSpot_ToyStore                                     ;
LD [ChosenMapSpot], A                                       ;
JP GenericAButtonResponse_1E_66E2                           ;

PressedUp_1E_75F1:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, [SelectedOption]                                      ;standard wrap-around procedure
DEC A                                                       ;
CP $FF                                                      ;
JR NZ, CODE_1E_7600                                         ;

LD A, $06                                                   ;go from first option to last

CODE_1E_7600:
LD [SelectedOption], A                                      ;
JR CODE_1E_7616                                             ;

PressedDown_1E_7605:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, [SelectedOption]                                      ;
INC A                                                       ;
CP $07                                                      ;
JR NZ, CODE_1E_7613                                         ;

XOR A                                                       ;go from last option to first

CODE_1E_7613:
LD [SelectedOption], A                                      ;

CODE_1E_7616:
JP UpdateCursorYPos_SeparateScreen_1E_7498                  ;

HandleShoppingCenterShoppingChoiceFunctionality_1E_7619:
LD A, [JoypadInputPress]                                    ;
BitTest JoypadInput_A, A                                    ;
JP NZ, GenericAButtonResponse_1E_66E2                       ;

BitTest JoypadInput_B, A                                    ;
JP NZ, GenericBButtonResponse_1E_66ED                       ;

BitTest JoypadInput_Up, A                                   ;
JR NZ, PressedUp_1E_7637                                    ;

BitTest JoypadInput_Down, A                                 ;
JR NZ, PressedDown_1E_7657                                  ;

BitTest JoypadInput_Left, A                                 ;
JR NZ, PressedLeft_1E_7685                                  ;

BitTest JoypadInput_Right, A                                ;
JR NZ, PressedRight_1E_7698                                 ;
RET                                                         ;

PressedUp_1E_7637:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, [SelectedOption]                                      ;
DEC A                                                       ;
CP $FF                                                      ;
JR NZ, CODE_1E_7646                                         ;

LD A, $05                                                   ;

CODE_1E_7646:
LD [SelectedOption], A                                      ;

LD HL, CurrentItemDisplayArray                              ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;

LD A, [HL]                                                  ;
CP $FF                                                      ;
JR Z, PressedUp_1E_7637                                     ;
JR CODE_1E_7674                                             ;

PressedDown_1E_7657:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, [SelectedOption]                                      ;
INC A                                                       ;
CP $06                                                      ;
JR NZ, CODE_1E_7665                                         ;
XOR A                                                       ;

CODE_1E_7665:
LD [SelectedOption], A                                      ;

LD HL, CurrentItemDisplayArray                              ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;
LD A, [HL]                                                  ;
CP $FF                                                      ;
JR Z, PressedDown_1E_7657                                   ;

CODE_1E_7674:
LD A, [SelectedOption]                                      ;
SLA A                                                       ;
SLA A                                                       ;
SLA A                                                       ;
SLA A                                                       ;
ADD A, $28                                                  ;
LD [SpriteDisplayables_YPos+1], A                           ;
RET                                                         ;

PressedLeft_1E_7685:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, [CurrentSelectionPage]                                ;
CP $00                                                      ;
JR Z, RETURN_1E_7697                                        ;page flipping doesn't have wrap-around implementation

DEC A                                                       ;
LD [CurrentSelectionPage], A                                ;

JR CODE_1E_76AC                                             ;

RETURN_1E_7697:
RET                                                         ;

PressedRight_1E_7698:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, [InventoryUnobtainedItemsMaxPages]                    ;
DEC A                                                       ;
LD C, A                                                     ;
LD A, [CurrentSelectionPage]                                ;
CP C                                                        ;
JR Z, RETURN_1E_76B7                                        ;can't get past max amount of pages
INC A                                                       ;
LD [CurrentSelectionPage], A                                ;

CODE_1E_76AC:
XOR A                                                       ;
LD [SelectedOption], A                                      ;

LD A, GenericStateChange_Refresh                            ;
LD [GenericStateChangeIndicator], A                         ;refresh item selection
JR CODE_1E_7674                                             ;

RETURN_1E_76B7:
RET                                                         ;

HandlePhoneCallOptionsFunctionality_1E_76B8:
LD A, [JoypadInputPress]                                    ;
BitTest JoypadInput_A, A                                    ;
JP NZ, GenericAButtonResponse_1E_66E2                       ;

BitTest JoypadInput_B, A                                    ;
JP NZ, GenericBButtonResponse_1E_66ED                       ;

BitTest JoypadInput_Up, A                                   ;
JR NZ, PressedUpOrDown_1E_76CE                              ;

BitTest JoypadInput_Down, A                                 ;
JR NZ, PressedUpOrDown_1E_76CE                              ;
RET                                                         ;

PressedUpOrDown_1E_76CE:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, [SelectedOption]                                      ;
XOR $01                                                     ;
LD [SelectedOption], A                                      ;
JP CODE_1E_70EB                                             ;

HandleDatePlannerScreenFunctionality_1E_76DE:
LD A, [JoypadInputPress]                                    ;
BitTest JoypadInput_A, A                                    ;
JR NZ, PressedA_1E_76FA                                     ;

BitTest JoypadInput_Up, A                                   ;
JP NZ, PressedUp_1E_7703                                    ;

BitTest JoypadInput_Down, A                                 ;
JP NZ, PressedDown_1E_7717                                  ;

BitTest JoypadInput_Left, A                                 ;
JP NZ, PressedLeftOrRight_1E_772A                           ;

BitTest JoypadInput_Right, A                                ;
JP NZ, PressedLeftOrRight_1E_772A                           ;
RET                                                         ;

PressedA_1E_76FA:
CALL CheckIfSelectedDateSlotIsFree_1E_7756                  ;
JR C, RETURN_1E_7702                                        ;if you can't actually select this slot, nothing happens

CALL GenericAButtonResponse_1E_66E2                         ;

RETURN_1E_7702:
RET                                                         ;

PressedUp_1E_7703:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, [DatePlanner_CurrentSlotChoice]                       ;
DEC A                                                       ;
CP $FF                                                      ;
JR NZ, CODE_1E_7712                                         ;

LD A, $09                                                   ;wrap-around

CODE_1E_7712:
LD [DatePlanner_CurrentSlotChoice], A                       ;
JR CODE_1E_7737                                             ;

PressedDown_1E_7717:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;
LD A, [DatePlanner_CurrentSlotChoice]                       ;
INC A                                                       ;
CP $0A                                                      ;
JR NZ, CODE_1E_7725                                         ;
XOR A                                                       ;

CODE_1E_7725:
LD [DatePlanner_CurrentSlotChoice], A                       ;
JR CODE_1E_7737                                             ;

PressedLeftOrRight_1E_772A:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, [DatePlanner_EarlyOrLateDayChoice]                    ;
XOR $01                                                     ;flip between left and right side
LD [DatePlanner_EarlyOrLateDayChoice], A                    ;

CODE_1E_7737:
LD A, [DatePlanner_EarlyOrLateDayChoice]                    ;
CP $00                                                      ;
JR NZ, CODE_1E_7742                                         ;

LD A, $18                                                   ;place cursor on the left
JR CODE_1E_7744                                             ;

CODE_1E_7742:
LD A, $48                                                   ;place cursor on the right

CODE_1E_7744:
LD [SpriteDisplayables_XPos+1], A                           ;

LD A, [DatePlanner_CurrentSlotChoice]                       ;
SLA A                                                       ;
SLA A                                                       ;
SLA A                                                       ;
ADD A, $28                                                  ;
LD [SpriteDisplayables_YPos+1], A                           ;
RET                                                         ;

CheckIfSelectedDateSlotIsFree_1E_7756:
LD A, [DatePlanner_EarlyOrLateDayChoice]                    ;
CP $00                                                      ;
JR NZ, CODE_1E_7762                                         ;

LD HL, DateOccupiedEarlyDaySlotArray                        ;
JR CODE_1E_7765                                             ;

CODE_1E_7762:
LD HL, DateOccupiedLateDaySlotArray                         ;

CODE_1E_7765:
LD A, [DatePlanner_CurrentSlotChoice]                       ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;
LD A, [HL]                                                  ;
CP $00                                                      ;
JR NZ, CODE_1E_7787                                         ;

LD HL, AvailableDaysForDateArray                            ;
LD A, [DatePlanner_CurrentSlotChoice]                       ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;
LD A, [HL]                                                  ;
LD [SelectedDateDaySlot], A                                 ;

LD A, [DatePlanner_EarlyOrLateDayChoice]                    ;
LD [SelectedDateDayTime], A                                 ;

XOR A                                                       ;
RET                                                         ;

CODE_1E_7787:                                               ;
SCF                                                         ;
RET

HandleSpotChoiceForInviteScreenFunctionality_1E_7789:
LD A, [JoypadInputPress]                                    ;
BitTest JoypadInput_A, A                                    ;
JP NZ, GenericAButtonResponse_1E_66E2                       ;

BitTest JoypadInput_Up, A                                   ;
JP NZ, PressedUp_1E_77A6                                    ;

BitTest JoypadInput_Down, A                                 ;
JP NZ, PressedDown_1E_77BF                                  ;

BitTest JoypadInput_Left, A                                 ;
JP NZ, PressedLeft_1E_77D7                                  ;

BitTest JoypadInput_Right, A                                ;
JP NZ, PressedRight_1E_77E0                                 ;
RET                                                         ;

PressedUp_1E_77A6:
LD A, [CurrentSelectionPageOption]                          ;
DEC A                                                       ;
CP $FF                                                      ;
JR NZ, CODE_1E_77B0                                         ;

LD A, $09                                                   ;

CODE_1E_77B0:
LD [CurrentSelectionPageOption], A                          ;

CALL CheckValidDateSpotSelection_1E_780E                    ;
JR C, PressedUp_1E_77A6                                     ;

LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;
JR CODE_1E_77FF                                             ;

PressedDown_1E_77BF:
LD A, [CurrentSelectionPageOption]                          ;
INC A                                                       ;
CP 10                                                       ;
JR NZ, CODE_1E_77C8                                         ;
XOR A                                                       ;

CODE_1E_77C8:
LD [CurrentSelectionPageOption], A                          ;

CALL CheckValidDateSpotSelection_1E_780E                    ;
JR C, PressedDown_1E_77BF                                   ;keep skipping over choices that don't exist

LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;
JR CODE_1E_77FF                                             ;

PressedLeft_1E_77D7:
LD A, [CurrentSelectionPage]                                ;
DEC A                                                       ;
CP $FF                                                      ;
JR NZ, CODE_1E_77EB                                         ;
RET                                                         ;say it with me children and adults alike: "THERE IS NO WRAP AROUND FOR PAGES!"

PressedRight_1E_77E0:
LD A, [DateSpotMaxPages]                                    ;
LD C, A                                                     ;
LD A, [CurrentSelectionPage]                                ;
INC A                                                       ;
CP C                                                        ;
JR Z, RETURN_1E_77FE                                        ;

CODE_1E_77EB:
LD [CurrentSelectionPage], A                                ;

LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, $01                                                   ;
LD [ChangedSelectionPageFlag], A                            ;indicate page update for display refresh

XOR A                                                       ;
LD [CurrentSelectionPageOption], A                          ;default cursor
JR CODE_1E_77FF                                             ;

RETURN_1E_77FE:
RET                                                         ;

CODE_1E_77FF:
LD A, [CurrentSelectionPageOption]                          ;
SLA A                                                       ;
SLA A                                                       ;
SLA A                                                       ;
ADD A, $28                                                  ;
LD [SpriteDisplayables_YPos+1], A                           ;update cursor position on phone call spot selection screen
RET                                                         ;

CheckValidDateSpotSelection_1E_780E:
LD HL, DateSpotArray                                        ;
LD A, [CurrentSelectionPage]                                ;
SLA A                                                       ;
LD B, A                                                     ;
SLA A                                                       ;
SLA A                                                       ;
ADD A, B                                                    ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;

LD A, [CurrentSelectionPageOption]                          ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;

LD A, [HL]                                                  ;
CP $FF                                                      ;
JR Z, CODE_1E_782E                                          ;

XOR A                                                       ;
RET                                                         ;

CODE_1E_782E:
SCF                                                         ;will skip over options that aren't there
RET                                                         ;

HandleGiftSelectionScreenFunctionality_1E_7830:
LD A, [JoypadInputPress]                                    ;
BitTest JoypadInput_A, A                                    ;
JP NZ, GenericAButtonResponse_1E_66E2                       ;

BitTest JoypadInput_Up, A                                   ;
JP NZ, PressedUp_1E_784D                                    ;

BitTest JoypadInput_Down, A                                 ;
JP NZ, PressedDown_1E_7866                                  ;

BitTest JoypadInput_Left, A                                 ;
JP NZ, PressedLeft_1E_787E                                  ;

BitTest JoypadInput_Right, A                                ;
JP NZ, PressedRight_1E_7887                                 ;
RET                                                         ;

PressedUp_1E_784D:
LD A, [CurrentSelectionPageOption]                          ;
DEC A                                                       ;
CP $FF                                                      ;
JR NZ, CODE_1E_7857                                         ;

LD A, 5                                                     ;wrap around cursor

CODE_1E_7857:
LD [CurrentSelectionPageOption], A                          ;
CALL CheckValidGiftItemSelection_1E_78B7                    ;
JR C, PressedUp_1E_784D                                     ;

LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;
JR CODE_1E_78A6                                             ;

PressedDown_1E_7866:
LD A, [CurrentSelectionPageOption]                          ;
INC A                                                       ;
CP $06
JR NZ, CODE_1E_786F                                         ;

XOR A                                                       ;

CODE_1E_786F:
LD [CurrentSelectionPageOption], A                          ;

CALL CheckValidGiftItemSelection_1E_78B7                    ;
JR C, PressedDown_1E_7866                                   ;

LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;
JR CODE_1E_78A6                                             ;

PressedLeft_1E_787E:
LD A, [CurrentSelectionPage]                                ;
DEC A                                                       ;
CP $FF                                                      ;
JR NZ, CODE_1E_7892                                         ;
RET                                                         ;can't wrap-around pages

PressedRight_1E_7887:
LD A, [InventoryObtainedItemsMaxPages]                      ;
LD C, A                                                     ;
LD A, [CurrentSelectionPage]                                ;
INC A                                                       ;
CP C                                                        ;
JR Z, RETURN_1E_78A5                                        ;still can't wrap-around pages

CODE_1E_7892:
LD [CurrentSelectionPage], A                                ;update current page value

LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, $01                                                   ;
LD [ChangedSelectionPageFlag], A                            ;refresh display

XOR A                                                       ;
LD [CurrentSelectionPageOption], A                          ;
JR CODE_1E_78A6                                             ;

RETURN_1E_78A5:
RET                                                         ;

CODE_1E_78A6:
LD A, [CurrentSelectionPageOption]                          ;
SLA A                                                       ;
SLA A                                                       ;
SLA A                                                       ;
SLA A                                                       ;
ADD A, $28                                                  ;
LD [SpriteDisplayables_YPos+1], A                           ;update cursor position based on chosen option on current page
RET                                                         ;

CheckValidGiftItemSelection_1E_78B7:
LD HL, CurrentItemDisplayArray                              ;
LD A, [CurrentSelectionPageOption]                          ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;

LD A, [HL]                                                  ;check if we stumbled upon an empty slot
CP $FF                                                      ;
JR Z, CODE_1E_78C8                                          ;

XOR A                                                       ;
RET                                                         ;

CODE_1E_78C8:
SCF                                                         ;skip over it
RET                                                         ;

;Remove item from player's inventory, it has been gifted
RemoveItemFromPlayerInventory_1E_78CA:
LD A, [CurrentlyChosenGift]                                 ;
LD B, A                                                     ;
AND $07                                                     ;calculate which bit the item corresponds to
LD E, A                                                     ;

LD A, B                                                     ;
SRL A                                                       ;
SRL A                                                       ;
SRL A                                                       ;

LD HL, CurrentSave_PlayerInventory                          ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;

LD A, [HL]                                                  ;
LD C, A                                                     ;
LD B, E                                                     ;
INC B                                                       ;

XOR A                                                       ;load 0 into A, then replaced by FF...
LD A, $FF                                                   ;

LOOP_1E_78E6:
RL A                                                        ;bit shift to filter the gifted item's bit
DEC B                                                       ;
JR NZ, LOOP_1E_78E6                                         ;
AND C                                                       ;logical AND
LD [HL], A                                                  ;removes that item
RET                                                         ;

;input:
;A - day value
;output:
;carry - set if the day is off day
CheckIfInputDayIsOffDay_1E_78EE:
PUSH BC                                                     ;
PUSH HL                                                     ;
LD C, A                                                     ;
LD B, $00                                                   ;
LD HL, EventPerDay_1E_5476                                  ;
ADD HL, BC                                                  ;

LD A, [HL]                                                  ;
CP Event_OffDay                                             ;
JR Z, CODE_1E_78FF                                          ;if off day, set carry flag

XOR A                                                       ;
JR CODE_1E_7900                                             ;

CODE_1E_78FF:
SCF                                                         ;

CODE_1E_7900:
POP HL                                                      ;
POP BC                                                      ;
RET                                                         ;

;Just entered the shopping center
LoadShoppingCenterInitialChoiceGeneralLayout_1E_7903:
CALL ClearFullSizeInfoBoxContents_1E_6669                   ;

LD HL, ShoppingCenterWhatToDoMessage_1E_469D                ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, ShoppingCenterInitialChoiceStrings_1E_46A9           ;
CALL DrawFromTilemap_1E_79B0                                ;

CALL SeparateScreen_DrawAAndBButtonPrompts_1E_79A4          ;

LD A, $FF                                                   ;remove the walking dude sprite
LD [SpriteDisplayables_ID+2], A                             ;
JP DrawSidewayCursor_SeparateScreen_1E_66CB                 ;

;Picked walking option
LoadShoppingCenterWalkGeneralLayout_1E_791D:
CALL ClearFullSizeInfoBoxContents_1E_6669                   ;

LD HL, ShoppingCenterWhereToGoMessage_1E_46BD               ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, ShoppingCenterLocationChoiceStrings_1E_46CB          ;
CALL DrawFromTilemap_1E_79B0                                ;

CALL SeparateScreen_DrawAAndBButtonPrompts_1E_79A4          ;
JP DrawSidewayCursor_SeparateScreen_1E_66CB                 ;

;Picked buy option
LoadShoppingCenterBuyChoiceGeneralLayout_1E_7932:
LD HL, ShoppingeCenterWhatToBuyMessage_1E_4731              ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, ShoppingCenterPlayerMoneyCountString_1E_473F         ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, ShoppingCenterNoBuyString_1E_474D                    ;
CALL DrawFromTilemap_1E_79B0                                ;
JP SeparateScreen_DrawAAndBButtonPrompts_1E_79A4            ;

LoadBoughtItemMessage_1E_7947:
CALL ClearFullSizeInfoBoxContents_1E_6669                   ;

LD HL, PurchasedThisItemString_1E_4788                      ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, BoughtItemMessage_1E_478D                            ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, PurchasedItemNameTilemapData_1E_4780                 ;
JP StoreTilemapLocationToRAM_1E_7333                        ;

;draw some general dating planner elements
LoadDatePlannerGeneralLayout_1E_795C:
CALL ClearFullSizeInfoBoxContents_1E_6669                   ;

LD HL, WhatDateToMeetMessage_1E_4889                        ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, DatePlannerEarlyDayStrings_1E_48A9                   ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, DatePlannerLaterDayStrings_1E_48C1                   ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, DatePlannerMonthStrings_1E_48D9                      ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, DatePlannerDayStrings_1E_48E7                        ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, AButtonPrompt_1E_48F5                                ;
JP DrawFromTilemap_1E_79B0                                  ;

DrawPlayerMessagesForDateConfirmation_1E_7983:
CALL ClearFullSizeInfoBoxContents_1E_6669                   ;

LD HL, PhoneCallDateConfirmationOnceMoreMessage_1E_4980     ;
CALL DrawFromTilemap_1E_79B0                                ;

CALL Wait50Frames_1E_6706                                   ;

LD HL, PhoneCallConfirmationTimeMessage_1E_4996             ;
CALL DrawFromTilemap_1E_79B0                                ;

CALL Wait50Frames_1E_6706                                   ;

LD HL, PhoneCallConfirmationPlannedDayTemplate_1E_49A7      ;
JP DrawFromTilemap_1E_79B0                                  ;

;A and B prompts are on top of one another
ScheduleScreen_DrawAAndBButtonPrompts_1E_799E:
LD HL, AAndBPromptStacked_1E_4ECC                           ;
JP DrawFromTilemap_1E_79B0                                  ;

;more specifically, map and associated screens (like shop)
;A and B prompts are together (literally, there's no space between them)
SeparateScreen_DrawAAndBButtonPrompts_1E_79A4:
LD HL, AAndBPrompt_1E_4EDC                                  ;
JP DrawFromTilemap_1E_79B0                                  ;

;A and B prompts on window layer (separate by space this time)
Window_DrawAAndBButtonPrompts_1E_79AA:
LD HL, AAndBPromptWindow_1E_4EEC                            ;
JP DrawFromTilemap_1E_79B0                                  ;yep

;input HL - tilemap data.
DrawFromTilemap_1E_79B0:
LD A, [HL+]                                                 ;
LD E, A                                                     ;
LD [TilemapDrawing_VRAMLoc], A                              ;first two bytes are VRAM location to draw at

LD A, [HL+]                                                 ;
LD D, A                                                     ;
LD [TilemapDrawing_VRAMLoc+1], A                            ;

LD A, [HL+]                                                 ;
LD C, A                                                     ;
LD [TilemapDrawing_TilesPerLine], A                         ;third byte is tiles on each single line

LD A, [HL+]                                                 ;
LD B, A                                                     ;
LD [TilemapDrawing_LinesToDraw], A                          ;fourth byte is the amount of lines to draw

LOOP_1E_79C4:
CheckPPUModes                                               ;
LD A, [HL]                                                  ;
LD [DE], A                                                  ;

LDH A, [Reg_LCDStatus]                                      ;
BIT 1, A                                                    ;
JR NZ, LOOP_1E_79C4                                         ;

INC HL                                                      ;
INC DE                                                      ;
DEC C                                                       ;
XOR A                                                       ;
CP C                                                        ;
JR NZ, LOOP_1E_79C4                                         ;

DEC B                                                       ;
JR Z, RETURN_1E_79EF                                        ;

LD A, [TilemapDrawing_VRAMLoc]                              ;
ADD A, $20                                                  ;next row of tiles
LD E, A                                                     ;
LD [TilemapDrawing_VRAMLoc], A                              ;

LD A, [TilemapDrawing_VRAMLoc+1]                            ;
ADC A, $00                                                  ;
LD D, A                                                     ;
LD [TilemapDrawing_VRAMLoc+1], A                            ;

LD A, [TilemapDrawing_TilesPerLine]                         ;
LD C, A                                                     ;
JR LOOP_1E_79C4                                             ;

RETURN_1E_79EF:
RET                                                         ;

;clears a specified area
ClearTilemap_1E_79F0:
LD A, [HL+]                                                 ;
LD E, A                                                     ;
LD [TilemapDrawing_VRAMLoc], A                              ;

LD A, [HL+]                                                 ;
LD D, A                                                     ;
LD [TilemapDrawing_VRAMLoc+1], A                            ;

LD A, [HL+]                                                 ;
LD C, A                                                     ;
LD [TilemapDrawing_TilesPerLine], A                         ;

LD A, [HL+]                                                 ;
LD B, A                                                     ;
LD [TilemapDrawing_LinesToDraw], A                          ;

LOOP_1E_7A04:
CheckPPUModes                                               ;
XOR A                                                       ;
LD [DE], A                                                  ;

LDH A, [Reg_LCDStatus]                                      ;
BIT 1, A                                                    ;
JR NZ, LOOP_1E_7A04                                         ;

INC DE                                                      ;
DEC C                                                       ;
XOR A                                                       ;
CP C                                                        ;
JR NZ, LOOP_1E_7A04                                         ;

DEC B                                                       ;
JR Z, RETURN_1E_7A2E                                        ;

LD A, [TilemapDrawing_VRAMLoc]                              ;
ADD A, $20                                                  ;
LD E, A                                                     ;
LD [TilemapDrawing_VRAMLoc], A                              ;

LD A, [TilemapDrawing_VRAMLoc+1]                            ;
ADC A, $00                                                  ;
LD D, A                                                     ;
LD [TilemapDrawing_VRAMLoc+1], A                            ;

LD A, [TilemapDrawing_TilesPerLine]                         ;
LD C, A                                                     ;
JR LOOP_1E_7A04                                             ;

RETURN_1E_7A2E:
RET                                                         ;

;some kind of randomization
RandomizeForStats_1E_7A2F:
PUSH BC                                                     ;
LD C, $03                                                   ;
LD B, $03                                                   ;

LOOP_1E_7A34:
PUSH HL                                                     ;
LD A, [FrameCounter8Bit]                                    ;
LD HL, RandomNumber_ActivityEffect                          ;
ADD A, [HL]                                                 ;
CPL                                                         ;
INC A                                                       ;
RRCA                                                        ;
LD A, [FrameCounter8Bit]                                    ;
LD [HL], A                                                  ;
POP HL                                                      ;
AND B                                                       ;
CP C                                                        ;
JR NC, LOOP_1E_7A34                                         ;

POP BC                                                      ;
LD A, [RandomNumber_ActivityEffect]                         ;
SRA A                                                       ;
RET                                                         ;

;check if should display a date icon on the calendar
CalendarDisplay_CheckForPlannedDates_1E_7A4F:
LD HL, CurrentSave_PlannedDatesArray                        ;
LD A, [Calendar_Day]                                        ;
LD C, A                                                     ;
LD B, 12                                                    ;fairly certain there's normally 10 slots...

LOOP_1E_7A58:
PUSH HL                                                     ;
LD A, [HL]                                                  ;
CP $FF                                                      ;
JR Z, CODE_1E_7A67                                          ;
INC HL                                                      ;
INC HL                                                      ;
LD A, [HL]                                                  ;
CP C                                                        ;
JR NZ, CODE_1E_7A67                                         ;
POP HL                                                      ;
SCF                                                         ;
RET                                                         ;

CODE_1E_7A67:
POP HL                                                      ;
LD DE, $0006                                                ;
ADD HL, DE                                                  ;
DEC B                                                       ;
JR NZ, LOOP_1E_7A58                                         ;
XOR A                                                       ;
RET                                                         ;

LoadCDLinkOptionGeneralLayout_1E_7A71:
LD HL, TilemapClear_WindowContents_1E_5469                  ;
CALL ClearTilemap_1E_79F0                                   ;

LD HL, CDLinkOption_LinkWithCDQuestionMessage_1E_4B36       ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, CDLinkOption_CurrentCDLinkSettingIsString_1E_4B4C    ;
CALL DrawFromTilemap_1E_79B0                                ;

LD A, [CurrentSave_CDLinkFlag]                              ;check current status of CD link
CP $00                                                      ;
JR NZ, CODE_1E_7A8F                                         ;

LD HL, CDLinkOption_CDNotLinkedMessage_1E_4B69              ;
JR CODE_1E_7A92                                             ;

CODE_1E_7A8F:
LD HL, CDLinkOption_CDLinkedMessage_1E_4B5B                 ;

CODE_1E_7A92:
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, CDLinkOption_OptionStrings_1E_4B77                   ;
CALL DrawFromTilemap_1E_79B0                                ;
JP Window_DrawAAndBButtonPrompts_1E_79AA                    ;

HandleCDLinkOptionFunctionality_1E_7A9E:
LD A, [JoypadInputPress]                                    ;
BitTest JoypadInput_A, A                                    ;
JP NZ, GenericAButtonResponse_1E_66E2                       ;

BitTest JoypadInput_B, A                                    ;
JP NZ, GenericBButtonResponse_1E_66ED                       ;

BitTest JoypadInput_Up, A                                   ;
JP NZ, PressedUpOrDown_1E_7AB6                              ;

BitTest JoypadInput_Down, A                                 ;
JP NZ, PressedUpOrDown_1E_7AB6                              ;
RET                                                         ;

PressedUpOrDown_1E_7AB6:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, [SelectedOption]                                      ;
XOR $01                                                     ;flip between just two options
LD [SelectedOption], A                                      ;

LD A, [SelectedOption]                                      ;
SLA A                                                       ;
SLA A                                                       ;
SLA A                                                       ;
ADD A, $70                                                  ;
LD [SpriteDisplayables_YPos+1], A                           ;
RET                                                         ;

HandleSaveDeletionOptionFunctionality_1E_7AD2:
LD A, [JoypadInputPress]                                    ;
BitTest JoypadInput_A, A                                    ;
JP NZ, GenericAButtonResponse_1E_66E2                       ;

BitTest JoypadInput_B, A                                    ;
JP NZ, GenericBButtonResponse_1E_66ED                       ;

BitTest JoypadInput_Up, A                                   ;
JP NZ, PressedUp_1E_7AEA                                    ;

BitTest JoypadInput_Down, A                                 ;
JP NZ, PressedDown_1E_7AFE                                  ;
RET                                                         ;

PressedUp_1E_7AEA:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, [SelectedOption]                                      ;
DEC A                                                       ;
CP $FF                                                      ;
JR NZ, CODE_1E_7AF9                                         ;

LD A, $02                                                   ;wrap-around, woo hoo!

CODE_1E_7AF9:
LD [SelectedOption], A                                      ;
JR CODE_1E_7B0F                                             ;

PressedDown_1E_7AFE:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, [SelectedOption]                                      ;
INC A                                                       ;
CP $03                                                      ;
JR NZ, CODE_1E_7B0C                                         ;

XOR A                                                       ;

CODE_1E_7B0C:
LD [SelectedOption], A                                      ;

CODE_1E_7B0F:
LD A, [SelectedOption]                                      ;
SLA A                                                       ;
SLA A                                                       ;
SLA A                                                       ;
ADD A, $68                                                  ;
LD [SpriteDisplayables_YPos+1], A                           ;
RET                                                         ;

DrawCurrentSaveSelectedForDeletionMessage_1E_7B1E:
LD HL, TilemapClear_WindowContents_1E_5469                  ;
CALL ClearTilemap_1E_79F0                                   ;

LD A, [SelectedOption]                                      ;display respective save file selected string
CP $02                                                      ;
JR Z, CODE_1E_7B39                                          ;
CP $01                                                      ;
JR Z, CODE_1E_7B34                                          ;

LD HL, Save1SelectedForDeletionMessage_1E_4B89              ;
JR CODE_1E_7B3C                                             ;

CODE_1E_7B34:
LD HL, Save2SelectedForDeletionMessage_1E_4B9A              ;
JR CODE_1E_7B3C                                             ;

CODE_1E_7B39:
LD HL, Save3SelectedForDeletionMessage_1E_4BAB              ;

CODE_1E_7B3C:
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, DoYouWantToDeleteThisSaveMessage_1E_4BBC             ;
CALL DrawFromTilemap_1E_79B0                                ;
CALL Window_DrawAAndBButtonPrompts_1E_79AA                  ;
JP Wait8VBlanks_1E_65BA                                     ;

HandleSaveFileDeletion_1E_7B4B:
CALL DeleteSaveFile_1E_7B77                                 ;

LD A, [SelectedOption]                                      ;
CP $02                                                      ;
JR Z, CODE_1E_7B63                                          ;
CP $01                                                      ;
JR Z, CODE_1E_7B5E                                          ;

LD HL, SaveFile1DeletedMessage_1E_4BC8                      ;
JR CODE_1E_7B66                                             ;

CODE_1E_7B5E:
LD HL, SaveFile2DeletedMessage_1E_4BDA                      ;
JR CODE_1E_7B66                                             ;

CODE_1E_7B63:
LD HL, SaveFile3DeletedMessage_1E_4BEC                      ;

CODE_1E_7B66:
JP DrawFromTilemap_1E_79B0                                  ;

HandleSaveDeletionConfirmationFunctionality_1E_7B69:
LD A, [JoypadInputPress]                                    ;
BitTest JoypadInput_A, A                                    ;
JP NZ, GenericAButtonResponse_1E_66E2                       ;

BitTest JoypadInput_B, A                                    ;
JP NZ, GenericBButtonResponse_1E_66ED                       ;
RET                                                         ;

DeleteSaveFile_1E_7B77:
LD A, $0A                                                   ;
LD [MBC1RAMAccessToggle], A                                 ;

LD A, $01                                                   ;
LD [MBC1BankingMode], A                                     ;

XOR A                                                       ;
LD [MBC1RAMBank], A                                         ;

LD A, [SelectedOption]                                      ;
LD HL, SaveFileDataPointers_1E_6DA4                         ;
SLA A                                                       ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;
LD E, [HL]                                                  ;
INC HL                                                      ;
LD D, [HL]                                                  ;
LD BC, SaveFileSize                                         ;

XOR A                                                       ;
LD [SaveFileChecksum], A                                    ;
LD [SaveFileChecksum+1], A                                  ;

XOR A                                                       ;

CODE_1E_7B9F:
LD [DE], A                                                  ;clear SRAM
INC DE                                                      ;
DEC BC                                                      ;
LD A, C                                                     ;
OR B                                                        ;
JR NZ, CODE_1E_7B9F                                         ;

LD A, $63
LD [DE], A                                                  ;
INC DE                                                      ;
LD [DE], A                                                  ;last two bytes of the save RAM will be set to $63. This should ensure that save file is clear and safe to use.

LD A, $49                                                   ;
LD [MBC1RAMAccessToggle], A                                 ;done writing to SRAM
RET                                                         ;

;check if you're supposed to have a date and about to miss it.
CheckIfMissedADate_1E_7BB1:
LD HL, CurrentSave_PlannedDatesArray                        ;
LD B, 10                                                    ;

LOOP_1E_7BB6:
LD A, [HL]                                                  ;check if slot is occupied
CP $FF                                                      ;
JR Z, CODE_1E_7C14                                          ;if not, skip right over

PUSH HL                                                     ;
PUSH BC                                                     ;
INC HL                                                      ;
INC HL                                                      ;
LD A, [HL]                                                  ;
LD C, A                                                     ;
LD A, [CurrentSave_DaysPassed]                              ;check if the day matches
CP C                                                        ;
JR NZ, CODE_1E_7C12                                         ;

INC HL                                                      ;
INC HL                                                      ;
LD A, [HL]                                                  ;
LD C, A                                                     ;
LD A, [DayOffTime]                                          ;
CP C                                                        ;
JR NZ, CODE_1E_7C12                                         ;check if the time matches

;You missed it! How could you?!
POP BC                                                      ;
POP HL                                                      ;
LD A, [HL]                                                  ;
LD [SelectedCharacterForDateOrGift], A                      ;

LD A, $FF                                                   ;clear this slot
LD [HL+], A                                                 ;
INC HL                                                      ;
LD [HL+], A                                                 ;
INC HL                                                      ;
LD [HL+], A                                                 ;

LD A, [CurrentSave_AttitudeStat]                            ;for some reason you become more mean if you miss a date.
SUB 48                                                      ;
JR NC, CODE_1E_7BE6                                         ;I get it, missing a date IS rude, but it shouldn't magically turn you from a gentleman into the opposite of gentleman.

XOR A                                                       ;don't underflow. rock bottom

CODE_1E_7BE6:
LD [CurrentSave_AttitudeStat], A                            ;

LD A, [SelectedCharacterForDateOrGift]                      ;
SLA A                                                       ;which character did you promise to meet?
LD C, A                                                     ;
SLA A                                                       ;
ADD A, C                                                    ;
LD C, A                                                     ;
LD B, $00                                                   ;
LD HL, CurrentSave_CharacterRelationship                    ;
ADD HL, BC                                                  ;resulting relationship RAM

LD A, [HL]                                                  ;
SUB 10                                                      ;all three types of disposition decrease by 10.
JR NC, CODE_1E_7BFF                                         ;

XOR A                                                       ;handle underflow once again

CODE_1E_7BFF:
LD [HL+], A                                                 ;
INC HL                                                      ;

LD A, [HL]                                                  ;
SUB 10                                                      ;now you seem less interesting to that character.
JR NC, CODE_1E_7C07                                         ;

XOR A                                                       ;

CODE_1E_7C07:
LD [HL+], A                                                 ;
INC HL                                                      ;

LD A, [HL]                                                  ;
SUB 10                                                      ;you breaker of hearts! if they had a crush, that would hurt a lot I imagine.
JR NC, CODE_1E_7C0F                                         ;

XOR A                                                       ;

CODE_1E_7C0F:
LD [HL+], A                                                 ;
INC HL                                                      ;
RET                                                         ;advice: have you considered NOT missing a date? hope it helps. Sincerely, Russ.

CODE_1E_7C12:
POP BC                                                      ;
POP HL                                                      ;

CODE_1E_7C14:
LD DE, $0006                                                ;next date slot
ADD HL, DE                                                  ;
DEC B                                                       ;
JR NZ, LOOP_1E_7BB6                                         ;
RET                                                         ;

InitializeScheduleScreenVariables_1E_7C1C:
XOR A                                                       ;
LD [CurrentMonth], A                                        ;
LD [CurrentDayOfTheMonth], A                                ;
LD [CurrentDayOfTheWeek], A                                 ;
LD [CurrentWeekOfTheMonth], A                               ;
LD [CurrentYearHalf], A                                     ;
LD [DayOffFlag], A                                          ;
LD [QuitGameFlag], A                                        ;
LD [$D228], A
LD [ScheduleScreen_PickedOption], A                         ;

LD A, $FF                                                   ;
LD [CurrentDayScheduledOption_EarlyDay], A                  ;
LD [CurrentDayScheduledOption_LaterDay], A                  ;
RET                                                         ;

;Input HL - tilemap locaiton where the brakets and whatever is going to be inside of them will be
;DynamicTilemapArray should contain a string between DynamicTilemapArray+4 and DynamicTilemapArray+13 (that's 9 characters)
DrawStringInParetheses_1E_7C41:
CALL StoreTilemapLocationToRAM_1E_7333                      ;

LD A, CHARVAL("(")                                          ;
LD [DynamicTilemapArray+4], A                               ;

LD A, CHARVAL(")")                                          ;
LD [DynamicTilemapArray+13], A                              ;

LD HL, DynamicTilemapArray                                  ;
JP DrawFromTilemap_1E_79B0                                  ;

DrawCharacterMessagesAfterProposingADate_1E_7C54:
LD HL, PhoneCallDateQuestionMessage_1E_481A                 ;to date or not to date? That's the question. Like, literally, that's the question. What's the answer?
CALL DrawFromTilemap_1E_79B0                                ;

CALL Wait50Frames_1E_6706                                   ;

LD HL, CharaterReplyingNameTilemapPosition_1E_4885          ;
CALL DrawStringInParetheses_1E_7C41                         ;

LD HL, PhoneCallCharacterDateReaction_1E_4830               ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, PhoneCallDotsTilemapPosition_1E_4875                 ;
LD DE, TEMP_ARRAY                                           ;
LD B, $04                                                   ;
CALL CopyData8Bit_1E_6CD5                                   ;

LD A, CHARVAL("•")                                          ;
LD [TEMP_ARRAY+4], A                                        ;
JP DrawDotsForCharacterDateDecision_1E_6714                 ;

DrawGiftPhoneConversation_1E_7C7C:
LD HL, TellingCharacterAboutGiftMessage_1E_4A53             ;
CALL DrawFromTilemap_1E_79B0                                ;

CALL Wait50Frames_1E_6706                                   ;wait for their reaction

LD HL, CharaterReplyingNameTilemapPosition_1E_4885          ;
CALL DrawStringInParetheses_1E_7C41                         ;will draw character name in brakets

LD HL, CharacterReactionToGiftMessage_1E_4A68               ;wowza! gift!
CALL DrawFromTilemap_1E_79B0                                ;

CALL Wait50Frames_1E_6706                                   ;it takes them 50 frames to.......

LD HL, CharacterThanksForGiftMessage_1E_4A77                ;...say thanks!
JP DrawFromTilemap_1E_79B0                                  ;

DisplayCalendarSprite_1E_7C9A:
LD A, SpriteDisplayable_CalendarBase1                       ;
LD [SpriteDisplayables_ID+6], A                             ;

LD A, $74                                                   ;
LD [SpriteDisplayables_XPos+6], A                           ;

LD A, $64                                                   ;
LD [SpriteDisplayables_YPos+6], A                           ;

LD A, [TEMP_ARRAY]                                          ;check if tens digit...
CP $00                                                      ;...is 0
JR NZ, CODE_1E_7CB4                                         ;

LD A, $FF                                                   ;do not display if digit tens is 0
JR CODE_1E_7CB6                                             ;

CODE_1E_7CB4:
SUB CHARVAL("0")-SpriteDisplayable_CalendarDigit0           ;

CODE_1E_7CB6:
LD [SpriteDisplayables_ID+4], A                             ;

LD A, $7C                                                   ;
LD [SpriteDisplayables_XPos+4], A                           ;

LD A, $6C                                                   ;
LD [SpriteDisplayables_YPos+4], A                           ;

LD A, [TEMP_ARRAY+1]                                        ;
SUB CHARVAL("0")-SpriteDisplayable_CalendarDigit0           ;
LD [SpriteDisplayables_ID+5], A                             ;

LD A, $6C                                                   ;
LD [SpriteDisplayables_YPos+5], A                           ;

LD A, [SpriteDisplayables_ID+4]                             ;check if the tens sprite is non-existent (days 1-9)
CP SpriteDisplayable_None                                   ;
JR NZ, CODE_1E_7CE3                                         ;

LD A, [SpriteDisplayables_ID+5]                             ;the "ones" sprite will be displayed as one digit, but centerered (using two sprite tiles)
ADD A, SpriteDisplayable_CalendarDigit0Center-SpriteDisplayable_CalendarDigit0
LD [SpriteDisplayables_ID+5], A                             ;

LD A, $7C                                                   ;
JR CODE_1E_7CE5                                             ;

CODE_1E_7CE3:
LD A, $84                                                   ;

CODE_1E_7CE5:
LD [SpriteDisplayables_XPos+5], A                           ;

XOR A                                                       ;
LD [TimePassingCounter], A                                  ;
RET                                                         ;

;time passing, next day
AnimateCalendarPageTearing_1E_7CED:
LD A, [TimePassingCounter]                                  ;
SRL A                                                       ;
SRL A                                                       ;
AND $03                                                     ;
ADD A, SpriteDisplayable_CalendarBase1                      ;
LD [SpriteDisplayables_ID+6], A                             ;
RET                                                         ;

;draws "x/y" where x - current page, y - maximum page
DrawItemPageCount_Inventory_1E_7CFC:
LD HL, Tilemap_PageCount_1E_4BFE                            ;
LD DE, TEMP_ARRAY                                           ;

LD B, 7                                                     ;
CALL CopyData8Bit_1E_6CD5                                   ;

LD A, [CurrentSelectionPage]                                ;
ADD A, CHARVAL("1")                                         ;
LD [TEMP_ARRAY+4], A                                        ;

LD A, [InventoryObtainedItemsMaxPages]                      ;
ADD A, CHARVAL("0")                                         ;max pages always start from 1, so need to compensate
LD [TEMP_ARRAY+6], A                                        ;

LD HL, TEMP_ARRAY                                           ;
JP DrawFromTilemap_1E_79B0                                  ;

DrawItemPageCount_Shopping_1E_7D1D:
LD HL, Tilemap_PageCount_1E_4BFE                            ;
LD DE, TEMP_ARRAY                                           ;

LD B, 7                                                     ;
CALL CopyData8Bit_1E_6CD5                                   ;

LD A, [CurrentSelectionPage]                                ;
ADD A, CHARVAL("1")                                         ;
LD [TEMP_ARRAY+4], A                                        ;

LD A, [InventoryUnobtainedItemsMaxPages]                    ;
ADD A, CHARVAL("0")                                         ;
LD [TEMP_ARRAY+6], A                                        ;

LD HL, TEMP_ARRAY                                           ;
JP DrawFromTilemap_1E_79B0                                  ;

;Check if player had purchased current month's info magazine. Or newspaper or whatever that informs them.
CheckPurchasedInfoForCurrentMonth_1E_7D3E:
LD HL, PurchasedInfoPlayerInventoryOffset_1E_7D60           ;
LD A, [CurrentMonth]                                        ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;

LD A, [HL]                                                  ;RAM to check

LD HL, CurrentSave_PlayerInventory+2                        ;purchased info last few bytes
LD C, A                                                     ;in reality this only checks CurrentSave_PlayerInventory+3 and CurrentSave_PlayerInventory+4 due to first few months not being used
ADD HL, BC                                                  ;

LD A, [HL]                                                  ;bit to compare
LD E, A                                                     ;

LD HL, PurchasedInfoItemBitValues_1E_7D6D                   ;
LD A, [CurrentMonth]                                        ;
LD C, A                                                     ;
ADD HL, BC                                                  ;

LD A, [HL]                                                  ;
AND E                                                       ;check if current month's info item has been purchased
JR Z, CODE_1E_7D5E                                          ;bit clear = not purchased

XOR A                                                       ;purchased
RET                                                         ;

CODE_1E_7D5E:
SCF                                                         ;didn't purchase
RET                                                         ;

;offsets player inventory RAM per-month (CurrentSave_PlayerInventory+2 + offset from the table).
;for some reason, besides having the usual unused january through march values, it also has a value that would correspond to the january of the next year.
PurchasedInfoPlayerInventoryOffset_1E_7D60:
db $00
db $00
db $00
db $01
db $01
db $01
db $01
db $01
db $01
db $02
db $02
db $02
db $00                                                      ;January didn't happen the first time, and REALLY won't happen the second time. Pinky promise!

;bitwise checks for respective items
PurchasedInfoItemBitValues_1E_7D6D:
db 0
db 0
db 0
db %00000100
db %00001000
db %00010000
db %00100000
db %01000000
db %10000000
db %00000001
db %00000010
db %00000100
db 0

CheckIfPlayerIsTired_1E_7D7A:
XOR A                                                       ;
LD [MissedDateDueToExhastionFlag], A                        ;by default you're not missing on a date due to being tired

LD A, [CurrentSave_PlayerTiredFlag]                         ;
CP $01                                                      ;check if player is tired
JR Z, CODE_1E_7D95                                          ;it will take a fair amount of energy to recover

LD A, [CurrentSave_EnergyStat]                              ;
CP 64                                                       ;checks if energy is less than 64
JR NC, CODE_1E_7D93                                         ;

LD A, [FrameCounter8Bit]                                    ;check for timing. this means there's a 1/4 chance to get unwell and very tired.
AND $03                                                     ;
JR Z, CODE_1E_7D95                                          ;

CODE_1E_7D93:
XOR A                                                       ;don't rest
RET                                                         ;

CODE_1E_7D95:
LD A, [CurrentSave_EnergyStat]                              ;check if energy is below 100
CP 100                                                      ;
JR NC, CODE_1E_7D93                                         ;recover if at or above 100

SCF                                                         ;rest easy
RET                                                         ;

DrawDatePlanEndMessages_1E_7D9E:
LD DE, DateLocationTilemapArray+4                           ;
LD B, PlaceName_MaxLength                                   ;
CALL CopyData8Bit_1E_6CD5                                   ;

LD HL, DateLocationTilemapArray                             ;
CALL DrawFromTilemap_1E_79B0                                ;draw the date spot name you're gonna attend at a later time (or miss it, your choice)

CALL Wait50Frames_1E_6706                                   ;

LD HL, PhoneCallConfirmationQuestionMessage_1E_49E0         ;
CALL DrawFromTilemap_1E_79B0                                ;

CALL Wait50Frames_1E_6706                                   ;

LD HL, PhoneCallConfirmationCharacterNameTilemapPosition_1E_49EB
CALL DrawStringInParetheses_1E_7C41                         ;draw character's name

LD HL, PhoneCallCharacterAgreesToDateMessage_1E_49EF        ;
CALL DrawFromTilemap_1E_79B0                                ;

CALL Wait50Frames_1E_6706                                   ;

LD HL, PhoneCallCharacterLooksForwardToDateMessage_1E_49FB  ;
CALL DrawFromTilemap_1E_79B0                                ;

CALL Wait50Frames_1E_6706                                   ;

LD HL, PhoneCallDateConversationEnd_1E_4A0C                 ;
CALL DrawFromTilemap_1E_79B0                                ;

CALL Wait50Frames_1E_6706                                   ;

LD HL, PuttingDownPhoneOnomatopoeia_DateCall_1E_4A17        ;
CALL DrawFromTilemap_1E_79B0                                ;

CALL Wait50Frames_1E_6706                                   ;

LD HL, DatePlanConversationFinish_1E_4A1E                   ;
JP DrawFromTilemap_1E_79B0                                  ;

;note: actual date is handled before this, time in this case refers to early or later in that day
DrawTimeAndPlaceConfirmationMessages_1E_7DE8:
LD A, [SelectedDateDayTime]                                 ;
CP $00                                                      ;
JR NZ, CODE_1E_7DF4                                         ;

LD HL, PhoneCallConfirmationEarlyDay_1E_49B3                ;
JR CODE_1E_7DF7                                             ;

CODE_1E_7DF4:
LD HL, PhoneCallConfirmationLaterDay_1E_49B9                ;

CODE_1E_7DF7:
CALL DrawFromTilemap_1E_79B0                                ;

CALL Wait50Frames_1E_6706                                   ;

LD HL, PhoneCallConfirmationLocationMessage_1E_49BF         ;
CALL DrawFromTilemap_1E_79B0                                ;

CALL Wait50Frames_1E_6706                                   ;

LD A, [CurrentlyChosenDateSpot]                             ;check if the date spot is in shopping center once again
CP MapSpot_07                                               ;
JR C, CODE_1E_7E1A                                          ;
CP MapSpot_Library                                          ;
JR NC, CODE_1E_7E1A                                         ;

LD HL, PhoneCallConfirmationSpotInShoppingCenter_1E_49C7    ;
CALL DrawFromTilemap_1E_79B0                                ;

CALL Wait50Frames_1E_6706                                   ;

CODE_1E_7E1A:
LD HL, PhoneCallConfirmationLocationTilemapPosition_1E_49DC ;
LD DE, DateLocationTilemapArray                             ;
LD B, $04                                                   ;
JP CopyData8Bit_1E_6CD5                                     ;

MarkPlannedDateInArray_1E_7E25:
LD HL, CurrentSave_PlannedDatesArray                        ;
LD B, 10                                                    ;

LOOP_1E_7E2A:
LD A, [HL]                                                  ;if this date slot is free, fill it
CP $FF                                                      ;
JR Z, CODE_1E_7E37                                          ;

LD DE, $0006                                                ;
ADD HL, DE                                                  ;
DEC B                                                       ;
JR NZ, LOOP_1E_7E2A                                         ;
RET                                                         ;

CODE_1E_7E37:
LD A, [SelectedCharacterForDateOrGift]                      ;
LD [HL+], A                                                 ;save character
INC HL                                                      ;skip over high byte

LD A, [SelectedDateDaySlot]                                 ;
LD [HL+], A                                                 ;save day the date happens on
INC HL                                                      ;skip over high byte

LD A, [SelectedDateDayTime]                                 ;
LD [HL+], A                                                 ;save which time of day it happens on

LD A, [CurrentlyChosenDateSpot]                             ;
LD [HL], A                                                  ;save the place of meeting
RET                                                         ;

DrawItemNamesForCharacterInviteOnWalk_1E_7E4A:
LD HL, ItemNamesForCharacterInviteOnWalk_1E_4CCB            ;
LD DE, DynamicTilemapArray                                  ;
LoadDataSizeConstant B, ItemNamesForCharacterInviteOnWalk_1E_4CCB
CALL CopyData8Bit_1E_6CD5                                   ;

LD A, $01                                                   ;the first "item" is always available (which is a "no special item" choice
LD [TEMP_ARRAY], A                                          ;

LD HL, CurrentSave_PlayerInventory                          ;comb through player's inventory
LD A, [HL]                                                  ;
LD C, A                                                     ;
LD HL, TEMP_ARRAY+1                                         ;
LD DE, DynamicTilemapArray+13                               ;
LD B, 4                                                     ;only first 4 items can be used for invitation

LOOP_1E_7E67:
SRL C                                                       ;check item's bit
JR NC, CODE_1E_7E70                                         ;

LD A, $01                                                   ;this item is in player's inventory
LD [HL+], A                                                 ;
JR CODE_1E_7E7E                                             ;

CODE_1E_7E70:
XOR A                                                       ;
LD [HL+], A                                                 ;this item is not in player's inventory

PUSH BC                                                     ;
PUSH DE                                                     ;
XOR A                                                       ;
LD B, ItemName_MaxLength-8                                  ;

LOOP_1E_7E77:
LD [DE], A                                                  ;erase this item name if not obtained
INC DE                                                      ;
DEC B                                                       ;
JR NZ, LOOP_1E_7E77                                         ;
POP DE                                                      ;
POP BC                                                      ;

CODE_1E_7E7E:
LD A, E                                                     ;
ADD A, ItemName_MaxLength-8                                 ;next name
LD E, A                                                     ;

LD A, D                                                     ;
ADC A, $00                                                  ;
LD D, A                                                     ;
DEC B                                                       ;
JR NZ, LOOP_1E_7E67                                         ;loop until checked all items

LD HL, DynamicTilemapArray                                  ;
JP DrawFromTilemap_1E_79B0                                  ;

HandleItemSelectForCharacterInviteOnWalkFunctionality_1E_7E8F:
LD A, [JoypadInputPress]                                    ;
BitTest JoypadInput_A, A                                    ;
JP NZ, GenericAButtonResponse_1E_66E2                       ;

BitTest JoypadInput_Up, A                                   ;
JP NZ, PressedUp_1E_7EA2                                    ;

BitTest JoypadInput_Down, A                                 ;
JP NZ, PressedDown_1E_7EB6                                  ;
RET                                                         ;

PressedUp_1E_7EA2:
LD A, [SelectedOption]                                      ;
DEC A                                                       ;
CP $FF                                                      ;
JR NZ, CODE_1E_7EAC                                         ;

LD A, $04                                                   ;

CODE_1E_7EAC:
LD [SelectedOption], A                                      ;

CALL CheckValidItemForWalkingOutSelection_1E_7ED1           ;
JR NZ, CODE_1E_7EC9                                         ;change successful
JR PressedUp_1E_7EA2                                        ;keep looping until the valid option

PressedDown_1E_7EB6:
LD A, [SelectedOption]                                      ;
INC A                                                       ;
CP $05                                                      ;
JR NZ, CODE_1E_7EBF                                         ;

XOR A                                                       ;

CODE_1E_7EBF:
LD [SelectedOption], A                                      ;

CALL CheckValidItemForWalkingOutSelection_1E_7ED1           ;
JR NZ, CODE_1E_7EC9                                         ;
JR PressedDown_1E_7EB6                                      ;

CODE_1E_7EC9:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;
JP UpdateCursorYPos_SeparateScreen_1E_7498                  ;

CheckValidItemForWalkingOutSelection_1E_7ED1:
LD HL, TEMP_ARRAY                                           ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;
LD A, [HL]                                                  ;
CP $00                                                      ;check item's presence
RET                                                         ;

;Inviting while walking out
DrawWaitForCharacterToComeMessages_1E_7EDC:
CALL ClearFullSizeInfoBoxContents_1E_6669                   ;

LD HL, ContactCharacterOnWalkMessage_1E_4CFC                ;
CALL DrawFromTilemap_1E_79B0                                ;

CALL Wait50Frames_1E_6706                                   ;

LD HL, WillTheyComeMessage_1E_4D0B                          ;
CALL DrawFromTilemap_1E_79B0                                ;

CALL Wait50Frames_1E_6706                                   ;

LD HL, WaitDot1_1E_4D18                                     ;
CALL DrawFromTilemap_1E_79B0                                ;

CALL Wait50Frames_1E_6706                                   ;

LD HL, WaitDot2_1E_4D1D                                     ;
CALL DrawFromTilemap_1E_79B0                                ;

CALL Wait50Frames_1E_6706                                   ;

LD HL, WaitDot3_1E_4D22                                     ;
CALL DrawFromTilemap_1E_79B0                                ;

CALL Wait50Frames_1E_6706                                   ;

LD HL, ThirtyMinutesLaterString_1E_4D27                     ;
CALL DrawFromTilemap_1E_79B0                                ;

JP Wait50Frames_1E_6706                                     ;

DrawJobOptionStrings_1E_7F15:
LD HL, TilemapClear_ScheduleScreen_ActionInfoBox_1E_5465    ;
CALL ClearTilemap_1E_79F0                                   ;

LD A, [HolidayOrWeekendFlag]                                ;check if current day is a holiday/weekend
CP $01                                                      ;
JR Z, CODE_1E_7F29                                          ;always work hard

LD A, [ScheduleScreen_CurrentSelectionIndex]                ;check if we're selecting current activity for the later half of the day or earlier
CP Weekday_Monday+7                                         ;
JR NC, CODE_1E_7F2E                                         ;

CODE_1E_7F29:
LD HL, WorkHardAtJobOrClub_1E_465C                          ;
JR CODE_1E_7F31                                             ;

CODE_1E_7F2E:
LD HL, JustWorkAtJobOrClub_1E_4668                          ;

CODE_1E_7F31:
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, PartTimeJobActivityOptionStrings_1E_4564             ;
CALL DrawFromTilemap_1E_79B0                                ;
CALL ScheduleScreen_DrawAAndBButtonPrompts_1E_799E          ;

XOR A                                                       ;
LD [GenericStateChangeIndicator], A                         ;
LD [SelectedOption_Vertical], A                             ;
LD [SelectedOption_Horizontal], A                           ;
LD [SelectedClub], A                                        ;
JP DrawSidewayCursor_ActionWindow_1E_66BB                   ;

DrawClubOptionStrings_1E_7F4D:
LD HL, TilemapClear_ScheduleScreen_ActionInfoBox_1E_5465;
CALL ClearTilemap_1E_79F0                                   ;

LD A, [HolidayOrWeekendFlag]                                ;check if it's holiday/weekend time
CP $01                                                      ;
JR Z, CODE_1E_7F61                                          ;

LD A, [ScheduleScreen_CurrentSelectionIndex]                ;check if we're selecting current activity for the later half of the day or earlier
CP Weekday_Monday+7                                         ;
JR NC, CODE_1E_7F66                                         ;

CODE_1E_7F61:
LD HL, WorkHardAtJobOrClub_1E_465C                          ;
JR CODE_1E_7F69                                             ;

CODE_1E_7F66:
LD HL, JustWorkAtJobOrClub_1E_4668                          ;

CODE_1E_7F69:
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, ClubActivityOptionStrings_1E_4506                    ;draw strings for doing the club or quitting it
CALL DrawFromTilemap_1E_79B0                                ;
CALL ScheduleScreen_DrawAAndBButtonPrompts_1E_799E          ;

XOR A                                                       ;
LD [GenericStateChangeIndicator], A                         ;
LD [SelectedOption_Vertical], A                             ;
LD [SelectedOption_Horizontal], A                           ;
LD [SelectedClub], A                                        ;
JP DrawSidewayCursor_ActionWindow_1E_66BB                   ;

;general layout, the info is laid out after
LoadTownInfoScreenGeneralLayout_1E_7F85:
CALL DrawFullScreenInfoBox_1E_6648                          ;

LD HL, TownInfoScreen_Header_1E_4179                        ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, TownInfoScreen_CurrentMonthSymbol_1E_4185            ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, TownInfoScreen_MovieString_1E_418A                   ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, TownInfoScreen_RecommendedSpot_1E_4191               ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, TownInfoScreen_Bargain_1E_419D                       ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, TownInfoScreen_Item1PriceSymbol_1E_41AC              ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, TownInfoScreen_Item2PriceSymbol_1E_41B1              ;
JP DrawFromTilemap_1E_79B0                                  ;