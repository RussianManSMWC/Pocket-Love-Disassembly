;all scripting from bank 1C (just a couple of scripts)

POINTERS_1C_4000:
dw GameStartScript_1C_4004-POINTERS_1C_4000                 ;$0000
dw Script_1C_4309-POINTERS_1C_4000                          ;$0001

;a script that is executed when starting the game. handle intros and so on.
GameStartScript_1C_4004:
ClearTileLines $00,$00,$14,$12
ModifyVariable_StoreToVar16Bit DebugBits, $0000
ModifyVariable_StoreToVarFromVar $D33B, TextDrawing_ProcessingTiming ;remember defaults
ModifyVariable_StoreToVarFromVar $D33D, TextDrawing_ProcessingAmount
ModifyVariable_StoreToVarFromVar $D33F, CurrentCharacter_Display ;remember character appearance for some reason
PlayMusic Music_NewGame
SceneFadeIn

ModifyVariable_StoreToVar16Bit $D335, $21
ScriptBranch_SuperGameBoy ScriptLabel_1C_4028

ModifyVariable_StoreToVar16Bit $D335, $1E

ScriptLabel_1C_4028:
ModifyVariable_StoreToVar16Bit $D337, $07
ModifyVariable_StoreToVar16Bit $D339, $01
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31B, CharProp_Character_Ruruna
LoadTextEntry $0203, TextBank_08
LoadTextEntry $01FF, TextBank_08
LoadTextEntry $0200, TextBank_08
EnablePlayerChoice_2Options $00
ScriptBranch_VarEqualVal8Bit DecisionVariable, $00, ScriptLabel_1C_4053
ModifyVariable_StoreToVar8Bit CurrentSave_CDLinkFlag, $01
LoadTextEntry $01EE, TextBank_08
LoadTextEntry $01F0, TextBank_08
LoadTextEntry $01EF, TextBank_08
ScriptBranch ScriptLabel_1C_405C

ScriptLabel_1C_4053:
ModifyVariable_StoreToVar16Bit $D335, $78
ModifyVariable_StoreToVar16Bit $D337, $00
MakeTextSkippable

ScriptLabel_1C_405C:
ModifyVariable_StoreToVar16Bit TextDrawing_ProcessingTiming, $D337
ModifyVariable_StoreToVar16Bit TextDrawing_ProcessingAmount, $D339
VariableSceneFadeOut $81
ModifyVariable_StoreToVar16Bit CurrentCharacter_Display, CharProp_Display_Intro
PlayMusic Music_MainTheme

;debug check for temporary variable ScriptTEMP_D31B? jumps to one of the later character intros. by default it's always zero, which means it'll start with Ruruna.
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, CharProp_Character_Mizuki, Script_MizukiIntro_1C_40CB
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, CharProp_Character_Yumi, Script_YumiIntro_1C_40FD
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, CharProp_Character_Miri, Script_MiriIntro_1C_4132
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, CharProp_Character_Mari, Script_MariIntro_1C_4167
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, CharProp_Character_Suzune, Script_SuzuneIntro_1C_419C
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, CharProp_Character_Momoyo, Script_MomoyoIntro_1C_41D1
ScriptBranch_SuperGameBoy ScriptLabel_1C_4093
Sleep 10 ;the sleep value is identical when playing on Game Boy and via Super Game Boy, making the check redundant
ScriptBranch ScriptLabel_1C_4096

ScriptLabel_1C_4093:
Sleep 10

ScriptLabel_1C_4096:
ModifyVariable_StoreToVar16Bit ScriptTEMP_D31B, CharProp_Character_Ruruna
ModifyVariable_StoreToVar16Bit ScriptTEMP_D31F, $00
ModifyVariable_StoreToVar16Bit ScriptTEMP_D321, $29
ModifyVariable_StoreToVar16Bit ScriptTEMP_D323, $1F
ModifyVariable_StoreToVar16Bit ScriptTEMP_D32B, $0001
ModifyVariable_StoreToVar16Bit ScriptTEMP_D32D, $06
ModifyVariable_StoreToVar16Bit ScriptTEMP_D32F, $00
ModifyVariable_StoreToVar16Bit ScriptTEMP_D331, $1C
ExecuteSubScript SubScript_1C_4214
ScriptBranch_SuperGameBoy ScriptLabel_1C_40C5
Sleep 35
Sleep 60
ScriptBranch Script_MizukiIntro_1C_40CB

ScriptLabel_1C_40C5:
Sleep 25
Sleep 60

