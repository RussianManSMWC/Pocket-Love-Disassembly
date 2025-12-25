;all scripting from bank 1D

POINTERS_1D_4000:
dw GameEndScript_1D_406A-POINTERS_1D_4000                   ;$0000
dw Debug_BGAndCharViewer_1D_564C-POINTERS_1D_4000           ;$0001
dw TouchingShoulder_Ruruna_1D_56C7-POINTERS_1D_4000         ;$0002
dw TouchingShoulder_Mizuki_1D_56DF-POINTERS_1D_4000         ;$0003
dw TouchingShoulder_Yumi_1D_56F7-POINTERS_1D_4000           ;$0004
dw TouchingShoulder_Miri_1D_570F-POINTERS_1D_4000           ;$0005
dw TouchingShoulder_Mari_1D_5727-POINTERS_1D_4000           ;$0006
dw TouchingShoulder_Suzune_1D_573F-POINTERS_1D_4000         ;$0007
dw TouchingShoulder_Momoyo_1D_5757-POINTERS_1D_4000         ;$0008
dw PlaceholderScript_1D_5817-POINTERS_1D_4000               ;$0009 \placeholders
dw PlaceholderScript_1D_5817-POINTERS_1D_4000               ;$000A |
dw PlaceholderScript_1D_5817-POINTERS_1D_4000               ;$000B /
dw TouchingHand_Ruruna_1D_576F-POINTERS_1D_4000             ;$000C
dw TouchingHand_Mizuki_1D_5787-POINTERS_1D_4000             ;$000D
dw TouchingHand_Yumi_1D_579F-POINTERS_1D_4000               ;$000E
dw TouchingHand_Miri_1D_57B7-POINTERS_1D_4000               ;$000F
dw TouchingHand_Mari_1D_57CF-POINTERS_1D_4000               ;$0010
dw TouchingHand_Suzune_1D_57E7-POINTERS_1D_4000             ;$0011
dw TouchingHand_Momoyo_1D_57FF-POINTERS_1D_4000             ;$0012
dw PlaceholderScript_1D_5817-POINTERS_1D_4000               ;$0013 Placeholders that don't have associated event data.
dw PlaceholderScript_1D_5817-POINTERS_1D_4000               ;$0014
dw PlaceholderScript_1D_5817-POINTERS_1D_4000               ;$0015
dw PlaceholderScript_1D_5817-POINTERS_1D_4000               ;$0016
dw PlaceholderScript_1D_5817-POINTERS_1D_4000               ;$0017
dw PlaceholderScript_1D_5817-POINTERS_1D_4000               ;$0018
dw PlaceholderScript_1D_5817-POINTERS_1D_4000               ;$0019
dw PlaceholderScript_1D_5817-POINTERS_1D_4000               ;$001A
dw PlaceholderScript_1D_5817-POINTERS_1D_4000               ;$001B
dw PlaceholderScript_1D_5817-POINTERS_1D_4000               ;$001C
dw PlaceholderScript_1D_5817-POINTERS_1D_4000               ;$001D
dw PlaceholderScript_1D_5817-POINTERS_1D_4000               ;$001E
dw PlaceholderScript_1D_5817-POINTERS_1D_4000               ;$001F
dw PlaceholderScript_1D_5817-POINTERS_1D_4000               ;$0020
dw PlaceholderScript_1D_5817-POINTERS_1D_4000               ;$0021
dw PlaceholderScript_1D_5817-POINTERS_1D_4000               ;$0022
dw PlaceholderScript_1D_5817-POINTERS_1D_4000               ;$0023
dw PlaceholderScript_1D_5817-POINTERS_1D_4000               ;$0024
dw PlaceholderScript_1D_5817-POINTERS_1D_4000               ;$0025
dw PlaceholderScript_1D_5817-POINTERS_1D_4000               ;$0026
dw PlaceholderScript_1D_5817-POINTERS_1D_4000               ;$0027
dw PlaceholderScript_1D_5817-POINTERS_1D_4000               ;$0028
dw PlaceholderScript_1D_5817-POINTERS_1D_4000               ;$0029
dw PlaceholderScript_1D_5817-POINTERS_1D_4000               ;$002A
dw PlaceholderScript_1D_5817-POINTERS_1D_4000               ;$002B
dw PlaceholderScript_1D_5817-POINTERS_1D_4000               ;$002C
dw PlaceholderScript_1D_5817-POINTERS_1D_4000               ;$002D
dw PlaceholderScript_1D_5817-POINTERS_1D_4000               ;$002E
dw PlaceholderScript_1D_5817-POINTERS_1D_4000               ;$002F
dw PlaceholderScript_1D_5817-POINTERS_1D_4000               ;$0030
dw PlaceholderScript_1D_5817-POINTERS_1D_4000               ;$0031
dw PlaceholderScript_1D_5817-POINTERS_1D_4000               ;$0032
dw PlaceholderScript_1D_5817-POINTERS_1D_4000               ;$0033
dw PlaceholderScript_1D_5817-POINTERS_1D_4000               ;$0034

;Ending script. Christmas. Choose the character that you like and see if they leave you in the friendzone.
GameEndScript_1D_406A:
SceneFadeIn
LoadTextEntry $01C9, TextBank_04
LoadTextEntry $01C1, TextBank_04
LoadTextEntry $01C2, TextBank_04
LoadTextEntry $01C1, TextBank_04
LoadTextEntry $01C3, TextBank_04
LoadTextEntry $01C1, TextBank_04
LoadTextEntry $01C4, TextBank_04
LoadTextEntry $01C1, TextBank_04
LoadTextEntry $01C5, TextBank_04
LoadTextEntry $01C6, TextBank_04
LoadTextEntry $01C7, TextBank_04
LoadTextEntry $01C8, TextBank_04

ModifyVariable_StoreToVarFromVar DecisionVariable, TopCharacterRelationships_FirstChar
ExecuteSubScript SubScript_1D_5A89
ModifyVariable_StoreToVarFromVar DecisionVariable, TopCharacterRelationships_SecondChar
ExecuteSubScript SubScript_1D_5A89
ModifyVariable_StoreToVarFromVar DecisionVariable, TopCharacterRelationships_ThirdChar
ExecuteSubScript SubScript_1D_5A89
EnablePlayerChoice_3Options $00

DecisionBranches_3Branches ScriptLabel_1D_40AF, ScriptLabel_1D_40B5
ModifyVariable_StoreToVarFromVar DecisionVariable, TopCharacterRelationships_ThirdChar
ScriptBranch ScriptLabel_1D_40B8

ScriptLabel_1D_40AF:
ModifyVariable_StoreToVarFromVar DecisionVariable, TopCharacterRelationships_FirstChar
ScriptBranch ScriptLabel_1D_40B8

ScriptLabel_1D_40B5:
ModifyVariable_StoreToVarFromVar DecisionVariable, TopCharacterRelationships_SecondChar

ScriptLabel_1D_40B8:
ModifyVariable_StoreToVarFromVar ScriptTEMP_D321, DecisionVariable
ModifyVariable_StoreToVar8Bit ScriptTEMP_D323, $00
DecisionBranches_6Branches RurunaEndingCheck_1D_4257, MizukiEndingCheck_1D_4405, YumiEndingCheck_1D_459A, MoriEndingCheck_1D_471A, MariEndingCheck_1D_48B2
ScriptBranch_VarEqualVal8Bit DecisionVariable, $05, SuzuneEndingCheck_1D_4A59

;Every ending checks if combined friendship and love points are at or exceed 300, and love points must be at or exceed 128, then an assortment of stat checks for the best outcome
ModifyVariable_StoreToVarFromVar ScriptTEMP_D31B, CurrentSave_MomoyoFriendPoints
ModifyVariable_AddToVar16Bit ScriptTEMP_D31B, CurrentSave_MomoyoLovePoints
VariableScriptBranch ScriptTEMP_D31B, ScriptVarCheck_LessThan, 300, ScriptLabel_1D_41BC

ScriptBranch_VarLessVal8Bit CurrentSave_MomoyoLovePoints, 128, ScriptLabel_1D_41BC
ScriptBranch_VarLessVal8Bit CurrentSave_SmartStat, 70, ScriptLabel_1D_41BC
ScriptBranch_VarLessVal8Bit CurrentSave_FitStat, 100, ScriptLabel_1D_41BC
ScriptBranch_VarLessVal8Bit CurrentSave_StyleStat, 40, ScriptLabel_1D_41BC
ScriptBranch_VarLessVal8Bit CurrentSave_SkillStat, 220, ScriptLabel_1D_41BC
ScriptBranch_VarLessVal8Bit CurrentSave_SenseStat, 150, ScriptLabel_1D_41BC

ScriptLabel_1D_40FA:
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31B, $00
ExecuteSubScript SubScript_1D_5A9C
ScriptBranch_SuperGameBoy ScriptLabel_1D_4BF5
ModifyVariable_StoreToVar8Bit ScriptTEMP_D323, $01
LoadBackground BG_Park
SceneFadeIn
LoadTextEntry $014A, TextBank_0D
Sleep 180
LoadTextEntry $014B, TextBank_0D
Sleep 210
FixedLoadCharacter CharProp_Character_Momoyo,CharProp_Display_Outdoors,CharProp_Emotion_Blush
LoadTextEntry $014C, TextBank_0D
Sleep 300
LoadTextEntry $0004, TextBank_0D
Sleep 180
UpdateCharacterEmote CharProp_Emotion_Happy
LoadTextEntry $014D, TextBank_0D
Sleep 540
LoadTextEntry $014E, TextBank_0D
Sleep 180
LoadTextEntry $014F, TextBank_0D
Sleep 480
LoadTextEntry $0150, TextBank_0D
Sleep 120
UpdateCharacterEmote CharProp_Emotion_Normal
LoadTextEntry $0151, TextBank_0D
Sleep 260
LoadTextEntry $0152, TextBank_0D
Sleep 100
LoadTextEntry $0153, TextBank_0D
Sleep 240
LoadTextEntry $0152, TextBank_0D
Sleep 120
LoadTextEntry $0154, TextBank_0D
Sleep 180
LoadTextEntry $0155, TextBank_0D
Sleep 240
LoadTextEntry $0156, TextBank_0D
Sleep 480
PlayMusic Music_0C
UpdateCharacterEmote CharProp_Emotion_Blush
LoadTextEntry $0157, TextBank_0D
Sleep 180
LoadTextEntry $0158, TextBank_0D
Sleep 108
LoadTextEntry $0159, TextBank_0D
Sleep 600
LoadTextEntry $015A, TextBank_0D
Sleep 600
LoadTextEntry $015B, TextBank_0D
Sleep 240
LoadTextEntry $015C, TextBank_0D
Sleep 240
LoadTextEntry $015D, TextBank_0D
Sleep 240
LoadTextEntry $015E, TextBank_0D
Sleep 320
LoadTextEntry $015F, TextBank_0D
Sleep 168
LoadTextEntry $0160, TextBank_0D
Sleep 400
LoadTextEntry $0161, TextBank_0D
Sleep 180
LoadTextEntry $0162, TextBank_0D
Sleep 260
LoadTextEntry $0163, TextBank_0D
Sleep 300
ScriptBranch ScriptLabel_1D_5567

ScriptLabel_1D_41BC:
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31B, $01
ExecuteSubScript SubScript_1D_5A9C
ScriptBranch_SuperGameBoy ScriptLabel_1D_4CAE
LoadBackground BG_Park
SceneFadeIn
LoadTextEntry $014A, TextBank_0D
Sleep 170
LoadTextEntry $014B, TextBank_0D
Sleep 150
FixedLoadCharacter CharProp_Character_Momoyo,CharProp_Display_Outdoors,CharProp_Emotion_Normal
LoadTextEntry $0164, TextBank_0D
Sleep 350
LoadTextEntry $0165, TextBank_0D
Sleep 220
LoadTextEntry $0166, TextBank_0D
Sleep 220
LoadTextEntry $0167, TextBank_0D
Sleep 360
LoadTextEntry $0168, TextBank_0D
Sleep 360
LoadTextEntry $0169, TextBank_0D
Sleep 100
UpdateCharacterEmote CharProp_Emotion_Happy
LoadTextEntry $016A, TextBank_0D
Sleep 600
LoadTextEntry $016B, TextBank_0D
Sleep 325
LoadTextEntry $016C, TextBank_0D
Sleep 180
LoadTextEntry $016D, TextBank_0D
Sleep 360
UpdateCharacterEmote CharProp_Emotion_Blush
LoadTextEntry $016E, TextBank_0D
Sleep 240
LoadTextEntry $016F, TextBank_0D
Sleep 240
UpdateCharacterEmote CharProp_Emotion_Happy
LoadTextEntry $0170, TextBank_0D
Sleep 420
LoadTextEntry $0171, TextBank_0D
Sleep 240
LoadTextEntry $0172, TextBank_0D
Sleep 420
LoadTextEntry $0173, TextBank_0D
Sleep 240
UpdateCharacterEmote CharProp_Emotion_Blush
LoadTextEntry $0174, TextBank_0D
Sleep 240
RemoveCharacter
LoadTextEntry $0175, TextBank_0D
Sleep 180
LoadTextEntry $0176, TextBank_0D
Sleep 240
LoadTextEntry $0032, TextBank_0D
Sleep 300
ScriptBranch ScriptLabel_1D_5567

RurunaEndingCheck_1D_4257:
ModifyVariable_StoreToVarFromVar ScriptTEMP_D31B, CurrentSave_RurunaFriendPoints
ModifyVariable_AddToVar16Bit ScriptTEMP_D31B, CurrentSave_RurunaLovePoints ;combine these relationship values
VariableScriptBranch ScriptTEMP_D31B, ScriptVarCheck_LessThan, 300, ScriptLabel_1D_436A ;combined friendship and love points
ScriptBranch_VarLessVal8Bit CurrentSave_RurunaLovePoints, 128, ScriptLabel_1D_436A
ScriptBranch_VarLessVal8Bit CurrentSave_SmartStat, 200, ScriptLabel_1D_436A
ScriptBranch_VarLessVal8Bit CurrentSave_FitStat, 200, ScriptLabel_1D_436A
ScriptBranch_VarLessVal8Bit CurrentSave_StyleStat, 200, ScriptLabel_1D_436A
ScriptBranch_VarLessVal8Bit CurrentSave_SkillStat, 220, ScriptLabel_1D_436A
ScriptBranch_VarLessVal8Bit CurrentSave_SenseStat, 200, ScriptLabel_1D_436A

