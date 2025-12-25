;PRG ROM $74000-$77FFF

SECTION "bank 1D", ROMX, BANK[$1D]

SETCHARMAP Text_Other

include "Data/Scripts/ScriptsBank1D.asm"

SECTION "bank 1D after scripts", ROMX[$6000], BANK[$1D]

include "Data/Tilemaps/NewGameScreens.asm"

;A - confirm, B - cancel
AAndBPrompt_1D_62C3:
dw $9A06
db 13
db 1
db "A=けってい B=とりけし"

FullScreenTilemapClearData_1D_62D4:
dw $9800
db 20
db 18

FullScreenInfoBoxTopTilemap_1D_62D8:
dw $9800
db 20
db 1
db $01
ds 18, $04
db $06

include "Data/StartingStats.asm"

FullScreenInfoBoxLeftTilemap_1D_6830:
dw $9820
db 1
db 16
ds 16, $02

FullScreenInfoBoxRightTilemap_1D_6844:
dw $9833
db 1
db 16
ds 16, $07

FullScreenInfoBoxBottomTilemap_1D_6858:
dw $9A20
db 20
db 1
db $03
ds 18, $05
db $08

include "Data/Tilemaps/TitleScreen.asm"
include "Data/Tilemaps/TitleScreen_LoadingWindow.asm"

include "Data/SpriteDisplayableData.asm"

HandleNewGameFunctionality_1D_7082:
GoBackToSecondNameEntryScreen_1D_7082:
CALL LoadHandleSecondNameEntryScreen_1D_71BE                ;

LD A, [GenericStateChangeIndicator]                         ;
CP GenericStateChange_Confirm                               ;next name entry screen a go
JR Z, CODE_1D_7090                                          ;
CP GenericStateChange_Cancel                                ;if cancelled out, return to the title screen
JR Z, CODE_1D_70ED                                          ;

CODE_1D_7090:
CALL SaveTypedSecondName_1D_7708                            ;

GoBackToFirstNameEntryScreen_1D_7093:
CALL LoadAndHandleFirstNameEntryScreen_1D_7220              ;

LD A, [GenericStateChangeIndicator]                         ;
CP GenericStateChange_Confirm                               ;
JR Z, CODE_1D_70A1                                          ;
CP GenericStateChange_Cancel                                ;
JR Z, GoBackToSecondNameEntryScreen_1D_7082                 ;

CODE_1D_70A1:
CALL SaveTypedFirstName_1D_770D                             ;

GoBackToNickNameEntryScreen_1D_70A4:
CALL LoadAndHandleNickNameEntryScreen_1D_724D               ;

LD A, [GenericStateChangeIndicator]                         ;
CP GenericStateChange_Confirm                               ;
JR Z, CODE_1D_70B2                                          ;
CP GenericStateChange_Cancel                                ;
JR Z, GoBackToFirstNameEntryScreen_1D_7093                  ;

CODE_1D_70B2:
CALL SaveTypedNickName_1D_7712                              ;

CODE_1D_70B5:
CALL LoadAndHandleBirthMonthEntryScreen_1D_727A             ;

LD A, [GenericStateChangeIndicator]                         ;
CP GenericStateChange_Confirm                               ;
JR Z, GoToBirthDaySelectionScreen_1D_70C3                   ;
CP GenericStateChange_Cancel                                ;
JR Z, GoBackToNickNameEntryScreen_1D_70A4                   ;

GoToBirthDaySelectionScreen_1D_70C3:
CALL LoadAndHandleBirthDayEntryScreen_1D_72DD               ;

LD A, [GenericStateChangeIndicator]                         ;
CP GenericStateChange_Confirm                               ;
JR Z, GoToBloodTypeSelectionScreen_1D_70D1                  ;
CP GenericStateChange_Cancel                                ;
JR Z, CODE_1D_70B5                                          ;

GoToBloodTypeSelectionScreen_1D_70D1:
CALL LoadAndHandleBloodTypeEntryScreen_1D_7394              ;

LD A, [GenericStateChangeIndicator]                         ;
CP GenericStateChange_Confirm                               ;
JR Z, GoToNewGameConfirmationScreen_1D_70DF                 ;
CP GenericStateChange_Cancel                                ;
JR Z, GoToBirthDaySelectionScreen_1D_70C3                   ;

GoToNewGameConfirmationScreen_1D_70DF:
CALL LoadAndHandleNewGameConfirmationScreen_1D_73F4         ;

LD A, [GenericStateChangeIndicator]                         ;
CP GenericStateChange_Confirm                               ;
JR Z, StartGame_1D_70F0                                     ;
CP GenericStateChange_Cancel                                ;
JR Z, GoToBloodTypeSelectionScreen_1D_70D1                  ;

CODE_1D_70ED:
LD A, $01                                                   ;not start game, go back to title screen
RET                                                         ;

;confirmed birth date, name, blood type and etc., moving to the gameplay
;first, set player's starting stats/relationships
StartGame_1D_70F0:
LD HL, CurrentSave_BirthMonth                               ;
LD A, [NewGame_TypedBirthMonth]                             ;
LD [HL], A                                                  ;

LD HL, CurrentSave_BirthDay                                 ;
LD A, [NewGame_TypedBirthDay]                               ;
LD [HL], A                                                  ;

LD HL, CurrentSave_BloodType                                ;
LD A, [NewGame_TypedBloodType]                              ;
LD [HL], A                                                  ;

LD HL, DayRangesForBirthSigns_1D_717E                       ;start calculating birth sign
LD A, [NewGame_TypedBirthMonth]                             ;picked birth month
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;
LD C, [HL]                                                  ;

LD A, [NewGame_TypedBirthDay]                               ;picked birth day
CP C                                                        ;check if day is below threshold
JR NC, CODE_1D_711B                                         ;used to determine birth date range and which star sign it falls under

LD HL, BirthSign_BeforeDayThreshold_1D_718A                 ;
JR CODE_1D_711E                                             ;

CODE_1D_711B:
LD HL, BirthSign_AtOrAfterDayThreshold_1D_7196              ;

CODE_1D_711E:
LD A, [NewGame_TypedBirthMonth]                             ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;get the birth sign value

LD A, [HL]                                                  ;birth sign
SLA A                                                       ;times 2
LD HL, InitialStatDataOffsets_1D_71A2                       ;gets offset for starting stats
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;

LD E, [HL]                                                  ;
INC HL                                                      ;
LD D, [HL]                                                  ;

LD HL, BloodTypeInitialDataOffsets_1D_71BA                  ;
LD A, [NewGame_TypedBloodType]                              ;blood type
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;offset further with blood type

LD C, [HL]                                                  ;
PUSH DE                                                     ;
POP HL                                                      ;
ADD HL, BC                                                  ;
LD BC, InitialStatDistributions_1D_62F0                     ;
ADD HL, BC                                                  ;resulting starting stat offset

LD DE, CurrentSave_SmartStat                                ;start with smart stat
LD B, 7                                                     ;go through all stats

LOOP_1D_7149:
LD A, [HL+]                                                 ;grab starting value
LD [DE], A                                                  ;store to stat

INC DE                                                      ;
INC DE                                                      ;skip over high byte
DEC B                                                       ;
JR NZ, LOOP_1D_7149                                         ;

LD DE, CurrentSave_CharacterRelationship                    ;character relationships will be pre-set as well. It's as if this is destiny or something.
LD B, 3*7                                                   ;

CODE_1D_7155:
LD A, [HL+]                                                 ;grab starting value
LD [DE], A                                                  ;will have this disposition

INC DE                                                      ;
INC DE                                                      ;skip over high byte
DEC B                                                       ;
JR NZ, CODE_1D_7155                                         ;

CALL ClearRelantioshipsOnSpecificBirthInfo_1D_7F54          ;

;initialize some event-specific defines, starting from wallet status
LD HL, CurrentSave_WalletStatus                             ;
LD B, $2F                                                   ;
LD A, $FF                                                   ;

LOOP_1D_7166:
LD [HL+], A                                                 ;
INC HL                                                      ;
DEC B                                                       ;
JR NZ, LOOP_1D_7166                                         ;

LD [CurrentSave_ShrinePhotoCharacter], A                    ;you havent taken photo yet
LD [CharacterOnADate], A                                    ;no one's on a date yet

LD A, $01                                                   ;
LD [NotGoingOutOnDateFlag], A                               ;

LD A, [CDLinkFlag]                                          ;save CD flag from the intro script
LD [CurrentSave_CDLinkFlag], A                              ;that'll be the default option

XOR A                                                       ;continue to the main game
RET                                                         ;