Script_MizukiIntro_1C_40CB:
ModifyVariable_StoreToVar16Bit ScriptTEMP_D31B, CharProp_Character_Mizuki
ModifyVariable_StoreToVar16Bit ScriptTEMP_D31F, $A0
ModifyVariable_StoreToVar16Bit ScriptTEMP_D321, $29
ModifyVariable_StoreToVar16Bit ScriptTEMP_D323, $1F
ModifyVariable_StoreToVar16Bit ScriptTEMP_D32B, $FFFF
ModifyVariable_StoreToVar16Bit ScriptTEMP_D32D, $06
ModifyVariable_StoreToVar16Bit ScriptTEMP_D32F, $1D
ModifyVariable_StoreToVar16Bit ScriptTEMP_D331, $1A
ExecuteSubScript SubScript_1C_4214
ScriptBranch_SuperGameBoy ScriptLabel_1C_40FA
Sleep 5
Sleep 60
ScriptBranch Script_YumiIntro_1C_40FD

ScriptLabel_1C_40FA:
Sleep 55

Script_YumiIntro_1C_40FD:
ModifyVariable_StoreToVar16Bit ScriptTEMP_D31B, CharProp_Character_Yumi
ModifyVariable_StoreToVar16Bit ScriptTEMP_D31F, $00
ModifyVariable_StoreToVar16Bit ScriptTEMP_D321, $29
ModifyVariable_StoreToVar16Bit ScriptTEMP_D323, $1F
ModifyVariable_StoreToVar16Bit ScriptTEMP_D32B, $0001
ModifyVariable_StoreToVar16Bit ScriptTEMP_D32D, $06
ModifyVariable_StoreToVar16Bit ScriptTEMP_D32F, $3C
ModifyVariable_StoreToVar16Bit ScriptTEMP_D331, $19
ExecuteSubScript SubScript_1C_4214
ScriptBranch_SuperGameBoy ScriptLabel_1C_412C
Sleep 10
Sleep 60
ScriptBranch Script_MiriIntro_1C_4132

ScriptLabel_1C_412C:
Sleep 5
Sleep 60

Script_MiriIntro_1C_4132:
ModifyVariable_StoreToVar16Bit ScriptTEMP_D31B, CharProp_Character_Miri
ModifyVariable_StoreToVar16Bit ScriptTEMP_D31F, $A0
ModifyVariable_StoreToVar16Bit ScriptTEMP_D321, $29
ModifyVariable_StoreToVar16Bit ScriptTEMP_D323, $1F
ModifyVariable_StoreToVar16Bit ScriptTEMP_D32B, $FFFF
ModifyVariable_StoreToVar16Bit ScriptTEMP_D32D, $06
ModifyVariable_StoreToVar16Bit ScriptTEMP_D32F, $55
ModifyVariable_StoreToVar16Bit ScriptTEMP_D331, $1B
ExecuteSubScript SubScript_1C_4214
ScriptBranch_SuperGameBoy ScriptLabel_1C_4161
Sleep 25
Sleep 60
ScriptBranch Script_MariIntro_1C_4167

ScriptLabel_1C_4161:
Sleep 10
Sleep 60

Script_MariIntro_1C_4167:
ModifyVariable_StoreToVar16Bit ScriptTEMP_D31B, CharProp_Character_Mari
ModifyVariable_StoreToVar16Bit ScriptTEMP_D31F, $00
ModifyVariable_StoreToVar16Bit ScriptTEMP_D321, $29
ModifyVariable_StoreToVar16Bit ScriptTEMP_D323, $1F
ModifyVariable_StoreToVar16Bit ScriptTEMP_D32B, $0001
ModifyVariable_StoreToVar16Bit ScriptTEMP_D32D, $06
ModifyVariable_StoreToVar16Bit ScriptTEMP_D32F, $73
ModifyVariable_StoreToVar16Bit ScriptTEMP_D331, $1B
ExecuteSubScript SubScript_1C_4214
ScriptBranch_SuperGameBoy ScriptLabel_1C_4196
Sleep 25
Sleep 60
ScriptBranch Script_SuzuneIntro_1C_419C

ScriptLabel_1C_4196:
Sleep 20
Sleep 60