;good ending
ScriptLabel_1D_4283:
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31B, $00
ExecuteSubScript SubScript_1D_5A9C
ScriptBranch_SuperGameBoy ScriptLabel_1D_4D40
ModifyVariable_StoreToVar8Bit ScriptTEMP_D323, $01
LoadBackground BG_SchoolRooftop
SceneFadeIn
LoadTextEntry $0000, TextBank_0D
Sleep 240
LoadTextEntry $0001, TextBank_0D
Sleep 180
LoadTextEntry $0002, TextBank_0D
Sleep 180
FixedLoadCharacter CharProp_Character_Ruruna,CharProp_Display_School,CharProp_Emotion_Normal
LoadTextEntry $0003, TextBank_0D
Sleep 180
LoadTextEntry $0004, TextBank_0D
Sleep 180
LoadTextEntry $0005, TextBank_0D
Sleep 360
LoadTextEntry $0006, TextBank_0D
Sleep 600
LoadTextEntry $0007, TextBank_0D
Sleep 600
LoadTextEntry $0008, TextBank_0D
Sleep 540
LoadTextEntry $0009, TextBank_0D
Sleep 240
UpdateCharacterEmote CharProp_Emotion_Upset
LoadTextEntry $000A, TextBank_0D
Sleep 600
LoadTextEntry $000B, TextBank_0D
Sleep 600
LoadTextEntry $000C, TextBank_0D
Sleep 180
LoadTextEntry $000D, TextBank_0D
Sleep 600
LoadTextEntry $000E, TextBank_0D
Sleep 600
LoadTextEntry $000F, TextBank_0D
Sleep 600
LoadTextEntry $0010, TextBank_0D
Sleep 180
UpdateCharacterEmote CharProp_Emotion_Blush
LoadTextEntry $0011, TextBank_0D
PlayMusic Music_0C
Sleep 360
LoadTextEntry $0012, TextBank_0D
Sleep 360
LoadTextEntry $0013, TextBank_0D
Sleep 360
LoadTextEntry $0014, TextBank_0D
Sleep 360
UpdateCharacterEmote CharProp_Emotion_Sad
LoadTextEntry $0015, TextBank_0D
Sleep 600
LoadTextEntry $0016, TextBank_0D
Sleep 200
LoadTextEntry $0017, TextBank_0D
Sleep 420
LoadTextEntry $0018, TextBank_0D
Sleep 600
LoadTextEntry $0019, TextBank_0D
Sleep 750
LoadTextEntry $001A, TextBank_0D
Sleep 280
LoadTextEntry $001B, TextBank_0D
Sleep 220
LoadTextEntry $001C, TextBank_0D
Sleep 280
LoadTextEntry $001D, TextBank_0D
Sleep 160
UpdateCharacterEmote CharProp_Emotion_Blush
LoadTextEntry $001E, TextBank_0D
Sleep 630
LoadTextEntry $001F, TextBank_0D
Sleep 360
LoadTextEntry $0020, TextBank_0D
Sleep 240
LoadTextEntry $0021, TextBank_0D
Sleep 300
ScriptBranch ScriptLabel_1D_5567

;normal ending
ScriptLabel_1D_436A:
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31B, $01
ExecuteSubScript SubScript_1D_5A9C
ScriptBranch_SuperGameBoy ScriptLabel_1D_4E1E
LoadBackground BG_SchoolRooftop
SceneFadeIn
LoadTextEntry $0000, TextBank_0D
Sleep 240
LoadTextEntry $0001, TextBank_0D
Sleep 180
LoadTextEntry $0002, TextBank_0D
Sleep 180
FixedLoadCharacter CharProp_Character_Ruruna,CharProp_Display_School,CharProp_Emotion_Upset
PlayMusic Music_0C
LoadTextEntry $0003, TextBank_0D
Sleep 120
LoadTextEntry $0004, TextBank_0D
Sleep 240
LoadTextEntry $0022, TextBank_0D
Sleep 155
LoadTextEntry $0023, TextBank_0D
Sleep 480
LoadTextEntry $0024, TextBank_0D
Sleep 240
LoadTextEntry $0025, TextBank_0D
Sleep 360
LoadTextEntry $0026, TextBank_0D
Sleep 160
LoadTextEntry $0027, TextBank_0D
Sleep 600
LoadTextEntry $0028, TextBank_0D
Sleep 420
LoadTextEntry $0029, TextBank_0D
Sleep 480
LoadTextEntry $002A, TextBank_0D
Sleep 180
LoadTextEntry $002B, TextBank_0D
Sleep 120
LoadTextEntry $002C, TextBank_0D
Sleep 180
UpdateCharacterEmote CharProp_Emotion_Happy
LoadTextEntry $002D, TextBank_0D
Sleep 180
LoadTextEntry $002E, TextBank_0D
Sleep 360
UpdateCharacterEmote CharProp_Emotion_Normal
LoadTextEntry $002F, TextBank_0D
Sleep 240
UpdateCharacterEmote CharProp_Emotion_Blush
LoadTextEntry $0030, TextBank_0D
Sleep 375
LoadTextEntry $0031, TextBank_0D
Sleep 300
LoadTextEntry $0032, TextBank_0D
Sleep 400
ScriptBranch ScriptLabel_1D_5567


MizukiEndingCheck_1D_4405:
ModifyVariable_StoreToVarFromVar ScriptTEMP_D31B, CurrentSave_MizukiFriendPoints
ModifyVariable_AddToVar16Bit ScriptTEMP_D31B, CurrentSave_MizukiLovePoints
VariableScriptBranch ScriptTEMP_D31B, ScriptVarCheck_LessThan, 300, ScriptLabel_1D_4516

ScriptBranch_VarLessVal8Bit CurrentSave_MizukiLovePoints, 128, ScriptLabel_1D_4516
ScriptBranch_VarLessVal8Bit CurrentSave_SmartStat, 150, ScriptLabel_1D_4516
ScriptBranch_VarLessVal8Bit CurrentSave_FitStat, 220, ScriptLabel_1D_4516
ScriptBranch_VarLessVal8Bit CurrentSave_StyleStat, 70, ScriptLabel_1D_4516
ScriptBranch_VarLessVal8Bit CurrentSave_SkillStat, 24, ScriptLabel_1D_4516
ScriptBranch_VarLessVal8Bit CurrentSave_SenseStat, 100, ScriptLabel_1D_4516

;good ending
ScriptLabel_1D_4431:
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31B, $00
ExecuteSubScript SubScript_1D_5A9C
ScriptBranch_SuperGameBoy ScriptLabel_1D_4EB0
ModifyVariable_StoreToVar8Bit ScriptTEMP_D323, $01
LoadBackground BG_River
SceneFadeIn
LoadTextEntry $0033, TextBank_0D
Sleep 180
FixedLoadCharacter CharProp_Character_Mizuki,CharProp_Display_School,CharProp_Emotion_Blush
LoadTextEntry $0034, TextBank_0D
Sleep 120
LoadTextEntry $0035, TextBank_0D
Sleep 120
LoadTextEntry $0004, TextBank_0D
Sleep 120
LoadTextEntry $0036, TextBank_0D
Sleep 360
LoadTextEntry $0037, TextBank_0D
Sleep 120
LoadTextEntry $0038, TextBank_0D
Sleep 360
LoadTextEntry $0039, TextBank_0D
Sleep 120
LoadTextEntry $003A, TextBank_0D
Sleep 360
LoadTextEntry $003B, TextBank_0D
Sleep 180
LoadTextEntry $003C, TextBank_0D
Sleep 480
UpdateCharacterEmote CharProp_Emotion_Upset
LoadTextEntry $003D, TextBank_0D
Sleep 420
LoadTextEntry $003E, TextBank_0D
Sleep 240
LoadTextEntry $003F, TextBank_0D
Sleep 520
LoadTextEntry $0040, TextBank_0D
Sleep 120
LoadTextEntry $0041, TextBank_0D
Sleep 360
LoadTextEntry $0042, TextBank_0D
Sleep 300
LoadTextEntry $0043, TextBank_0D
Sleep 120
LoadTextEntry $0044, TextBank_0D
Sleep 180
LoadTextEntry $0045, TextBank_0D
Sleep 120
LoadTextEntry $0046, TextBank_0D
Sleep 180
LoadTextEntry $0047, TextBank_0D
Sleep 180
UpdateCharacterEmote CharProp_Emotion_Blush
LoadTextEntry $0048, TextBank_0D
PlayMusic Music_0C
Sleep 240
LoadTextEntry $0049, TextBank_0D
Sleep 180
LoadTextEntry $004A, TextBank_0D
Sleep 360
LoadTextEntry $004B, TextBank_0D
Sleep 300
LoadTextEntry $004C, TextBank_0D
Sleep 300
LoadTextEntry $004D, TextBank_0D
Sleep 360
LoadTextEntry $0034, TextBank_0D
Sleep 120
LoadTextEntry $004E, TextBank_0D
Sleep 180
LoadTextEntry $004F, TextBank_0D
Sleep 240
LoadTextEntry $0050, TextBank_0D
Sleep 360
LoadTextEntry $0051, TextBank_0D
Sleep 300
LoadTextEntry $0052, TextBank_0D
Sleep 400
ScriptBranch ScriptLabel_1D_5567

;normal ending
ScriptLabel_1D_4516:
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31B, $01
ExecuteSubScript SubScript_1D_5A9C
ScriptBranch_SuperGameBoy ScriptLabel_1D_4F8C
PlayMusic Music_0D
LoadBackground BG_River
SceneFadeIn
LoadTextEntry $0033, TextBank_0D
Sleep 180
LoadTextEntry $0034, TextBank_0D
Sleep 120
FixedLoadCharacter CharProp_Character_Mizuki,CharProp_Display_School,CharProp_Emotion_Normal
LoadTextEntry $0035, TextBank_0D
Sleep 120
LoadTextEntry $0004, TextBank_0D
Sleep 180
LoadTextEntry $0036, TextBank_0D
Sleep 300
LoadTextEntry $0057, TextBank_0D
Sleep 240
LoadTextEntry $0058, TextBank_0D
Sleep 360
LoadTextEntry $0059, TextBank_0D
Sleep 240
LoadTextEntry $005A, TextBank_0D
Sleep 300
LoadTextEntry $005B, TextBank_0D
Sleep 600
LoadTextEntry $005C, TextBank_0D
Sleep 240
UpdateCharacterEmote CharProp_Emotion_Happy
LoadTextEntry $005D, TextBank_0D
Sleep 300
LoadTextEntry $005E, TextBank_0D
Sleep 240
UpdateCharacterEmote CharProp_Emotion_Upset
LoadTextEntry $005F, TextBank_0D
Sleep 420
UpdateCharacterEmote CharProp_Emotion_Blush
LoadTextEntry $0061, TextBank_0D
Sleep 600
RemoveCharacter
LoadTextEntry $0062, TextBank_0D
Sleep 240
LoadTextEntry $0063, TextBank_0D
Sleep 360
LoadTextEntry $0032, TextBank_0D
Sleep 400
ScriptBranch ScriptLabel_1D_5567

YumiEndingCheck_1D_459A:
ModifyVariable_StoreToVarFromVar ScriptTEMP_D31B, CurrentSave_YumiFriendPoints
ModifyVariable_AddToVar16Bit ScriptTEMP_D31B, CurrentSave_YumiLovePoints
VariableScriptBranch ScriptTEMP_D31B, ScriptVarCheck_LessThan, 300, ScriptLabel_1D_4688

ScriptBranch_VarLessVal8Bit CurrentSave_YumiLovePoints, 128, ScriptLabel_1D_4688
ScriptBranch_VarLessVal8Bit CurrentSave_SmartStat, 70, ScriptLabel_1D_4688
ScriptBranch_VarLessVal8Bit CurrentSave_FitStat, 150, ScriptLabel_1D_4688
ScriptBranch_VarLessVal8Bit CurrentSave_StyleStat, 220, ScriptLabel_1D_4688
ScriptBranch_VarLessVal8Bit CurrentSave_SkillStat, 32, ScriptLabel_1D_4688
ScriptBranch_VarLessVal8Bit CurrentSave_SenseStat, 100, ScriptLabel_1D_4688

ScriptLabel_1D_45C6:
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31B, $00
ExecuteSubScript SubScript_1D_5A9C
ScriptBranch_SuperGameBoy ScriptLabel_1D_5007
ModifyVariable_StoreToVar8Bit ScriptTEMP_D323, $01
LoadBackground BG_ScenicRoadWithered
SceneFadeIn
LoadTextEntry $006E, TextBank_0D
Sleep 240
LoadTextEntry $006F, TextBank_0D
Sleep 180
FixedLoadCharacter CharProp_Character_Yumi,CharProp_Display_Outdoors,CharProp_Emotion_Blush
LoadTextEntry $0070, TextBank_0D
Sleep 180
LoadTextEntry $0071, TextBank_0D
Sleep 420
LoadTextEntry $0072, TextBank_0D
Sleep 540
LoadTextEntry $0073, TextBank_0D
Sleep 240
LoadTextEntry $0074, TextBank_0D
Sleep 420
LoadTextEntry $0075, TextBank_0D
Sleep 180
UpdateCharacterEmote CharProp_Emotion_Normal
LoadTextEntry $0076, TextBank_0D
Sleep 420
LoadTextEntry $0077, TextBank_0D
Sleep 180
LoadTextEntry $0078, TextBank_0D
Sleep 540
LoadTextEntry $0079, TextBank_0D
Sleep 180
LoadTextEntry $007A, TextBank_0D
Sleep 300
LoadTextEntry $007B, TextBank_0D
Sleep 120
LoadTextEntry $007C, TextBank_0D
Sleep 540
LoadTextEntry $007D, TextBank_0D
Sleep 420
LoadTextEntry $007E, TextBank_0D
Sleep 120
LoadTextEntry $007F, TextBank_0D
Sleep 540
LoadTextEntry $0080, TextBank_0D
Sleep 480
UpdateCharacterEmote CharProp_Emotion_Blush
PlayMusic Music_0C
LoadTextEntry $0081, TextBank_0D
Sleep 120
LoadTextEntry $0082, TextBank_0D
Sleep 300
LoadTextEntry $0083, TextBank_0D
Sleep 300
UpdateCharacterEmote CharProp_Emotion_Sad
LoadTextEntry $0084, TextBank_0D
Sleep 240
LoadTextEntry $0085, TextBank_0D
Sleep 300
LoadTextEntry $0086, TextBank_0D
Sleep 240
LoadTextEntry $0087, TextBank_0D
Sleep 300
LoadTextEntry $0088, TextBank_0D
Sleep 300
LoadTextEntry $0089, TextBank_0D
Sleep 400
ScriptBranch ScriptLabel_1D_5567