;day ranges for each of the Astronomical signs (since these are 0-inclusive, it's value -1)
DayRangesForBirthSigns_1D_717E:
db 21-1
db 19-1
db 21-1
db 21-1
db 22-1
db 22-1
db 23-1
db 23-1
db 24-1
db 24-1
db 23-1
db 22-1

;birth sign value if day is below the threshold.
;the birth sign is not stored anywhere, it's only used to determine starting stats/relationships
BirthSign_BeforeDayThreshold_1D_718A:
db BirthSign_Capricorn
db BirthSign_Aquarius
db BirthSign_Pisces
db BirthSign_Aries
db BirthSign_Taurus
db BirthSign_Gemini
db BirthSign_Cancer
db BirthSign_Leo
db BirthSign_Virgo
db BirthSign_Libra
db BirthSign_Scorpio
db BirthSign_Sagittarius

;birth sign value if day is equal or above the threshold
BirthSign_AtOrAfterDayThreshold_1D_7196:
db BirthSign_Aquarius
db BirthSign_Pisces
db BirthSign_Aries
db BirthSign_Taurus
db BirthSign_Gemini
db BirthSign_Cancer
db BirthSign_Leo
db BirthSign_Virgo
db BirthSign_Libra
db BirthSign_Scorpio
db BirthSign_Sagittarius
db BirthSign_Capricorn

;offsets for initial stat distributions based on star sign
InitialStatDataOffsets_1D_71A2:
dw InitialStatDistributions_1D_62F0.Aries-InitialStatDistributions_1D_62F0
dw InitialStatDistributions_1D_62F0.Taurus-InitialStatDistributions_1D_62F0
dw InitialStatDistributions_1D_62F0.Gemini-InitialStatDistributions_1D_62F0
dw InitialStatDistributions_1D_62F0.Cancer-InitialStatDistributions_1D_62F0
dw InitialStatDistributions_1D_62F0.Leo-InitialStatDistributions_1D_62F0
dw InitialStatDistributions_1D_62F0.Virgo-InitialStatDistributions_1D_62F0
dw InitialStatDistributions_1D_62F0.Libra-InitialStatDistributions_1D_62F0
dw InitialStatDistributions_1D_62F0.Scorpio-InitialStatDistributions_1D_62F0
dw InitialStatDistributions_1D_62F0.Sagittarius-InitialStatDistributions_1D_62F0
dw InitialStatDistributions_1D_62F0.Capricorn-InitialStatDistributions_1D_62F0
dw InitialStatDistributions_1D_62F0.Aquarius-InitialStatDistributions_1D_62F0
dw InitialStatDistributions_1D_62F0.Pisces-InitialStatDistributions_1D_62F0

;additional offsets for each blood type
BloodTypeInitialDataOffsets_1D_71BA:
db LOW(InitialStatDistributions_1D_62F0.BloodTypeA-InitialStatDistributions_1D_62F0)
db LOW(InitialStatDistributions_1D_62F0.BloodTypeB-InitialStatDistributions_1D_62F0)
db LOW(InitialStatDistributions_1D_62F0.BloodTypeAB-InitialStatDistributions_1D_62F0)
db LOW(InitialStatDistributions_1D_62F0.BloodTypeO-InitialStatDistributions_1D_62F0)

LoadHandleSecondNameEntryScreen_1D_71BE:
LD A, LCDControlEnable                                      ;
LDH [Reg_LCDControlAndRender], A                            ;

CALL LoadSecondNameEntryScreen_1D_71FE                      ;
CALL ExecuteNameEntryScreen1D_71C9                          ;
RET                                                         ;

;general name entry code (name, second name, nickname)
ExecuteNameEntryScreen1D_71C9:
CALL LoadNameInformation_1D_76A5                            ;
CALL WaitForVBlank_1D_7527                                  ;

LD HL, Reg_LCDControlAndRender                              ;
SetBit LCDBackgroundRender, [HL]                            ;
SetBit LCDSpriteRender, [HL]                                ;
CALL FadeInTransition_1D_7B82                               ;

HandleNameInputScreen_1D_71D9:
CALL ResetCurrentSpriteSlot_1D_7503                         ;
CALL HandleCursorAndNameSprites_1D_7628                     ;
CALL RemoveRemainingSpriteSlots_1D_7508                     ;
CALL NameInputControlHandling_1D_7533                       ;

LD A, [GenericStateChangeIndicator]                         ;
CP GenericStateChange_Nothing                               ;check for state change
JR NZ, CODE_1D_71F1                                         ;transition to next screen or previous

CALL WaitForVBlank_1D_7527                                  ;
JR HandleNameInputScreen_1D_71D9                            ;keep player on the same screen

CODE_1D_71F1:
CALL FadeOutTransition_1D_7BCB                              ;
CALL ResetCurrentSpriteSlot_1D_7503                         ;
CALL RemoveRemainingSpriteSlots_1D_7508                     ;
CALL WaitForVBlank_1D_7527                                  ;
RET                                                         ;

LoadSecondNameEntryScreen_1D_71FE:
CALL DrawFullScreenInfoBox_1D_7ADF                          ;

LD HL, NewGame_LetterSelectionTilemap_1D_6000               ;
CALL DrawFromTilemap_1D_7AFD                                ;

CALL DrawAAndBButtonFunctionalityStrings_1D_7B7C            ;

LD HL, EnterSecondNameStrings_1D_60F4                       ;
CALL DrawFromTilemap_1D_7AFD                                ;

XOR A                                                       ;
LDH [Reg_CameraXPosition], A                                ;
LDH [Reg_CameraYPosition], A                                ;

LD A, PlayerInfo_SecondNameMaxLength                        ;
LD [PlayerNameMaxCharactersForInput], A                     ;length of second name

LD A, PlayerString_SecondName                               ;
LD [PlayerStringType], A                                    ;typing second name right now
RET                                                         ;

LoadAndHandleFirstNameEntryScreen_1D_7220:
LD A, LCDControlEnable                                      ;
LDH [Reg_LCDControlAndRender], A                            ;

CALL LoadFirstNameEntryScreen_1D_722B                       ;
CALL ExecuteNameEntryScreen1D_71C9                          ;
RET                                                         ;

LoadFirstNameEntryScreen_1D_722B:
CALL DrawFullScreenInfoBox_1D_7ADF                          ;

LD HL, NewGame_LetterSelectionTilemap_1D_6000               ;
CALL DrawFromTilemap_1D_7AFD                                ;

CALL DrawAAndBButtonFunctionalityStrings_1D_7B7C            ;

LD HL, EnterFirstNameStrings_1D_611A                        ;
CALL DrawFromTilemap_1D_7AFD                                ;

XOR A                                                       ;
LDH [Reg_CameraXPosition], A                                ;
LDH [Reg_CameraYPosition], A                                ;

LD A, PlayerInfo_NameMaxLength                              ;
LD [PlayerNameMaxCharactersForInput], A                     ;length of first name

LD A, PlayerString_Name                                     ;
LD [PlayerStringType], A                                    ;
RET                                                         ;

LoadAndHandleNickNameEntryScreen_1D_724D:
LD A, LCDControlEnable                                      ;
LDH [Reg_LCDControlAndRender], A                            ;

CALL LoadNickNameEntryScreen_1D_7258                        ;
CALL ExecuteNameEntryScreen1D_71C9                          ;
RET                                                         ;

LoadNickNameEntryScreen_1D_7258:
CALL DrawFullScreenInfoBox_1D_7ADF                          ;

LD HL, NewGame_LetterSelectionTilemap_1D_6000               ;
CALL DrawFromTilemap_1D_7AFD                                ;
CALL DrawAAndBButtonFunctionalityStrings_1D_7B7C            ;

LD HL, EnterNickNameStrings_1D_613E                         ;
CALL DrawFromTilemap_1D_7AFD                                ;

XOR A                                                       ;
LDH [Reg_CameraXPosition], A                                ;
LDH [Reg_CameraYPosition], A                                ;

LD A, PlayerInfo_NickNameMaxLength                          ;
LD [PlayerNameMaxCharactersForInput], A                     ;length of player nickname

LD A, PlayerString_NickName                                 ;
LD [PlayerStringType], A                                    ;
RET                                                         ;

LoadAndHandleBirthMonthEntryScreen_1D_727A:
LD A, LCDControlEnable                                      ;
LDH [Reg_LCDControlAndRender], A                            ;

LD HL, NewGame_TypedBirthMonth                              ;
CALL LoadOtherBirthInformation_1D_78A0                      ;
CALL LoadBirthMonthEntryScreen_1D_72B9                      ;
CALL WaitForVBlank_1D_7527                                  ;

LD HL, Reg_LCDControlAndRender                              ;
SetBit LCDBackgroundRender, [HL]                            ;
SetBit LCDSpriteRender, [HL]                                ;

CALL FadeInTransition_1D_7B82                               ;

HandleBirthMonthEntryScreen_1D_7294:
CALL ResetCurrentSpriteSlot_1D_7503                         ;
CALL HandleCursorAndOtherBirthInfoSprites_1D_7864           ;
CALL RemoveRemainingSpriteSlots_1D_7508                     ;
CALL HandleBirthMonthEntryScreenFunctionality_1D_78DC       ;

LD A, [GenericStateChangeIndicator]                         ;
CP GenericStateChange_Nothing                               ;
JR NZ, CODE_1D_72AC                                         ;

CALL WaitForVBlank_1D_7527                                  ;
JR HandleBirthMonthEntryScreen_1D_7294                      ;

CODE_1D_72AC:
CALL FadeOutTransition_1D_7BCB                              ;
CALL ResetCurrentSpriteSlot_1D_7503                         ;
CALL RemoveRemainingSpriteSlots_1D_7508                     ;
CALL WaitForVBlank_1D_7527                                  ;
RET                                                         ;

LoadBirthMonthEntryScreen_1D_72B9:
CALL DrawFullScreenInfoBox_1D_7ADF                          ;

LD HL, EnterBirthMonthStrings_1D_6166                       ;
CALL DrawFromTilemap_1D_7AFD                                ;

LD HL, BirthMonthSelection_1D_618E                          ;
CALL DrawFromTilemap_1D_7AFD                                ;

LD HL, ConfirmBirthInfoString_1D_61B6                       ;
CALL DrawFromTilemap_1D_7AFD                                ;
CALL DrawAAndBButtonFunctionalityStrings_1D_7B7C            ;

XOR A                                                       ;
LDH [Reg_CameraXPosition], A                                ;
LDH [Reg_CameraYPosition], A                                ;
LD [GenericStateChangeIndicator], A                         ;

CALL HandleCursorAndOtherBirthInfoSprites_1D_7864           ;
RET                                                         ;

LoadAndHandleBirthDayEntryScreen_1D_72DD:
LD A, LCDControlEnable                                      ;
LDH [Reg_LCDControlAndRender], A                            ;

CALL LoadBirthDayEntryScreen_1D_731F                        ;

LD HL, NewGame_TypedBirthDay                                ;
CALL LoadOtherBirthInformation_1D_78A0                      ;
CALL HandleCursorAndOtherBirthInfoSprites_1D_7864           ;
CALL WaitForVBlank_1D_7527                                  ;

LD HL, Reg_LCDControlAndRender                              ;
SetBit LCDBackgroundRender, [HL]                            ;
SetBit LCDSpriteRender, [HL]                                ;

CALL FadeInTransition_1D_7B82                               ;

HandleBirthDayEntryScreen_1D_72FA:
CALL ResetCurrentSpriteSlot_1D_7503                         ;
CALL HandleCursorAndOtherBirthInfoSprites_1D_7864           ;
CALL RemoveRemainingSpriteSlots_1D_7508                     ;
CALL HandleBirthDayEntryScreenFunctionality_1D_7735         ;

LD A, [GenericStateChangeIndicator]                         ;
CP GenericStateChange_Nothing                               ;
JR NZ, CODE_1D_7312                                         ;

CALL WaitForVBlank_1D_7527                                  ;
JR HandleBirthDayEntryScreen_1D_72FA                        ;

CODE_1D_7312:
CALL FadeOutTransition_1D_7BCB                              ;
CALL ResetCurrentSpriteSlot_1D_7503                         ;
CALL RemoveRemainingSpriteSlots_1D_7508                     ;
CALL WaitForVBlank_1D_7527                                  ;
RET                                                         ;

LoadBirthDayEntryScreen_1D_731F:
CALL DrawFullScreenInfoBox_1D_7ADF                          ;

LD HL, EnterBirthDayStrings_1D_61BD                         ;
CALL DrawFromTilemap_1D_7AFD                                ;

LD HL, BirthDaySelection_1Through10_1D_61E5                 ;
CALL DrawFromTilemap_1D_7AFD                                ;

LD HL, BirthDaySelection_11Through20_1D_6207                ;
CALL DrawFromTilemap_1D_7AFD                                ;

LD HL, BirthDaySelection_21Through29_1D_6229                ;
CALL DrawFromTilemap_1D_7AFD                                ;

LD HL, ConfirmBirthInfoString_1D_61B6                       ;
CALL DrawFromTilemap_1D_7AFD                                ;

CALL DrawAAndBButtonFunctionalityStrings_1D_7B7C            ;

LD HL, ExtraDaysPerMonth_1D_7382                            ;
LD A, [NewGame_TypedBirthMonth]                             ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;
LD A, [HL]                                                  ;

LD [NewGameInfoInput_MonthDurationIndex], A                 ;
CP $02                                                      ;
JR NZ, CODE_1D_7363                                         ;check the month duration is supposed to be 31 days

LD HL, Day31OfMonthstring_1D_738E                           ;draw 31st day
LD DE, $99CE                                                ;
LD BC, $0003                                                ;
CALL CopyData_1D_74F9                                       ;
JR CODE_1D_7367                                             ;

CODE_1D_7363:
CP $01                                                      ;check if month duration is supposed to be at least 30 days
JR NZ, CODE_1D_7373                                         ;

CODE_1D_7367:
LD HL, Day30OfMonthstring_1D_7391                           ;
LD DE, $99AE                                                ;
LD BC, $0003                                                ;
CALL CopyData_1D_74F9                                       ;

CODE_1D_7373:
XOR A                                                       ;
LDH [Reg_CameraXPosition], A                                ;
LDH [Reg_CameraYPosition], A                                ;
LD [NewGame_TypedInfo], A                                   ;
LD [NewGame_TypedInfo+1], A                                 ;

CALL HandleCursorAndOtherBirthInfoSprites_1D_7864           ;
RET                                                         ;

;The game only prints days up to 29, this is used if we need to print days 30 and 31 as well
ExtraDaysPerMonth_1D_7382:
db $02,$00,$02,$01,$02,$01,$02,$02
db $01,$02,$01,$02

Day31OfMonthstring_1D_738E:
db "31日"

Day30OfMonthstring_1D_7391:
db "30日"

LoadAndHandleBloodTypeEntryScreen_1D_7394:
LD A, LCDControlEnable                                      ;
LDH [Reg_LCDControlAndRender], A                            ;

CALL LoadBloodTypeEntryScreen_1D_73D6                       ;

LD HL, NewGame_TypedBloodType                               ;
CALL LoadOtherBirthInformation_1D_78A0                      ;
CALL InitializeBloodTypeSpriteDisplay_1D_7A95               ;
CALL WaitForVBlank_1D_7527                                  ;

LD HL, Reg_LCDControlAndRender                              ;
SetBit LCDBackgroundRender, [HL]                            ;
SetBit LCDSpriteRender, [HL]                                ;

CALL FadeInTransition_1D_7B82                               ;

HandleBloodTypeEntryScreen_1D_73B1:
CALL ResetCurrentSpriteSlot_1D_7503                         ;
CALL HandleCursorAndOtherBirthInfoSprites_1D_7864           ;
CALL RemoveRemainingSpriteSlots_1D_7508                     ;
CALL HandleBloodTypeEntryScreenFunctionality_1D_7961        ;

LD A, [GenericStateChangeIndicator]                         ;
CP GenericStateChange_Nothing                               ;
JR NZ, CODE_1D_73C9                                         ;

CALL WaitForVBlank_1D_7527                                  ;
JR HandleBloodTypeEntryScreen_1D_73B1                       ;

CODE_1D_73C9:
CALL FadeOutTransition_1D_7BCB                              ;
CALL ResetCurrentSpriteSlot_1D_7503                         ;
CALL RemoveRemainingSpriteSlots_1D_7508                     ;
CALL WaitForVBlank_1D_7527                                  ;
RET                                                         ;

;InitBloodTypeSelectionScreen_1D_73D6:
LoadBloodTypeEntryScreen_1D_73D6:
CALL DrawFullScreenInfoBox_1D_7ADF                          ;

LD HL, EnterBloodTypeStrings_1D_6248                        ;
CALL DrawFromTilemap_1D_7AFD                                ;

LD HL, BloodTypeSelection_1D_6270                           ;
CALL DrawFromTilemap_1D_7AFD                                ;

LD HL, ConfirmBirthInfoString_1D_61B6                       ;
CALL DrawFromTilemap_1D_7AFD                                ;
CALL DrawAAndBButtonFunctionalityStrings_1D_7B7C            ;

XOR A                                                       ;
LDH [Reg_CameraXPosition], A                                ;
LDH [Reg_CameraYPosition], A                                ;
RET                                                         ;

;Final stretch, let the player look at their birth info
LoadAndHandleNewGameConfirmationScreen_1D_73F4:
LD A, LCDControlEnable                                      ;
LDH [Reg_LCDControlAndRender], A                            ;

CALL LoadNewGameConfirmationScreenVisuals_1D_744E           ;
CALL WaitForVBlank_1D_7527                                  ;

LD HL, Reg_LCDControlAndRender                              ;
SetBit LCDBackgroundRender, [HL]                            ;
SetBit LCDSpriteRender, [HL]                                ;

CALL FadeInTransition_1D_7B82                               ;

HandleNewGameConfirmationScreen_1D_7408:
CALL ResetCurrentSpriteSlot_1D_7503                         ;
CALL RemoveRemainingSpriteSlots_1D_7508                     ;
CALL HandleNewGameConfirmationScreenFunctionality_1D_79E3   ;

LD A, [GenericStateChangeIndicator]                         ;
CP GenericStateChange_Nothing                               ;
JR NZ, CODE_1D_741D                                         ;

CALL WaitForVBlank_1D_7527                                  ;
JR HandleNewGameConfirmationScreen_1D_7408                  ;

CODE_1D_741D:
CALL FadeOutTransition_1D_7BCB                              ;

LD HL, FullScreenTilemapClearData_1D_62D4                   ;
CALL ClearTilemap_1E_7B3D                                   ;
RET                                                         ;

;an unused copy of DisableLCD routine
DisableLCD_1D_7427:
LD A, [Reg_LCDControlAndRender]                             ;check if LCD control is already off
BitTest LCDControlEnable, A                                 ;
RET Z                                                       ;

LD A, [Reg_InterruptsEnabler]                               ;
LD [InterruptDisablerMirror], A                             ;
ResetBit Interrupt_VBlank, A                                ;
LD [Reg_InterruptsEnabler], A                               ;

LOOP_1D_7438:
LD A, [Register_LCDYPos]                                    ;
CP $91                                                      ;LCD can only be disabled during VBlank, or the hardware can get damaged. serious stuff.
JR NZ, LOOP_1D_7438                                         ;

LD A, [Reg_LCDControlAndRender]                             ;
AND ~LCDControlEnable                                       ;preserve all bits except for LCD control
LD [Reg_LCDControlAndRender], A                             ;

LD A, [InterruptDisablerMirror]                             ;
LD [Reg_InterruptsEnabler], A                               ;
RET                                                         ;

LoadNewGameConfirmationScreenVisuals_1D_744E:
CALL WaitForVBlank_1D_7527                                  ;

CALL DrawFullScreenInfoBox_1D_7ADF                          ;

LD HL, ConfirmBirthInfoString_1D_6284                       ;
CALL DrawFromTilemap_1D_7AFD                                ;

LD HL, ConfirmBirthInfo_NameString_1D_6292                  ;
CALL DrawFromTilemap_1D_7AFD                                ;

LD HL, ConfirmBirthInfo_NickNameString_1D_6299              ;
CALL DrawFromTilemap_1D_7AFD                                ;

LD HL, ConfirmBirthInfo_BirthDateString_1D_62A3             ;
CALL DrawFromTilemap_1D_7AFD                                ;

LD HL, ConfirmBirthInfo_BloodTypeString_1D_62B4             ;
CALL DrawFromTilemap_1D_7AFD                                ;
CALL DrawAAndBButtonFunctionalityStrings_1D_7B7C            ;

LD A, PlayerString_SecondName                               ;
LD [PlayerStringType], A                                    ;
CALL GetPlayerStringFromSaveFile_1D_7ABF                    ;

LD HL, NewGame_TypedInfo                                    ;
LD DE, $98C8                                                ;
LD BC, PlayerInfo_SecondNameMaxLength                       ;
CALL CopyData_1D_74F9                                       ;draw second name

LD A, PlayerString_Name                                     ;
LD [PlayerStringType], A                                    ;
CALL GetPlayerStringFromSaveFile_1D_7ABF                    ;

LD HL, NewGame_TypedInfo                                    ;
LD DE, $98CE                                                ;
LD BC, PlayerInfo_NameMaxLength                             ;
CALL CopyData_1D_74F9                                       ;draw first name

LD A, PlayerString_NickName                                 ;
LD [PlayerStringType], A                                    ;
CALL GetPlayerStringFromSaveFile_1D_7ABF                    ;

LD HL, NewGame_TypedInfo                                    ;
LD DE, $9908                                                ;
LD BC, PlayerInfo_NickNameMaxLength                         ;
CALL CopyData_1D_74F9                                       ;draw nickname

LD A, [NewGame_TypedBirthMonth]                             ;
LD [NewGame_CurrentBirthInfo], A                            ;
CALL InitializeBirthDateSpriteDisplay_1D_7A3C               ;

LD HL, NewGame_TypedInfo                                    ;
LD DE, $9948                                                ;
LD BC, $0002                                                ;
CALL CopyData_1D_74F9                                       ;draw birth month

LD A, [NewGame_TypedBirthDay]                               ;
LD [NewGame_CurrentBirthInfo], A                            ;
CALL InitializeBirthDateSpriteDisplay_1D_7A3C               ;

LD HL, NewGame_TypedInfo                                    ;
LD DE, $994B                                                ;
LD BC, $0002                                                ;
CALL CopyData_1D_74F9                                       ;

CALL InitializeBloodTypeSpriteDisplay_1D_7A95               ;

LD HL, NewGame_TypedInfo                                    ;
LD DE, $9988                                                ;
LD BC, $0002                                                ;
CALL CopyData_1D_74F9                                       ;draw blood type

XOR A                                                       ;
LDH [Reg_CameraXPosition], A                                ;
LDH [Reg_CameraYPosition], A                                ;
LD [GenericStateChangeIndicator], A                         ;

CALL ResetCurrentSpriteSlot_1D_7503                         ;
CALL RemoveRemainingSpriteSlots_1D_7508                     ;
RET                                                         ;

;A copy of CopyData from bank 0. Get it? CopyData was copied over!
;input:
;HL - data to transfer from
;DE - data to transfer to
;BC - amount of bytes to transfer
CopyData_1D_74F9:
CheckPPUModes                                               ;
LD A, [HL+]                                                 ;copy HL
LD [DE], A                                                  ;into DE
INC DE                                                      ;

DEC BC                                                      ;
LD A, B                                                     ;
OR C                                                        ;
JR NZ, CopyData_1D_74F9                                     ;do it BC times
RET                                                         ;

;there's a perfectly valid routine in bank 0, but ok.
ResetCurrentSpriteSlot_1D_7503:
XOR A                                                       ;
LD [LatestOAMSlot], A                                       ;
RET                                                         ;

;there's a perfectly vali-hold on just a moment! what are we doing here?
RemoveRemainingSpriteSlots_1D_7508:
LD DE, OAM_Y                                                ;
LD A, [LatestOAMSlot]                                       ;
SLA A                                                       ;
SLA A                                                       ;
ADD A, E                                                    ;
LD E, A                                                     ;
LD A, D                                                     ;
ADC A, $00                                                  ;
LD D, A                                                     ;

LOOP_1D_7518:
LD A, E                                                     ;
CP 40*4                                                     ;
JR NC, RETURN_1D_7526                                       ;

INC DE                                                      ;
LD A, $00                                                   ;
LD [DE], A                                                  ;sprite slot gone

INC DE                                                      ;
INC DE                                                      ;
INC DE                                                      ;
JR LOOP_1D_7518                                             ;

RETURN_1D_7526:
RET                                                         ;

;more stuff from bank 0 for some reason
WaitForVBlank_1D_7527:
HALT                                                        ;
LD A, [VBlankHitFlag]                                       ;
AND A                                                       ;
JR Z, WaitForVBlank_1D_7527                                 ;

XOR A                                                       ;
LD [VBlankHitFlag], A                                       ;clear the flag
RET                                                         ;

NameInputControlHandling_1D_7533:
LD A, [JoypadInputPress]                                    ;
BitTest JoypadInput_A, A                                    ;
JR NZ, PressedA_1D_7553                                     ;

BitTest JoypadInput_B, A                                    ;
JR NZ, PressedB_1D_75B6                                     ;

BitTest JoypadInput_Up, A                                   ;
JP NZ, PressedUp_1D_75DA                                    ;

BitTest JoypadInput_Down, A                                 ;
JP NZ, PressedDown_1D_75EF                                  ;

BitTest JoypadInput_Left, A                                 ;
JP NZ, PressedLeft_1D_7601                                  ;

BitTest JoypadInput_Right, A                                ;
JP NZ, PressedRight_1D_7616                                 ;
RET                                                         ;

PressedA_1D_7553:
LD A, SFX_Confirm                                           ;
LD [SoundQueue], A                                          ;

LD A, [NewGameInfoInput_VerticalOption]                     ;check if we chose the done option
CP $0A                                                      ;
JR NZ, CODE_1D_7565                                         ;selected some character

LD A, GenericStateChange_Confirm                            ;transition
LD [GenericStateChangeIndicator], A                         ;
RET                                                         ;

;picked a text character
CODE_1D_7565:
LD HL, NewGame_TypedInfo                                    ;
LD A, [NewGameInfoInput_CurrentCharacter]                   ;
LD E, A                                                     ;
LD D, $00                                                   ;
ADD HL, DE                                                  ;
LD C, L                                                     ;
LD B, H                                                     ;

LD A, [NewGameInfoInput_VerticalOption]                     ;check if player is hovering over the first 5 rows of characters or last 5 rows of characters
CP $05                                                      ;
JR C, CODE_1D_7579                                          ;

INC A                                                       ;since the other half of characters is separated, need to compensate for that

CODE_1D_7579:
LD E, A                                                     ;vertical line

LD D, $00                                                   ;
SLA E                                                       ;
SLA E                                                       ;
LD A, E                                                     ;vertical choice times 4, which should skip over irrelevant characters (borders, and space before character row)
SLA E                                                       ;
SLA E                                                       ;and obviously add the row offset, which is high nibble
ADD A, E                                                    ;
LD E, A                                                     ;
LD HL, InfoEntryScreen_CharacterMap_1D_6006                 ;
ADD HL, DE                                                  ;vertical offset applied

LD A, [NewGameInfoInput_HorizontalOption]                   ;
LD E, A                                                     ;
SLA E                                                       ;
LD D, $00                                                   ;
ADD HL, DE                                                  ;horizontal offset applied

LD A, [HL]                                                  ;
LD [BC], A                                                  ;got selected character

LD A, [PlayerNameMaxCharactersForInput]                     ;go to next character
DEC A                                                       ;
LD B, A                                                     ;

LD A, [NewGameInfoInput_CurrentCharacter]                   ;check if all characters are filled in
CP B                                                        ;
JR NZ, CODE_1D_75A6                                         ;

LD A, $0A                                                   ;automatically place the cursor at done option when all spaces are filled in
LD [NewGameInfoInput_VerticalOption], A                     ;

CODE_1D_75A6:
LD A, [PlayerNameMaxCharactersForInput]                     ;
LD B, A                                                     ;
LD A, [NewGameInfoInput_CurrentCharacter]                   ;
INC A                                                       ;
CP B                                                        ;
JR NZ, CODE_1D_75B2                                         ;
DEC A                                                       ;

CODE_1D_75B2:
LD [NewGameInfoInput_CurrentCharacter], A                   ;
RET                                                         ;

PressedB_1D_75B6:
LD A, SFX_Cancel                                            ;
LD [SoundQueue], A                                          ;

LD HL, NewGame_TypedInfo                                    ;
LD A, [NewGameInfoInput_CurrentCharacter]                   ;
LD E, A                                                     ;
LD D, $00                                                   ;
ADD HL, DE                                                  ;

LD A, CHARVAL("_")                                          ;that character becomes underscore
LD [HL], A                                                  ;
LD A, [NewGameInfoInput_CurrentCharacter]                   ;
CP $00                                                      ;check if pressed B while the first character is selected
JR NZ, CODE_1D_75D5                                         ;

LD A, GenericStateChange_Cancel                             ;back out of the name entry screen entirely
LD [GenericStateChangeIndicator], A                         ;
RET                                                         ;

CODE_1D_75D5:
DEC A                                                       ;move to previous character
LD [NewGameInfoInput_CurrentCharacter], A                   ;
RET                                                         ;

PressedUp_1D_75DA:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, [NewGameInfoInput_VerticalOption]                     ;
CP $00                                                      ;
JR NZ, CODE_1D_75EA                                         ;

LD A, $0A                                                   ;
JR CODE_1D_75EB                                             ;

CODE_1D_75EA:
DEC A                                                       ;

CODE_1D_75EB:
LD [NewGameInfoInput_VerticalOption], A                     ;
RET                                                         ;

PressedDown_1D_75EF:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, [NewGameInfoInput_VerticalOption]                     ;
INC A                                                       ;
CP $0B                                                      ;
JR NZ, CODE_1D_75FD                                         ;

XOR A                                                       ;

CODE_1D_75FD:
LD [NewGameInfoInput_VerticalOption], A                     ;
RET                                                         ;

PressedLeft_1D_7601:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, [NewGameInfoInput_HorizontalOption]                   ;
CP $00                                                      ;
JR NZ, CODE_1D_7611                                         ;

LD A, $08                                                   ;
JR CODE_1D_7612                                             ;

CODE_1D_7611:
DEC A                                                       ;

CODE_1D_7612:
LD [NewGameInfoInput_HorizontalOption], A                   ;
RET                                                         ;

PressedRight_1D_7616:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, [NewGameInfoInput_HorizontalOption]                   ;
INC A                                                       ;
CP $09                                                      ;
JR NZ, CODE_1D_7624                                         ;

XOR A                                                       ;

CODE_1D_7624:
LD [NewGameInfoInput_HorizontalOption], A                   ;
RET                                                         ;

;The game does something sneaky - instead of animating BG tiles, it uses sprites that have the same appearance as text characters!
HandleCursorAndNameSprites_1D_7628:
LD DE, OAM_Y                                                ;
LD A, [NewGameInfoInput_VerticalOption]                     ;place cursor vertically based on selected option
SLA A                                                       ;
SLA A                                                       ;
SLA A                                                       ;
ADD A, $30                                                  ;
CP $54                                                      ;check if should be on done option
JR C, CODE_1D_763C                                          ;
ADD A, $08                                                  ;done option is further down

CODE_1D_763C:
LD [DE], A                                                  ;store y-pos
INC DE                                                      ;

LD A, [NewGameInfoInput_VerticalOption]                     ;
CP $0A                                                      ;fix x-position when at done option
JR Z, CODE_1D_7654                                          ;

LD A, [NewGameInfoInput_HorizontalOption]                   ;x-position at selected text character
SLA A                                                       ;
SLA A                                                       ;
SLA A                                                       ;
SLA A                                                       ;
ADD A, $10                                                  ;
JR CODE_1D_7656                                             ;

CODE_1D_7654:
LD A, $80                                                   ;done option cursor x-pos

CODE_1D_7656:
LD [DE], A                                                  ;store x-pos
INC DE                                                      ;

LD A, BGTile_HandCursor                                     ;it's not a BG tile, but it uses the same tile (and graphics as a whole)
LD [DE], A                                                  ;store tile
INC DE                                                      ;

XOR A                                                       ;default OAM prop, nothing special
LD [DE], A                                                  ;
INC DE                                                      ;

LD HL, NewGame_TypedInfo                                    ;
LD B, $00                                                   ;start from first character
LD C, $48                                                   ;default name-that-we-are-typing x-pos

LOOP_1D_7666:
LD A, [NewGameInfoInput_CurrentCharacter]                   ;check if the character that should be drawn is the character we're modifying
CP B                                                        ;
JR NZ, CODE_1D_767C                                         ;

LD A, [FrameCounter8Bit]                                    ;blink current character
RRA                                                         ;
RRA                                                         ;
RRA                                                         ;
JR NC, CODE_1D_767C                                         ;

XOR A                                                       ;?

LD A, C                                                     ;
ADC A, $08                                                  ;next character x-pos
LD C, A                                                     ;

INC HL                                                      ;
JR CODE_1D_7696                                             ;

CODE_1D_767C:
LD A, $20                                                   ;y-position for name entry
LD [DE], A                                                  ;
INC DE                                                      ;

LD A, C                                                     ;x-position for name entry
LD [DE], A                                                  ;
INC DE                                                      ;

XOR A                                                       ;?

LD A, C                                                     ;
ADC A, $08                                                  ;next character x-pos
LD C, A                                                     ;

LD A, [HL+]                                                 ;character tile
LD [DE], A                                                  ;
INC DE                                                      ;

LD A, OAMProp_Palette1                                      ;different palette for text character sprites
LD [DE], A                                                  ;
INC DE                                                      ;

LD A, [LatestOAMSlot]                                       ;
INC A                                                       ;
LD [LatestOAMSlot], A                                       ;

CODE_1D_7696:
INC B                                                       ;
LD A, [PlayerNameMaxCharactersForInput]                     ;
CP B                                                        ;
JR NZ, LOOP_1D_7666                                         ;keep drawing until done

LD A, [LatestOAMSlot]                                       ;
INC A                                                       ;
LD [LatestOAMSlot], A                                       ;
RET                                                         ;

;initializes name display (either all underscore or the name we typed previously)
LoadNameInformation_1D_76A5:
LD A, [GenericStateChangeIndicator]                         ;
CP GenericStateChange_Cancel                                ;check if we got into this screen by cancelling from the next one
JR Z, CODE_1D_76C3                                          ;

XOR A                                                       ;
LD [NewGameInfoInput_HorizontalOption], A                   ;
LD [NewGameInfoInput_VerticalOption], A                     ;
LD [NewGameInfoInput_CurrentCharacter], A                   ;

LD A, CHARVAL("_")                                          ;
LD HL, NewGame_TypedInfo                                    ;

LD B, PlayerInfoMaxCharacters                               ;

LOOP_1D_76BD:
LD [HL+], A                                                 ;all underscore
DEC B                                                       ;
JR NZ, LOOP_1D_76BD                                         ;
JR CODE_1D_7700                                             ;

CODE_1D_76C3:
XOR A                                                       ;
LD [NewGameInfoInput_HorizontalOption], A                   ;
LD [NewGameInfoInput_CurrentCharacter], A                   ;

LD A, $0A                                                   ;
LD [NewGameInfoInput_VerticalOption], A                     ;put the cursor on "done" option

LD DE, NewGame_TypedInfo                                    ;
LD HL, CurrentSave_PlayerSecondName                         ;
LD A, [PlayerStringType]                                    ;get an appropriate name data
SLA A                                                       ;
SLA A                                                       ;
SLA A                                                       ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;

LD B, PlayerInfoMaxCharacters                               ;
LD C, $00                                                   ;

LOOP_1D_76E6:
LD A, [HL+]                                                 ;
CP $00                                                      ;check if character is empty
JR Z, CODE_1D_76EE                                          ;

INC C                                                       ;
JR CODE_1D_76F0                                             ;

CODE_1D_76EE:
LD A, CHARVAL("_")                                          ;characters not typed in are marked with underscores

CODE_1D_76F0:
LD [DE], A                                                  ;proper character that was selected
INC DE                                                      ;
DEC B                                                       ;
JR NZ, LOOP_1D_76E6                                         ;

LD A, [PlayerNameMaxCharactersForInput]                     ;
CP C                                                        ;check if the name is exactly the max size
JR NZ, CODE_1D_76FC                                         ;

DEC C                                                       ;

CODE_1D_76FC:
LD A, C
LD [NewGameInfoInput_CurrentCharacter], A                   ;the index for the last character we typed in

CODE_1D_7700:
XOR A                                                       ;
LD [GenericStateChangeIndicator], A                         ;

CALL HandleCursorAndNameSprites_1D_7628                     ;keep updating sprite stuff (most importantly, blink character to be replaced)
RET                                                         ;

SaveTypedSecondName_1D_7708:
LD A, PlayerString_SecondName                               ;
JP CODE_1D_7717                                             ;

SaveTypedFirstName_1D_770D:
LD A, PlayerString_Name                                     ;
JP CODE_1D_7717                                             ;

SaveTypedNickName_1D_7712:
LD A, PlayerString_NickName                                 ;
JP CODE_1D_7717                                             ;

CODE_1D_7717:
LD HL, CurrentSave_PlayerSecondName                         ;
SLA A                                                       ;
SLA A                                                       ;
SLA A                                                       ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;
LD DE, NewGame_TypedInfo                                    ;
                                                            ;
LD B, PlayerInfoMaxCharacters                               ;

LOOP_1D_7729:
LD A, [DE]                                                  ;
INC DE                                                      ;
CP CHARVAL("_")                                             ;check if this character wasn't replaced with something (remains underscore)
JR NZ, CODE_1D_7730                                         ;

XOR A                                                       ;empty space otherwise

CODE_1D_7730:
LD [HL+], A                                                 ;
DEC B                                                       ;
JR NZ, LOOP_1D_7729                                         ;
RET                                                         ;

HandleBirthDayEntryScreenFunctionality_1D_7735:
LD A, [JoypadInputPress]                                    ;
BitTest JoypadInput_A, A                                    ;
JR NZ, PressedA_1D_775F                                     ;

BitTest JoypadInput_B, A                                    ;
JR NZ, PressedB_1D_7790                                     ;

LD A, [NewGameInfoInput_SelectedOtherBirthInfoFlag]         ;can move cursor around if haven't decided on birth day
CP $01                                                      ;
JR Z, RETURN_1D_775E                                        ;

LD A, [JoypadInputPress]                                    ;
BitTest JoypadInput_Up, A                                   ;
JP NZ, PressedUp_1D_77B4                                    ;

BitTest JoypadInput_Down, A                                 ;
JP NZ, PressedDown_1D_77DE                                  ;

BitTest JoypadInput_Left, A                                 ;
JP NZ, PressedLeft_1D_7806                                  ;

BitTest JoypadInput_Right, A                                ;
JP NZ, PressedRight_1D_7834                                 ;

RETURN_1D_775E:
RET                                                         ;

PressedA_1D_775F:
LD A, SFX_Confirm                                           ;
LD [SoundQueue], A                                          ;

LD A, [NewGameInfoInput_SelectedOtherBirthInfoFlag]         ;
CP $00                                                      ;
JR Z, CODE_1D_7771                                          ;

LD A, GenericStateChange_Confirm                            ;
LD [GenericStateChangeIndicator], A                         ;
RET                                                         ;

CODE_1D_7771:
LD HL, BirthDaySelectedDayBaseOffset_1D_7861                ;
LD A, [NewGameInfoInput_HorizontalOption]                   ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;

LD A, [HL]                                                  ;base offset
LD B, A                                                     ;
LD A, [NewGameInfoInput_VerticalOption]                     ;add vertically selection option as an offset
ADD A, B                                                    ;
LD [NewGame_TypedBirthDay], A                               ;
LD [NewGame_CurrentBirthInfo], A                            ;

CALL InitializeBirthDateSpriteDisplay_1D_7A3C               ;

LD A, $01                                                   ;
LD [NewGameInfoInput_SelectedOtherBirthInfoFlag], A         ;
RET                                                         ;

PressedB_1D_7790:
LD A, SFX_Cancel                                            ;
LD [SoundQueue], A                                          ;

LD A, [NewGameInfoInput_SelectedOtherBirthInfoFlag]         ;
CP $00                                                      ;
JR NZ, EraseBirthDayInfo_1D_77A2                            ;

LD A, GenericStateChange_Cancel                             ;
LD [GenericStateChangeIndicator], A                         ;
RET                                                         ;

EraseBirthDayInfo_1D_77A2:
LD A, 99                                                    ;
LD [NewGame_TypedBirthDay], A                               ;

LD A, CHARVAL("_")                                          ;
LD [NewGame_TypedInfo], A                                   ;
LD [NewGame_TypedInfo+1], A                                 ;

XOR A                                                       ;
LD [NewGameInfoInput_SelectedOtherBirthInfoFlag], A         ;
RET                                                         ;

PressedUp_1D_77B4:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, [NewGameInfoInput_HorizontalOption]                   ;
CP $02                                                      ;
JR Z, CODE_1D_77D0                                          ;

LD A, [NewGameInfoInput_VerticalOption]                     ;
CP $00                                                      ;
JR NZ, CODE_1D_77CB                                         ;

LD A, $09                                                   ;wrap-around for columns with 10 days
JR CODE_1D_77CC                                             ;

CODE_1D_77CB:
DEC A                                                       ;

CODE_1D_77CC:
LD [NewGameInfoInput_VerticalOption], A                     ;
RET                                                         ;

CODE_1D_77D0:
LD A, [NewGameInfoInput_VerticalOption]                     ;check for wrap-around on last column
CP $00                                                      ;
JR NZ, CODE_1D_77CB                                         ;

LD A, [NewGameInfoInput_MonthDurationIndex]                 ;wrap to the last day of the month (29, 30 or 31)
ADD A, $08                                                  ;
JR CODE_1D_77CC                                             ;

PressedDown_1D_77DE:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, [NewGameInfoInput_HorizontalOption]                   ;
CP $02                                                      ;
JR Z, CODE_1D_77F7                                          ;
LD A, [NewGameInfoInput_VerticalOption]                     ;
INC A                                                       ;
CP $0A                                                      ;
JR NZ, CODE_1D_77F3                                         ;

CODE_1D_77F2:
XOR A                                                       ;

CODE_1D_77F3:
LD [NewGameInfoInput_VerticalOption], A                     ;
RET                                                         ;

CODE_1D_77F7:
LD A, [NewGameInfoInput_MonthDurationIndex]                 ;
ADD A, $09                                                  ;
LD C, A                                                     ;
LD A, [NewGameInfoInput_VerticalOption]                     ;
INC A                                                       ;
CP C                                                        ;
JR NZ, CODE_1D_77F3                                         ;
JR CODE_1D_77F2                                             ;

PressedLeft_1D_7806:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, [NewGameInfoInput_VerticalOption]                     ;
CP $0A                                                      ;
JR Z, RETURN_1D_7823                                        ;can't wrap around from 31st
CP $09                                                      ;
JR Z, CODE_1D_7824                                          ;

CODE_1D_7816:
LD A, [NewGameInfoInput_HorizontalOption]                   ;
DEC A                                                       ;
CP $FF                                                      ;
JR NZ, CODE_1D_7820                                         ;
LD A, $02                                                   ;

CODE_1D_7820:
LD [NewGameInfoInput_HorizontalOption], A                   ;

RETURN_1D_7823:
RET                                                         ;

CODE_1D_7824:
LD A, [NewGameInfoInput_MonthDurationIndex]                 ;check if we're selecting days for february and about to wrap around
CP $00
JR NZ, CODE_1D_7816

LD A, [NewGameInfoInput_HorizontalOption]                   ;
XOR $01                                                     ;can only wrap between 10 and 20
LD [NewGameInfoInput_HorizontalOption], A                   ;
RET                                                         ;

PressedRight_1D_7834:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, [NewGameInfoInput_VerticalOption]                     ;
CP $0A                                                      ;
JR Z, RETURN_1D_7850                                        ;can't wrap around from 31st
CP $09                                                      ;
JR Z, CODE_1D_7851                                          ;

CODE_1D_7844:
LD A, [NewGameInfoInput_HorizontalOption]                   ;
INC A                                                       ;
CP $03                                                      ;
JR NZ, CODE_1D_784D                                         ;

XOR A                                                       ;

CODE_1D_784D:
LD [NewGameInfoInput_HorizontalOption], A                   ;

RETURN_1D_7850:
RET                                                         ;

CODE_1D_7851:
LD A, [NewGameInfoInput_MonthDurationIndex]                 ;check if the month duration is 29 days (february)
CP $00                                                      ;
JR NZ, CODE_1D_7844                                         ;

LD A, [NewGameInfoInput_HorizontalOption]                   ;swap between 10 and 20, since there's no 30
XOR $01                                                     ;
LD [NewGameInfoInput_HorizontalOption], A                   ;
RET                                                         ;

BirthDaySelectedDayBaseOffset_1D_7861:
db 0,10,20

HandleCursorAndOtherBirthInfoSprites_1D_7864:
LD DE, OAM_Y                                                ;
LD A, [NewGameInfoInput_SelectedOtherBirthInfoFlag]         ;check if we selected birth info
CP $00                                                      ;
JR NZ, CODE_1D_788A                                         ;if so, then cursor will be at done option

LD A, [NewGameInfoInput_VerticalOption]                     ;Y-position
SLA A                                                       ;
SLA A                                                       ;
SLA A                                                       ;
ADD A, $30                                                  ;
LD [DE], A                                                  ;
INC DE                                                      ;

LD HL, CursorXPositionForOtherBirthInfoSelection_1D_789D    ;
LD A, [NewGameInfoInput_HorizontalOption]                   ;x-pos depends on the column
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;

LD A, [HL]                                                  ;
LD [DE], A                                                  ;
INC DE                                                      ;
JR CODE_1D_7892                                             ;

CODE_1D_788A:
LD A, $88                                                   ;x-pos, placed at done option
LD [DE], A                                                  ;
INC DE                                                      ;

LD A, $80                                                   ;y-pos
LD [DE], A                                                  ;
INC DE                                                      ;

CODE_1D_7892:
LD A, BGTile_HandCursor                                     ;
LD [DE], A                                                  ;
INC DE                                                      ;

XOR A                                                       ;
LD [DE], A                                                  ;
INC DE                                                      ;

CALL HandleOtherBirthInfoSprites_1D_7A05
RET                                                         ;

CursorXPositionForOtherBirthInfoSelection_1D_789D:
db $10,$40,$70

;input HL - the type of information to attempt to load
LoadOtherBirthInformation_1D_78A0:
LD A, [GenericStateChangeIndicator]                         ;check if you got here by cancelling out
CP GenericStateChange_Cancel                                ;
JR Z, CODE_1D_78C1                                          ;

XOR A                                                       ;if you got here by advancing here, the birth info will be initialized
LD [NewGameInfoInput_HorizontalOption], A                   ;
LD [NewGameInfoInput_VerticalOption], A                     ;
LD [NewGameInfoInput_CurrentCharacter], A                   ;
LD [NewGameInfoInput_SelectedOtherBirthInfoFlag], A         ;

LD A, CHARVAL("_")                                          ;
LD [NewGame_TypedInfo], A                                   ;
LD [NewGame_TypedInfo+1], A                                 ;

LD A, 99                                                    ;default to 99
LD [HL], A                                                  ;
JR CODE_1D_78D7                                             ;

CODE_1D_78C1:
XOR A                                                       ;
LD [NewGameInfoInput_HorizontalOption], A                   ;
LD [NewGameInfoInput_CurrentCharacter], A                   ;
LD [NewGameInfoInput_VerticalOption], A                     ;

LD A, [HL]                                                  ;get the birth info we previously typed
LD [NewGame_CurrentBirthInfo], A                            ;

CALL InitializeBirthDateSpriteDisplay_1D_7A3C               ;

LD A, $01                                                   ;
LD [NewGameInfoInput_SelectedOtherBirthInfoFlag], A         ;we did type that in, cursor will be at done option

CODE_1D_78D7:
XOR A                                                       ;
LD [GenericStateChangeIndicator], A                         ;
RET                                                         ;

HandleBirthMonthEntryScreenFunctionality_1D_78DC:
LD A, [JoypadInputPress]                                    ;
BitTest JoypadInput_A, A                                    ;
JR NZ, PressedA_1D_78F2                                     ;

BitTest JoypadInput_B, A                                    ;
JR NZ, PressedB_1D_7916                                     ;

BitTest JoypadInput_Up, A                                   ;
JP NZ, PressedUp_1D_793A                                    ;

BitTest JoypadInput_Down, A                                 ;
JP NZ, PressedDown_1D_794F                                  ;
RET                                                         ;

PressedA_1D_78F2:
LD A, SFX_Confirm                                           ;
LD [SoundQueue], A                                          ;

LD A, [NewGameInfoInput_SelectedOtherBirthInfoFlag]         ;check if we already selected that something
CP $00                                                      ;
JR Z, CODE_1D_7904                                          ;

LD A, GenericStateChange_Confirm                            ;then move on from this screen to the next one
LD [GenericStateChangeIndicator], A                         ;
RET                                                         ;

CODE_1D_7904:
LD A, [NewGameInfoInput_VerticalOption]                     ;
LD [NewGame_TypedBirthMonth] , A                            ;

LD [NewGame_CurrentBirthInfo], A                            ;
CALL InitializeBirthDateSpriteDisplay_1D_7A3C               ;

LD A, $01                                                   ;just selected something
LD [NewGameInfoInput_SelectedOtherBirthInfoFlag], A         ;
RET                                                         ;

PressedB_1D_7916:
LD A, SFX_Cancel                                            ;
LD [SoundQueue], A                                          ;

LD A, [NewGameInfoInput_SelectedOtherBirthInfoFlag]         ;check if we didn't already select something
CP $00                                                      ;
JR NZ, CODE_1D_7928                                         ;

LD A, GenericStateChange_Cancel                             ;go to the previous screen
LD [GenericStateChangeIndicator], A                         ;
RET                                                         ;

CODE_1D_7928:
LD A, 99                                                    ;birth info we just typed in gets trashed
LD [NewGame_TypedBirthMonth], A                             ;

LD A, CHARVAL("_")                                          ;
LD [NewGame_TypedInfo], A                                   ;
LD [NewGame_TypedInfo+1], A                                 ;

XOR A                                                       ;
LD [NewGameInfoInput_SelectedOtherBirthInfoFlag], A         ;
RET                                                         ;

PressedUp_1D_793A:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, [NewGameInfoInput_VerticalOption]                     ;
CP $00                                                      ;
JR NZ, CODE_1D_794A                                         ;

LD A, $0B                                                   ;wrap around
JR CODE_1D_794B                                             ;

CODE_1D_794A:
DEC A                                                       ;

CODE_1D_794B:
LD [NewGameInfoInput_VerticalOption], A                     ;
RET                                                         ;

PressedDown_1D_794F:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, [NewGameInfoInput_VerticalOption]                     ;
INC A                                                       ;
CP $0C                                                      ;
JR NZ, CODE_1D_795D                                         ;

XOR A                                                       ;

CODE_1D_795D:
LD [NewGameInfoInput_VerticalOption], A                     ;
RET                                                         ;

HandleBloodTypeEntryScreenFunctionality_1D_7961:
LD A, [JoypadInputPress]                                    ;
BitTest JoypadInput_A, A                                    ;
JR NZ, PressedA_1D_7977                                     ;

BitTest JoypadInput_B, A                                    ;
JR NZ, PressedB_1D_7998                                     ;

BitTest JoypadInput_Up, A                                   ;
JP NZ, PressedUp_1D_79BC                                    ;

BitTest JoypadInput_Down, A                                 ;
JP NZ, PressedDown_1D_79D1                                  ;
RET                                                         ;

PressedA_1D_7977:
LD A, SFX_Confirm                                           ;
LD [SoundQueue], A                                          ;

LD A, [NewGameInfoInput_SelectedOtherBirthInfoFlag]         ;
CP $00                                                      ;
JR Z, CODE_1D_7989                                          ;

LD A, GenericStateChange_Confirm                            ;
LD [GenericStateChangeIndicator], A                         ;
RET                                                         ;

CODE_1D_7989:
LD A, [NewGameInfoInput_VerticalOption]                     ;
LD [NewGame_TypedBloodType], A                              ;
CALL InitializeBloodTypeSpriteDisplay_1D_7A95               ;

LD A, $01                                                   ;
LD [NewGameInfoInput_SelectedOtherBirthInfoFlag], A         ;
RET                                                         ;

PressedB_1D_7998:
LD A, SFX_Cancel                                            ;
LD [SoundQueue], A                                          ;

LD A, [NewGameInfoInput_SelectedOtherBirthInfoFlag]         ;
CP $00                                                      ;
JR NZ, CODE_1D_79AA                                         ;

LD A, GenericStateChange_Cancel                             ;
LD [GenericStateChangeIndicator], A                         ;get out of blood type screen
RET                                                         ;

CODE_1D_79AA:
LD A, 99                                                    ;
LD [NewGame_TypedBloodType], A                              ;

LD A, CHARVAL("_")                                          ;
LD [NewGame_TypedInfo], A                                   ;
LD [NewGame_TypedInfo+1], A                                 ;

XOR A                                                       ;
LD [NewGameInfoInput_SelectedOtherBirthInfoFlag], A         ;
RET                                                         ;

PressedUp_1D_79BC:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, [NewGameInfoInput_VerticalOption]                     ;
CP $00                                                      ;
JR NZ, CODE_1D_79CC                                         ;

LD A, $03                                                   ;
JR CODE_1D_79CD                                             ;

CODE_1D_79CC:
DEC A                                                       ;

CODE_1D_79CD:
LD [NewGameInfoInput_VerticalOption], A                     ;
RET                                                         ;

PressedDown_1D_79D1:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, [NewGameInfoInput_VerticalOption]                     ;
INC A                                                       ;
CP $04                                                      ;
JR NZ, CODE_1D_79DF                                         ;

XOR A                                                       ;

CODE_1D_79DF:
LD [NewGameInfoInput_VerticalOption], A                     ;
RET                                                         ;

;probably the last screen before starting the game, giving an overview on the player info
HandleNewGameConfirmationScreenFunctionality_1D_79E3:
LD A, [JoypadInputPress]                                    ;
BitTest JoypadInput_A, A                                    ;
JR NZ, CODE_1D_79EF                                         ;

BitTest JoypadInput_B, A                                    ;
JR NZ, CODE_1D_79FA                                         ;
RET                                                         ;

CODE_1D_79EF:
LD A, SFX_Confirm                                           ;
LD [SoundQueue], A                                          ;

LD A, GenericStateChange_Confirm                            ;confirmed, finally start the game
LD [GenericStateChangeIndicator], A                         ;
RET                                                         ;

CODE_1D_79FA:
LD A, SFX_Cancel                                            ;
LD [SoundQueue], A                                          ;

LD A, GenericStateChange_Cancel                             ;actually, nevermind, I'm gonna spend 10 more minutes in this character creator
LD [GenericStateChangeIndicator], A                         ;
RET                                                         ;

HandleOtherBirthInfoSprites_1D_7A05:
LD A, [NewGameInfoInput_SelectedOtherBirthInfoFlag]         ;
CP $00                                                      ;
JR NZ, CODE_1D_7A1A                                         ;

LD A, [FrameCounter8Bit]                                    ;blinking underscores
RRA                                                         ;
RRA                                                         ;
RRA                                                         ;
JR NC, CODE_1D_7A1A                                         ;

LD A, $01                                                   ;
LD [LatestOAMSlot], A                                       ;
RET                                                         ;

CODE_1D_7A1A:
LD HL, NewGame_TypedInfo                                    ;
LD B, 2                                                     ;2 characters long
LD C, $50                                                   ;x-pos

CODE_1D_7A21:
LD A, $20                                                   ;constant y-pos
LD [DE], A                                                  ;
INC DE                                                      ;

LD A, C                                                     ;
LD [DE], A                                                  ;
INC DE                                                      ;

XOR A                                                       ;still ?

LD A, C                                                     ;shift 8 pixels right
ADC A, $08                                                  ;oh, now I get it! It uses ADC, which factors in carry. so the XOR clears it. Game Boy has ADD instruction which doesnt take carry.
LD C, A                                                     ;whoever programmed this must've been 6502/65c816 pilled.

LD A, [HL+]                                                 ;tile
LD [DE], A                                                  ;
INC DE                                                      ;

XOR A                                                       ;property (this time doesn't use the other palette unlike name characters)
LD [DE], A                                                  ;
INC DE                                                      ;

DEC B                                                       ;
JR NZ, CODE_1D_7A21                                         ;

LD A, $03                                                   ;
LD [LatestOAMSlot], A                                       ;
RET                                                         ;

InitializeBirthDateSpriteDisplay_1D_7A3C:
LD A, [NewGame_CurrentBirthInfo]                            ;if info is invalid, that means it's not typed in/erased
CP 99                                                       ;
JR NZ, CODE_1D_7A4C                                         ;

LD A, CHARVAL("_")                                          ;sprites will display as underscores
LD [NewGame_TypedInfo], A                                   ;
LD [NewGame_TypedInfo+1], A                                 ;
RET                                                         ;

CODE_1D_7A4C:
CP 9                                                        ;check if it's between 1 and 9
JR NC, CODE_1D_7A5D                                         ;

XOR A                                                       ;
LD [NewGame_TypedInfo], A                                   ;display first digit as nothing

LD A, [NewGame_CurrentBirthInfo]                            ;
ADD A, CHARVAL("1")                                         ;
LD [NewGame_TypedInfo+1], A                                 ;
RET                                                         ;

CODE_1D_7A5D:
CP 19                                                       ;now check if it's between 10 and 19
JR NC, CODE_1D_7A71                                         ;

LD A, CHARVAL("1")                                          ;tens will display as one
LD [NewGame_TypedInfo], A                                   ;

LD A, [NewGame_CurrentBirthInfo]                            ;
SUB 10                                                      ;
ADD A, CHARVAL("1")                                         ;
LD [NewGame_TypedInfo+1], A                                 ;ones
RET                                                         ;

CODE_1D_7A71:
CP 29                                                       ;now check if it's between 20 and 29
JR NC, CODE_1D_7A85                                         ;

LD A, CHARVAL("2")                                          ;tens = 2
LD [NewGame_TypedInfo], A                                   ;

LD A, [NewGame_CurrentBirthInfo]                            ;
SUB 20                                                      ;
ADD A, CHARVAL("1")                                         ;
LD [NewGame_TypedInfo+1], A                                 ;ones
RET                                                         ;

CODE_1D_7A85:
LD A, CHARVAL("3")                                          ;otherwise it is in its 30s
LD [NewGame_TypedInfo], A                                   ;

LD A, [NewGame_CurrentBirthInfo]                            ;
SUB 30                                                      ;
ADD A, CHARVAL("1")                                         ;
LD [NewGame_TypedInfo+1], A                                 ;
RET                                                         ;

InitializeBloodTypeSpriteDisplay_1D_7A95:
LD A, [NewGame_TypedBloodType]                              ;check for invalid blood type (not typed in/erased)
CP 99                                                       ;
JR NZ, CODE_1D_7AA5                                         ;

LD A, CHARVAL("_")                                          ;blood type will be __. That's a... unique name for a blood type.
LD [NewGame_TypedInfo], A                                   ;
LD [NewGame_TypedInfo+1], A                                 ;
RET                                                         ;

CODE_1D_7AA5:
LD HL, BloodTypeStrings_1D_7AB7                             ;
SLA A                                                       ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;
LD A, [HL+]                                                 ;blood type first character
LD [NewGame_TypedInfo], A                                   ;

LD A, [HL]                                                  ;second character
LD [NewGame_TypedInfo+1], A                                 ;
RET                                                         ;

;blood type display
BloodTypeStrings_1D_7AB7:
db " A"
db " B"
db "AB"
db " O"

;input PlayerStringType - string to fetch.
;0 - second name,
;1 - first name
;2 - nickname
GetPlayerStringFromSaveFile_1D_7ABF:
LD DE, NewGame_TypedInfo                                    ;
LD HL, CurrentSave_PlayerSecondName                         ;       
LD A, [PlayerStringType]                                    ;
SLA A                                                       ;
SLA A                                                       ;
SLA A                                                       ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;

LD B, PlayerInfoMaxCharacters                               ;
LD C, $00                                                   ;

LOOP_1D_7AD6:
LD A, [HL+]                                                 ;
CP $00                                                      ;
LD [DE], A                                                  ;
INC DE                                                      ;
DEC B                                                       ;
JR NZ, LOOP_1D_7AD6                                         ;
RET                                                         ;

DrawFullScreenInfoBox_1D_7ADF:
LD HL, FullScreenTilemapClearData_1D_62D4                   ;
CALL ClearTilemap_1E_7B3D                                   ;

LD HL, FullScreenInfoBoxTopTilemap_1D_62D8                  ;
CALL DrawFromTilemap_1D_7AFD                                ;

LD HL, FullScreenInfoBoxLeftTilemap_1D_6830                 ;
CALL DrawFromTilemap_1D_7AFD                                ;

LD HL, FullScreenInfoBoxRightTilemap_1D_6844                ;
CALL DrawFromTilemap_1D_7AFD                                ;

LD HL, FullScreenInfoBoxBottomTilemap_1D_6858               ;
JP DrawFromTilemap_1D_7AFD                                  ;.

;draw from tilemap
DrawFromTilemap_1D_7AFD:
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

LOOP_1D_7B11:
CheckPPUModes                                               ;
LD A, [HL]                                                  ;
LD [DE], A                                                  ;

LDH A, [Reg_LCDStatus]                                      ;check PPU modes again for good measure
BIT 1, A                                                    ;
JR NZ, LOOP_1D_7B11                                         ;

INC HL                                                      ;
INC DE                                                      ;
DEC C                                                       ;
XOR A                                                       ;
CP C                                                        ;
JR NZ, LOOP_1D_7B11                                         ;

DEC B                                                       ;
JR Z, RETURN_1D_7B3C                                        ;

LD A, [TilemapDrawing_VRAMLoc]                              ;
ADD A, $20                                                  ;next row
LD E, A                                                     ;
LD [TilemapDrawing_VRAMLoc], A                              ;

LD A, [TilemapDrawing_VRAMLoc+1]                            ;
ADC A, $00                                                  ;
LD D, A                                                     ;
LD [TilemapDrawing_VRAMLoc+1], A                            ;

LD A, [TilemapDrawing_TilesPerLine]                         ;
LD C, A                                                     ;
JR LOOP_1D_7B11                                             ;

RETURN_1D_7B3C:
RET                                                         ;

ClearTilemap_1E_7B3D:
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

LOOP_1D_7B51:
CheckPPUModes                                               ;
XOR A                                                       ;clear tile
LD [DE], A                                                  ;

LDH A, [Reg_LCDStatus]                                      ;
BIT 1, A                                                    ;
JR NZ, LOOP_1D_7B51                                         ;

INC DE                                                      ;
DEC C                                                       ;
XOR A                                                       ;
CP C                                                        ;
JR NZ, LOOP_1D_7B51                                         ;

DEC B                                                       ;
JR Z, RETURN_1D_7B7B                                        ;

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
JR LOOP_1D_7B51                                             ;

RETURN_1D_7B7B:
RET

DrawAAndBButtonFunctionalityStrings_1D_7B7C:
LD HL, AAndBPrompt_1D_62C3                                  ;
JP DrawFromTilemap_1D_7AFD                                  ;

;transition codes
;fade in
FadeInTransition_1D_7B82:
LD A, $40                                                   ;
LDH [Reg_BackgroundPalette], A                              ;
LDH [Reg_SpritePalette1], A                                 ;
LDH [Reg_SpritePalette0], A                                 ;
CALL FadeWait_1D_7C11                                       ;

LD A, $50                                                   ;
LDH [Reg_BackgroundPalette], A                              ;
LDH [Reg_SpritePalette1], A                                 ;
LDH [Reg_SpritePalette0], A                                 ;
CALL FadeWait_1D_7C11                                       ;

LD A, $90                                                   ;
LDH [Reg_BackgroundPalette], A                              ;
LDH [Reg_SpritePalette1], A                                 ;
LDH [Reg_SpritePalette0], A                                 ;
CALL FadeWait_1D_7C11                                       ;

LD A, $94                                                   ;
LDH [Reg_BackgroundPalette], A                              ;
LDH [Reg_SpritePalette1], A                                 ;

LD A, $90                                                   ;
LDH [Reg_SpritePalette0], A                                 ;
CALL FadeWait_1D_7C11                                       ;

LD A, $A4                                                   ;
LDH [Reg_BackgroundPalette], A                              ;
LDH [Reg_SpritePalette1], A                                 ;

LD A, $A0                                                   ;
LDH [Reg_SpritePalette0], A                                 ;
CALL FadeWait_1D_7C11                                       ;

LD A, $E4                                                   ;
LDH [Reg_BackgroundPalette], A                              ;
LDH [Reg_SpritePalette1], A                                 ;

LD A, $E0                                                   ;
LDH [Reg_SpritePalette0], A                                 ;
CALL FadeWait_1D_7C11                                       ;
RET                                                         ;

;fade out
FadeOutTransition_1D_7BCB:
LD A, $A4                                                   ;
LDH [Reg_BackgroundPalette], A                              ;
LDH [Reg_SpritePalette1], A                                 ;

LD A, $A0                                                   ;
LDH [Reg_SpritePalette0], A                                 ;
CALL FadeWait_1D_7C11                                       ;

LD A, $94                                                   ;
LDH [Reg_BackgroundPalette], A                              ;
LDH [Reg_SpritePalette1], A                                 ;

LD A, $90                                                   ;
LDH [Reg_SpritePalette0], A                                 ;
CALL FadeWait_1D_7C11                                       ;

LD A, $90                                                   ;
LDH [Reg_BackgroundPalette], A                              ;
LDH [Reg_SpritePalette1], A                                 ;
LDH [Reg_SpritePalette0], A                                 ;
CALL FadeWait_1D_7C11                                       ;

LD A, $50                                                   ;
LDH [Reg_BackgroundPalette], A                              ;
LDH [Reg_SpritePalette1], A                                 ;
LDH [Reg_SpritePalette0], A                                 ;
CALL FadeWait_1D_7C11                                       ;

LD A, $40                                                   ;
LDH [Reg_BackgroundPalette], A                              ;
LDH [Reg_SpritePalette1], A                                 ;
LDH [Reg_SpritePalette0], A                                 ;
CALL FadeWait_1D_7C11                                       ;

XOR A                                                       ;
LDH [Reg_BackgroundPalette], A                              ;
LDH [Reg_SpritePalette1], A                                 ;
LDH [Reg_SpritePalette0], A                                 ;
CALL FadeWait_1D_7C11                                       ;
RET                                                         ;

;wait a couple of frames
FadeWait_1D_7C11:
LD B, $02                                                   ;2 frames

LOOP_1D_7C13:
CALL WaitForVBlank_1D_7527                                  ;
DEC B                                                       ;
JR NZ, LOOP_1D_7C13                                         ;
RET                                                         ;

InitTitleScreenVisuals_1D_7C1A:
LD HL, TitleScreenTilemap_1D_6870                           ;
CALL DrawFromTilemap_1D_7AFD                                ;draw title screen layout

LD HL, TitleScreenPressStartMessage_1D_69E8                 ;
CALL DrawFromTilemap_1D_7AFD                                ;

CALL InitSpriteDisplayables_1D_7E8D                         ;

LD A, SpriteDisplayable_TitleHeart                          ;
LD [SpriteDisplayables_ID+1], A                             ;heart sprite displayable

LD A, $58                                                   ;
LD [SpriteDisplayables_XPos+1], A                           ;

LD A, $28                                                   ;
LD [SpriteDisplayables_YPos+1], A                           ;

LD A, [CurrentSave_CDLinkFlag]                              ;
LD [CDLinkFlag], A                                          ;this might get applied to a save file after loading or starting a new one
RET                                                         ;

InitTitleScreenChoices_AfterPressStart_1D_7C3F:
LD A, SFX_Confirm                                           ;
LD [SoundQueue], A                                          ;

LD HL, TitleScreenPressStartMessage_1D_69E8                 ;
CALL ClearTilemap_1E_7B3D                                   ;pressed start, remove message

LD HL, TitleScreenOptionStrings_1D_69DC                     ;
CALL DrawFromTilemap_1D_7AFD                                ;options

LD A, SpriteDisplayable_SidewayCursor                       ;spawn cursor
LD [SpriteDisplayables_ID], A                               ;

LD A, $48                                                   ;
LD [SpriteDisplayables_XPos], A                             ;

LD A, $58                                                   ;
LD [SpriteDisplayables_YPos], A                             ;

XOR A                                                       ;
LD [NewGameInfoInput_VerticalOption], A                     ;
LD [GenericStateChangeIndicator], A                         ;
RET                                                         ;

InitTitleScreenChoices_CancelledFileLoading_1D_7C67:
LD A, SFX_Confirm                                           ;
LD [SoundQueue], A                                          ;

LD HL, TitleScreenOptionStrings_1D_69DC                     ;
CALL DrawFromTilemap_1D_7AFD                                ;

LD A, SpriteDisplayable_SidewayCursor                       ;
LD [SpriteDisplayables_ID], A                               ;

LD A, $48                                                   ;
LD [SpriteDisplayables_XPos], A                             ;

LD A, $58                                                   ;
LD [SpriteDisplayables_YPos], A                             ;

XOR A                                                       ;
LD [NewGameInfoInput_VerticalOption], A                     ;
LD [GenericStateChangeIndicator], A                         ;
RET                                                         ;

HandleTitleScreenFunctionality_1D_7C89:
LD A, [JoypadInputPress]                                    ;
BitTest JoypadInput_A, A                                    ;
JR NZ, PressedA_1D_7C9B                                     ;

BitTest JoypadInput_Up, A                                   ;
JP NZ, PressedUp_1D_7CA6                                    ;

BitTest JoypadInput_Down, A                                 ;
JP NZ, PressedDown_1D_7CB5                                  ;
RET                                                         ;

PressedA_1D_7C9B:
LD A, SFX_Confirm                                           ;
LD [SoundQueue], A                                          ;

LD A, $01                                                   ;confirmed
LD [GenericStateChangeIndicator], A                         ;
RET                                                         ;

PressedUp_1D_7CA6:
LD A, [TitleScreen_SelectedOption]                          ;
DEC A                                                       ;
CP $FF                                                      ;prevent underflow
JR NZ, CODE_1D_7CB0                                         ;
LD A, $01                                                   ;

CODE_1D_7CB0:
LD [TitleScreen_SelectedOption], A                          ;
JR CODE_1D_7CC1                                             ;

PressedDown_1D_7CB5:
LD A, [TitleScreen_SelectedOption]                          ;
INC A                                                       ;
CP $02                                                      ;prevent overflow
JR NZ, CODE_1D_7CBE                                         ;
XOR A                                                       ;

CODE_1D_7CBE:
LD [TitleScreen_SelectedOption], A                          ;

CODE_1D_7CC1:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, [TitleScreen_SelectedOption]                          ;
LD B, A                                                     ;
SLA A                                                       ;
SLA A                                                       ;
SLA A                                                       ;
ADD A, $58                                                  ;
LD [SpriteDisplayables_YPos], A                             ;move cursor
RET                                                         ;

InitSaveLoadingWindowAndCheckSaveFile1Status_1D_7CD6:
LD A, SFX_Confirm                                           ;confirm
LD [SoundQueue], A                                          ;

LD HL, Tilemap_LoadFileWindow_1D_69FE                       ;draw load file window
CALL DrawFromTilemap_1D_7AFD                                ;

XOR A                                                       ;
LD [SelectedOption], A                                      ;
CALL LoadSaveData_1D_7EA0                                   ;

LD [SaveFileUnusedFlag], A                                  ;check if save file is used
CP $01                                                      ;
RET NZ                                                      ;

LD HL, EmptySaveFile1Tilemap_1D_6ACA                        ;
CALL DrawFromTilemap_1D_7AFD                                ;

LD A, $01                                                   ;
RET                                                         ;

CheckSaveFile2Status_1D_7CF7:
LD A, $01                                                   ;
LD [SelectedOption], A                                      ;
CALL LoadSaveData_1D_7EA0                                   ;

LD [SaveFileUnusedFlag+1], A                                ;
CP $01                                                      ;
RET NZ                                                      ;

LD HL, EmptySaveFile2Tilemap_1D_6AE0                        ;
CALL DrawFromTilemap_1D_7AFD                                ;

LD A, $01                                                   ;
RET                                                         ;

CheckSaveFile3Status_1D_7D0E:
LD A, $02                                                   ;
LD [SelectedOption], A                                      ;
CALL LoadSaveData_1D_7EA0                                   ;

LD [SaveFileUnusedFlag+2], A                                ;
CP $01                                                      ;
RET NZ                                                      ;

LD HL, EmptySaveFile3Tilemap_1D_6AF6                        ;
CALL DrawFromTilemap_1D_7AFD                                ;

LD A, $01                                                   ;save file is not used sadge.
RET                                                         ;

HandleSaveLoadingWindowScrollingUp_1D_7D25:
CALL ScrollSaveLoadingWindowUp_1D_7DE2                      ;

LD A, SpriteDisplayable_SidewayCursor                       ;
LD [SpriteDisplayables_ID], A                               ;

LD A, $18                                                   ;
LD [SpriteDisplayables_XPos], A                             ;

LD A, $60                                                   ;
LD [SpriteDisplayables_YPos], A                             ;

XOR A                                                       ;
LD [NewGameInfoInput_VerticalOption], A                     ;
LD [GenericStateChangeIndicator], A                         ;
RET                                                         ;

;input A - offset for name printing
DrawPlayerNameFromSaveFileAndGetDate_1D_7D3F:
LD C, A                                                     ;
LD B, $00                                                   ;
PUSH BC                                                     ;

LD A, PlayerString_SecondName                               ;
LD [PlayerStringType], A                                    ;
CALL GetPlayerStringFromSaveFile_1D_7ABF                    ;
POP BC                                                      ;

PUSH BC                                                     ;
LD HL, $9C67                                                ;base VRAM location for name and second name
ADD HL, BC                                                  ;
LD E, L                                                     ;

LD D, H                                                     ;
LD HL, TEMP_ARRAY                                           ;
LD BC, PlayerInfo_SecondNameMaxLength                       ;
CALL CopyData_1D_74F9                                       ;

LD A, PlayerString_Name                                     ;
LD [PlayerStringType], A                                    ;
CALL GetPlayerStringFromSaveFile_1D_7ABF                    ;
POP BC                                                      ;

PUSH BC                                                     ;
LD HL, $9C6C                                                ;
ADD HL, BC                                                  ;
LD E, L                                                     ;

LD D, H                                                     ;
LD HL, TEMP_ARRAY                                           ;
LD BC, PlayerInfo_NameMaxLength                             ;
CALL CopyData_1D_74F9                                       ;

CALL GetSaveFileDate_1D_7DB3                                ;
POP BC                                                      ;
RET                                                         ;

;this is used to prepare for displaying an 8-bit number that starts from 1 (day or month value)
Prepare8BitValuePlus1ForExtraction_1D_7D7A:
INC A                                                       ;
LD [$D234], A                                               ;

XOR A                                                       ;high byte is 0
LD [$D235], A                                               ;

LD HL, $D234                                                ;extract digits from this
RET                                                         ;

;BC - VRAM offset (used for each save file to display each save's respective values
DrawMonthForSaveFilesAtTitleScreen_1D_7D86:
LD HL, $9C83                                                ;
ADD HL, BC                                                  ;
LD E, L                                                     ;
LD D, H                                                     ;
LD HL, TEMP_ARRAY+3                                         ;
LD BC, $0002                                                ;
JP CopyData_1D_74F9                                         ;

DrawDayForSaveFilesAtTitleScreen_1D_7D95:
LD HL, $9C86                                                ;
ADD HL, BC                                                  ;
LD E, L                                                     ;
LD D, H                                                     ;
LD HL, TEMP_ARRAY+3                                         ;
LD BC, $0002                                                ;
JP CopyData_1D_74F9                                         ;

DrawMoneyForSaveFilesAtTitleScreen_1D_7DA4:
LD HL, $9C8B                                                ;where to print money saved to the first save file
ADD HL, BC                                                  ;
LD E, L                                                     ;
LD D, H                                                     ;
LD HL, TEMP_ARRAY                                           ;
LD BC, $0005                                                ;
JP CopyData_1D_74F9                                         ;

GetSaveFileDate_1D_7DB3:
LD HL, CurrentSave_DaysPassed                               ;
LD A, [HL]                                                  ;
LD B, $03                                                   ;
LD HL, AvailableDaysPerMonth_1D_7DD9                        ;

LOOP_1D_7DBC:
LD C, [HL]                                                  ;
INC HL                                                      ;
SUB C                                                       ;
JR C, CODE_1D_7DC4                                          ;
INC B                                                       ;
JR LOOP_1D_7DBC                                             ;

CODE_1D_7DC4:
ADD A, C                                                    ;
LD [CurrentDayOfTheMonth], A                                ;

LD A, B                                                     ;
LD [CurrentMonth], A                                        ;
CP Month_April                                              ;check if current month is april.
JR NZ, RETURN_1D_7DD8                                       ;

LD A, [CurrentDayOfTheMonth]                                ;
ADD A, 13                                                   ;player starts at 14th of that month.
LD [CurrentDayOfTheMonth], A                                ;

RETURN_1D_7DD8:
RET                                                         ;

;how many days are playable in each month. the player starts on 14th of april, which means there are only 17 days that the player goes through.
;...except the game ends on 25th of december, so 
AvailableDaysPerMonth_1D_7DD9:
db 17,31,30,31,31,30,31,30,31

;scrolling loading window up
ScrollSaveLoadingWindowUp_1D_7DE2:
LDH A, [Reg_LCDControlAndRender]                            ;
OR LCDWindowTilemapSelect|LCDWindowDisplay                  ;
LDH [Reg_LCDControlAndRender], A                            ;make sure window layer is on

LD A, $07                                                   ;init position
LD [Reg_WindowXPosition], A                                 ;

LD A, $8E                                                   ;
LD [Reg_WindowYPosition], A                                 ;

SaveLoadingWindowScrollingLoop_1D_7DF2:
CALL WaitForVBlank_1D_7527                                  ;

LD A, [Reg_WindowYPosition]                                 ;
SUB $04                                                     ;move up 4 pixels per frame
LD [Reg_WindowYPosition], A                                 ;
CP 64                                                       ;check if it reaches this position or above
JR NC, SaveLoadingWindowScrollingLoop_1D_7DF2               ;

LD A, 64                                                    ;fix its position
LD [Reg_WindowYPosition], A                                 ;
RET                                                         ;

;scrolling down
ScrollSaveLoadingWindowDown_1D_7E07:
CALL WaitForVBlank_1D_7527                                  ;
LD A, [Reg_WindowYPosition]                                 ;
ADD A, $04                                                  ;
LD [Reg_WindowYPosition], A                                 ;
CP $8E                                                      ;
JR C, ScrollSaveLoadingWindowDown_1D_7E07                   ;

;LD A, SpriteDisplayable_ScheduleSelector
XOR A                                                       ;spawn cursor on the title screen(?)
LD [SpriteDisplayables_ID], A                               ;

LDH A, [Reg_LCDControlAndRender]                            ;
AND ~(LCDWindowTilemapSelect|LCDWindowDisplay)              ;
LDH [Reg_LCDControlAndRender], A                            ;
RET                                                         ;

HandleSaveLoadingWindowControls_1D_7E21:
LD A, [JoypadInputPress]                                    ;
BitTest JoypadInput_A, A                                    ;
JR NZ, PressedA_1D_7E37                                     ;

BitTest JoypadInput_B, A                                    ;
JR NZ, PressedB_1D_7E50                                     ;

BitTest JoypadInput_Up, A                                   ;
JP NZ, PressedUp_1D_7E5B                                    ;

BitTest JoypadInput_Down, A                                 ;
JP NZ, PressedDown_1D_7E6A                                  ;
RET                                                         ;

PressedA_1D_7E37:
LD A, [LoadSaveWindow_SelectedSave]                         ;
LD C, A                                                     ;
LD B, $00                                                   ;
LD HL, SaveFileUnusedFlag                                   ;check what save file we're trying to load
ADD HL, BC                                                  ;
LD A, [HL]                                                  ;
CP $01                                                      ;check if it's used or not
RET Z                                                       ;nothing happens if not used

LD A, SFX_Confirm                                           ;save file used, confirm
LD [SoundQueue], A                                          ;

LD A, GenericStateChange_Confirm                            ;load that save file
LD [GenericStateChangeIndicator], A                         ;
RET                                                         ;

;get out of load window
PressedB_1D_7E50:
LD A, SFX_Cancel                                            ;
LD [SoundQueue], A                                          ;

LD A, GenericStateChange_Cancel                             ;
LD [GenericStateChangeIndicator], A                         ;
RET                                                         ;

PressedUp_1D_7E5B:
LD A, [LoadSaveWindow_SelectedSave]                         ;
DEC A                                                       ;
CP $FF                                                      ;check for underflow
JR NZ, CODE_1D_7E65                                         ;

LD A, $02                                                   ;wrap around

CODE_1D_7E65:
LD [LoadSaveWindow_SelectedSave], A                         ;
JR CODE_1D_7E76                                             ;

PressedDown_1D_7E6A:
LD A, [LoadSaveWindow_SelectedSave]                         ;
INC A                                                       ;
CP $03                                                      ;check if going over
JR NZ, CODE_1D_7E73                                         ;

XOR A                                                       ;wrap around

CODE_1D_7E73:
LD [LoadSaveWindow_SelectedSave], A                         ;

CODE_1D_7E76:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, [LoadSaveWindow_SelectedSave]                         ;
LD B, A                                                     ;
SLA A                                                       ;
SLA A                                                       ;
SLA A                                                       ;
SLA A                                                       ;
ADD A, $60                                                  ;
LD [SpriteDisplayables_YPos], A                             ;move cursor
RET                                                         ;

InitSpriteDisplayables_1D_7E8D:
LD A, SpriteDisplayable_None                                ;
LD B, SpriteDisplayablesSlots                               ;
LD HL, SpriteDisplayables_ID                                ;

LOOP_1D_7E94:
LD [HL+], A                                                 ;
DEC B                                                       ;
JR NZ, LOOP_1D_7E94                                         ;
RET                                                         ;

FadeOutAndInitSpriteDisplayables_1D_7E99:
CALL FadeOutTransition_1D_7BCB                              ;
CALL InitSpriteDisplayables_1D_7E8D                         ;
RET                                                         ;

;load save file information
;input:
;SelectedOption - which save file to load
;output:
;A - if 0, save file loaded successfully, if 1, save file failed to load
LoadSaveData_1D_7EA0:
LD A, $0A                                                   ;enable access to extra RAM (save data in this game's case)
LD [MBC1RAMAccessToggle], A                                 ;

LD A, $01                                                   ;change banking mode..
LD [MBC1BankingMode], A                                     ;

XOR A                                                       ;only the first RAM bank is used in this game. we're robbed of so many saves.
LD [MBC1RAMBank], A                                         ;

LD A, [SelectedOption]                                      ;
LD HL, SaveFileDataPointers_1D_7F37                         ;get save location
SLA A                                                       ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;
LD E, [HL]                                                  ;
INC HL                                                      ;
LD D, [HL]                                                  ;
LD BC, SaveFileSize                                         ;size of one save file

XOR A                                                       ;
LD [SaveFileChecksum], A                                    ;
LD [SaveFileChecksum+1], A                                  ;

LD HL, CurrentSave_PlayerSecondName                         ;

LOOP_1D_7ECA:
LD A, [DE]                                                  ;
LD [HL+], A                                                 ;
INC DE                                                      ;
PUSH BC                                                     ;
LD C, A                                                     ;
LD A, [SaveFileChecksum]                                    ;
ADD A, C                                                    ;calculate checksum along the way
LD [SaveFileChecksum], A                                    ;

LD A, [SaveFileChecksum+1]                                  ;
ADC A, $00                                                  ;
LD [SaveFileChecksum+1], A                                  ;

POP BC                                                      ;
DEC BC                                                      ;
LD A, C                                                     ;
OR B                                                        ;
JR NZ, LOOP_1D_7ECA                                         ;

LD A, [DE]                                                  ;check file integrity
LD B, A                                                     ;
LD A, [SaveFileChecksum]                                    ;
CP B                                                        ;
JR NZ, SaveFileNotUsed_1D_7F22                              ;

INC A                                                       ;
LD L, A                                                     ;
INC DE                                                      ;
LD A, [DE]                                                  ;
LD B, A                                                     ;
LD A, [SaveFileChecksum+1]                                  ;
CP B                                                        ;
JR NZ, SaveFileNotUsed_1D_7F22                              ;

INC A                                                       ;
LD H, A                                                     ;
INC DE                                                      ;
LD A, [DE]                                                  ;
CP L                                                        ;
JR NZ, SaveFileNotUsed_1D_7F22                              ;

INC L                                                       ;
INC DE                                                      ;
LD A, [DE]                                                  ;
CP H                                                        ;
JR NZ, SaveFileNotUsed_1D_7F22                              ;

INC H                                                       ;
INC DE                                                      ;
LD A, [DE]                                                  ;
CP L                                                        ;
JR NZ, SaveFileNotUsed_1D_7F22                              ;

INC DE                                                      ;
LD A, [DE]                                                  ;
CP H                                                        ;
JR NZ, SaveFileNotUsed_1D_7F22                              ;

LD A, $49                                                   ;
LD [MBC1RAMAccessToggle], A                                 ;

LD A, [CurrentSave_CurrentTimeOfDay]                        ;
LD [DayOffTime], A                                          ;

LD A, [CDLinkFlag]                                          ;
LD [CurrentSave_CDLinkFlag], A                              ;overwrite this even if it should be a different value in current save file

XOR A                                                       ;save file used
RET                                                         ;

;save file is officially NOT used (or corrupted or tempered with)
SaveFileNotUsed_1D_7F22:
LD A, $49                                                   ;
LD [MBC1RAMAccessToggle], A                                 ;

LD BC, SaveFileSize                                         ;
LD HL, CurrentSave_PlayerSecondName                         ;

LOOP_1D_7F2D:
XOR A                                                       ;wipe it all
LD [HL+], A                                                 ;

DEC BC                                                      ;
LD A, C                                                     ;
OR B                                                        ;
JR NZ, LOOP_1D_7F2D                                         ;

LD A, $01                                                   ;indicate this save file is not used
RET                                                         ;

;where each save file's data is stored in the battery backed RAM
SaveFileDataPointers_1D_7F37:
dw $A001
dw $A801
dw $B001

;clear everything we just loaded from a save file into working RAM. note that this routine is NOT for clearing save file data.
ClearLoadedSaveFileRAM_1D_7F3D:
LD HL, CurrentSave_PlayerSecondName                         ;
LD BC, SaveFileSize                                         ;

LOOP_1D_7F43:
XOR A                                                       ;
LD [HL+], A                                                 ;cleared

DEC BC                                                      ;next RAM address
LD A, C                                                     ;
OR B                                                        ;
JR NZ, LOOP_1D_7F43                                         ;
RET                                                         ;

Wait8VBlanks_1D_7F4B:
LD B, $08                                                   ;does what it says on the tin of the tin can.

LOOP_1D_7F4D:
CALL WaitForVBlank_1D_7527                                  ;

DEC B                                                       ;
JR NZ, LOOP_1D_7F4D                                         ;
RET                                                         ;

;all relationship values get cleared if player's birth date is February 14th and have blood type AB
ClearRelantioshipsOnSpecificBirthInfo_1D_7F54:
LD A, [CurrentSave_BirthMonth]                              ;
CP Month_February                                           ;check if born on februrary...
RET NZ                                                      ;

LD A, [CurrentSave_BirthDay]                                ;
CP 14-1                                                     ;14th... (valentines)
RET NZ                                                      ;

LD A, [CurrentSave_BloodType]                               ;
CP BloodType_AB                                             ;and has AB blood type
RET NZ                                                      ;

LD HL, CurrentSave_CharacterRelationship                    ;all character relationships become zero. An easter egg of sorts? Hard mode?
LD B, (7*3)*3                                               ;
XOR A                                                       ;

LOOP_1D_7F6C:
LD [HL+], A                                                 ;zero that out

DEC B                                                       ;
JR NZ, LOOP_1D_7F6C                                         ;
RET                                                         ;