Script_SuzuneIntro_1C_419C:
ModifyVariable_StoreToVar16Bit ScriptTEMP_D31B, CharProp_Character_Suzune
ModifyVariable_StoreToVar16Bit ScriptTEMP_D31F, $A0
ModifyVariable_StoreToVar16Bit ScriptTEMP_D321, $29
ModifyVariable_StoreToVar16Bit ScriptTEMP_D323, $1F
ModifyVariable_StoreToVar16Bit ScriptTEMP_D32B, $FFFF
ModifyVariable_StoreToVar16Bit ScriptTEMP_D32D, $06
ModifyVariable_StoreToVar16Bit ScriptTEMP_D32F, $8E
ModifyVariable_StoreToVar16Bit ScriptTEMP_D331, $1B
ExecuteSubScript SubScript_1C_4214
ScriptBranch_SuperGameBoy ScriptLabel_1C_41CB
Sleep 30
Sleep 60
ScriptBranch Script_MomoyoIntro_1C_41D1

ScriptLabel_1C_41CB:
Sleep 25
Sleep 60

;"Finally you have Momoyo - the cheeky gamer girl who spends all her free time on the arcade and likes video games more than her fellow humans" - MerryBytes on YouTube
Script_MomoyoIntro_1C_41D1:
ModifyVariable_StoreToVar16Bit ScriptTEMP_D31B, CharProp_Character_Momoyo
ModifyVariable_StoreToVar16Bit ScriptTEMP_D31F, $00
ModifyVariable_StoreToVar16Bit ScriptTEMP_D321, $29
ModifyVariable_StoreToVar16Bit ScriptTEMP_D323, $1F
ModifyVariable_StoreToVar16Bit ScriptTEMP_D32B, $0001
ModifyVariable_StoreToVar16Bit ScriptTEMP_D32D, $06
ModifyVariable_StoreToVar16Bit ScriptTEMP_D32F, $A9
ModifyVariable_StoreToVar16Bit ScriptTEMP_D331, $1C
ExecuteSubScript SubScript_1C_4214
ModifyVariable_StoreToVarFromVar TextDrawing_ProcessingTiming, $D33B
ModifyVariable_StoreToVarFromVar TextDrawing_ProcessingAmount, $D33D
ModifyVariable_StoreToVarFromVar CurrentCharacter_Display, $D33F
ScriptBranch_VarEqualVal8Bit CurrentSave_CDLinkFlag, $00, ScriptLabel_1C_4213
RemoveCharacter
ClearTileLines $00, $00, $14, $12
ForceTextPrintPosition $00, $00
SceneFadeIn
LoadTextEntry $0201, TextBank_08

ScriptLabel_1C_4213:
EndScript

SubScript_1C_4214:
LoadTextEntry $001C, TextBank_04
ModifyVariable_StoreToVar16Bit $D4BB, $00
LoadBackgroundAlt ScriptTEMP_D31B
VariableLoadCharacter ScriptTEMP_D31B
SetCharacterCoords ScriptTEMP_D31F, $38
VariableSceneFadeIn $05
ModifyVariable_StoreToVar16Bit ScriptTEMP_D325, ScriptTEMP_D31F
ModifyVariable_LogicalShiftVarLeft ScriptTEMP_D325, $03
ModifyVariable_StoreToVar16Bit ScriptTEMP_D327, ScriptTEMP_D321
VariableScriptBranch ScriptTEMP_D32B, ScriptVarCheck_Equals, $01, ScriptLabel_1C_4243
ModifyVariable_LogicalXORVar16Bit ScriptTEMP_D327, $FFFF
ModifyVariable_AddToVar16Bit ScriptTEMP_D327, $01

ScriptLabel_1C_4243:
ModifyVariable_StoreToVar16Bit ScriptTEMP_D329, ScriptTEMP_D32B
ModifyVariable_LogicalXORVar16Bit ScriptTEMP_D329, $FFFF
ModifyVariable_AddToVar16Bit ScriptTEMP_D329, $01

ScriptLabel_1C_424F:
Sleep 1
ExecuteSubScript SubScript_1C_42BA
VariableScriptBranch ScriptTEMP_D321, ScriptVarCheck_NotEquals, $18, ScriptLabel_1C_4266
LoadVariableTextEntry ScriptTEMP_D32D, ScriptTEMP_D32F, $00
ModifyVariable_AddToVar16Bit ScriptTEMP_D32F, $01

ScriptLabel_1C_4266:
ScriptBranch_VarEqualVal8Bit $D4BF, $01, ScriptLabel_1C_4276
VariableScriptBranch $D4BB, ScriptVarCheck_NotEquals, $00, ScriptLabel_1C_4276
ModifyVariable_StoreToVar16Bit $D4BB, $D335