ScriptLabel_1D_4688:
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31B, $01
ExecuteSubScript SubScript_1D_5A9C
ScriptBranch_SuperGameBoy ScriptLabel_1D_50C0
LoadBackground BG_ScenicRoadWithered
SceneFadeIn
LoadTextEntry $006E, TextBank_0D
Sleep 240
LoadTextEntry $006F, TextBank_0D
Sleep 180
LoadTextEntry $008A, TextBank_0D
Sleep 180
FixedLoadCharacter CharProp_Character_Yumi,CharProp_Display_Outdoors,CharProp_Emotion_Normal
PlayMusic Music_0C
LoadTextEntry $008B, TextBank_0D
Sleep 300
LoadTextEntry $008C, TextBank_0D
Sleep 240
LoadTextEntry $008D, TextBank_0D
Sleep 360
LoadTextEntry $008E, TextBank_0D
Sleep 180
UpdateCharacterEmote CharProp_Emotion_Happy
LoadTextEntry $008F, TextBank_0D
Sleep 480
LoadTextEntry $0090, TextBank_0D
Sleep 240
UpdateCharacterEmote CharProp_Emotion_Normal
LoadTextEntry $0091, TextBank_0D
Sleep 420
LoadTextEntry $0092, TextBank_0D
Sleep 540
LoadTextEntry $0093, TextBank_0D
Sleep 180
UpdateCharacterEmote CharProp_Emotion_Blush
LoadTextEntry $0094, TextBank_0D
Sleep 540
LoadTextEntry $0095, TextBank_0D
Sleep 300
UpdateCharacterEmote CharProp_Emotion_Normal
LoadTextEntry $0096, TextBank_0D
Sleep 300
LoadTextEntry $0097, TextBank_0D
Sleep 360
LoadTextEntry $0098, TextBank_0D
Sleep 600
UpdateCharacterEmote CharProp_Emotion_Blush
LoadTextEntry $0099, TextBank_0D
Sleep 540
RemoveCharacter
LoadTextEntry $009A, TextBank_0D
Sleep 240
LoadTextEntry $0032, TextBank_0D
Sleep 400
ScriptBranch ScriptLabel_1D_5567

MoriEndingCheck_1D_471A:
ModifyVariable_StoreToVarFromVar ScriptTEMP_D31B, CurrentSave_MiriFriendPoints
ModifyVariable_AddToVar16Bit ScriptTEMP_D31B, CurrentSave_MiriLovePoints
VariableScriptBranch ScriptTEMP_D31B, ScriptVarCheck_LessThan, 300, ScriptLabel_1D_4811

ScriptBranch_VarLessVal8Bit CurrentSave_MiriLovePoints, 128, ScriptLabel_1D_4811
ScriptBranch_VarLessVal8Bit CurrentSave_SmartStat, 220, ScriptLabel_1D_4811
ScriptBranch_VarLessVal8Bit CurrentSave_FitStat, 40, ScriptLabel_1D_4811
ScriptBranch_VarLessVal8Bit CurrentSave_StyleStat, 150, ScriptLabel_1D_4811
ScriptBranch_VarLessVal8Bit CurrentSave_SkillStat, 70, ScriptLabel_1D_4811
ScriptBranch_VarLessVal8Bit CurrentSave_SenseStat, 100, ScriptLabel_1D_4811

ScriptLabel_1D_4746:
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31B, $00
ExecuteSubScript SubScript_1D_5A9C
ScriptBranch_SuperGameBoy ScriptLabel_1D_5149
ModifyVariable_StoreToVar8Bit ScriptTEMP_D323, $01
LoadBackground BG_Schoolyard
SceneFadeIn
LoadTextEntry $00A0, TextBank_0D
Sleep 300
FixedLoadCharacter CharProp_Character_Miri,CharProp_Display_School,CharProp_Emotion_Normal
LoadTextEntry $00A1, TextBank_0D
Sleep 180
LoadTextEntry $0004, TextBank_0D
Sleep 180
LoadTextEntry $00A2, TextBank_0D
Sleep 420
LoadTextEntry $009F, TextBank_0D
Sleep 240
LoadTextEntry $00A3, TextBank_0D
Sleep 300
LoadTextEntry $00A4, TextBank_0D
Sleep 360
LoadTextEntry $00A5, TextBank_0D
Sleep 180
LoadTextEntry $00A6, TextBank_0D
Sleep 480
LoadTextEntry $00A7, TextBank_0D
Sleep 240
LoadTextEntry $00A8, TextBank_0D
Sleep 540
LoadTextEntry $00A9, TextBank_0D
Sleep 120
LoadTextEntry $00AA, TextBank_0D
Sleep 600
LoadTextEntry $00AB, TextBank_0D
Sleep 600
LoadTextEntry $00AC, TextBank_0D
Sleep 600
LoadTextEntry $00AD, TextBank_0D
Sleep 120
UpdateCharacterEmote CharProp_Emotion_Sad
LoadTextEntry $00AE, TextBank_0D
Sleep 420
PlayMusic Music_0C
LoadTextEntry $00AF, TextBank_0D
Sleep 240
LoadTextEntry $00B0, TextBank_0D
Sleep 240
LoadTextEntry $00B1, TextBank_0D
Sleep 180
LoadTextEntry $00B2, TextBank_0D
Sleep 480
LoadTextEntry $00B3, TextBank_0D
Sleep 580
LoadTextEntry $00B4, TextBank_0D
Sleep 180
RemoveCharacter
Sleep 1
SetCharacterCoords $80, $38
FixedLoadCharacter CharProp_Character_Miri,CharProp_Display_Sideview,CharProp_Emotion_Sad
LoadTextEntry $00B5, TextBank_0D
Sleep 300
LoadTextEntry $00B6, TextBank_0D
Sleep 300
LoadTextEntry $00B7, TextBank_0D
Sleep 300
LoadTextEntry $00B8, TextBank_0D
Sleep 300
LoadTextEntry $00B9, TextBank_0D
Sleep 400
ScriptBranch ScriptLabel_1D_5567

ScriptLabel_1D_4811:
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31B, $01
ExecuteSubScript SubScript_1D_5A9C
ScriptBranch_SuperGameBoy ScriptLabel_1D_520B
LoadBackground BG_Schoolyard
SceneFadeIn
LoadTextEntry $00A0, TextBank_0D
Sleep 240
FixedLoadCharacter CharProp_Character_Miri,CharProp_Display_School,CharProp_Emotion_Normal
PlayMusic Music_0C
LoadTextEntry $00A1, TextBank_0D
Sleep 180
LoadTextEntry $0004, TextBank_0D
Sleep 180
LoadTextEntry $00BA, TextBank_0D
Sleep 300
LoadTextEntry $00BB, TextBank_0D
Sleep 240
LoadTextEntry $00BC, TextBank_0D
Sleep 420
LoadTextEntry $00BD, TextBank_0D
Sleep 180
LoadTextEntry $00BE, TextBank_0D
Sleep 480
LoadTextEntry $00BF, TextBank_0D
Sleep 300
LoadTextEntry $00C0, TextBank_0D
Sleep 180
LoadTextEntry $00C1, TextBank_0D
Sleep 480
LoadTextEntry $00C2, TextBank_0D
Sleep 600
LoadTextEntry $00C3, TextBank_0D
Sleep 300
LoadTextEntry $00C4, TextBank_0D
Sleep 240
UpdateCharacterEmote CharProp_Emotion_Happy
LoadTextEntry $00C5, TextBank_0D
Sleep 300
LoadTextEntry $00C6, TextBank_0D
Sleep 240
LoadTextEntry $00C7, TextBank_0D
Sleep 120
UpdateCharacterEmote CharProp_Emotion_Normal
LoadTextEntry $00C8, TextBank_0D
Sleep 120
LoadTextEntry $00C9, TextBank_0D
Sleep 120
UpdateCharacterEmote CharProp_Emotion_Blush
LoadTextEntry $00CA, TextBank_0D
Sleep 300
LoadTextEntry $00CB, TextBank_0D
Sleep 180
LoadTextEntry $00CC, TextBank_0D
Sleep 360
LoadTextEntry $0032, TextBank_0D
Sleep 360
ScriptBranch ScriptLabel_1D_5567

MariEndingCheck_1D_48B2:
ModifyVariable_StoreToVarFromVar ScriptTEMP_D31B, CurrentSave_MariFriendPoints
ModifyVariable_AddToVar16Bit ScriptTEMP_D31B, CurrentSave_MariLovePoints
VariableScriptBranch ScriptTEMP_D31B, ScriptVarCheck_LessThan, 300, ScriptLabel_1D_49A5

ScriptBranch_VarLessVal8Bit CurrentSave_MariLovePoints, 128, ScriptLabel_1D_49A5
ScriptBranch_VarLessVal8Bit CurrentSave_SmartStat, 56, ScriptLabel_1D_49A5
ScriptBranch_VarLessVal8Bit CurrentSave_FitStat, 100, ScriptLabel_1D_49A5
ScriptBranch_VarLessVal8Bit CurrentSave_StyleStat, 150, ScriptLabel_1D_49A5
ScriptBranch_VarLessVal8Bit CurrentSave_SkillStat, 76, ScriptLabel_1D_49A5
ScriptBranch_VarLessVal8Bit CurrentSave_SenseStat, 220, ScriptLabel_1D_49A5

ScriptLabel_1D_48DE:
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31B, $00
ExecuteSubScript SubScript_1D_5A9C
ScriptBranch_SuperGameBoy ScriptLabel_1D_52A3
ModifyVariable_StoreToVar8Bit ScriptTEMP_D323, $01
LoadBackground BG_Cafe
SceneFadeIn
LoadTextEntry $00D2, TextBank_0D
Sleep 180
LoadTextEntry $00D3, TextBank_0D
Sleep 240
FixedLoadCharacter CharProp_Character_Mari,CharProp_Display_Outdoors,CharProp_Emotion_Blush
LoadTextEntry $00D4, TextBank_0D
Sleep 360
LoadTextEntry $0004, TextBank_0D
Sleep 180
UpdateCharacterEmote CharProp_Emotion_Normal
LoadTextEntry $00D5, TextBank_0D
Sleep 600
LoadTextEntry $00D6, TextBank_0D
Sleep 240
LoadTextEntry $00D7, TextBank_0D
Sleep 360
LoadTextEntry $00D8, TextBank_0D
Sleep 180
LoadTextEntry $00D9, TextBank_0D
Sleep 420
LoadTextEntry $00DA, TextBank_0D
Sleep 120
LoadTextEntry $00DB, TextBank_0D
Sleep 480
LoadTextEntry $00DC, TextBank_0D
Sleep 180
UpdateCharacterEmote CharProp_Emotion_Blush
LoadTextEntry $00DD, TextBank_0D
Sleep 480
LoadTextEntry $00DE, TextBank_0D
Sleep 240
LoadTextEntry $00DF, TextBank_0D
Sleep 300
LoadTextEntry $00E0, TextBank_0D
Sleep 180
LoadTextEntry $00E1, TextBank_0D
Sleep 360
LoadTextEntry $00D1, TextBank_0D
Sleep 180
PlayMusic Music_0C
LoadTextEntry $00E2, TextBank_0D
Sleep 180
LoadTextEntry $00E3, TextBank_0D
Sleep 240
LoadTextEntry $00E4, TextBank_0D
Sleep 240
LoadTextEntry $00E5, TextBank_0D
Sleep 480
LoadTextEntry $00E6, TextBank_0D
Sleep 240
LoadTextEntry $00E7, TextBank_0D
Sleep 180
LoadTextEntry $00E8, TextBank_0D
Sleep 180
LoadTextEntry $00E9, TextBank_0D
Sleep 360
LoadTextEntry $00EA, TextBank_0D
Sleep 240
LoadTextEntry $00EB, TextBank_0D
Sleep 180
LoadTextEntry $00EC, TextBank_0D
Sleep 400
ScriptBranch ScriptLabel_1D_5567

ScriptLabel_1D_49A5:
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31B, $01
ExecuteSubScript SubScript_1D_5A9C
ScriptBranch_SuperGameBoy ScriptLabel_1D_5361
LoadBackground BG_Cafe
SceneFadeIn
LoadTextEntry $00D2, TextBank_0D
Sleep 180
LoadTextEntry $00D3, TextBank_0D
Sleep 240
FixedLoadCharacter CharProp_Character_Mari,CharProp_Display_Outdoors,CharProp_Emotion_Happy
PlayMusic Music_0C
LoadTextEntry $00D4, TextBank_0D
Sleep 240
LoadTextEntry $0004, TextBank_0D
Sleep 240
LoadTextEntry $00ED, TextBank_0D
Sleep 300
LoadTextEntry $00EE, TextBank_0D
Sleep 240
UpdateCharacterEmote CharProp_Emotion_Upset
LoadTextEntry $00EF, TextBank_0D
Sleep 300
LoadTextEntry $00F0, TextBank_0D
Sleep 180
UpdateCharacterEmote CharProp_Emotion_Normal
LoadTextEntry $00F1, TextBank_0D
Sleep 480
LoadTextEntry $00F2, TextBank_0D
Sleep 180
UpdateCharacterEmote CharProp_Emotion_Happy
LoadTextEntry $00F3, TextBank_0D
Sleep 420
LoadTextEntry $00F4, TextBank_0D
Sleep 180
LoadTextEntry $00F5, TextBank_0D
Sleep 360
LoadTextEntry $00F6, TextBank_0D
Sleep 180
LoadTextEntry $00F7, TextBank_0D
Sleep 240
LoadTextEntry $00F8, TextBank_0D
Sleep 300
LoadTextEntry $00F9, TextBank_0D
Sleep 120
LoadTextEntry $00FA, TextBank_0D
Sleep 240
LoadTextEntry $00FB, TextBank_0D
Sleep 120
UpdateCharacterEmote CharProp_Emotion_Blush
LoadTextEntry $00FC, TextBank_0D
Sleep 360
LoadTextEntry $00FD, TextBank_0D
Sleep 120
SceneFadeOut
RemoveCharacter
LoadBackground BG_CafeEntrance
LoadTextEntry $00FE, TextBank_0D
SceneFadeIn
Sleep 180
LoadTextEntry $00FF, TextBank_0D
Sleep 180
LoadTextEntry $0100, TextBank_0D
Sleep 240
LoadTextEntry $0032, TextBank_0D
Sleep 300
ScriptBranch ScriptLabel_1D_5567

SuzuneEndingCheck_1D_4A59:
ModifyVariable_StoreToVarFromVar ScriptTEMP_D31B, CurrentSave_SuzuneFriendPoints
ModifyVariable_AddToVar16Bit ScriptTEMP_D31B, CurrentSave_SuzuneLovePoints
VariableScriptBranch ScriptTEMP_D31B, ScriptVarCheck_LessThan, 300, ScriptLabel_1D_4B53

ScriptBranch_VarLessVal8Bit CurrentSave_SuzuneLovePoints, 128, ScriptLabel_1D_4B53
ScriptBranch_VarLessVal8Bit CurrentSave_SmartStat, 150, ScriptLabel_1D_4B53
ScriptBranch_VarLessVal8Bit CurrentSave_FitStat, 100, ScriptLabel_1D_4B53
ScriptBranch_VarLessVal8Bit CurrentSave_StyleStat, 220, ScriptLabel_1D_4B53
ScriptBranch_VarLessVal8Bit CurrentSave_SkillStat, 70, ScriptLabel_1D_4B53
ScriptBranch_VarLessVal8Bit CurrentSave_SenseStat, 40, ScriptLabel_1D_4B53