ScriptLabel_1C_4276:
ModifyVariable_SubFromVar16Bit ScriptTEMP_D321, $01
VariableScriptBranch ScriptTEMP_D321, ScriptVarCheck_NotEquals, $00, ScriptLabel_1C_424F
VariableScriptBranch $D4BB, ScriptVarCheck_NotEquals, $00, ScriptLabel_1C_428C
ModifyVariable_StoreToVar16Bit $D4BB, $D335

ScriptLabel_1C_428C:
ExecuteSubScript SubScript_1C_42D0
ModifyVariable_StoreToVar16Bit ScriptTEMP_D325, ScriptTEMP_D31F
ModifyVariable_LogicalShiftVarLeft ScriptTEMP_D325, $03
ModifyVariable_StoreToVar16Bit ScriptTEMP_D327, $00
ModifyVariable_StoreToVar16Bit ScriptTEMP_D329, ScriptTEMP_D32B

ScriptLabel_1C_429F:
Sleep 1
ExecuteSubScript SubScript_1C_42BA
VariableScriptBranch ScriptTEMP_D323, ScriptVarCheck_NotEquals, $10, ScriptLabel_1C_42AE
VariableSceneFadeOut $05

ScriptLabel_1C_42AE:
ModifyVariable_SubFromVar16Bit ScriptTEMP_D323, $01
VariableScriptBranch ScriptTEMP_D323, ScriptVarCheck_NotEquals, $00, ScriptLabel_1C_429F
EndSubscript

SubScript_1C_42BA:
SetCharacterCoords ScriptTEMP_D31F, $38
ModifyVariable_AddToVar16Bit ScriptTEMP_D325, ScriptTEMP_D327
ModifyVariable_AddToVar16Bit ScriptTEMP_D327, ScriptTEMP_D329
ModifyVariable_StoreToVar16Bit ScriptTEMP_D31F, ScriptTEMP_D325
ModifyVariable_LogicalShiftVarRight ScriptTEMP_D31F, $03
EndSubscript

SubScript_1C_42D0:
ExecuteSubScript SubScript_1C_42E8

ScriptLabel_1C_42D3:
LoadVariableTextEntry ScriptTEMP_D32D, ScriptTEMP_D32F, $00
ModifyVariable_AddToVar16Bit ScriptTEMP_D32F, $01
ExecuteSubScript SubScript_1C_42E8
VariableScriptBranch ScriptTEMP_D331, ScriptVarCheck_NotEquals, $00, ScriptLabel_1C_42D3
EndSubscript

SubScript_1C_42E8:
VariableScriptBranch $D4BF, ScriptVarCheck_NotEquals, $01, ScriptLabel_1C_42FB

ScriptLabel_1C_42EF:
Sleep 1
ScriptBranch_VarEqualVal8Bit $D4BF, $01, ScriptLabel_1C_42EF
ModifyVariable_StoreToVar16Bit $D4BB, $D335

ScriptLabel_1C_42FB:
Sleep 1
VariableScriptBranch $D4BB, ScriptVarCheck_NotEquals, $00, ScriptLabel_1C_42FB
ModifyVariable_SubFromVar8Bit ScriptTEMP_D331, $01
EndSubscript

Script_1C_4309:
ExecuteSubScript SubScript_1C_4416
LoadScript $E6

;unlike other banks, the debug subscript is never executed in scripts from this bank
ModifyVariable_StoreToVarFromVar ScriptTEMP_D31B, $D359
ModifyVariable_LogicalANDVar16Bit ScriptTEMP_D31B, $04
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, $00, ScriptLabel_1C_43CA