ScriptLabel_1D_4A85:
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31B, $00
ExecuteSubScript SubScript_1D_5A9C
ScriptBranch_SuperGameBoy ScriptLabel_1D_540C
ModifyVariable_StoreToVar8Bit ScriptTEMP_D323, $01
LoadBackground BG_Classroom
SceneFadeIn
LoadTextEntry $010E, TextBank_0D
Sleep 180
LoadTextEntry $010F, TextBank_0D
Sleep 180
FixedLoadCharacter CharProp_Character_Suzune,CharProp_Display_School,CharProp_Emotion_Normal
LoadTextEntry $0110, TextBank_0D
Sleep 300
LoadTextEntry $0004, TextBank_0D
Sleep 180
UpdateCharacterEmote CharProp_Emotion_Sad
LoadTextEntry $0111, TextBank_0D
Sleep 360
LoadTextEntry $0112, TextBank_0D
Sleep 240
LoadTextEntry $0113, TextBank_0D
Sleep 480
LoadTextEntry $0114, TextBank_0D
Sleep 480
LoadTextEntry $0115, TextBank_0D
Sleep 180
LoadTextEntry $0116, TextBank_0D
Sleep 420
LoadTextEntry $0117, TextBank_0D
Sleep 240
LoadTextEntry $0118, TextBank_0D
Sleep 600
LoadTextEntry $0119, TextBank_0D
Sleep 360
LoadTextEntry $011A, TextBank_0D
Sleep 120
LoadTextEntry $011B, TextBank_0D
Sleep 540
LoadTextEntry $011C, TextBank_0D
Sleep 120
LoadTextEntry $011D, TextBank_0D
Sleep 420
LoadTextEntry $011E, TextBank_0D
Sleep 360
UpdateCharacterEmote CharProp_Emotion_Blush
LoadTextEntry $011F, TextBank_0D
Sleep 180
PlayMusic Music_0C
LoadTextEntry $0120, TextBank_0D
Sleep 180
LoadTextEntry $0121, TextBank_0D
Sleep 240
LoadTextEntry $0122, TextBank_0D
Sleep 180
UpdateCharacterEmote CharProp_Emotion_Sad
LoadTextEntry $0123, TextBank_0D
Sleep 500
LoadTextEntry $0124, TextBank_0D
Sleep 240
LoadTextEntry $0125, TextBank_0D
Sleep 240
LoadTextEntry $0126, TextBank_0D
Sleep 480
LoadTextEntry $0127, TextBank_0D
Sleep 420
LoadTextEntry $0128, TextBank_0D
Sleep 240
LoadTextEntry $0129, TextBank_0D
Sleep 240
LoadTextEntry $012A, TextBank_0D
Sleep 400
ScriptBranch ScriptLabel_1D_5567

ScriptLabel_1D_4B53:
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31B, $01
ExecuteSubScript SubScript_1D_5A9C
ScriptBranch_SuperGameBoy ScriptLabel_1D_54D1
LoadBackground BG_Classroom
SceneFadeIn
LoadTextEntry $010E, TextBank_0D
Sleep 180
LoadTextEntry $010F, TextBank_0D
Sleep 180
FixedLoadCharacter CharProp_Character_Suzune,CharProp_Display_School,CharProp_Emotion_Happy
PlayMusic Music_0C
LoadTextEntry $0110, TextBank_0D
Sleep 300
LoadTextEntry $012B, TextBank_0D
Sleep 180
UpdateCharacterEmote CharProp_Emotion_Normal
LoadTextEntry $012C, TextBank_0D
Sleep 180
LoadTextEntry $012D, TextBank_0D
Sleep 240
LoadTextEntry $012E, TextBank_0D
Sleep 420
LoadTextEntry $012F, TextBank_0D
Sleep 120
LoadTextEntry $0130, TextBank_0D
Sleep 420
LoadTextEntry $0131, TextBank_0D
Sleep 180
UpdateCharacterEmote CharProp_Emotion_Sad
LoadTextEntry $0132, TextBank_0D
Sleep 540
LoadTextEntry $0133, TextBank_0D
Sleep 180
LoadTextEntry $0134, TextBank_0D
Sleep 360
LoadTextEntry $0135, TextBank_0D
Sleep 600
LoadTextEntry $0136, TextBank_0D
Sleep 240
UpdateCharacterEmote CharProp_Emotion_Happy
LoadTextEntry $0137, TextBank_0D
Sleep 300
LoadTextEntry $0138, TextBank_0D
Sleep 240
LoadTextEntry $0139, TextBank_0D
Sleep 420
LoadTextEntry $013A, TextBank_0D
Sleep 120
UpdateCharacterEmote CharProp_Emotion_Blush
LoadTextEntry $013B, TextBank_0D
Sleep 360
LoadTextEntry $013C, TextBank_0D
Sleep 240
LoadTextEntry $013D, TextBank_0D
Sleep 240
LoadTextEntry $0032, TextBank_0D
Sleep 400
ScriptBranch ScriptLabel_1D_5567