ForceTextPrintPosition $00, $00
PrintVariableValue8Bit CurrentSave_RurunaFriendPoints
Sleep 1
ForceTextPrintPosition $04, $00
PrintVariableValue8Bit CurrentSave_MizukiFriendPoints
Sleep 1
ForceTextPrintPosition $08, $00
PrintVariableValue8Bit CurrentSave_YumiFriendPoints
Sleep 1
ForceTextPrintPosition $0C, $00
PrintVariableValue8Bit CurrentSave_MiriFriendPoints
Sleep 1
ForceTextPrintPosition $00, $01
PrintVariableValue8Bit CurrentSave_RurunaInterestPoints
Sleep 1
ForceTextPrintPosition $04, $01
PrintVariableValue8Bit CurrentSave_MizukiInterestPoints
Sleep 1
ForceTextPrintPosition $08, $01
PrintVariableValue8Bit CurrentSave_YumiInterestPoints
Sleep 1
ForceTextPrintPosition $0C, $01
PrintVariableValue8Bit CurrentSave_MiriInterestPoints
Sleep 1
ForceTextPrintPosition $00, $02
PrintVariableValue8Bit CurrentSave_RurunaLovePoints
Sleep 1
ForceTextPrintPosition $04, $02
PrintVariableValue8Bit CurrentSave_MizukiLovePoints
Sleep 1
ForceTextPrintPosition $08, $02
PrintVariableValue8Bit CurrentSave_YumiLovePoints
Sleep 1
ForceTextPrintPosition $0C, $02
PrintVariableValue8Bit CurrentSave_MiriLovePoints
Sleep 1
ForceTextPrintPosition $00, $03
LoadTextEntry $0015, TextBank_08
ForceTextPrintPosition $00, $00
PrintVariableValue8Bit CurrentSave_MariFriendPoints
Sleep 1
ForceTextPrintPosition $04, $00
PrintVariableValue8Bit CurrentSave_SuzuneFriendPoints
Sleep 1
ForceTextPrintPosition $08, $00
PrintVariableValue8Bit CurrentSave_MomoyoFriendPoints
Sleep 1
ForceTextPrintPosition $00, $01
PrintVariableValue8Bit CurrentSave_MariInterestPoints
Sleep 1
ForceTextPrintPosition $04, $01
PrintVariableValue8Bit CurrentSave_SuzuneInterestPoints
Sleep 1
ForceTextPrintPosition $08, $01
PrintVariableValue8Bit CurrentSave_MomoyoInterestPoints
Sleep 1
ForceTextPrintPosition $00, $02
PrintVariableValue8Bit CurrentSave_MariLovePoints
Sleep 1
ForceTextPrintPosition $04, $02
PrintVariableValue8Bit CurrentSave_SuzuneLovePoints
Sleep 1
ForceTextPrintPosition $08, $02
PrintVariableValue8Bit CurrentSave_MomoyoLovePoints
Sleep 1
Debug_ExpandedVariableEditor

ScriptLabel_1C_43CA:
ModifyVariable_StoreToVarFromVar ScriptTEMP_D31B, $D359
ModifyVariable_LogicalANDVar16Bit ScriptTEMP_D31B, $02
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, $00, ScriptLabel_1C_4415
ModifyVariable_StoreToVar8Bit CurrentSave_RurunaFriendPoints, $64
ModifyVariable_StoreToVar8Bit CurrentSave_RurunaInterestPoints, $64
ModifyVariable_StoreToVar8Bit CurrentSave_RurunaLovePoints, $64
ModifyVariable_StoreToVar8Bit CurrentSave_MizukiFriendPoints, $64
ModifyVariable_StoreToVar8Bit CurrentSave_MizukiInterestPoints, $64
ModifyVariable_StoreToVar8Bit CurrentSave_MizukiLovePoints, $64
ModifyVariable_StoreToVar8Bit CurrentSave_YumiFriendPoints, $64
ModifyVariable_StoreToVar8Bit CurrentSave_YumiInterestPoints, $64
ModifyVariable_StoreToVar8Bit CurrentSave_YumiLovePoints, $64
ModifyVariable_StoreToVar8Bit CurrentSave_MiriFriendPoints, $64
ModifyVariable_StoreToVar8Bit CurrentSave_MiriInterestPoints, $64
ModifyVariable_StoreToVar8Bit CurrentSave_MiriLovePoints, $64
ModifyVariable_StoreToVar8Bit CurrentSave_MariFriendPoints, $64
ModifyVariable_StoreToVar8Bit CurrentSave_MariInterestPoints, $64
ModifyVariable_StoreToVar8Bit CurrentSave_MariLovePoints, $64
ModifyVariable_StoreToVar8Bit CurrentSave_SuzuneFriendPoints, $64
ModifyVariable_StoreToVar8Bit CurrentSave_SuzuneInterestPoints, $64
ModifyVariable_StoreToVar8Bit CurrentSave_SuzuneLovePoints, $64
ModifyVariable_StoreToVar8Bit CurrentSave_MomoyoFriendPoints, $64
ModifyVariable_StoreToVar8Bit CurrentSave_MomoyoInterestPoints, $64
ModifyVariable_StoreToVar8Bit CurrentSave_MomoyoLovePoints, $64

ScriptLabel_1C_4415:
EndSubscript

SubScript_1C_4416:
VariableScriptBranch CurrentSave_DaysPassed, ScriptVarCheck_LessThan, $8C, ScriptLabel_1C_4421
LoadBackground BG_ScenicRoadWithered
EndSubscript

ScriptLabel_1C_4421:
LoadBackground BG_ScenicRoad
EndSubscript