;Super Game Boy timed endings to compensate for slightly higher clock speed (unless you're on SGB2, in which case they just take longer now)
ScriptLabel_1D_4BF5:
ModifyVariable_StoreToVar8Bit ScriptTEMP_D323, $01
LoadBackground BG_Park
SceneFadeIn
LoadTextEntry $014A, TextBank_0D
Sleep 190
LoadTextEntry $014B, TextBank_0D
Sleep 220
FixedLoadCharacter CharProp_Character_Momoyo,CharProp_Display_Outdoors,CharProp_Emotion_Blush
LoadTextEntry $014C, TextBank_0D
Sleep 310
LoadTextEntry $0004, TextBank_0D
Sleep 190
UpdateCharacterEmote CharProp_Emotion_Happy
LoadTextEntry $014D, TextBank_0D
Sleep 550
LoadTextEntry $014E, TextBank_0D
Sleep 190
LoadTextEntry $014F, TextBank_0D
Sleep 490
LoadTextEntry $0150, TextBank_0D
Sleep 130
UpdateCharacterEmote CharProp_Emotion_Normal
LoadTextEntry $0151, TextBank_0D
Sleep 270
LoadTextEntry $0152, TextBank_0D
Sleep 110
LoadTextEntry $0153, TextBank_0D
Sleep 250
LoadTextEntry $0152, TextBank_0D
Sleep 130
LoadTextEntry $0154, TextBank_0D
Sleep 190
LoadTextEntry $0155, TextBank_0D
Sleep 250
LoadTextEntry $0156, TextBank_0D
Sleep 490
PlayMusic Music_0C
UpdateCharacterEmote CharProp_Emotion_Blush
LoadTextEntry $0157, TextBank_0D
Sleep 190
LoadTextEntry $0158, TextBank_0D
Sleep 118
LoadTextEntry $0159, TextBank_0D
Sleep 610
LoadTextEntry $015A, TextBank_0D
Sleep 610
LoadTextEntry $015B, TextBank_0D
Sleep 250
LoadTextEntry $015C, TextBank_0D
Sleep 250
LoadTextEntry $015D, TextBank_0D
Sleep 250
LoadTextEntry $015E, TextBank_0D
Sleep 330
LoadTextEntry $015F, TextBank_0D
Sleep 178
LoadTextEntry $0160, TextBank_0D
Sleep 380
LoadTextEntry $0161, TextBank_0D
Sleep 190
LoadTextEntry $0162, TextBank_0D
Sleep 270
LoadTextEntry $0163, TextBank_0D
Sleep 310
ScriptBranch ScriptLabel_1D_5567

ScriptLabel_1D_4CAE:
LoadBackground BG_Park
SceneFadeIn
LoadTextEntry $014A, TextBank_0D
Sleep 188
LoadTextEntry $014B, TextBank_0D
Sleep 168
FixedLoadCharacter CharProp_Character_Momoyo,CharProp_Display_Outdoors,CharProp_Emotion_Normal
LoadTextEntry $0164, TextBank_0D
Sleep 368
LoadTextEntry $0165, TextBank_0D
Sleep 240
LoadTextEntry $0166, TextBank_0D
Sleep 240
LoadTextEntry $0167, TextBank_0D
Sleep 368
LoadTextEntry $0168, TextBank_0D
Sleep 368
LoadTextEntry $0169, TextBank_0D
Sleep 108
UpdateCharacterEmote CharProp_Emotion_Happy
LoadTextEntry $016A, TextBank_0D
Sleep 608
LoadTextEntry $016B, TextBank_0D
Sleep 333
LoadTextEntry $016C, TextBank_0D
Sleep 188
LoadTextEntry $016D, TextBank_0D
Sleep 368
UpdateCharacterEmote CharProp_Emotion_Blush
LoadTextEntry $016E, TextBank_0D
Sleep 248
LoadTextEntry $016F, TextBank_0D
Sleep 248
UpdateCharacterEmote CharProp_Emotion_Happy
LoadTextEntry $0170, TextBank_0D
Sleep 428
LoadTextEntry $0171, TextBank_0D
Sleep 248
LoadTextEntry $0172, TextBank_0D
Sleep 428
LoadTextEntry $0173, TextBank_0D
Sleep 248
UpdateCharacterEmote CharProp_Emotion_Blush
LoadTextEntry $0174, TextBank_0D
Sleep 248
RemoveCharacter
LoadTextEntry $0175, TextBank_0D
Sleep 188
LoadTextEntry $0176, TextBank_0D
Sleep 248
LoadTextEntry $0032, TextBank_0D
Sleep 308
ScriptBranch ScriptLabel_1D_5567

ScriptLabel_1D_4D40:
ModifyVariable_StoreToVar8Bit ScriptTEMP_D323, $01
LoadBackground BG_SchoolRooftop
SceneFadeIn
LoadTextEntry $0000, TextBank_0D
Sleep 278
LoadTextEntry $0001, TextBank_0D
Sleep 188
LoadTextEntry $0002, TextBank_0D
Sleep 188
FixedLoadCharacter CharProp_Character_Ruruna,CharProp_Display_School,CharProp_Emotion_Normal
LoadTextEntry $0003, TextBank_0D
Sleep 188
LoadTextEntry $0004, TextBank_0D
Sleep 188
LoadTextEntry $0005, TextBank_0D
Sleep 368
LoadTextEntry $0006, TextBank_0D
Sleep 608
LoadTextEntry $0007, TextBank_0D
Sleep 608
LoadTextEntry $0008, TextBank_0D
Sleep 538
LoadTextEntry $0009, TextBank_0D
Sleep 248
UpdateCharacterEmote CharProp_Emotion_Upset
LoadTextEntry $000A, TextBank_0D
Sleep 608
LoadTextEntry $000B, TextBank_0D
Sleep 608
LoadTextEntry $000C, TextBank_0D
Sleep 188
LoadTextEntry $000D, TextBank_0D
Sleep 608
LoadTextEntry $000E, TextBank_0D
Sleep 608
LoadTextEntry $000F, TextBank_0D
Sleep 608
LoadTextEntry $0010, TextBank_0D
Sleep 188
UpdateCharacterEmote CharProp_Emotion_Blush
LoadTextEntry $0011, TextBank_0D
PlayMusic Music_0C
Sleep 368
LoadTextEntry $0012, TextBank_0D
Sleep 368
LoadTextEntry $0013, TextBank_0D
Sleep 368
LoadTextEntry $0014, TextBank_0D
Sleep 368
UpdateCharacterEmote CharProp_Emotion_Sad
LoadTextEntry $0015, TextBank_0D
Sleep 608
LoadTextEntry $0016, TextBank_0D
Sleep 208
LoadTextEntry $0017, TextBank_0D
Sleep 428
LoadTextEntry $0018, TextBank_0D
Sleep 608
LoadTextEntry $0019, TextBank_0D
Sleep 758
LoadTextEntry $001A, TextBank_0D
Sleep 288
LoadTextEntry $001B, TextBank_0D
Sleep 228
LoadTextEntry $001C, TextBank_0D
Sleep 288
LoadTextEntry $001D, TextBank_0D
Sleep 168
UpdateCharacterEmote CharProp_Emotion_Blush
LoadTextEntry $001E, TextBank_0D
Sleep 638
LoadTextEntry $001F, TextBank_0D
Sleep 368
LoadTextEntry $0020, TextBank_0D
Sleep 248
LoadTextEntry $0021, TextBank_0D
Sleep 308
ScriptBranch ScriptLabel_1D_5567

ScriptLabel_1D_4E1E:
LoadBackground BG_SchoolRooftop
SceneFadeIn
LoadTextEntry $0000, TextBank_0D
Sleep 253
LoadTextEntry $0001, TextBank_0D
Sleep 193
LoadTextEntry $0002, TextBank_0D
Sleep 193
FixedLoadCharacter CharProp_Character_Ruruna,CharProp_Display_School,CharProp_Emotion_Upset
PlayMusic Music_0C
LoadTextEntry $0003, TextBank_0D
Sleep 133
LoadTextEntry $0004, TextBank_0D
Sleep 253
LoadTextEntry $0022, TextBank_0D
Sleep 168
LoadTextEntry $0023, TextBank_0D
Sleep 493
LoadTextEntry $0024, TextBank_0D
Sleep 253
LoadTextEntry $0025, TextBank_0D
Sleep 373
LoadTextEntry $0026, TextBank_0D
Sleep 173
LoadTextEntry $0027, TextBank_0D
Sleep 613
LoadTextEntry $0028, TextBank_0D
Sleep 433
LoadTextEntry $0029, TextBank_0D
Sleep 493
LoadTextEntry $002A, TextBank_0D
Sleep 193
LoadTextEntry $002B, TextBank_0D
Sleep 133
LoadTextEntry $002C, TextBank_0D
Sleep 193
UpdateCharacterEmote CharProp_Emotion_Happy
LoadTextEntry $002D, TextBank_0D
Sleep 193
LoadTextEntry $002E, TextBank_0D
Sleep 373
UpdateCharacterEmote CharProp_Emotion_Normal
LoadTextEntry $002F, TextBank_0D
Sleep 253
UpdateCharacterEmote CharProp_Emotion_Blush
LoadTextEntry $0030, TextBank_0D
Sleep 388
LoadTextEntry $0031, TextBank_0D
Sleep 313
LoadTextEntry $0032, TextBank_0D
Sleep 413
ScriptBranch ScriptLabel_1D_5567

ScriptLabel_1D_4EB0:
ModifyVariable_StoreToVar8Bit ScriptTEMP_D323, $01
LoadBackground BG_River
SceneFadeIn
LoadTextEntry $0033, TextBank_0D
Sleep 188
FixedLoadCharacter CharProp_Character_Mizuki,CharProp_Display_School,CharProp_Emotion_Blush
LoadTextEntry $0034, TextBank_0D
Sleep 128
LoadTextEntry $0035, TextBank_0D
Sleep 128
LoadTextEntry $0004, TextBank_0D
Sleep 128
LoadTextEntry $0036, TextBank_0D
Sleep 368
LoadTextEntry $0037, TextBank_0D
Sleep 128
LoadTextEntry $0038, TextBank_0D
Sleep 368
LoadTextEntry $0039, TextBank_0D
Sleep 128
LoadTextEntry $003A, TextBank_0D
Sleep 368
LoadTextEntry $003B, TextBank_0D
Sleep 188
LoadTextEntry $003C, TextBank_0D
Sleep 488
UpdateCharacterEmote CharProp_Emotion_Upset
LoadTextEntry $003D, TextBank_0D
Sleep 428
LoadTextEntry $003E, TextBank_0D
Sleep 248
LoadTextEntry $003F, TextBank_0D
Sleep 488
LoadTextEntry $0040, TextBank_0D
Sleep 128
LoadTextEntry $0041, TextBank_0D
Sleep 368
LoadTextEntry $0042, TextBank_0D
Sleep 308
LoadTextEntry $0043, TextBank_0D
Sleep 128
LoadTextEntry $0044, TextBank_0D
Sleep 188
LoadTextEntry $0045, TextBank_0D
Sleep 128
LoadTextEntry $0046, TextBank_0D
Sleep 188
LoadTextEntry $0047, TextBank_0D
Sleep 188
UpdateCharacterEmote CharProp_Emotion_Blush
LoadTextEntry $0048, TextBank_0D
PlayMusic Music_0C
Sleep 248
LoadTextEntry $0049, TextBank_0D
Sleep 188
LoadTextEntry $004A, TextBank_0D
Sleep 368
LoadTextEntry $004B, TextBank_0D
Sleep 308
LoadTextEntry $004C, TextBank_0D
Sleep 308
LoadTextEntry $004D, TextBank_0D
Sleep 365
LoadTextEntry $0034, TextBank_0D
Sleep 128
LoadTextEntry $004E, TextBank_0D
Sleep 188
LoadTextEntry $004F, TextBank_0D
Sleep 248
LoadTextEntry $0050, TextBank_0D
Sleep 368
LoadTextEntry $0051, TextBank_0D
Sleep 308
LoadTextEntry $0052, TextBank_0D
Sleep 408
ScriptBranch ScriptLabel_1D_5567

ScriptLabel_1D_4F8C:
PlayMusic Music_0D
LoadBackground BG_River
SceneFadeIn
LoadTextEntry $0033, TextBank_0D
Sleep 185
LoadTextEntry $0034, TextBank_0D
Sleep 125
FixedLoadCharacter CharProp_Character_Mizuki,CharProp_Display_School,CharProp_Emotion_Normal
LoadTextEntry $0035, TextBank_0D
Sleep 125
LoadTextEntry $0004, TextBank_0D
Sleep 185
LoadTextEntry $0036, TextBank_0D
Sleep 305
LoadTextEntry $0057, TextBank_0D
Sleep 245
LoadTextEntry $0058, TextBank_0D
Sleep 365
LoadTextEntry $0059, TextBank_0D
Sleep 245
LoadTextEntry $005A, TextBank_0D
Sleep 305
LoadTextEntry $005B, TextBank_0D
Sleep 605
LoadTextEntry $005C, TextBank_0D
Sleep 245
UpdateCharacterEmote CharProp_Emotion_Happy
LoadTextEntry $005D, TextBank_0D
Sleep 305
LoadTextEntry $005E, TextBank_0D
Sleep 245
UpdateCharacterEmote CharProp_Emotion_Upset
LoadTextEntry $005F, TextBank_0D
Sleep 425
UpdateCharacterEmote CharProp_Emotion_Blush
LoadTextEntry $0061, TextBank_0D
Sleep 605
RemoveCharacter
LoadTextEntry $0062, TextBank_0D
Sleep 245
LoadTextEntry $0063, TextBank_0D
Sleep 365
LoadTextEntry $0032, TextBank_0D
Sleep 405
ScriptBranch ScriptLabel_1D_5567

ScriptLabel_1D_5007:
ModifyVariable_StoreToVar8Bit ScriptTEMP_D323, $01
LoadBackground BG_ScenicRoadWithered
SceneFadeIn
LoadTextEntry $006E, TextBank_0D
Sleep 245
LoadTextEntry $006F, TextBank_0D
Sleep 185
FixedLoadCharacter CharProp_Character_Yumi,CharProp_Display_Outdoors,CharProp_Emotion_Blush
LoadTextEntry $0070, TextBank_0D
Sleep 185
LoadTextEntry $0071, TextBank_0D
Sleep 425
LoadTextEntry $0072, TextBank_0D
Sleep 545
LoadTextEntry $0073, TextBank_0D
Sleep 245
LoadTextEntry $0074, TextBank_0D
Sleep 425
LoadTextEntry $0075, TextBank_0D
Sleep 185
UpdateCharacterEmote CharProp_Emotion_Normal
LoadTextEntry $0076, TextBank_0D
Sleep 425
LoadTextEntry $0077, TextBank_0D
Sleep 185
LoadTextEntry $0078, TextBank_0D
Sleep 545
LoadTextEntry $0079, TextBank_0D
Sleep 185
LoadTextEntry $007A, TextBank_0D
Sleep 305
LoadTextEntry $007B, TextBank_0D
Sleep 125
LoadTextEntry $007C, TextBank_0D
Sleep 545
LoadTextEntry $007D, TextBank_0D
Sleep 425
LoadTextEntry $007E, TextBank_0D
Sleep 125
LoadTextEntry $007F, TextBank_0D
Sleep 545
LoadTextEntry $0080, TextBank_0D
Sleep 485
UpdateCharacterEmote CharProp_Emotion_Blush
PlayMusic Music_0C
LoadTextEntry $0081, TextBank_0D
Sleep 125
LoadTextEntry $0082, TextBank_0D
Sleep 305
LoadTextEntry $0083, TextBank_0D
Sleep 305
UpdateCharacterEmote CharProp_Emotion_Sad
LoadTextEntry $0084, TextBank_0D
Sleep 245
LoadTextEntry $0085, TextBank_0D
Sleep 305
LoadTextEntry $0086, TextBank_0D
Sleep 245
LoadTextEntry $0087, TextBank_0D
Sleep 305
LoadTextEntry $0088, TextBank_0D
Sleep 305
LoadTextEntry $0089, TextBank_0D
Sleep 405
ScriptBranch ScriptLabel_1D_5567

ScriptLabel_1D_50C0:
LoadBackground BG_ScenicRoadWithered
SceneFadeIn
LoadTextEntry $006E, TextBank_0D
Sleep 245
LoadTextEntry $006F, TextBank_0D
Sleep 185
LoadTextEntry $008A, TextBank_0D
Sleep 185
FixedLoadCharacter CharProp_Character_Yumi,CharProp_Display_Outdoors,CharProp_Emotion_Normal
PlayMusic Music_0C
LoadTextEntry $008B, TextBank_0D
Sleep 305
LoadTextEntry $008C, TextBank_0D
Sleep 245
LoadTextEntry $008D, TextBank_0D
Sleep 365
LoadTextEntry $008E, TextBank_0D
Sleep 185
UpdateCharacterEmote CharProp_Emotion_Happy
LoadTextEntry $008F, TextBank_0D
Sleep 485
LoadTextEntry $0090, TextBank_0D
Sleep 245
UpdateCharacterEmote CharProp_Emotion_Normal
LoadTextEntry $0091, TextBank_0D
Sleep 425
LoadTextEntry $0092, TextBank_0D
Sleep 545
LoadTextEntry $0093, TextBank_0D
Sleep 185
UpdateCharacterEmote CharProp_Emotion_Blush
LoadTextEntry $0094, TextBank_0D
Sleep 545
LoadTextEntry $0095, TextBank_0D
Sleep 305
UpdateCharacterEmote CharProp_Emotion_Normal
LoadTextEntry $0096, TextBank_0D
Sleep 305
LoadTextEntry $0097, TextBank_0D
Sleep 365
LoadTextEntry $0098, TextBank_0D
Sleep 605
UpdateCharacterEmote CharProp_Emotion_Blush
LoadTextEntry $0099, TextBank_0D
Sleep 545
RemoveCharacter
LoadTextEntry $009A, TextBank_0D
Sleep 245
LoadTextEntry $0032, TextBank_0D
Sleep 405
ScriptBranch ScriptLabel_1D_5567

ScriptLabel_1D_5149:
ModifyVariable_StoreToVar8Bit ScriptTEMP_D323, $01
LoadBackground BG_Schoolyard
SceneFadeIn
LoadTextEntry $00A0, TextBank_0D
Sleep 313
FixedLoadCharacter CharProp_Character_Miri,CharProp_Display_School,CharProp_Emotion_Normal
LoadTextEntry $00A1, TextBank_0D
Sleep 193
LoadTextEntry $0004, TextBank_0D
Sleep 193
LoadTextEntry $00A2, TextBank_0D
Sleep 433
LoadTextEntry $009F, TextBank_0D
Sleep 253
LoadTextEntry $00A3, TextBank_0D
Sleep 313
LoadTextEntry $00A4, TextBank_0D
Sleep 373
LoadTextEntry $00A5, TextBank_0D
Sleep 193
LoadTextEntry $00A6, TextBank_0D
Sleep 493
LoadTextEntry $00A7, TextBank_0D
Sleep 253
LoadTextEntry $00A8, TextBank_0D
Sleep 553
LoadTextEntry $00A9, TextBank_0D
Sleep 133
LoadTextEntry $00AA, TextBank_0D
Sleep 613
LoadTextEntry $00AB, TextBank_0D
Sleep 613
LoadTextEntry $00AC, TextBank_0D
Sleep 613
LoadTextEntry $00AD, TextBank_0D
Sleep 133
UpdateCharacterEmote CharProp_Emotion_Sad
LoadTextEntry $00AE, TextBank_0D
Sleep 433
PlayMusic Music_0C
LoadTextEntry $00AF, TextBank_0D
Sleep 253
LoadTextEntry $00B0, TextBank_0D
Sleep 253
LoadTextEntry $00B1, TextBank_0D
Sleep 193
LoadTextEntry $00B2, TextBank_0D
Sleep 493
LoadTextEntry $00B3, TextBank_0D
Sleep 553
LoadTextEntry $00B4, TextBank_0D
Sleep 193
RemoveCharacter
Sleep 1
SetCharacterCoords $80, $38
FixedLoadCharacter CharProp_Character_Miri,CharProp_Display_Sideview,CharProp_Emotion_Sad
LoadTextEntry $00B5, TextBank_0D
Sleep 313
LoadTextEntry $00B6, TextBank_0D
Sleep 313
LoadTextEntry $00B7, TextBank_0D
Sleep 313
LoadTextEntry $00B8, TextBank_0D
Sleep 313
LoadTextEntry $00B9, TextBank_0D
Sleep 413
ScriptBranch ScriptLabel_1D_5567

ScriptLabel_1D_520B:
LoadBackground BG_Schoolyard
SceneFadeIn
LoadTextEntry $00A0, TextBank_0D
Sleep 248
FixedLoadCharacter CharProp_Character_Miri,CharProp_Display_School,CharProp_Emotion_Normal
PlayMusic Music_0C
LoadTextEntry $00A1, TextBank_0D
Sleep 188
LoadTextEntry $0004, TextBank_0D
Sleep 188
LoadTextEntry $00BA, TextBank_0D
Sleep 308
LoadTextEntry $00BB, TextBank_0D
Sleep 248
LoadTextEntry $00BC, TextBank_0D
Sleep 428
LoadTextEntry $00BD, TextBank_0D
Sleep 188
LoadTextEntry $00BE, TextBank_0D
Sleep 488
LoadTextEntry $00BF, TextBank_0D
Sleep 308
LoadTextEntry $00C0, TextBank_0D
Sleep 188
LoadTextEntry $00C1, TextBank_0D
Sleep 488
LoadTextEntry $00C2, TextBank_0D
Sleep 608
LoadTextEntry $00C3, TextBank_0D
Sleep 308
LoadTextEntry $00C4, TextBank_0D
Sleep 248
UpdateCharacterEmote CharProp_Emotion_Happy
LoadTextEntry $00C5, TextBank_0D
Sleep 308
LoadTextEntry $00C6, TextBank_0D
Sleep 248
LoadTextEntry $00C7, TextBank_0D
Sleep 128
UpdateCharacterEmote CharProp_Emotion_Normal
LoadTextEntry $00C8, TextBank_0D
Sleep 128
LoadTextEntry $00C9, TextBank_0D
Sleep 128
UpdateCharacterEmote CharProp_Emotion_Blush
LoadTextEntry $00CA, TextBank_0D
Sleep 308
LoadTextEntry $00CB, TextBank_0D
Sleep 188
LoadTextEntry $00CC, TextBank_0D
Sleep 368
LoadTextEntry $0032, TextBank_0D
Sleep 368
ScriptBranch ScriptLabel_1D_5567

ScriptLabel_1D_52A3:
ModifyVariable_StoreToVar8Bit ScriptTEMP_D323, $01
LoadBackground BG_Cafe
SceneFadeIn
LoadTextEntry $00D2, TextBank_0D
Sleep 188
LoadTextEntry $00D3, TextBank_0D
Sleep 248
FixedLoadCharacter CharProp_Character_Mari,CharProp_Display_Outdoors,CharProp_Emotion_Blush
LoadTextEntry $00D4, TextBank_0D
Sleep 368
LoadTextEntry $0004, TextBank_0D
Sleep 188
UpdateCharacterEmote CharProp_Emotion_Normal
LoadTextEntry $00D5, TextBank_0D
Sleep 608
LoadTextEntry $00D6, TextBank_0D
Sleep 248
LoadTextEntry $00D7, TextBank_0D
Sleep 368
LoadTextEntry $00D8, TextBank_0D
Sleep 188
LoadTextEntry $00D9, TextBank_0D
Sleep 428
LoadTextEntry $00DA, TextBank_0D
Sleep 128
LoadTextEntry $00DB, TextBank_0D
Sleep 488
LoadTextEntry $00DC, TextBank_0D
Sleep 188
UpdateCharacterEmote CharProp_Emotion_Blush
LoadTextEntry $00DD, TextBank_0D
Sleep 488
LoadTextEntry $00DE, TextBank_0D
Sleep 248
LoadTextEntry $00DF, TextBank_0D
Sleep 308
LoadTextEntry $00E0, TextBank_0D
Sleep 188
LoadTextEntry $00E1, TextBank_0D
Sleep 368
LoadTextEntry $00D1, TextBank_0D
Sleep 188
PlayMusic Music_0C
LoadTextEntry $00E2, TextBank_0D
Sleep 188
LoadTextEntry $00E3, TextBank_0D
Sleep 248
LoadTextEntry $00E4, TextBank_0D
Sleep 248
LoadTextEntry $00E5, TextBank_0D
Sleep 488
LoadTextEntry $00E6, TextBank_0D
Sleep 248
LoadTextEntry $00E7, TextBank_0D
Sleep 188
LoadTextEntry $00E8, TextBank_0D
Sleep 188
LoadTextEntry $00E9, TextBank_0D
Sleep 368
LoadTextEntry $00EA, TextBank_0D
Sleep 248
LoadTextEntry $00EB, TextBank_0D
Sleep 188
LoadTextEntry $00EC, TextBank_0D
Sleep 408
ScriptBranch ScriptLabel_1D_5567

ScriptLabel_1D_5361:
LoadBackground BG_Cafe
SceneFadeIn
LoadTextEntry $00D2, TextBank_0D
Sleep 188
LoadTextEntry $00D3, TextBank_0D
Sleep 248
FixedLoadCharacter CharProp_Character_Mari,CharProp_Display_Outdoors,CharProp_Emotion_Happy
PlayMusic Music_0C
LoadTextEntry $00D4, TextBank_0D
Sleep 248
LoadTextEntry $0004, TextBank_0D
Sleep 248
LoadTextEntry $00ED, TextBank_0D
Sleep 308
LoadTextEntry $00EE, TextBank_0D
Sleep 248
UpdateCharacterEmote CharProp_Emotion_Upset
LoadTextEntry $00EF, TextBank_0D
Sleep 308
LoadTextEntry $00F0, TextBank_0D
Sleep 188
UpdateCharacterEmote CharProp_Emotion_Normal
LoadTextEntry $00F1, TextBank_0D
Sleep 488
LoadTextEntry $00F2, TextBank_0D
Sleep 188
UpdateCharacterEmote CharProp_Emotion_Happy
LoadTextEntry $00F3, TextBank_0D
Sleep 428
LoadTextEntry $00F4, TextBank_0D
Sleep 188
LoadTextEntry $00F5, TextBank_0D
Sleep 368
LoadTextEntry $00F6, TextBank_0D
Sleep 188
LoadTextEntry $00F7, TextBank_0D
Sleep 248
LoadTextEntry $00F8, TextBank_0D
Sleep 308
LoadTextEntry $00F9, TextBank_0D
Sleep 128
LoadTextEntry $00FA, TextBank_0D
Sleep 248
LoadTextEntry $00FB, TextBank_0D
Sleep 128
UpdateCharacterEmote CharProp_Emotion_Blush
LoadTextEntry $00FC, TextBank_0D
Sleep 368
LoadTextEntry $00FD, TextBank_0D
Sleep 128
SceneFadeOut
RemoveCharacter
LoadBackground BG_CafeEntrance
LoadTextEntry $00FE, TextBank_0D
SceneFadeIn
Sleep 188
LoadTextEntry $00FF, TextBank_0D
Sleep 188
LoadTextEntry $0100, TextBank_0D
Sleep 248
LoadTextEntry $0032, TextBank_0D
Sleep 308
ScriptBranch ScriptLabel_1D_5567

ScriptLabel_1D_540C:
ModifyVariable_StoreToVar8Bit ScriptTEMP_D323, $01
LoadBackground BG_Classroom
SceneFadeIn
LoadTextEntry $010E, TextBank_0D
Sleep 188
LoadTextEntry $010F, TextBank_0D
Sleep 188
FixedLoadCharacter CharProp_Character_Suzune,CharProp_Display_School,CharProp_Emotion_Normal
LoadTextEntry $0110, TextBank_0D
Sleep 308
LoadTextEntry $0004, TextBank_0D
Sleep 188
UpdateCharacterEmote CharProp_Emotion_Sad
LoadTextEntry $0111, TextBank_0D
Sleep 368
LoadTextEntry $0112, TextBank_0D
Sleep 248
LoadTextEntry $0113, TextBank_0D
Sleep 488
LoadTextEntry $0114, TextBank_0D
Sleep 488
LoadTextEntry $0115, TextBank_0D
Sleep 188
LoadTextEntry $0116, TextBank_0D
Sleep 428
LoadTextEntry $0117, TextBank_0D
Sleep 248
LoadTextEntry $0118, TextBank_0D
Sleep 608
LoadTextEntry $0119, TextBank_0D
Sleep 368
LoadTextEntry $011A, TextBank_0D
Sleep 128
LoadTextEntry $011B, TextBank_0D
Sleep 548
LoadTextEntry $011C, TextBank_0D
Sleep 128
LoadTextEntry $011D, TextBank_0D
Sleep 428
LoadTextEntry $011E, TextBank_0D
Sleep 368
UpdateCharacterEmote CharProp_Emotion_Blush
LoadTextEntry $011F, TextBank_0D
Sleep 188
PlayMusic Music_0C
LoadTextEntry $0120, TextBank_0D
Sleep 188
LoadTextEntry $0121, TextBank_0D
Sleep 248
LoadTextEntry $0122, TextBank_0D
Sleep 188
UpdateCharacterEmote CharProp_Emotion_Sad
LoadTextEntry $0123, TextBank_0D
Sleep 560
LoadTextEntry $0124, TextBank_0D
Sleep 210
LoadTextEntry $0125, TextBank_0D
Sleep 210
LoadTextEntry $0126, TextBank_0D
Sleep 480
LoadTextEntry $0127, TextBank_0D
Sleep 420
LoadTextEntry $0128, TextBank_0D
Sleep 240
LoadTextEntry $0129, TextBank_0D
Sleep 240
LoadTextEntry $012A, TextBank_0D
Sleep 400
ScriptBranch ScriptLabel_1D_5567

ScriptLabel_1D_54D1:
LoadBackground BG_Classroom
SceneFadeIn
LoadTextEntry $010E, TextBank_0D
Sleep 188
LoadTextEntry $010F, TextBank_0D
Sleep 188
FixedLoadCharacter CharProp_Character_Suzune,CharProp_Display_School,CharProp_Emotion_Happy
PlayMusic Music_0C
LoadTextEntry $0110, TextBank_0D
Sleep 308
LoadTextEntry $012B, TextBank_0D
Sleep 188
UpdateCharacterEmote CharProp_Emotion_Normal
LoadTextEntry $012C, TextBank_0D
Sleep 188
LoadTextEntry $012D, TextBank_0D
Sleep 248
LoadTextEntry $012E, TextBank_0D
Sleep 428
LoadTextEntry $012F, TextBank_0D
Sleep 128
LoadTextEntry $0130, TextBank_0D
Sleep 428
LoadTextEntry $0131, TextBank_0D
Sleep 188
UpdateCharacterEmote CharProp_Emotion_Sad
LoadTextEntry $0132, TextBank_0D
Sleep 548
LoadTextEntry $0133, TextBank_0D
Sleep 188
LoadTextEntry $0134, TextBank_0D
Sleep 368
LoadTextEntry $0135, TextBank_0D
Sleep 608
LoadTextEntry $0136, TextBank_0D
Sleep 248
UpdateCharacterEmote CharProp_Emotion_Happy
LoadTextEntry $0137, TextBank_0D
Sleep 308
LoadTextEntry $0138, TextBank_0D
Sleep 248
LoadTextEntry $0139, TextBank_0D
Sleep 428
LoadTextEntry $013A, TextBank_0D
Sleep 128
UpdateCharacterEmote CharProp_Emotion_Blush
LoadTextEntry $013B, TextBank_0D
Sleep 368
LoadTextEntry $013C, TextBank_0D
Sleep 248
LoadTextEntry $013D, TextBank_0D
Sleep 248
LoadTextEntry $0032, TextBank_0D
Sleep 408

;queue credits
ScriptLabel_1D_5567:
SceneFadeOut
ClearTileLines $00, $00, $14, $12
ScriptBranch_VarEqualVal8Bit CurrentSave_CDLinkFlag, $00, ScriptLabel_1D_557F
RemoveCharacter
ForceTextPrintPosition $00, $00
SceneFadeIn
LoadTextEntry $0201, TextBank_08
SceneFadeOut

ScriptLabel_1D_557F:
LoadBackground BG_SakuraWoods
ModifyVariable_StoreToVar8Bit CurrentCharacter_Display, CharProp_Display_School
UpdateCharacterEmote CharProp_Emotion_Happy
LoadTextEntry $0177, TextBank_0D
SceneFadeIn
Sleep 200
ModifyVariable_StoreToVar8Bit ScriptTEMP_D327, $00
ModifyVariable_StoreToVar8Bit ScriptTEMP_D329, $01
ModifyVariable_StoreToVar16Bit ScriptTEMP_D32B, $0178
ExecuteSubScript SubScript_1D_5ABD
ExecuteSubScript SubScript_1D_5ABD
ExecuteSubScript SubScript_1D_5ABD
ExecuteSubScript SubScript_1D_5ABD
ExecuteSubScript SubScript_1D_5ABD
ExecuteSubScript SubScript_1D_5ABD
ExecuteSubScript SubScript_1D_5ABD
SceneFadeOut
LoadBackground BG_ShrinePhoto
RemoveCharacter
ScriptBranch_VarEqualVal8Bit CurrentSave_ShrinePhotoCharacter, $FF, ScriptLabel_1D_55C2
SetCharacterCoords $70, $38
ModifyVariable_StoreToVar8Bit CurrentCharacter_Display, CharProp_Display_School
UpdateCharacterEmote CharProp_Emotion_Happy
VariableLoadCharacter CurrentSave_ShrinePhotoCharacter

ScriptLabel_1D_55C2:
LoadVariableTextEntry TextBank_0D, ScriptTEMP_D32B, $00
ModifyVariable_AddToVar16Bit ScriptTEMP_D32B, $01
SceneFadeIn
Sleep 200
ModifyVariable_StoreToVar8Bit ScriptTEMP_D327, $00
ExecuteSubScript SubScript_1D_5ABD
ExecuteSubScript SubScript_1D_5ABD
ExecuteSubScript SubScript_1D_5ABD
ExecuteSubScript SubScript_1D_5ABD
ExecuteSubScript SubScript_1D_5ABD
ExecuteSubScript SubScript_1D_5ABD
ExecuteSubScript SubScript_1D_5ABD
SceneFadeOut
LoadBackground BG_Spotlight
SetCharacterCoords $50, $38
ModifyVariable_StoreToVar8Bit CurrentCharacter_Display, CharProp_Display_Outdoors
UpdateCharacterEmote CharProp_Emotion_Blush
VariableLoadCharacter ScriptTEMP_D321
LoadVariableTextEntry TextBank_0D, ScriptTEMP_D32B, $00
SceneFadeIn
Sleep 500
EndScript
LoadTextEntry $01EF, TextBank_08
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, $00, ScriptLabel_1D_4283
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, $01, ScriptLabel_1D_436A
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, $02, ScriptLabel_1D_4431
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, $03, ScriptLabel_1D_4516
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, $04, ScriptLabel_1D_45C6
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, $05, ScriptLabel_1D_4688
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, $06, ScriptLabel_1D_4746
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, $07, ScriptLabel_1D_4811
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, $08, ScriptLabel_1D_48DE
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, $09, ScriptLabel_1D_49A5
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, $0A, ScriptLabel_1D_4A85
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, $0B, ScriptLabel_1D_4B53
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, $0C, ScriptLabel_1D_40FA
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, $0D, ScriptLabel_1D_41BC

;debug script, used to view backgrounds and characters
;ScriptTEMP_D31B - background
;ScriptTEMP_D31D - character
;ScriptTEMP_D31F - character outfit (only uses first 3 values of 
;ScriptTEMP_D321 - character emote
;if background value is 255, quit debug script
;the script will rotate character attributes automatically. the script will go through all character emotes, then changes outfit. after all outfits, changes character
;Note 1: This script only allows to view all backgrounds except for ones used in the intro.
;Note 2: The outfit is only limited to 4 standard choices, and the outdoors appearance is still tied to in-game time. That means intro and special sprites are inaccessible.
Debug_BGAndCharViewer_1D_564C:
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31B, $00
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31D, $00
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31F, $00
ModifyVariable_StoreToVar8Bit ScriptTEMP_D321, $00

ScriptLabel_1D_5658:
ClearTileLines $01, $0C, $12, $05
LoadBackground ScriptTEMP_D31B
ForceTextPrintPosition $00, $00
VariableSceneFadeIn $80
LoadTextEntry $01BD, TextBank_04
Debug_VariableEditor ScriptTEMP_D31B

LoadTextEntry $01BE, TextBank_04
Debug_VariableEditor ScriptTEMP_D31D

LoadTextEntry $01BF, TextBank_04
Debug_VariableEditor ScriptTEMP_D31F

LoadTextEntry $01C0, TextBank_04
Debug_VariableEditor ScriptTEMP_D321

ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, $FF, ScriptLabel_1D_56C3
ScriptBranch_VarLessVal8Bit ScriptTEMP_D31B, $48, ScriptLabel_1D_568E ;prevent background value overflow
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31B, $00

ScriptLabel_1D_568E:
ScriptBranch_VarLessVal8Bit ScriptTEMP_D321, CharProp_Emotion_Sad+1, ScriptLabel_1D_5699
ModifyVariable_StoreToVar8Bit ScriptTEMP_D321, CharProp_Emotion_Normal ;prevent character emote value overflow
ModifyVariable_AddToVar8Bit ScriptTEMP_D31F, $01 ;next outfit

ScriptLabel_1D_5699:
ScriptBranch_VarLessVal8Bit ScriptTEMP_D31F, CharProp_Display_Intro, ScriptLabel_1D_56A4
ModifyVariable_AddToVar8Bit ScriptTEMP_D31D, $01 ;next character
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31F, CharProp_Display_School

ScriptLabel_1D_56A4:
ScriptBranch_VarLessVal8Bit ScriptTEMP_D31D, CharProp_Character_Momoyo+1, ScriptLabel_1D_56B2
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31D, CharProp_Character_Ruruna
RemoveCharacter
VariableSceneFadeOut $80
ScriptBranch ScriptLabel_1D_5658

ScriptLabel_1D_56B2:
VariableSceneFadeOut $80
ModifyVariable_StoreToVarFromVar CurrentCharacter_Display, ScriptTEMP_D31F
ModifyVariable_StoreToVarFromVar CurrentCharacter_Expression, ScriptTEMP_D321
VariableLoadCharacter ScriptTEMP_D31D
ModifyVariable_AddToVar8Bit ScriptTEMP_D321, $01
ScriptBranch ScriptLabel_1D_5658

ScriptLabel_1D_56C3:
ExecuteSubScript SubScript_1D_5CBE
EndScript

;Placing hand on Ruruna's shoulder
TouchingShoulder_Ruruna_1D_56C7:
SceneFadeIn
LoadTextEntry $0013, TextBank_09
LoadTextEntry $0014, TextBank_09
LoadTextEntry $0015, TextBank_09
ExecuteSubScript SubScript_1D_590B
LoadTextEntry $0016, TextBank_09
ModifyVariable_LogicalANDVar16Bit ShoulderTouchEventBits, $FE
ExecuteSubScript SubScript_1D_5CBE
EndScript

;Placing hand on Mizuki's shoulder
TouchingShoulder_Mizuki_1D_56DF:
SceneFadeIn
LoadTextEntry $0013, TextBank_09
LoadTextEntry $0017, TextBank_09
LoadTextEntry $0018, TextBank_09
ExecuteSubScript SubScript_1D_590B
LoadTextEntry $0019, TextBank_09
ModifyVariable_LogicalANDVar16Bit ShoulderTouchEventBits, $FD
ExecuteSubScript SubScript_1D_5CBE
EndScript

;Placing hand on Yumi's shoulder
TouchingShoulder_Yumi_1D_56F7:
SceneFadeIn
LoadTextEntry $0013, TextBank_09
LoadTextEntry $001A, TextBank_09
LoadTextEntry $001B, TextBank_09
ExecuteSubScript SubScript_1D_590B
LoadTextEntry $001C, TextBank_09
ModifyVariable_LogicalANDVar16Bit ShoulderTouchEventBits, $FB
ExecuteSubScript SubScript_1D_5CBE
EndScript

;Placing hand on Miri's shoulder
TouchingShoulder_Miri_1D_570F:
SceneFadeIn
LoadTextEntry $0013, TextBank_09
LoadTextEntry $001D, TextBank_09
LoadTextEntry $001E, TextBank_09
ExecuteSubScript SubScript_1D_590B
LoadTextEntry $001F, TextBank_09
ModifyVariable_LogicalANDVar16Bit ShoulderTouchEventBits, $F7
ExecuteSubScript SubScript_1D_5CBE
EndScript

;Placing hand on Mari's shoulder
TouchingShoulder_Mari_1D_5727:
SceneFadeIn
LoadTextEntry $0013, TextBank_09
LoadTextEntry $0020, TextBank_09
LoadTextEntry $0021, TextBank_09
ExecuteSubScript SubScript_1D_590B
LoadTextEntry $0022, TextBank_09
ModifyVariable_LogicalANDVar16Bit ShoulderTouchEventBits, $EF
ExecuteSubScript SubScript_1D_5CBE
EndScript

;Placing hand on Suzune's shoulder
TouchingShoulder_Suzune_1D_573F:
SceneFadeIn
LoadTextEntry $0013, TextBank_09
LoadTextEntry $0023, TextBank_09
LoadTextEntry $0024, TextBank_09
ExecuteSubScript SubScript_1D_590B
LoadTextEntry $0025, TextBank_09
ModifyVariable_LogicalANDVar16Bit ShoulderTouchEventBits, $DF
ExecuteSubScript SubScript_1D_5CBE
EndScript

;Placing hand on Momoyo's shoulder
TouchingShoulder_Momoyo_1D_5757:
SceneFadeIn
LoadTextEntry $0013, TextBank_09
LoadTextEntry $0026, TextBank_09
LoadTextEntry $0027, TextBank_09
ExecuteSubScript SubScript_1D_590B
LoadTextEntry $0028, TextBank_09
ModifyVariable_LogicalANDVar16Bit ShoulderTouchEventBits, $BF
ExecuteSubScript SubScript_1D_5CBE
EndScript

;Hand touch event with Ruruna
TouchingHand_Ruruna_1D_576F:
SceneFadeIn
LoadTextEntry $0013, TextBank_09
LoadTextEntry $0029, TextBank_09
LoadTextEntry $002A, TextBank_09
ExecuteSubScript SubScript_1D_58C5
LoadTextEntry $002B, TextBank_09
ModifyVariable_LogicalANDVar16Bit $D445, $FE
ExecuteSubScript SubScript_1D_5CBE
EndScript

;Hand touch event with Mizuki
TouchingHand_Mizuki_1D_5787:
SceneFadeIn
LoadTextEntry $0013, TextBank_09
LoadTextEntry $0029, TextBank_09
LoadTextEntry $002C, TextBank_09
ExecuteSubScript SubScript_1D_58C5
LoadTextEntry $002D, TextBank_09
ModifyVariable_LogicalANDVar16Bit $D445, $FD
ExecuteSubScript SubScript_1D_5CBE
EndScript

;Hand touch event with Yumi
TouchingHand_Yumi_1D_579F:
SceneFadeIn
LoadTextEntry $0013, TextBank_09
LoadTextEntry $0029, TextBank_09
LoadTextEntry $002E, TextBank_09
ExecuteSubScript SubScript_1D_58C5
LoadTextEntry $002F, TextBank_09
ModifyVariable_LogicalANDVar16Bit $D445, $FB
ExecuteSubScript SubScript_1D_5CBE
EndScript

;Hand touch event with Miri
TouchingHand_Miri_1D_57B7:
SceneFadeIn
LoadTextEntry $0013, TextBank_09
LoadTextEntry $0029, TextBank_09
LoadTextEntry $0030, TextBank_09
ExecuteSubScript SubScript_1D_58C5
LoadTextEntry $0031, TextBank_09
ModifyVariable_LogicalANDVar16Bit $D445, $F7
ExecuteSubScript SubScript_1D_5CBE
EndScript

;Hand touch event with Mari
TouchingHand_Mari_1D_57CF:
SceneFadeIn
LoadTextEntry $0013, TextBank_09
LoadTextEntry $0029, TextBank_09
LoadTextEntry $0032, TextBank_09
ExecuteSubScript SubScript_1D_58C5
LoadTextEntry $0033, TextBank_09
ModifyVariable_LogicalANDVar16Bit $D445, $EF
ExecuteSubScript SubScript_1D_5CBE
EndScript

;Hand touch event with Suzune
TouchingHand_Suzune_1D_57E7:
SceneFadeIn
LoadTextEntry $0013, TextBank_09
LoadTextEntry $0029, TextBank_09
LoadTextEntry $0034, TextBank_09
ExecuteSubScript SubScript_1D_58C5
LoadTextEntry $0035, TextBank_09
ModifyVariable_LogicalANDVar16Bit $D445, $DF
ExecuteSubScript SubScript_1D_5CBE
EndScript

;Hand touch event with Momoyo
TouchingHand_Momoyo_1D_57FF:
SceneFadeIn
LoadTextEntry $0013, TextBank_09
LoadTextEntry $0029, TextBank_09
LoadTextEntry $0036, TextBank_09
ExecuteSubScript SubScript_1D_58C5
LoadTextEntry $0037, TextBank_09
ModifyVariable_LogicalANDVar16Bit $D445, $BF
ExecuteSubScript SubScript_1D_5CBE
EndScript

;A dummy script. For some reason, enables player choice but that doesn't affect anything (and there's no associated text)
PlaceholderScript_1D_5817:
VariableSceneFadeIn $80
EnablePlayerChoice_2Options $00
ExecuteSubScript SubScript_1D_5CBE
EndScript

ScriptBranch_VarLessVal8Bit DecisionVariable, $40, ScriptLabel_1D_5833
ScriptBranch_VarLessVal8Bit DecisionVariable, $80, ScriptLabel_1D_5837
ScriptBranch_VarLessVal8Bit DecisionVariable, $C0, ScriptLabel_1D_583B
ModifyVariable_StoreToVar8Bit DecisionVariable, $03
EndSubscript

ScriptLabel_1D_5833:
ModifyVariable_StoreToVar8Bit DecisionVariable, $00
EndSubscript

ScriptLabel_1D_5837:
ModifyVariable_StoreToVar8Bit DecisionVariable, $01
EndSubscript

ScriptLabel_1D_583B:
ModifyVariable_StoreToVar8Bit DecisionVariable, $02
EndSubscript

ScriptBranch_VarLessVal8Bit DecisionVariable, $55, ScriptLabel_1D_584D
ScriptBranch_VarLessVal8Bit DecisionVariable, $AA, ScriptLabel_1D_5851
ModifyVariable_StoreToVar8Bit DecisionVariable, $02
EndSubscript

ScriptLabel_1D_584D:
ModifyVariable_StoreToVar8Bit DecisionVariable, $00
EndSubscript

ScriptLabel_1D_5851:
ModifyVariable_StoreToVar8Bit DecisionVariable, $01
EndSubscript

ModifyVariable_8BitRNGStore ScriptTEMP_D31B
ScriptBranch_VarLessVal8Bit ScriptTEMP_D31B, $80, ScriptLabel_1D_5860
ModifyVariable_StoreToVar8Bit DecisionVariable, $00
EndSubscript

ScriptLabel_1D_5860:
ModifyVariable_StoreToVar8Bit DecisionVariable, $01
EndSubscript

SubScript_1D_5864:
ModifyVariable_8BitRNGStore ScriptTEMP_D31B
ScriptBranch_VarLessVal8Bit ScriptTEMP_D31B, $40, ScriptLabel_1D_586F
ModifyVariable_StoreToVar8Bit DecisionVariable, $00
EndSubscript

ScriptLabel_1D_586F:
ModifyVariable_StoreToVar8Bit DecisionVariable, $01
EndSubscript

ModifyVariable_8BitRNGStore ScriptTEMP_D31B
ModifyVariable_StoreToVar8Bit DecisionVariable, $00
ScriptBranch_VarLessVal8Bit ScriptTEMP_D31B, $24, ScriptLabel_1D_58A8
ModifyVariable_AddToVar8Bit DecisionVariable, $01
ScriptBranch_VarLessVal8Bit ScriptTEMP_D31B, $49, ScriptLabel_1D_58A8
ModifyVariable_AddToVar8Bit DecisionVariable, $01
ScriptBranch_VarLessVal8Bit ScriptTEMP_D31B, $6D, ScriptLabel_1D_58A8
ModifyVariable_AddToVar8Bit DecisionVariable, $01
ScriptBranch_VarLessVal8Bit ScriptTEMP_D31B, $92, ScriptLabel_1D_58A8
ModifyVariable_AddToVar8Bit DecisionVariable, $01
ScriptBranch_VarLessVal8Bit ScriptTEMP_D31B, $B6, ScriptLabel_1D_58A8
ModifyVariable_AddToVar8Bit DecisionVariable, $01
ScriptBranch_VarLessVal8Bit ScriptTEMP_D31B, $DB, ScriptLabel_1D_58A8
ModifyVariable_AddToVar8Bit DecisionVariable, $01

ScriptLabel_1D_58A8:
EndSubscript

ExecuteSubScript SubScript_1D_5864
ScriptBranch_VarEqualVal8Bit DecisionVariable, $00, ScriptLabel_1D_58C4
ScriptBranch_VarLessVal8Bit ScriptTEMP_D31F, $80, ScriptLabel_1D_58BB
ModifyVariable_LogicalORVar16Bit CurrentSave_AttendingParty, ScriptTEMP_D321
EndSubscript

ScriptLabel_1D_58BB:
ScriptBranch_VarLessVal8Bit ScriptTEMP_D31F, $40, ScriptLabel_1D_58C4
ModifyVariable_LogicalORVar16Bit $D3A5, ScriptTEMP_D321

ScriptLabel_1D_58C4:
EndSubscript

SubScript_1D_58C5:
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31B, $68
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31D, $38
SetCharacterCoords ScriptTEMP_D31B, ScriptTEMP_D31D
ModifyVariable_StoreToVar8Bit CurrentCharacter_Display, CharProp_Display_Special
UpdateCharacterEmote CharProp_Emotion_Normal
VariableLoadCharacter CharProp_Character_Mizuki ;this is Mizuki cosplaying as a hand sprite

ModifyVariable_StoreToVar8Bit ScriptTEMP_D31F, $58
ModifyVariable_StoreToVar8Bit ScriptTEMP_D321, $01
ExecuteSubScript SubScript_1D_596C
Sleep 20
UpdateCharacterEmote CharProp_Emotion_Upset
Sleep 15
UpdateCharacterEmote CharProp_Emotion_Happy
Sleep 10
UpdateCharacterEmote CharProp_Emotion_Upset
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31F, $60
ModifyVariable_StoreToVar8Bit ScriptTEMP_D321, $02
ExecuteSubScript SubScript_1D_597E
UpdateCharacterEmote CharProp_Emotion_Normal
Sleep 20
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31F, $58
ModifyVariable_StoreToVar8Bit ScriptTEMP_D321, $01
ExecuteSubScript SubScript_1D_596C
Sleep 30
UpdateCharacterEmote CharProp_Emotion_Upset
Sleep 20
UpdateCharacterEmote CharProp_Emotion_Happy
EndSubscript

SubScript_1D_590B:
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31B, $50
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31D, $48
SetCharacterCoords ScriptTEMP_D31B, ScriptTEMP_D31D
ModifyVariable_StoreToVar8Bit CurrentCharacter_Display, CharProp_Display_Special
UpdateCharacterEmote CharProp_Emotion_Blush
VariableLoadCharacter CharProp_Character_Yumi ;the hand is Yumi in disguise!
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31F, $4C
ModifyVariable_StoreToVar8Bit ScriptTEMP_D321, $04
ExecuteSubScript SubScript_1D_5990
UpdateCharacterEmote CharProp_Emotion_Happy
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31F, $48
ModifyVariable_StoreToVar8Bit ScriptTEMP_D321, $03
ExecuteSubScript SubScript_1D_5990
UpdateCharacterEmote CharProp_Emotion_Upset
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31F, $44
ModifyVariable_StoreToVar8Bit ScriptTEMP_D321, $02
ExecuteSubScript SubScript_1D_5990
UpdateCharacterEmote CharProp_Emotion_Normal
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31F, $40
ModifyVariable_StoreToVar8Bit ScriptTEMP_D321, $01
ExecuteSubScript SubScript_1D_596C
Sleep 10
UpdateCharacterEmote CharProp_Emotion_Upset
Sleep 6
SetCharacterCoords $41, $48
ExecuteSubScript SubScript_1D_597E
UpdateCharacterEmote CharProp_Emotion_Happy
Sleep 8
SetCharacterCoords $42, $48
ExecuteSubScript SubScript_1D_597E
UpdateCharacterEmote CharProp_Emotion_Blush
Sleep 10
SetCharacterCoords $43, $48
ExecuteSubScript SubScript_1D_597E
EndSubscript

SubScript_1D_596C:
Sleep 1
ModifyVariable_SubFromVar16Bit ScriptTEMP_D31B, ScriptTEMP_D321
SetCharacterCoords ScriptTEMP_D31B, ScriptTEMP_D31D
ScriptBranch_VarGreaterVar16Bit ScriptTEMP_D31B, ScriptTEMP_D31F, SubScript_1D_596C
EndSubscript

SubScript_1D_597E:
Sleep 1
ModifyVariable_AddToVar16Bit ScriptTEMP_D31B, ScriptTEMP_D321
SetCharacterCoords ScriptTEMP_D31B, ScriptTEMP_D31D
ScriptBranch_VarLessVar16Bit ScriptTEMP_D31B, ScriptTEMP_D31F, SubScript_1D_597E
EndSubscript

SubScript_1D_5990:
Sleep 1
ModifyVariable_SubFromVar16Bit ScriptTEMP_D31B, ScriptTEMP_D321
SetCharacterCoords ScriptTEMP_D31B, ScriptTEMP_D31D
Sleep 1
ModifyVariable_AddToVar16Bit ScriptTEMP_D31B, $01
SetCharacterCoords ScriptTEMP_D31B, ScriptTEMP_D31D
ScriptBranch_VarGreaterVar16Bit ScriptTEMP_D31B, ScriptTEMP_D31F, SubScript_1D_5990
EndSubscript

ScriptLabel_1D_59AE:
Sleep 1
ModifyVariable_AddToVar16Bit ScriptTEMP_D31B, ScriptTEMP_D321
SetCharacterCoords ScriptTEMP_D31B, ScriptTEMP_D31D
Sleep 1
ModifyVariable_SubFromVar16Bit ScriptTEMP_D31B, $01
SetCharacterCoords ScriptTEMP_D31B, ScriptTEMP_D31D
ScriptBranch_VarLessVar16Bit ScriptTEMP_D31B, ScriptTEMP_D31F, ScriptLabel_1D_59AE
EndSubscript
ScriptBranch_StrengthCheck DecisionVariable, ScriptLabel_1D_59D5
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31B, $10
EndSubscript

ScriptLabel_1D_59D5:
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31B, $08
EndSubscript
ModifyVariable_StoreToVar8Bit CurrentDateSpotStorageCopy_Ruruna, $00
ModifyVariable_StoreToVar8Bit CurrentDateSpotStorageCopy_Mizuki, $00
ModifyVariable_StoreToVar8Bit CurrentDateSpotStorageCopy_Yumi, $00
ModifyVariable_StoreToVar8Bit CurrentDateSpotStorageCopy_Miri, $00
ModifyVariable_StoreToVar8Bit CurrentDateSpotStorageCopy_Mari, $00
ModifyVariable_StoreToVar8Bit CurrentDateSpotStorageCopy_Suzune, $00
ModifyVariable_StoreToVar8Bit CurrentDateSpotStorageCopy_Momoyo, $00
EndSubscript

SubScript_1D_59EF:
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31D, $01
ScriptBranch_VarEqualVal8Bit DecisionVariable, $00, ScriptLabel_1D_5A22
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31D, $02
ScriptBranch_VarEqualVal8Bit DecisionVariable, $01, ScriptLabel_1D_5A22
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31D, $04
ScriptBranch_VarEqualVal8Bit DecisionVariable, $02, ScriptLabel_1D_5A22
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31D, $08
ScriptBranch_VarEqualVal8Bit DecisionVariable, $03, ScriptLabel_1D_5A22
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31D, $10
ScriptBranch_VarEqualVal8Bit DecisionVariable, $04, ScriptLabel_1D_5A22
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31D, $20
ScriptBranch_VarEqualVal8Bit DecisionVariable, $05, ScriptLabel_1D_5A22
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31D, $40

ScriptLabel_1D_5A22:
ModifyVariable_StoreToVarFromVar ScriptTEMP_D31B, CurrentSave_MetCharacterBits
ModifyVariable_LogicalANDVar16Bit ScriptTEMP_D31B, ScriptTEMP_D31D
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, $00, ScriptLabel_1D_5A32
ModifyVariable_StoreToVar8Bit DecisionVariable, $01
EndSubscript

ScriptLabel_1D_5A32:
ModifyVariable_StoreToVar8Bit DecisionVariable, $00
EndSubscript
ExecuteSubScript SubScript_1D_59EF
ScriptBranch_VarEqualVal8Bit DecisionVariable, $00, ScriptLabel_1D_5A45
ModifyVariable_StoreToVarFromVar ScriptTEMP_D31B, ScriptTEMP_D31F
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31D, $00
EndSubscript

ScriptLabel_1D_5A45:
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31B, $5E
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31D, $01
EndSubscript

ModifyVariable_StoreToVarFromVar ScriptTEMP_D31B, CurrentSave_Cash
ModifyVariable_AddToVar16Bit CurrentSave_Cash, CurrentSave_LostMoney
VariableScriptBranch CurrentSave_Cash, ScriptVarCheck_LessThan, ScriptTEMP_D31B, ScriptLabel_1D_5A5B
EndSubscript

ScriptLabel_1D_5A5B:
ModifyVariable_StoreToVar16Bit CurrentSave_Cash, 65535
EndSubscript
VariableSceneFadeOut $81
ModifyVariable_StoreToVarFromVar CurrentSave_ShrinePhotoCharacter, ScriptTEMP_D31B
LoadBackground BG_ShrinePhoto
SetCharacterCoords $40, $38
ModifyVariable_StoreToVar8Bit CurrentCharacter_Display, CharProp_Display_School
VariableLoadCharacter ScriptTEMP_D31B
VariableSceneFadeIn $82
LoadTextEntry $00C7, TextBank_04
SceneFadeOut
LoadBackground BG_SakuraWoods
SetCharacterCoords $80, $38
ModifyVariable_StoreToVar8Bit CurrentCharacter_Display, CharProp_Display_Sideview
VariableLoadCharacter ScriptTEMP_D31B
SceneFadeIn
EndSubscript

SubScript_1D_5A89:
ScriptBranch_VarLessVal8Bit DecisionVariable, $07, ScriptLabel_1D_5A92
LoadTextEntry $0043, TextBank_09
EndSubscript

ScriptLabel_1D_5A92:
ModifyVariable_AddToVar8Bit DecisionVariable, $3C
LoadVariableTextEntry TextBank_09, DecisionVariable, $01
EndSubscript

SubScript_1D_5A9C:
ScriptBranch_VarEqualVal8Bit CurrentSave_CDLinkFlag, $00, ScriptLabel_1D_5AB9
ModifyVariable_MultiplyVar16Bit DecisionVariable, $02
ModifyVariable_AddToVar16Bit ScriptTEMP_D31B, DecisionVariable
ModifyVariable_AddToVar16Bit ScriptTEMP_D31B, $01F1
LoadTextEntry $01EE, TextBank_08
LoadVariableTextEntry TextBank_08, ScriptTEMP_D31B, $01
LoadTextEntry $01EF, TextBank_08

ScriptLabel_1D_5AB9:
SceneFadeOut
PlayMusic Music_0B
EndSubscript

;handle character scrolling and some text display, credits time
SubScript_1D_5ABD:
SceneFadeOut

;randomly picks a background. some won't show up
ScriptLabel_1D_5ABE:
ModifyVariable_8BitRNGStore ScriptTEMP_D31B
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_Chalkboard, ScriptLabel_1D_5BE0
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_Classroom, ScriptLabel_1D_5BE0
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_ClassroomTest, ScriptLabel_1D_5BE0
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_SchoolHallway, ScriptLabel_1D_5BE0
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_Library, ScriptLabel_1D_5BE0
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_SchoolRooftop, ScriptLabel_1D_5BE0
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_SchoolNurseOffice, ScriptLabel_1D_5BE0
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_SchoolTerritory, ScriptLabel_1D_5BE0
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_SchoolEvent, ScriptLabel_1D_5BE0
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_Schoolyard, ScriptLabel_1D_5BE0
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_Street, ScriptLabel_1D_5BE0
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_SchoolEntrance, ScriptLabel_1D_5BE0
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_SchoolSoccerfield, ScriptLabel_1D_5BE0
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_SchoolBasketballCourt, ScriptLabel_1D_5BE0
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_SchoolClubroom, ScriptLabel_1D_5BE0
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_Bonfire, ScriptLabel_1D_5BE0
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_SchoolTheater, ScriptLabel_1D_5BE0
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_Neighborhood, ScriptLabel_1D_5BE6
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_Park, ScriptLabel_1D_5BE6
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_River, ScriptLabel_1D_5BE6
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_NightRiver, ScriptLabel_1D_5BE6
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_ArcadeEntrance, ScriptLabel_1D_5BE6
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_Arcade, ScriptLabel_1D_5BE6
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_KaraokeEntrance, ScriptLabel_1D_5BE6
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_Karaoke, ScriptLabel_1D_5BE6
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_ShoppingDistrict, ScriptLabel_1D_5BE6
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_CafeEntrance, ScriptLabel_1D_5BE6
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_Cafe, ScriptLabel_1D_5BE6
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_ToyStore, ScriptLabel_1D_5BE6
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_GeneralStore, ScriptLabel_1D_5BE6
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_PetStore, ScriptLabel_1D_5BE6
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_SoftwareStore, ScriptLabel_1D_5BE6
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_ClothesStore, ScriptLabel_1D_5BE6
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_13_1, ScriptLabel_1D_5BE6
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_BurgerJoint, ScriptLabel_1D_5BE6
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_Planetarium, ScriptLabel_1D_5BE6
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_MovieTheater, ScriptLabel_1D_5BE6
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_MovieTheaterEntrance, ScriptLabel_1D_5BE6
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_AmusementParkEntrance, ScriptLabel_1D_5BE6
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_AmusementPark, ScriptLabel_1D_5BE6
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_Beach, ScriptLabel_1D_5BEC
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_Pool, ScriptLabel_1D_5BEC
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_ScenicRoadWithered, ScriptLabel_1D_5BE6
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_BoatRide, ScriptLabel_1D_5BE6
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_Monkeys, ScriptLabel_1D_5BE6
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_TallBuildings, ScriptLabel_1D_5BE0
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_UrbanStreet, ScriptLabel_1D_5BE0
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_Room, ScriptLabel_1D_5BE0
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_HalloweenParty, ScriptLabel_1D_5BE6
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_BirthdayParty, ScriptLabel_1D_5BE6
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_Festival, ScriptLabel_1D_5BE6
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_GhostHouseEntrance, ScriptLabel_1D_5BE6
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_GhostHouse, ScriptLabel_1D_5BE6
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_Fireworks, ScriptLabel_1D_5BE6
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_BaseballCompetition, ScriptLabel_1D_5BE0
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_BasketballCompetition, ScriptLabel_1D_5BE0
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, BG_SoccerCompetition, ScriptLabel_1D_5BE0
ScriptBranch ScriptLabel_1D_5ABE

ScriptLabel_1D_5BE0:
ModifyVariable_StoreToVar8Bit CurrentCharacter_Display, CharProp_Display_School
ScriptBranch ScriptLabel_1D_5BEF

ScriptLabel_1D_5BE6:
ModifyVariable_StoreToVar8Bit CurrentCharacter_Display, CharProp_Display_Outdoors
ScriptBranch ScriptLabel_1D_5BEF

ScriptLabel_1D_5BEC:
ModifyVariable_StoreToVar8Bit CurrentCharacter_Display, CharProp_Display_Swimsuit

ScriptLabel_1D_5BEF:
LoadBackground ScriptTEMP_D31B
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D329, $01, ScriptLabel_1D_5BFD
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31B, $D2
ScriptBranch ScriptLabel_1D_5C00

ScriptLabel_1D_5BFD:
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31B, $CE

ScriptLabel_1D_5C00:
SetCharacterCoords ScriptTEMP_D31B, $38
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D323, $00, ScriptLabel_1D_5C0E
UpdateCharacterEmote CharProp_Emotion_Upset
ScriptBranch ScriptLabel_1D_5C0F

ScriptLabel_1D_5C0E:
UpdateCharacterEmote CharProp_Emotion_Normal

ScriptLabel_1D_5C0F:
VariableLoadCharacter ScriptTEMP_D327
LoadVariableTextEntry TextBank_0D, ScriptTEMP_D32B, $01
ModifyVariable_AddToVar16Bit ScriptTEMP_D32B, $01
SceneFadeIn
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31D, $04
ModifyVariable_MultiplyVar16Bit ScriptTEMP_D31D, ScriptTEMP_D329
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31F, $00

ScriptLabel_1D_5C27:
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31D, $00, ScriptLabel_1D_5C43
Sleep 1
ModifyVariable_AddToVar8Bit ScriptTEMP_D31F, $01
ModifyVariable_AddToVar16Bit ScriptTEMP_D31B, ScriptTEMP_D31D
SetCharacterCoords ScriptTEMP_D31B, $38
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31F, $0D, ScriptLabel_1D_5CAA
ScriptBranch ScriptLabel_1D_5C27

ScriptLabel_1D_5C43:
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31F, $00

ScriptLabel_1D_5C46:
ModifyVariable_AddToVar8Bit ScriptTEMP_D31F, $01
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D323, $00, ScriptLabel_1D_5C4F
UpdateCharacterEmote CharProp_Emotion_Normal

ScriptLabel_1D_5C4F:
Sleep 15
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D323, $00, ScriptLabel_1D_5C58
UpdateCharacterEmote CharProp_Emotion_Happy

ScriptLabel_1D_5C58:
Sleep 10
ScriptBranch_VarLessVal8Bit ScriptTEMP_D31F, $03, ScriptLabel_1D_5C46
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D323, $00, ScriptLabel_1D_5C66
UpdateCharacterEmote CharProp_Emotion_Blush

ScriptLabel_1D_5C66:
Sleep 50
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D323, $00, ScriptLabel_1D_5C6F
UpdateCharacterEmote CharProp_Emotion_Sad

ScriptLabel_1D_5C6F:
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31D, $01
ModifyVariable_MultiplyVar16Bit ScriptTEMP_D31D, ScriptTEMP_D329
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31F, $00

ScriptLabel_1D_5C79:
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31D, $05, ScriptLabel_1D_5C9A
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31D, $FB, ScriptLabel_1D_5C9A
Sleep 1
ModifyVariable_AddToVar8Bit ScriptTEMP_D31F, $01
ModifyVariable_AddToVar16Bit ScriptTEMP_D31B, ScriptTEMP_D31D
SetCharacterCoords ScriptTEMP_D31B, $38
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31F, $0D, ScriptLabel_1D_5CB4
ScriptBranch ScriptLabel_1D_5C79

ScriptLabel_1D_5C9A:
ModifyVariable_AddToVar8Bit ScriptTEMP_D327, $01
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D329, $01, ScriptLabel_1D_5CA6
ModifyVariable_StoreToVar8Bit ScriptTEMP_D329, $01
EndSubscript

ScriptLabel_1D_5CA6:
ModifyVariable_StoreToVar8Bit ScriptTEMP_D329, $FF
EndSubscript

ScriptLabel_1D_5CAA:
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31F, $00
ModifyVariable_SubFromVar16Bit ScriptTEMP_D31D, ScriptTEMP_D329
ScriptBranch ScriptLabel_1D_5C27

ScriptLabel_1D_5CB4:
ModifyVariable_StoreToVar8Bit ScriptTEMP_D31F, $00
ModifyVariable_AddToVar16Bit ScriptTEMP_D31D, ScriptTEMP_D329
ScriptBranch ScriptLabel_1D_5C79

SubScript_1D_5CBE:
ModifyVariable_StoreToVarFromVar ScriptTEMP_D31B, $D359
ModifyVariable_LogicalANDVar16Bit ScriptTEMP_D31B, $04
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, $00, ScriptLabel_1D_5D79
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

ScriptLabel_1D_5D79:
ModifyVariable_StoreToVarFromVar ScriptTEMP_D31B, $D359
ModifyVariable_LogicalANDVar16Bit ScriptTEMP_D31B, $02
ScriptBranch_VarEqualVal8Bit ScriptTEMP_D31B, $00, ScriptLabel_1D_5DC4
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

ScriptLabel_1D_5DC4:
EndSubscript