;PRG ROM $8000-$BFFF

SECTION "bank 2", ROMX, BANK[2]

POINTERS_02_4000:
PointerWithSize BackgroundData_02_402C
PointerWithSize IntroBackgroundData_02_414C
PointerWithSize CharacterTimedAppearanceData_02_4168
PointerWithSize CharacterGraphicDataPointers_02_4174
PointerWithSize TextDataBanks_02_41DC
PointerWithSize ScriptEntryTable_02_41E3
PointerWithSize DictionaryDataOffsets_02_46F9 
PointerWithSize SuperGameBoyBorderTilemap_02_4E72
PointerWithSize SuperGameBoyBorderGraphics_02_56D2
PointerWithSize FontGraphics_02_66B2
PointerWithSize ScriptCommandPointers_02_6EB2

;background-related data
;two pairs of bytes:
;first pair consists of a bank and pointer ID for the background graohics
;second pair of bytes is a bank and pointer ID for the background tilemap.
BackgroundData_02_402C:
db $10,$00,$10,$01
db $10,$00,$10,$01
db $10,$02,$10,$03
db $10,$04,$10,$05
db $10,$06,$10,$07
db $10,$08,$10,$09
db $10,$0A,$10,$0B
db $10,$0C,$10,$0D
db $10,$0E,$10,$0F
db $10,$10,$10,$11
db $10,$12,$10,$13
db $10,$14,$10,$15
db $10,$16,$10,$17
db $11,$00,$11,$01
db $11,$02,$11,$03
db $11,$04,$11,$05
db $15,$12,$15,$13
db $11,$06,$11,$07
db $11,$08,$11,$09
db $11,$0A,$11,$0B
db $11,$0C,$11,$0D
db $11,$0E,$11,$0F
db $11,$10,$11,$11
db $11,$12,$11,$13
db $11,$14,$11,$15
db $12,$00,$12,$01
db $12,$02,$12,$03
db $12,$04,$12,$05
db $12,$06,$12,$07
db $12,$08,$12,$09
db $12,$0A,$12,$0B
db $12,$0C,$12,$0D
db $12,$0E,$12,$0F
db $12,$10,$12,$11
db $12,$12,$12,$13
db $12,$14,$12,$15
db $13,$00,$13,$01
db $13,$02,$13,$03
db $13,$04,$13,$05
db $13,$06,$13,$07
db $13,$08,$13,$09
db $13,$0A,$13,$0B
db $13,$0C,$13,$0D
db $13,$0E,$13,$0F
db $13,$10,$13,$11
db $13,$12,$13,$13
db $14,$00,$14,$01
db $14,$02,$14,$03
db $14,$04,$14,$05
db $14,$06,$14,$07
db $14,$08,$14,$09
db $14,$0A,$14,$0B
db $14,$0C,$14,$0D
db $14,$0E,$14,$0F
db $14,$10,$14,$11
db $14,$12,$14,$13
db $15,$00,$15,$01
db $15,$02,$15,$03
db $15,$04,$15,$05
db $15,$06,$15,$07
db $15,$08,$15,$09
db $15,$0A,$15,$0B
db $15,$0C,$15,$0D
db $15,$0E,$15,$0F
db $15,$10,$15,$11
db $15,$14,$15,$15
db $15,$16,$15,$17
db $15,$18,$15,$19
db $1B,$00,$1B,$01
db $1B,$02,$1B,$03
db $1B,$04,$1B,$05
db $1B,$06,$1B,$07
.end

IntroBackgroundData_02_414C:
db $1B,$08,$1B,$09
db $1B,$0A,$1B,$0B
db $1B,$0C,$1B,$0D
db $1B,$0E,$1B,$0F
db $1B,$10,$1B,$11
db $1B,$12,$1B,$13
db $1B,$14,$1B,$15
.end

;this table is used to determine the character's appearance based on the passage of time.
;first value is the first half of the year, and second value is the rest of days
;only affects casual/warm appearance, the character will change their clothing for colder weather
CharacterTimedAppearanceData_02_4168:
db CharProp_Appearance_School,CharProp_Appearance_School
db CharProp_Appearance_Casual,CharProp_Appearance_Warm
db CharProp_Appearance_Swimsuit,CharProp_Appearance_Swimsuit
db CharProp_Appearance_Sideview,CharProp_Appearance_Sideview
db CharProp_Appearance_Intro,CharProp_Appearance_Intro
db CharProp_Appearance_Special,CharProp_Appearance_Special
.end

;used to get where the graphics for a particular character's appearance are stored
CharacterGraphicDataPointers_02_4174:
dw .RurunaGraphicData_02_4182-CharacterGraphicDataPointers_02_4174 ;ruruna
dw .MizukiGraphicData_02_4190-CharacterGraphicDataPointers_02_4174 ;Mizuki
dw .YumiGraphicData_02_419E-CharacterGraphicDataPointers_02_4174 ;yumi
dw .MariGraphicData_02_41AC-CharacterGraphicDataPointers_02_4174 ;Mari
dw .MiriGraphicData_02_41B8-CharacterGraphicDataPointers_02_4174 ;miri
dw .SuzuneGraphicData_02_41C4-CharacterGraphicDataPointers_02_4174 ;Suzune
dw .MomoyoGraphicData_02_41D0-CharacterGraphicDataPointers_02_4174 ;Momoyo

;first value is the bank from which to get graphics, second byte is the pointer to said graphics
.RurunaGraphicData_02_4182:
db $16,$00 ;school outfit
db $16,$01 ;casual outfit
db $16,$02 ;warm outfit
db $18,$03 ;beach outfit
db $19,$04 ;sideway face sprite. whatcha lookin' at?
db $1A,$02 ;intro sprite
db $19,$01 ;special sprite

.MizukiGraphicData_02_4190:
db $16,$03
db $16,$04
db $16,$05
db $18,$04
db $19,$05
db $1A,$03
db $19,$02 ;special sprite, which is not Mizuki, but a hand

.YumiGraphicData_02_419E:
db $16,$06
db $16,$07
db $17,$00
db $19,$00
db $19,$06
db $1A,$04
db $19,$03 ;not yumi but another hand

.MariGraphicData_02_41AC:
db $17,$01
db $17,$02
db $17,$03
db $18,$05
db $19,$07
db $1A,$05

.MiriGraphicData_02_41B8:
db $17,$04
db $17,$05
db $17,$06
db $18,$08
db $19,$08
db $1A,$06

.SuzuneGraphicData_02_41C4:
db $17,$07
db $17,$08
db $17,$09
db $18,$06
db $1A,$00
db $1A,$07

.MomoyoGraphicData_02_41D0:
db $18,$00
db $18,$01
db $18,$02
db $18,$07
db $1A,$01
db $1A,$08
.end

;these are bank values that contain the game's text
TextDataBanks_02_41DC:
db $08
db $09
db $0A
db $0B
db $0C
db $0D
db $04
.end

include "Data/EventData/ScriptEntries.asm"

include "Data/Text/VN/Dictionary.asm"

;Good luck editing this. Each tile is a word, which take the SNES's standard vhopppcc cccccccc tile format.
;  v/h  = Vertical/Horizontal flip this tile.
;  o    = Tile priority.
;  ppp  = Tile palette. The number of entries in the palette depends on the Mode
;      and the BG.
;  cccccccccc = Tile number.
;After the tilemap data, there are SNES color palettes which set palettes that the tilemap uses
SuperGameBoyBorderTilemap_02_4E72:
dw $1000,$1001,$5001,$1000,$D000,$1002,$5002,$5000,$9000,$1003,$1004,$9004,$5003,$9000,$9000,$1005,$1004,$1006,$1007,$1004,$1008,$9000,$1009,$100A,$500A,$5009,$9000,$1000,$1001,$5001,$5000,$1000
dw $1000,$180B,$180C,$180D,$180E,$100F,$500F,$9000,$9000,$1410,$1411,$1412,$1413,$1414,$1415,$1416,$1417,$1418,$1419,$141A,$141B,$141C,$141D,$1004,$1004,$5003,$1000,$580E,$580D,$580C,$580B,$1000
dw $181E,$181F,$1820,$1821,$1822,$5000,$5000,$1423,$1424,$1425,$1426,$1427,$1428,$1429,$142A,$142B,$142C,$142D,$142E,$142F,$1430,$1431,$1432,$5424,$5423,$1033,$9000,$5822,$5821,$5820,$581F,$581E
dw $1034,$1835,$1836,$1837,$1838,$1439,$1439,$143A,$143B,$143C,$143D,$143E,$143F,$1440,$1441,$1442,$1443,$1444,$1445,$1446,$1447,$1448,$1449,$543B,$543A,$1439,$1439,$5838,$5837,$5836,$5835,$5034
dw $500A,$5009,$184A,$184B,$184C,$144D,$144E,$144F,$144F,$144F,$144F,$144F,$144F,$144F,$144F,$144F,$144F,$144F,$144F,$144F,$144F,$144F,$144F,$144F,$144F,$144E,$544D,$584C,$584B,$584A,$1002,$5002
dw $9004,$5003,$9000,$1850,$1851,$1452,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$5052,$5851,$5850,$5000,$100F,$500F
dw $1004,$1033,$9000,$9000,$1454,$1455,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$5455,$5454,$500A,$5009,$9000,$9000
dw $1056,$5000,$5000,$5000,$9454,$9455,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$D455,$D454,$9004,$5003,$5000,$5000
dw $1000,$9000,$1002,$5002,$1454,$1455,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$5455,$5454,$1004,$1033,$1057,$5057
dw $9000,$5000,$100F,$500F,$9454,$9455,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$D455,$D454,$1056,$9000,$1001,$5001
dw $1058,$1059,$5059,$5058,$1454,$1455,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$5455,$5454,$5000,$5000,$1009,$100A
dw $1004,$105A,$505A,$5004,$9454,$9455,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$D455,$D454,$5057,$9000,$1003,$D004
dw $1004,$1004,$105B,$105C,$1454,$1455,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$5455,$5454,$5001,$5000,$5033,$5004
dw $1004,$9004,$105D,$105E,$9454,$9455,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$D455,$D454,$9000,$9000,$D000,$5056
dw $1005,$1004,$1006,$1007,$1454,$1455,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$5455,$5454,$5000,$1002,$5002,$9000
dw $1000,$105F,$505F,$5056,$9454,$9455,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$D455,$D454,$9000,$100F,$500F,$9000
dw $1002,$5002,$1000,$9000,$1454,$1455,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$5455,$5454,$1058,$1059,$5059,$5058
dw $100F,$500F,$5000,$9000,$9454,$9455,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$D455,$D454,$1004,$105A,$505A,$5004
dw $9000,$9000,$1057,$5057,$1454,$1455,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$5455,$5454,$1004,$1004,$105B,$105C
dw $5000,$5000,$1001,$5001,$9454,$9455,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$D455,$D454,$1004,$9004,$105D,$105E
dw $1009,$100A,$500A,$5009,$1454,$1455,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$5455,$5454,$1005,$1004,$1006,$1007
dw $1003,$D004,$9004,$5003,$9454,$9455,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$D455,$D454,$1000,$105F,$505F,$5056
dw $5033,$5004,$1004,$1033,$1460,$1452,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$5452,$5460,$9000,$1002,$5002,$1000
dw $D000,$5056,$1056,$9000,$1060,$904D,$944E,$1461,$5461,$1461,$5461,$1461,$5461,$1461,$5461,$1461,$5461,$1461,$5461,$1461,$5461,$1461,$5461,$1461,$5461,$944E,$D44D,$5460,$5000,$100F,$500F,$D000
dw $5057,$1862,$1863,$1864,$1865,$1866,$9439,$1467,$5467,$1467,$5467,$1467,$5467,$1467,$5467,$1467,$5467,$1467,$5467,$1467,$5467,$1467,$5467,$1467,$5467,$9439,$5866,$5865,$5864,$5863,$5862,$D000
dw $5001,$1868,$1869,$186A,$186B,$186C,$5000,$1002,$5002,$5000,$5000,$5000,$5033,$5004,$1004,$1033,$9000,$1057,$5057,$9000,$106D,$1058,$1059,$5059,$5058,$506D,$586C,$586B,$586A,$5869,$5868,$D000
dw $9000,$186E,$186F,$1870,$1871,$1872,$5000,$100F,$500F,$9000,$5000,$5000,$D000,$5056,$1056,$9000,$5000,$1001,$5001,$5000,$1073,$1004,$105A,$505A,$5004,$5073,$5872,$5871,$5870,$586F,$586E,$D000
dw $9000,$1874,$1875,$1876,$1877,$9000,$106D,$1058,$1059,$5059,$5058,$506D,$1002,$5002,$D000,$D000,$9000,$9000,$9000,$1009,$1078,$505C,$505B,$5004,$5004,$1079,$D000,$5877,$5876,$5875,$5874,$1057
dw $9000,$187A,$187B,$187C,$1057,$5057,$1073,$1004,$105A,$505A,$5004,$5073,$100F,$500F,$1000,$1000,$1057,$5057,$5000,$1003,$107D,$505E,$505D,$D004,$5004,$107E,$1002,$5002,$587C,$587B,$587A,$1001
dw $1002,$5002,$9000,$9000,$1001,$5001,$5079,$1004,$1004,$105B,$105C,$5078,$5009,$1000,$9000,$1000,$1001,$5001,$9000,$5033,$1004,$5007,$5006,$5004,$5005,$D000,$100F,$500F,$5000,$D000,$D000,$D000
dw $1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053
dw $1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053,$1053

;the three SNES tile palettes the tilemap uses (palettes 4, 5 and 6)
dw $7F0F,$08AF,$1131,$19B4,$2657,$36F9,$477C,$5BFE,$39BB,$41FB,$4A1C,$525C,$5A7D,$5EBD,$66FE,$6F3F
dw $7F0F,$08AF,$1131,$19B4,$2657,$36F9,$477C,$5BFE,$7FFF,$265F,$25BF,$211F,$301C,$1CEB,$499F,$6ABF
dw $7F0F,$41EE,$19B4,$32DA,$477C,$3219,$533F,$67BF,$62B3,$6F58,$7FFF,$429C,$2236,$5250,$39BB,$4A1C
.end

SuperGameBoyBorderGraphics_02_56D2:
incbin "GFX/SGBBorder.bin"
.end

;some common tile graphics
FontGraphics_02_66B2:
incbin "GFX/Font.bin"
.end

SETCHARMAP Text_VN

;data and code that is transferred to RAM
ScriptCommandPointers_02_6EB2:
dw ScriptCodeStorage+(.ScriptCommand_EndScript_02_6F4A-ScriptCommandPointers_02_6EB2) ;0
dw ScriptCodeStorage+(.ScriptCommand_MakeTextSkippable_02_6F51-ScriptCommandPointers_02_6EB2) ;1
dw ScriptCodeStorage+(.ScriptCommand_LoadTextEntry_02_6F5D-ScriptCommandPointers_02_6EB2) ;2
dw ScriptCodeStorage+(.ScriptCommand_LoadVariableTextEntry_02_6F8F-ScriptCommandPointers_02_6EB2) ;3
dw ScriptCodeStorage+(.ScriptCommand_ForceTextPrintPosition_02_6FCE-ScriptCommandPointers_02_6EB2) ;4
dw ScriptCodeStorage+(.ScriptCommand_ClearMessageBox_02_6FE9-ScriptCommandPointers_02_6EB2) ;5
dw ScriptCodeStorage+(.ScriptCommand_Sleep_02_700C-ScriptCommandPointers_02_6EB2) ;6
dw ScriptCodeStorage+(.ScriptCommand_StoreToVar16Bit_02_7029-ScriptCommandPointers_02_6EB2) ;7
dw ScriptCodeStorage+(.ScriptCommand_AddToVar16Bit_02_703F-ScriptCommandPointers_02_6EB2) ;8
dw ScriptCodeStorage+(.ScriptCommand_SubFromVar16Bit_02_7057-ScriptCommandPointers_02_6EB2) ;9
dw ScriptCodeStorage+(.ScriptCommand_LogicalANDVar_02_706F-ScriptCommandPointers_02_6EB2) ;A
dw ScriptCodeStorage+(.ScriptCommand_LogicalORVar_02_7087-ScriptCommandPointers_02_6EB2) ;B
dw ScriptCodeStorage+(.ScriptCommand_LogicalXORVar_02_709F-ScriptCommandPointers_02_6EB2) ;C
dw ScriptCodeStorage+(.ScriptCommand_LogicalShiftVarRight_02_70B7-ScriptCommandPointers_02_6EB2) ;D
dw ScriptCodeStorage+(.ScriptCommand_LogicalShiftVarLeft_02_70E5-ScriptCommandPointers_02_6EB2) ;E
dw ScriptCodeStorage+(.ScriptCommand_MultiplyVariable_02_7110-ScriptCommandPointers_02_6EB2) ;F
dw ScriptCodeStorage+(.ScriptCommand_MultiplyByVariable_02_7155-ScriptCommandPointers_02_6EB2) ;10
dw ScriptCodeStorage+(.ScriptCommand_Skip4Bytes_02_719A-ScriptCommandPointers_02_6EB2) ;11
dw ScriptCodeStorage+(.ScriptCommand_StoreToVarFromVar_02_71A9-ScriptCommandPointers_02_6EB2) ;12
dw ScriptCodeStorage+(.ScriptCommand_StoreToVar8Bit_02_71E3-ScriptCommandPointers_02_6EB2) ;13
dw ScriptCodeStorage+(.ScriptCommand_StoreRNGToVar16Bit_02_720C-ScriptCommandPointers_02_6EB2) ;14
dw ScriptCodeStorage+(.ScriptCommandStoreRNGToVar8Bit_02_723A-ScriptCommandPointers_02_6EB2) ;15
dw ScriptCodeStorage+(.ScriptCommand_AddToVar8Bit_02_7266-ScriptCommandPointers_02_6EB2) ;16
dw ScriptCodeStorage+(.ScriptCommand_SubFromVar8Bit_02_7296-ScriptCommandPointers_02_6EB2) ;17
dw ScriptCodeStorage+(.ScriptCommand_Branch_02_72EA-ScriptCommandPointers_02_6EB2) ;18
dw ScriptCodeStorage+(.ScriptCommand_LoadScriptEntry_02_72FE-ScriptCommandPointers_02_6EB2) ;19
dw ScriptCodeStorage+(.ScriptCommand_LoadScriptEntryWithTransition_02_7322-ScriptCommandPointers_02_6EB2) ;1A
dw ScriptCodeStorage+(.ScriptCommand_3DecisionBranches_02_7346-ScriptCommandPointers_02_6EB2) ;1B
dw ScriptCodeStorage+(.ScriptCommand_4DecisionBranches_02_736F-ScriptCommandPointers_02_6EB2) ;1C
dw ScriptCodeStorage+(.ScriptCommand_5DecisionBranches_02_739C-ScriptCommandPointers_02_6EB2) ;1D
dw ScriptCodeStorage+(.ScriptCommand_6DecisionBranches_02_73C9-ScriptCommandPointers_02_6EB2) ;1E
dw ScriptCodeStorage+(.ScriptCommand_VariableCompare_02_73F6-ScriptCommandPointers_02_6EB2) ;1F
dw ScriptCodeStorage+(.ScriptCommand_Compare_8BitVarVsVal_Equal_02_7436-ScriptCommandPointers_02_6EB2) ;20
dw ScriptCodeStorage+(.ScriptCommand_Compare_8BitVarVsVal_Greater_02_746A-ScriptCommandPointers_02_6EB2) ;21
dw ScriptCodeStorage+(.ScriptCommand_Compare_8BitVarVsVal_Less_02_749E-ScriptCommandPointers_02_6EB2) ;22
dw ScriptCodeStorage+(.ScriptCommand_Compare_16BitVarVsVar_Equal_02_74D4-ScriptCommandPointers_02_6EB2) ;23
dw ScriptCodeStorage+(.ScriptCommand_Compare_16BitVarVsVar_Greater_02_7520-ScriptCommandPointers_02_6EB2) ;24
dw ScriptCodeStorage+(.ScriptCommand_Compare_16BitVarVsVar_Less_02_756E-ScriptCommandPointers_02_6EB2) ;25
dw ScriptCodeStorage+(.ScriptCommand_SuperGameBoyBranch_02_75C0-ScriptCommandPointers_02_6EB2) ;26
dw ScriptCodeStorage+(.ScriptCommand_PlayerStrengthBranch_02_75E0-ScriptCommandPointers_02_6EB2) ;27
dw ScriptCodeStorage+(.ScriptCommand_ExecuteSubscript_02_7665-ScriptCommandPointers_02_6EB2) ;28
dw ScriptCodeStorage+(.ScriptCommand_Skip2Bytes_02_7685-ScriptCommandPointers_02_6EB2) ;29
dw ScriptCodeStorage+(.ScriptCommand_EndSubscript_02_7692-ScriptCommandPointers_02_6EB2) ;2A
dw ScriptCodeStorage+(.ScriptCommand_DoNothing_02_76A2-ScriptCommandPointers_02_6EB2) ;2B
dw ScriptCodeStorage+(.ScriptCommand_PlayMusic_02_76A9-ScriptCommandPointers_02_6EB2) ;2C
dw ScriptCodeStorage+(.ScriptCommand_PlaySFX_02_76C3-ScriptCommandPointers_02_6EB2) ;2D
dw ScriptCodeStorage+(.ScriptCommand_VariableSceneFadeIn_02_76DD-ScriptCommandPointers_02_6EB2) ;2E
dw ScriptCodeStorage+(.ScriptCommand_SceneFadeIn_02_771B-ScriptCommandPointers_02_6EB2) ;2F
dw ScriptCodeStorage+(.ScriptCommand_VariableSceneFadeOut_02_772B-ScriptCommandPointers_02_6EB2) ;30
dw ScriptCodeStorage+(.ScriptCommand_SceneFadeOut_02_7769-ScriptCommandPointers_02_6EB2) ;31
dw ScriptCodeStorage+(.ScriptCommand_LoadBackground_02_7779-ScriptCommandPointers_02_6EB2) ;32
dw ScriptCodeStorage+(.ScriptCommand_LoadBackgroundAlt_02_779F-ScriptCommandPointers_02_6EB2) ;33
dw ScriptCodeStorage+(.ScriptCommand_UpdateCameraPosition_02_77C5-ScriptCommandPointers_02_6EB2) ;34
dw ScriptCodeStorage+(.ScriptCommand_VariableLoadCharacter_02_77FC-ScriptCommandPointers_02_6EB2) ;35
dw ScriptCodeStorage+(.ScriptCommand_FixedLoadCharacter_02_7833-ScriptCommandPointers_02_6EB2) ;36
dw ScriptCodeStorage+(.ScriptCommand_SetCharExpression_Normal_02_7877-ScriptCommandPointers_02_6EB2) ;37
dw ScriptCodeStorage+(.ScriptCommand_SetCharExpression_Upset_02_7882-ScriptCommandPointers_02_6EB2) ;38
dw ScriptCodeStorage+(.ScriptCommand_SetCharExpression_Happy_02_788E-ScriptCommandPointers_02_6EB2) ;39
dw ScriptCodeStorage+(.ScriptCommand_SetCharExpression_Blush_02_789A-ScriptCommandPointers_02_6EB2) ;3A
dw ScriptCodeStorage+(.ScriptCommand_SetCharExpression_Sad_02_78A6-ScriptCommandPointers_02_6EB2) ;3B
dw ScriptCodeStorage+(.ScriptCommand_SetCharCoordinates_02_78B2-ScriptCommandPointers_02_6EB2) ;3C
dw ScriptCodeStorage+(.ScriptCommand_FlipCharacter_02_78E9-ScriptCommandPointers_02_6EB2) ;3D
dw ScriptCodeStorage+(.ScriptCommand_ShowOrRemoveCharacter_02_792F-ScriptCommandPointers_02_6EB2) ;3E
dw ScriptCodeStorage+(.ScriptCommand_ShowCharacter_02_7958-ScriptCommandPointers_02_6EB2) ;3F
dw ScriptCodeStorage+(.ScriptCommand_RemoveCharacter_02_7967-ScriptCommandPointers_02_6EB2) ;40
dw ScriptCodeStorage+(.ScriptCommand_ClearLinesOfTiles_02_7978-ScriptCommandPointers_02_6EB2) ;41
dw ScriptCodeStorage+(.ScriptCommand_ChangeMessagePrinting_02_79DE-ScriptCommandPointers_02_6EB2) ;42
dw ScriptCodeStorage+(.ScriptCommand_EnablePlayerChoice_2Options_02_7A3E-ScriptCommandPointers_02_6EB2) ;43
dw ScriptCodeStorage+(.ScriptCommand_EnablePlayerChoice_3Options_02_7A77-ScriptCommandPointers_02_6EB2) ;44
dw ScriptCodeStorage+(.ScriptCommand_InviteCharacterForADate_02_7AB0-ScriptCommandPointers_02_6EB2) ;45
dw ScriptCodeStorage+(.ScriptCommand_AffectRelationshipByGift_02_7ADA-ScriptCommandPointers_02_6EB2) ;46
dw ScriptCodeStorage+(.ScriptCommand_Print8BitVariableValue_02_7B20-ScriptCommandPointers_02_6EB2) ;47
dw ScriptCodeStorage+(.ScriptCommand_Print16BitVariableValue_02_7B6A-ScriptCommandPointers_02_6EB2) ;48
dw ScriptCodeStorage+(.ScriptCommand_SeedRNG_02_7BB4-ScriptCommandPointers_02_6EB2) ;49 seed RNG?
dw ScriptCodeStorage+(.ScriptCommand_DebugSingleVariableEditor_02_7BDB-ScriptCommandPointers_02_6EB2) ;4A
dw ScriptCodeStorage+(.ScriptCommand_DebugVariableEditorAndViewer_02_7CEE-ScriptCommandPointers_02_6EB2) ;4B

;EndScript
.ScriptCommand_EndScript_02_6F4A:
POP DE                                                      ;
LD A, ScriptExecutionState_EndExecution                     ;
LD [ScriptExecutionState], A                                ;
RET                                                         ;

;MakeTextSkippable
.ScriptCommand_MakeTextSkippable_02_6F51:
LD A, $01                                                   ;
LD [ContinueProcessingScriptFlag], A                        ;

POP DE                                                      ;

LD A, $01                                                   ;
LD [SequenceSkipFlag], A                                    ;
RET                                                         ;

;LoadTextEntry
.ScriptCommand_LoadTextEntry_02_6F5D:
CALL InitializeTextBufferPointers_00_197D
POP DE
LD L, E
LD H, D

INC HL
INC HL
PUSH HL

LD A, [ScriptTablePointer]
ADD A, E
LD E, A

LD A, [ScriptTablePointer+1]
ADC A, D
LD D, A

LD A, [DE]                                                  ;text ID low byte
INC DE
LD L, A

LD A, [DE]
LD B, A
AND $07                                                     ;first 3 bits are text id high byte
LD H, A

LD A, B
SRL A
SRL A
SRL A

LD E, A                                                     ;5 remaining bits determine banks
CALL ProcessTextEntry_00_198E                               ;

LD A, TextParsingState_Parse
LD [TextParsingState], A

LD A, ScriptExecutionState_WaitForTextParseEnd
LD [ScriptExecutionState], A
POP DE
RET

;LoadVariableTextEntry
.ScriptCommand_LoadVariableTextEntry_02_6F8F:
CALL InitializeTextBufferPointers_00_197D
POP DE
LD L, E
LD H, D

INC HL
INC HL
INC HL
INC HL
INC HL
PUSH HL

LD A, [ScriptTablePointer]
ADD A, E
LD E, A

LD A, [ScriptTablePointer+1]
ADC A, D
LD D, A

LD A, [DE]
INC DE
LD L, A

LD A, [DE]
INC DE
LD H, A
CALL MaybeFetchValueFromVariable_00_12AE
LD B, L                                                     ;bank

LD A, [DE]
INC DE
LD L, A

LD A, [DE]
INC DE
LD H, A

LD A, [DE]
PUSH AF
CALL MaybeFetchValueFromVariable_00_12AE

LD E, B
CALL ProcessTextEntry_00_198E

LD A, TextParsingState_Parse
LD [TextParsingState], A
POP AF
OR A                                                        ;can process script in addition to text
JR Z, .CODE_02_6FCC

LD A, ScriptExecutionState_WaitForTextParseEnd
LD [ScriptExecutionState], A

.CODE_02_6FCC:
POP DE
RET

;ForceTextPrintPosition
;forces text printing to specified position.
.ScriptCommand_ForceTextPrintPosition_02_6FCE:
POP DE
LD L, E
LD H, D

INC HL
INC HL
PUSH HL

LD A, [ScriptTablePointer]
ADD A, E
LD E, A

LD A, [ScriptTablePointer+1]
ADC A, D
LD D, A

LD A, [DE]
LD [TextDrawing_CurrentCharacterInLine], A

INC DE
LD A, [DE]
LD [TextDrawing_CurrentLine], A
POP DE
RET

;ClearMessageBox
;clears message box. doesnt seem all that useful since the message box can do that on its own
;the only difference is that it doesn't reset character printing position. still of questionable use.
.ScriptCommand_ClearMessageBox_02_6FE9:
POP DE
CALL WaitForVBlank_00_0382
CALL WaitForVBlank_00_0382
CALL WaitForVBlank_00_0382
CALL WaitForVBlank_00_0382
CALL WaitForVBlank_00_0382
CALL ClearMessageBox_00_18E2
CALL WaitForVBlank_00_0382
CALL WaitForVBlank_00_0382
CALL WaitForVBlank_00_0382
CALL WaitForVBlank_00_0382
CALL WaitForVBlank_00_0382
RET

;Sleep
;sets up a timer and just wait.
.ScriptCommand_Sleep_02_700C:
POP DE
LD L, E
LD H, D

LD A, [ScriptTablePointer]
ADD A, L
LD L, A

LD A, [ScriptTablePointer+1]
ADC A, H
LD H, A

LD A, [HL+]
LD [ScriptSleepTimer], A

LD A, [HL]
LD [ScriptSleepTimer+1], A

LD A, ScriptExecutionState_WaitForTimer
LD [ScriptExecutionState], A

INC DE
INC DE
RET

;ModifyVariable_StoreToVar16Bit
.ScriptCommand_StoreToVar16Bit_02_7029:
LD A, $01
LD [ContinueProcessingScriptFlag], A

POP DE
LD H, D
LD L, E
INC HL
INC HL
INC HL
PUSH HL

CALL ScriptCodeStorage+(.SetupVarAnd16BitValue_02_72C5-ScriptCommandPointers_02_6EB2)

LD A, L
LD [DE], A
INC DE

LD A, H
LD [DE], A

POP DE
RET

;ModifyVariable_AddToVar16Bit
.ScriptCommand_AddToVar16Bit_02_703F:
LD A, $01
LD [ContinueProcessingScriptFlag], A
POP DE
LD L, E
LD H, D

INC HL
INC HL
INC HL
PUSH HL

CALL ScriptCodeStorage+(.SetupVarAnd16BitValue_02_72C5-ScriptCommandPointers_02_6EB2)

LD A, [DE]                                                  ;does not handle overflow
ADD A, L
LD [DE], A

INC DE
LD A, [DE]
ADC A, H
LD [DE], A

POP DE
RET

;ModifyVariable_SubFromVar16Bit
.ScriptCommand_SubFromVar16Bit_02_7057:
LD A, $01
LD [ContinueProcessingScriptFlag], A

POP DE
LD L, E
LD H, D

INC HL
INC HL
INC HL
PUSH HL

CALL ScriptCodeStorage+(.SetupVarAnd16BitValue_02_72C5-ScriptCommandPointers_02_6EB2)

LD A, [DE]                                                  ;does not handle underflow
SUB L
LD [DE], A

INC DE
LD A, [DE]
SBC A, H
LD [DE], A

POP DE
RET

;ModifyVariable_LogicalANDVar16Bit
.ScriptCommand_LogicalANDVar_02_706F:
LD A, $01
LD [ContinueProcessingScriptFlag], A

POP DE
LD L, E
LD H, D

INC HL
INC HL
INC HL
PUSH HL

CALL ScriptCodeStorage+(.SetupVarAnd16BitValue_02_72C5-ScriptCommandPointers_02_6EB2)

LD A, [DE]
AND L
LD [DE], A

INC DE
LD A, [DE]
AND H
LD [DE], A

POP DE
RET

;ModifyVariable_LogicalORVar16Bit
.ScriptCommand_LogicalORVar_02_7087:
LD A, $01
LD [ContinueProcessingScriptFlag], A

POP DE
LD L, E
LD H, D

INC HL
INC HL
INC HL
PUSH HL

CALL ScriptCodeStorage+(.SetupVarAnd16BitValue_02_72C5-ScriptCommandPointers_02_6EB2)

LD A, [DE]
OR L
LD [DE], A

INC DE
LD A, [DE]
OR H
LD [DE], A
POP DE
RET

;ModifyVariable_LogicalXORVar16Bit
.ScriptCommand_LogicalXORVar_02_709F:
LD A, $01
LD [ContinueProcessingScriptFlag], A

POP DE
LD L, E
LD H, D

INC HL
INC HL
INC HL
PUSH HL

CALL ScriptCodeStorage+(.SetupVarAnd16BitValue_02_72C5-ScriptCommandPointers_02_6EB2)

LD A, [DE]
XOR L
LD [DE], A

INC DE
LD A, [DE]
XOR H
LD [DE], A

POP DE
RET

;ModifyVariable_LogicalShiftVarRight
.ScriptCommand_LogicalShiftVarRight_02_70B7:
LD A, $01
LD [ContinueProcessingScriptFlag], A

POP DE
LD L, E
LD H, D

INC HL
INC HL
INC HL
PUSH HL

CALL ScriptCodeStorage+(.SetupVarAnd16BitValue_02_72C5-ScriptCommandPointers_02_6EB2)

LD A, L
OR A
JR Z, .CODE_02_70E3
CP 16                                                       ;check if shifting more than 16 times
JR C, .CODE_02_70D1

XOR A                                                       ;???
JR .CODE_02_70E3                                            ;can't shift, moving on

.CODE_02_70D1:
LD B, L
LD L, E
LD H, D
LD A, [HL+]
LD H, [HL]
LD L, A

.LOOP_02_70D7:
SRL H
RR L
DEC B
JR NZ, .LOOP_02_70D7

LD A, L
LD [DE], A
INC DE

LD A, H
LD [DE], A

.CODE_02_70E3:
POP DE
RET

;ModifyVariable_LogicalShiftVarLeft
.ScriptCommand_LogicalShiftVarLeft_02_70E5:
LD A, $01
LD [ContinueProcessingScriptFlag], A

POP DE
LD L, E
LD H, D

INC HL
INC HL
INC HL
PUSH HL

CALL ScriptCodeStorage+(.SetupVarAnd16BitValue_02_72C5-ScriptCommandPointers_02_6EB2)

LD A, L
OR A
JR Z, .CODE_02_710E
CP 16                                                       ;check if shifting more than 16 times
JR C, .CODE_02_70FF                                         ;proceed as normal

XOR A                                                       ;why do you clear A?
JR .CODE_02_710E                                            ;anyway, don't do the shifting

.CODE_02_70FF:
LD B, L
LD L, E
LD H, D
LD A, [HL+]
LD H, [HL]
LD L, A

.LOOP_02_7105:
ADD HL, HL
DEC B
JR NZ, .LOOP_02_7105

LD A, L
LD [DE], A
INC DE
LD A, H
LD [DE], A

.CODE_02_710E:
POP DE
RET

;ModifyVariable_MultiplyVar16Bit
.ScriptCommand_MultiplyVariable_02_7110:
LD A, $01
LD [ContinueProcessingScriptFlag], A

POP DE
LD L, E
LD H, D

INC HL
INC HL
INC HL
PUSH HL

CALL ScriptCodeStorage+(.SetupVarAnd16BitValue_02_72C5-ScriptCommandPointers_02_6EB2)

LD A, [DE]
LD C, A

INC DE
LD A, [DE]
LD B, A
DEC DE
OR C                                                        ;check if we're multiplying 0
JR Z, .CODE_02_7153                                         ;nothing happens

LD A, L
OR H                                                        ;check if we're multiplying by 0
JR Z, .CODE_02_714F                                         ;the result will be 0.

PUSH DE
LD E, C
LD D, B
LD B, $00
LD C, $00

;BC - value from first variable
;HL is value we got from .SetupVarAnd16BitValue_02_72C5 (second variable)
.LOOP_02_7133:
LD A, C
ADD A, L
LD C, A

LD A, B
ADC A, H
JR C, .CODE_02_714E
LD B, A

LD A, E
SUB $01
LD E, A

LD A, D
SBC A, $00
LD D, A
OR E
JR NZ, .LOOP_02_7133

POP DE
LD A, C
LD [DE], A

INC DE
LD A, B
LD [DE], A
JR .CODE_02_7153

.CODE_02_714E:
POP DE

.CODE_02_714F:
XOR A
LD [DE], A
INC DE
LD [DE], A

.CODE_02_7153:
POP DE
RET

;ModifyVariable_MultiplyByVar16Bit
;Instead of multiplying the variable by value, we multiply the value by variable... doesnt make sense? multiplication works either way.
;probably supposed to be division, but never got programmed. this command is not used.
.ScriptCommand_MultiplyByVariable_02_7155:
LD A, $01
LD [ContinueProcessingScriptFlag], A

POP DE
LD L, E
LD H, D

INC HL
INC HL
INC HL
PUSH HL

CALL ScriptCodeStorage+(.SetupVarAnd16BitValue_02_72C5-ScriptCommandPointers_02_6EB2)
LD A, [DE]
LD C, A
INC DE

LD A, [DE]
LD B, A
DEC DE
OR C                                                        ;check if we're multiplying 0
JR Z, .CODE_02_7198

LD A, L
OR H                                                        ;check if the value we're multiplying by 0
JR Z, .CODE_02_7194
PUSH DE
LD E, C
LD D, B
LD B, $00
LD C, $00

.LOOP_02_7178:
LD A, C
ADD A, E
LD C, A

LD A, B
ADC A, D
JR C, .CODE_02_7193
LD B, A

LD A, L
SUB $01
LD L, A

LD A, H
SBC A, $00
LD H, A
OR L
JR NZ, .LOOP_02_7178
POP DE

LD A, C
LD [DE], A

INC DE
LD A, B
LD [DE], A
JR .CODE_02_7198

.CODE_02_7193:
POP DE

.CODE_02_7194:
XOR A                                                       ;variable becomes zero
LD [DE], A                                                  ;
INC DE                                                      ;
LD [DE], A                                                  ;

.CODE_02_7198:
POP DE                                                      ;
RET                                                         ;

;Skip4Bytes
;Most likely a template for a command that takes 4 bytes worth of arguments. Skips over 4 bytes. Can be used for short branches.
.ScriptCommand_Skip4Bytes_02_719A:
LD A, $01
LD [ContinueProcessingScriptFlag], A

POP DE
LD L, E
LD H, D

INC HL
INC HL
INC HL
INC HL
PUSH HL

POP DE
RET

;ModifyVariable_StoreToVarFromVar
.ScriptCommand_StoreToVarFromVar_02_71A9:
LD A, $01
LD [ContinueProcessingScriptFlag], A

POP DE
LD L, E
LD H, D

INC HL
INC HL
PUSH HL
LD A, [ScriptTablePointer]
ADD A, E
LD E, A

LD A, [ScriptTablePointer+1]
ADC A, D
LD D, A

LD A, [DE]
INC DE
LD L, A
LD H, $00
ADD HL, HL

LD A, L
ADD A, LOW(ScriptTEMP_D31B)
LD L, A

LD A, H
ADC A, HIGH(ScriptTEMP_D31B)
LD H, A

LD A, [DE]
LD E, A
LD D, $00
SLA E
RL D

LD A, E
ADD A, LOW(ScriptTEMP_D31B)
LD E, A

LD A, D
ADC A, HIGH(ScriptTEMP_D31B)
LD D, A

LD A, [DE]
LD [HL+], A

INC DE
LD A, [DE]
LD [HL], A
POP DE
RET

;ModifyVariable_StoreToVar8Bit
.ScriptCommand_StoreToVar8Bit_02_71E3:
LD A, $01
LD [ContinueProcessingScriptFlag], A
POP DE
LD L, E
LD H, D

INC HL
INC HL
PUSH HL

LD A, [ScriptTablePointer]
ADD A, E
LD E, A

LD A, [ScriptTablePointer+1]
ADC A, D
LD D, A

LD A, [DE]
INC DE
LD L, A
LD H, $00
ADD HL, HL

LD A, L
ADD A, LOW(ScriptTEMP_D31B)
LD L, A

LD A, H
ADC A, HIGH(ScriptTEMP_D31B)
LD H, A

LD A, [DE]
LD [HL+], A

XOR A
LD [HL], A
POP DE
RET


;ModifyVariable_16BitRNGStore
;stores random number
.ScriptCommand_StoreRNGToVar16Bit_02_720C:
LD A, $01
LD [ContinueProcessingScriptFlag], A
POP DE
LD L, E
LD H, D

INC HL
PUSH HL
LD A, [ScriptTablePointer]
ADD A, E
LD E, A

LD A, [ScriptTablePointer+1]
ADC A, D
LD D, A

LD A, [DE]
LD L, A
LD H, $00
ADD HL, HL

LD A, L
ADD A, LOW(ScriptTEMP_D31B)
LD L, A

LD A, H
ADC A, HIGH(ScriptTEMP_D31B)
LD H, A
CALL UpdateRandomNumber_00_0ADB

LD A, [RandomNumber]
LD [HL+], A

LD A, [RandomNumber+1]
LD [HL], A
POP DE
RET

;ModifyVariable_8BitRNGStore
.ScriptCommandStoreRNGToVar8Bit_02_723A:
LD A, $01
LD [ContinueProcessingScriptFlag], A

POP DE
LD L, E
LD H, D

INC HL
PUSH HL

LD A, [ScriptTablePointer]
ADD A, E
LD E, A

LD A, [ScriptTablePointer+1]
ADC A, D
LD D, A

LD A, [DE]
LD L, A
LD H, $00
ADD HL, HL
LD A, L
ADD A, LOW(ScriptTEMP_D31B)
LD L, A

LD A, H
ADC A, HIGH(ScriptTEMP_D31B)
LD H, A
CALL UpdateRandomNumber_00_0ADB

LD A, [RandomNumber]
LD [HL+], A

XOR A
LD [HL], A
POP DE
RET

;ModifyVariable_AddToVar8Bit
.ScriptCommand_AddToVar8Bit_02_7266:
LD A, $01
LD [ContinueProcessingScriptFlag], A

POP DE
LD L, E
LD H, D

INC HL
INC HL
PUSH HL
LD A, [ScriptTablePointer]
ADD A, E
LD E, A
LD A, [ScriptTablePointer+1]
ADC A, D
LD D, A
LD A, [DE]
INC DE
LD L, A
LD H, $00
ADD HL, HL

LD A, L
ADD A, LOW(ScriptTEMP_D31B)
LD L, A

LD A, H
ADC A, HIGH(ScriptTEMP_D31B)
LD H, A

LD A, [DE]
LD E, A
LD A, [HL]
ADD A, E
JR NC, .CODE_02_7291

LD A, $FF                                                   ;max

.CODE_02_7291:
LD [HL+], A

XOR A                                                       ;high byte is always 0
LD [HL], A
POP DE
RET

;ModifyVariable_SubFromVar8Bit
.ScriptCommand_SubFromVar8Bit_02_7296:
LD A, $01
LD [ContinueProcessingScriptFlag], A
POP DE
LD L, E
LD H, D
INC HL
INC HL
PUSH HL
LD A, [ScriptTablePointer]
ADD A, E
LD E, A

LD A, [ScriptTablePointer+1]
ADC A, D
LD D, A

LD A, [DE]
INC DE
LD L, A
LD H, $00
ADD HL, HL

LD A, L
ADD A, LOW(ScriptTEMP_D31B)
LD L, A

LD A, H
ADC A, HIGH(ScriptTEMP_D31B)
LD H, A

LD A, [DE]
LD E, A

LD A, [HL]
SUB E
JR NC, .CODE_02_72C0                                        ;prevent underflow
XOR A

.CODE_02_72C0:
LD [HL+], A

XOR A
LD [HL], A
POP DE
RET

.SetupVarAnd16BitValue_02_72C5:
LD A, [ScriptTablePointer]
ADD A, E
LD E, A

LD A, [ScriptTablePointer+1]
ADC A, D
LD D, A

LD A, [DE]                                                  ;first argument is 8-bit. this is gonna be the variable that we're messing with in some way
LD C, A

INC DE
LD A, [DE]                                                  ;second argument is 16-bit. it's either a variable or a fixed value
LD L, A

INC DE
LD A, [DE]
LD H, A

LD E, C
LD D, $00
SLA E
RL D

LD A, E
ADD A, LOW(ScriptTEMP_D31B)
LD E, A

LD A, D
ADC A, HIGH(ScriptTEMP_D31B)
LD D, A

CALL MaybeFetchValueFromVariable_00_12AE
RET

;ScriptBranch
;constant branch
.ScriptCommand_Branch_02_72EA:
LD A, $01
LD [ContinueProcessingScriptFlag], A
POP HL

LD A, [ScriptTablePointer]
ADD A, L
LD L, A

LD A, [ScriptTablePointer+1]
ADC A, H
LD H, A

LD A, [HL+]
LD E, A
LD D, [HL]
RET

;LoadScript
;used to get a script entry from a script entry table. either a fixed or via a variable.
.ScriptCommand_LoadScriptEntry_02_72FE:
LD A, $01
LD [ContinueProcessingScriptFlag], A
POP HL

LD A, [ScriptTablePointer]
ADD A, L
LD L, A

LD A, [ScriptTablePointer+1]
ADC A, H
LD H, A

LD A, [HL+]
LD H, [HL]
LD L, A
CALL MaybeFetchValueFromVariable_00_12AE

LD A, L
LD [ScriptEntryID], A

LD A, H
LD [ScriptEntryID+1], A

LD A, $01                                                   ;loading a new script
LD [LoadScriptFlag], A                                      ;
RET                                                         ;

;LoadScriptWithTransition
.ScriptCommand_LoadScriptEntryWithTransition_02_7322:
POP HL
LD A, [ScriptTablePointer]
ADD A, L
LD L, A

LD A, [ScriptTablePointer+1]
ADC A, H
LD H, A

LD A, [HL+]
LD H, [HL]
LD L, A
CALL MaybeFetchValueFromVariable_00_12AE

LD A, L
LD [ScriptEntryID], A

LD A, H
LD [ScriptEntryID+1], A

LD A, $01
LD [StopExecutingScriptFlag], A

LD A, ScriptExecutionState_EndExecution
LD [ScriptExecutionState], A
RET

;DecisionBranches_3Branches
.ScriptCommand_3DecisionBranches_02_7346:
LD A, $01
LD [ContinueProcessingScriptFlag], A

POP HL
LD E, L
LD D, H

INC DE
INC DE
INC DE
INC DE

LD A, [ScriptTablePointer]
ADD A, L
LD L, A

LD A, [ScriptTablePointer+1]
ADC A, H
LD H, A

LD A, [DecisionVariable]
CP $02                                                      ;the rest skip over
JR NC, .RETURN_02_736E

SLA A
ADD A, L
LD L, A

LD A, H
ADC A, $00
LD H, A

LD A, [HL+]
LD E, A
LD D, [HL]

.RETURN_02_736E:
RET

;DecisionBranches_4Branches
.ScriptCommand_4DecisionBranches_02_736F:
LD A, $01
LD [ContinueProcessingScriptFlag], A

POP HL
LD E, L
LD D, H

LD A, $06
ADD A, E
LD E, A

LD A, D
ADC A, $00
LD D, A

LD A, [ScriptTablePointer]
ADD A, L
LD L, A

LD A, [ScriptTablePointer+1]
ADC A, H
LD H, A

LD A, [DecisionVariable]
CP $03
JR NC, .RETURN_02_739B

SLA A
ADD A, L
LD L, A

LD A, H
ADC A, $00
LD H, A

LD A, [HL+]
LD E, A
LD D, [HL]

.RETURN_02_739B:
RET

;DecisionBranches_5Branches
.ScriptCommand_5DecisionBranches_02_739C:
LD A, $01
LD [ContinueProcessingScriptFlag], A

POP HL
LD E, L
LD D, H

LD A, $08
ADD A, E
LD E, A

LD A, D
ADC A, $00
LD D, A

LD A, [ScriptTablePointer]
ADD A, L
LD L, A

LD A, [ScriptTablePointer+1]
ADC A, H
LD H, A

LD A, [DecisionVariable]
CP $04
JR NC, .RETURN_02_73C8

SLA A
ADD A, L
LD L, A

LD A, H
ADC A, $00
LD H, A

LD A, [HL+]
LD E, A
LD D, [HL]

.RETURN_02_73C8:
RET

;DecisionBranches_6Branches
.ScriptCommand_6DecisionBranches_02_73C9:
LD A, $01
LD [ContinueProcessingScriptFlag], A

POP HL
LD E, L
LD D, H

LD A, $0A
ADD A, E
LD E, A

LD A, D
ADC A, $00
LD D, A

LD A, [ScriptTablePointer]
ADD A, L
LD L, A

LD A, [ScriptTablePointer+1]
ADC A, H
LD H, A

LD A, [DecisionVariable]
CP $05
JR NC, .RETURN_02_73F5

SLA A
ADD A, L
LD L, A

LD A, H
ADC A, $00
LD H, A

LD A, [HL+]
LD E, A
LD D, [HL]

.RETURN_02_73F5:
RET

;VariableScriptBranch
.ScriptCommand_VariableCompare_02_73F6:
LD A, $01
LD [ContinueProcessingScriptFlag], A

POP DE
LD L, E
LD H, D

LD A, $06                                                   ;should skip over 6 bytes
ADD A, L
LD L, A

LD A, H
ADC A, $00
LD H, A
PUSH HL

LD A, [ScriptTablePointer]
ADD A, E
LD E, A

LD A, [ScriptTablePointer+1]
ADC A, D
LD D, A

LD A, [DE]
LD [ScriptVariableCheck_WhichCheck], A

INC DE
LD A, [DE]
LD [ScriptVariableCheck_FirstValue], A

INC DE
LD A, [DE]
LD [ScriptVariableCheck_SecondValue], A

INC DE
LD A, [DE]
LD [ScriptVariableCheck_SecondValue+1], A

INC DE
PUSH DE
CALL VariableBranchCheck_00_1126
POP DE
JR NZ, .CODE_02_742F                                        ;if whatever check we did succeeded, branch to new location
POP DE
JR .RETURN_02_7435                                          ;otherwise continue

.CODE_02_742F:
POP HL
LD L, E
LD H, D

LD A, [HL+]
LD E, A
LD D, [HL]

.RETURN_02_7435:
RET

;ScriptBranch_VarEqualVal8Bit
;check if a variable equals an 8-bit value and takes a branch if equals
;compares variable against a fixed value
.ScriptCommand_Compare_8BitVarVsVal_Equal_02_7436:
LD A, $01
LD [ContinueProcessingScriptFlag], A

POP DE
LD L, E
LD H, D
INC HL
INC HL
INC HL
INC HL
PUSH HL

LD A, [ScriptTablePointer]
ADD A, E
LD E, A

LD A, [ScriptTablePointer+1]
ADC A, D
LD D, A

LD A, [DE]
INC DE
LD L, A
LD H, $00
ADD HL, HL

LD A, L
ADD A, LOW(ScriptTEMP_D31B)
LD L, A

LD A, H
ADC A, HIGH(ScriptTEMP_D31B)
LD H, A

LD A, [DE]
INC DE
CP [HL]
JR Z, .CODE_02_7463

POP DE
JR .RETURN_02_7469

.CODE_02_7463:
POP HL
LD L, E
LD H, D

LD A, [HL+]
LD E, A
LD D, [HL]

.RETURN_02_7469:
RET

;ScriptBranch_VarGreaterVal8Bit
.ScriptCommand_Compare_8BitVarVsVal_Greater_02_746A:
LD A, $01
LD [ContinueProcessingScriptFlag], A
POP DE
LD L, E
LD H, D

INC HL
INC HL
INC HL
INC HL
PUSH HL

LD A, [ScriptTablePointer]
ADD A, E
LD E, A

LD A, [ScriptTablePointer+1]
ADC A, D
LD D, A

LD A, [DE]
INC DE
LD L, A
LD H, $00
ADD HL, HL

LD A, L
ADD A, LOW(ScriptTEMP_D31B)
LD L, A

LD A, H
ADC A, HIGH(ScriptTEMP_D31B)
LD H, A

LD A, [DE]
INC DE
CP [HL]
JR C, .CODE_02_7497

POP DE
JR .RETURN_02_749D

.CODE_02_7497:
POP HL
LD L, E
LD H, D

LD A, [HL+]
LD E, A
LD D, [HL]

.RETURN_02_749D:
RET

;ScriptBranch_VarLessVal8Bit
.ScriptCommand_Compare_8BitVarVsVal_Less_02_749E:
LD A, $01
LD [ContinueProcessingScriptFlag], A

POP DE
LD L, E
LD H, D

INC HL
INC HL
INC HL
INC HL
PUSH HL

LD A, [ScriptTablePointer]
ADD A, E
LD E, A

LD A, [ScriptTablePointer+1]
ADC A, D
LD D, A

LD A, [DE]
INC DE
LD L, A
LD H, $00
ADD HL, HL
LD A, L
ADD A, LOW(ScriptTEMP_D31B)
LD L, A

LD A, H
ADC A, HIGH(ScriptTEMP_D31B)
LD H, A

LD A, [DE]                                                  ;load value
INC DE
CP [HL]                                                     ;compare against var
JR Z, .CODE_02_74CA                                         ;equal, skip branch
JR NC, .CODE_02_74CD                                        ;if value is greater than variable, that means variable is less than value, branch

.CODE_02_74CA:
POP DE
JR .RETURN_02_74D3

.CODE_02_74CD:
POP HL
LD L, E
LD H, D

LD A, [HL+]
LD E, A
LD D, [HL]

.RETURN_02_74D3:
RET

;ScriptBranch_VarEqualVar16Bit
;compares two 16-bit variables and takes a branch if condition is true
.ScriptCommand_Compare_16BitVarVsVar_Equal_02_74D4:
LD A, $01
LD [ContinueProcessingScriptFlag], A

POP DE
LD L, E
LD H, D

INC HL
INC HL
INC HL
INC HL
PUSH HL

LD A, [ScriptTablePointer]
ADD A, E
LD E, A

LD A, [ScriptTablePointer+1]
ADC A, D
LD D, A

LD A, [DE]
INC DE
LD L, A
LD H, $00
ADD HL, HL

LD A, L
ADD A, LOW(ScriptTEMP_D31B)
LD L, A

LD A, H
ADC A, HIGH(ScriptTEMP_D31B)
LD H, A

LD A, [DE]
INC DE
LD C, E
LD B, D
LD E, A
LD D, $00
SLA E
RL D

LD A, E
ADD A, LOW(ScriptTEMP_D31B)
LD E, A

LD A, D
ADC A, HIGH(ScriptTEMP_D31B)
LD D, A

LD A, [DE]
CP [HL]
JR NZ, .CODE_02_7516

INC DE
INC HL

LD A, [DE]
CP [HL]
JR Z, .CODE_02_7519

.CODE_02_7516:
POP DE
JR .RETURN_02_751F

.CODE_02_7519:
POP HL
LD L, C
LD H, B
LD A, [HL+]
LD E, A
LD D, [HL]

.RETURN_02_751F:
RET

;ScriptBranch_VarGreaterVar16Bit
.ScriptCommand_Compare_16BitVarVsVar_Greater_02_7520:
LD A, $01
LD [ContinueProcessingScriptFlag], A

POP DE
LD L, E
LD H, D

INC HL
INC HL
INC HL
INC HL
PUSH HL

LD A, [ScriptTablePointer]
ADD A, E
LD E, A

LD A, [ScriptTablePointer+1]
ADC A, D
LD D, A

LD A, [DE]
INC DE
LD L, A
LD H, $00
ADD HL, HL

LD A, L
ADD A, LOW(ScriptTEMP_D31B)
LD L, A

LD A, H
ADC A, HIGH(ScriptTEMP_D31B)
LD H, A

LD A, [DE]
INC DE
LD C, E
LD B, D
LD E, A

LD D, $00
SLA E
RL D

LD A, E
ADD A, LOW(ScriptTEMP_D31B)
LD E, A

LD A, D
ADC A, HIGH(ScriptTEMP_D31B)
LD D, A

INC DE
INC HL

LD A, [DE]                                                  ;compare second variable against first
CP [HL]
JR C, .CODE_02_7567

DEC DE
DEC HL
LD A, [DE]
CP [HL]
JR C, .CODE_02_7567

POP DE
JR .RETURN_02_756D

.CODE_02_7567:
POP HL
LD L, C
LD H, B
LD A, [HL+]
LD E, A
LD D, [HL]

.RETURN_02_756D:
RET

;ScriptBranch_VarLessVar16Bit
.ScriptCommand_Compare_16BitVarVsVar_Less_02_756E:
LD A, $01
LD [ContinueProcessingScriptFlag], A

POP DE
LD L, E
LD H, D

INC HL
INC HL
INC HL
INC HL
PUSH HL

LD A, [ScriptTablePointer]
ADD A, E
LD E, A

LD A, [ScriptTablePointer+1]
ADC A, D
LD D, A

LD A, [DE]
INC DE
LD L, A
LD H, $00
ADD HL, HL

LD A, L
ADD A, LOW(ScriptTEMP_D31B)
LD L, A

LD A, H
ADC A, HIGH(ScriptTEMP_D31B)
LD H, A

LD A, [DE]
INC DE
LD C, E
LD B, D
LD E, A

LD D, $00
SLA E
RL D

LD A, E
ADD A, LOW(ScriptTEMP_D31B)
LD E, A

LD A, D
ADC A, HIGH(ScriptTEMP_D31B)
LD D, A

INC DE
INC HL

LD A, [DE]
CP [HL]
JR C, .CODE_02_75B6
JR NZ, .CODE_02_75B9

DEC DE
DEC HL
LD A, [DE]
CP [HL]
JR C, .CODE_02_75B6
JR NZ, .CODE_02_75B9

.CODE_02_75B6:
POP DE
JR .RETURN_02_75BF

.CODE_02_75B9:
POP HL
LD L, C
LD H, B
LD A, [HL+]
LD E, A
LD D, [HL]

.RETURN_02_75BF:
RET

;ScriptBranch_SuperGameBoy
;checks if the game is played via Super Game Boy. if the check succeeds, it takes a 16-bit branch to a new location in script logic
.ScriptCommand_SuperGameBoyBranch_02_75C0:
LD A, $01
LD [ContinueProcessingScriptFlag], A
POP DE

LD A, [SuperGameBoyFlag]                                                ;check super game boy
OR A
JR NZ, .CODE_02_75D0

INC DE
INC DE
JR .RETURN_02_75DF

.CODE_02_75D0:
LD A, [ScriptTablePointer]
ADD A, E
LD E, A

LD A, [ScriptTablePointer+1]
ADC A, D
LD D, A

LD L, E
LD H, D
LD A, [HL+]

LD E, A
LD D, [HL]

.RETURN_02_75DF:
RET

;ScriptBranch_StrengthCheck
;a player "strength" check (a combination of (Fit*2 + Energy) against RNG
.ScriptCommand_PlayerStrengthBranch_02_75E0:
LD A, $01
LD [ContinueProcessingScriptFlag], A

CALL UpdateRandomNumber_00_0ADB

POP DE
LD L, E
LD H, D

INC HL
INC HL
INC HL
INC HL
PUSH HL

LD A, [ScriptTablePointer]
ADD A, E
LD E, A

LD A, [ScriptTablePointer+1]
ADC A, D
LD D, A

LD A, [DE]
INC DE
LD L, A

LD A, [DE]
INC DE
LD H, A
CALL MaybeFetchValueFromVariable_00_12AE

LD C, E
LD B, D
ADD HL, HL

LD A, L
ADD A, LOW(ScriptCodeStorage+(.POINTERS_02_7650-ScriptCommandPointers_02_6EB2))
LD L, A

LD A, H
ADC A, HIGH(ScriptCodeStorage+(.POINTERS_02_7650-ScriptCommandPointers_02_6EB2))
LD H, A

LD A, [HL+]                                                 ;get pointer
LD H, [HL]
LD L, A
PUSH HL
PUSH BC

LD A, [CurrentSave_FitStat]                                 ;
LD L, A                                                     ;get fitness stat
LD H, $00                                                   ;
ADD HL, HL                                                  ;times 2

LD A, [CurrentSave_EnergyStat]                              ;add energy on top
ADD A, L                                                    ;
LD L, A                                                     ;

LD A, H                                                     ;
ADC A, $00                                                  ;
LD H, A                                                     ;player's resulting "strength" value

LD C, $00                                                   ;
LD DE, -152                                                 ;every 152 "strength", the check becomes easier
LD B, $04                                                   ;

.LOOP_02_762A:
ADD HL, DE                                                  ;
BIT 7, H                                                    ;check if player isn't "strong" enough
JR NZ, .CODE_02_7633                                        ;

INC C                                                       ;
DEC B                                                       ;
JR NZ, .LOOP_02_762A

.CODE_02_7633:
LD A, C
POP BC
POP HL
ADD A, L
LD L, A

LD A, H
ADC A, $00
LD H, A

LD A, [HL]                                                  ;check if checked value is 0
OR A                                                        ;
JR Z, .CODE_02_7646                                         ;don't take the branch. instant fail

LD HL, RandomNumber                                         ;
CP [HL]                                                     ;
JR NC, .CODE_02_7649                                        ;check if chance is higher than or equal RNG. in which case, do take the branch

.CODE_02_7646:
POP DE                                                      ;

.CODE_02_7647:
JR .RETURN_02_764F                                          ;

.CODE_02_7649:
POP HL                                                      ;
LD L, C                                                     ;
LD H, B                                                     ;

LD A, [HL+]                                                 ;
LD E, A                                                     ;
LD D, [HL]                                                  ;

.RETURN_02_764F:
RET

.POINTERS_02_7650:
dw ScriptCodeStorage+(.DATA_02_7656-ScriptCommandPointers_02_6EB2)
dw ScriptCodeStorage+(.DATA_02_765B-ScriptCommandPointers_02_6EB2)
dw ScriptCodeStorage+(.DATA_02_7660-ScriptCommandPointers_02_6EB2)

.DATA_02_7656:
db $00,$3F,$7F,$BF,$FF ;easy

.DATA_02_765B:
db $00,$00,$3F,$7F,$BF ;medium

.DATA_02_7660:
db $00,$00,$00,$3F,$7F ;HARDCORE

;ExecuteSubScript
;execute a different script, then return back to executing current one
.ScriptCommand_ExecuteSubscript_02_7665:
LD A, $01
LD [ContinueProcessingScriptFlag], A

POP BC
PUSH BC
INC BC
INC BC

LD A, B
CALL PushToSubscriptStack_00_12EC

LD A, C
CALL PushToSubscriptStack_00_12EC

POP HL
LD A, [ScriptTablePointer]
ADD A, L
LD L, A

LD A, [ScriptTablePointer+1]
ADC A, H
LD H, A

LD A, [HL+]
LD E, A
LD D, [HL]
RET

;Skip2Bytes
;Probably a template for a command that would use 2 bytes worth of arguments. As is, it simply skips two bytes ahead.
.ScriptCommand_Skip2Bytes_02_7685:
LD A, $01
LD [ContinueProcessingScriptFlag], A

POP DE
LD L, E
LD H, D

INC HL
INC HL
PUSH HL

POP DE
RET

;EndSubscript
.ScriptCommand_EndSubscript_02_7692:
LD A, $01
LD [ContinueProcessingScriptFlag], A

POP HL
CALL PullFromSubscriptStack_00_12F8

LD B, A
CALL PullFromSubscriptStack_00_12F8
LD E, B
LD D, A
RET

;DoNothing
;Most likely a template for a command that takes no arguments. Does nothing if executed.
.ScriptCommand_DoNothing_02_76A2:
LD A, $01                                                   ;
LD [ContinueProcessingScriptFlag], A                        ;
POP DE                                                      ;
RET                                                         ;

;PlayMusic
.ScriptCommand_PlayMusic_02_76A9:
LD A, $01
LD [ContinueProcessingScriptFlag], A
POP DE
LD L, E
LD H, D
INC HL
PUSH HL
LD A, [ScriptTablePointer]
ADD A, E
LD E, A

LD A, [ScriptTablePointer+1]
ADC A, D
LD D, A

LD A, [DE]
CALL ChangeMusic_00_0B12
POP DE
RET

;PlaySFX
.ScriptCommand_PlaySFX_02_76C3:
LD A, $01
LD [ContinueProcessingScriptFlag], A
POP DE
LD L, E
LD H, D
INC HL
PUSH HL
LD A, [ScriptTablePointer]
ADD A, E
LD E, A

LD A, [ScriptTablePointer+1]
ADC A, D
LD D, A

LD A, [DE]                                                  ;simply queues SFX.
LD [SoundQueue], A
POP DE
RET

;VariableSceneFadeIn
;1 byte argument - fade speed. if bit 7 is enabled, the script won't execute during fading, otherwise it will.
.ScriptCommand_VariableSceneFadeIn_02_76DD:
POP DE                                                      ;

LD A, [SkippedSequenceFadingFlag]                           ;fade in is ignored if event is set to fade out because it's being skipped
OR A                                                        ;
JR NZ, .RETURN_02_771A                                      ;

LD L, E
LD H, D
INC HL
PUSH HL

LD A, [ScriptTablePointer]
ADD A, E
LD E, A

LD A, [ScriptTablePointer+1]
ADC A, D
LD D, A

LD A, [DE]
CP $80
JR C, .CODE_02_7702
LD B, A
LD A, ScriptExecutionState_WaitForFade
LD [ScriptExecutionState], A

LD A, B
AND $7F
JR .CODE_02_7709

.CODE_02_7702:
LD B, A
LD A, $01
LD [ContinueProcessingScriptFlag], A
LD A, B

.CODE_02_7709:
LD [FadeSpeed], A
LD [FadeCounter], A

LD A, $01
LD [FadeDirection], A

LD A, $06
LD [FadeTimer], A
POP DE

.RETURN_02_771A:
RET

;SceneFadeIn
;default scene fade in. script will wait for the fade to end.
.ScriptCommand_SceneFadeIn_02_771B:
POP DE                                                      ;

LD A, [SkippedSequenceFadingFlag]                           ;don't do any scripted fading if scene is being skipped
OR A                                                        ;
JR NZ, .RETURN_02_772A                                      ;

LD A, ScriptExecutionState_WaitForFade                      ;
LD [ScriptExecutionState], A                                ;

CALL InitFadeIn_00_0A25                                     ;

.RETURN_02_772A:
RET                                                         ;

;VariableSceneFadeOut
;1 byte argument - fade speed. if bit 7 is enabled, the script won't execute during fading, otherwise it will.
.ScriptCommand_VariableSceneFadeOut_02_772B:
POP DE                                                      ;

LD A, [SkippedSequenceFadingFlag]                           ;don't do fade out if current sequence is being skipped
OR A                                                        ;
JR NZ, .RETURN_02_7768                                      ;

LD L, E
LD H, D
INC HL
PUSH HL

LD A, [ScriptTablePointer]
ADD A, E
LD E, A

LD A, [ScriptTablePointer+1]
ADC A, D
LD D, A

LD A, [DE]
CP $80
JR C, .CODE_02_7750

LD B, A
LD A, ScriptExecutionState_WaitForFade
LD [ScriptExecutionState], A
LD A, B
AND $7F
JR .CODE_02_7757

.CODE_02_7750:
LD B, A
LD A, $01
LD [ContinueProcessingScriptFlag], A
LD A, B

.CODE_02_7757:
LD [FadeSpeed], A
LD [FadeCounter], A

LD A, $FF
LD [FadeDirection], A

LD A, $06
LD [FadeTimer], A
POP DE

.RETURN_02_7768:
RET

;SceneFadeOut
;default scene fade out. script will patiently wait for the fade to end before resuming.
.ScriptCommand_SceneFadeOut_02_7769:
POP DE                                                      ;

LD A, [SkippedSequenceFadingFlag]                           ;don't do fade out if current sequence is being skipped
OR A                                                        ;
JR NZ, .RETURN_02_7778                                      ;

LD A, ScriptExecutionState_WaitForFade                      ;
LD [ScriptExecutionState], A                                ;

CALL InitFadeOut_00_0A38                                    ;

.RETURN_02_7778:
RET                                                         ;

;LoadBackground
.ScriptCommand_LoadBackground_02_7779:
LD A, $01
LD [ContinueProcessingScriptFlag], A
POP DE
LD L, E
LD H, D
INC HL
INC HL
PUSH HL

LD A, [ScriptTablePointer]
ADD A, E
LD E, A

LD A, [ScriptTablePointer+1]
ADC A, D
LD D, A

LD A, [DE]
INC DE
LD L, A
LD A, [DE]

LD H, A
CALL MaybeFetchValueFromVariable_00_12AE

LD A, L
LD [BackgroundGraphicsID], A
CALL LoadBackground_00_1B97

POP DE
RET

;LoadBackgroundAlt
;alternate load background (different pointers)
.ScriptCommand_LoadBackgroundAlt_02_779F:
LD A, $01
LD [ContinueProcessingScriptFlag], A

POP DE
LD L, E
LD H, D
INC HL
INC HL
PUSH HL
LD A, [ScriptTablePointer]
ADD A, E
LD E, A

LD A, [ScriptTablePointer+1]
ADC A, D
LD D, A

LD A, [DE]
INC DE
LD L, A

LD A, [DE]
LD H, A
CALL MaybeFetchValueFromVariable_00_12AE

LD A, L
LD [BackgroundGraphicsID], A

CALL LoadBackgroundAlt_00_1BEA
POP DE
RET

;UpdateCamera
;change camera position. not used in this game
.ScriptCommand_UpdateCameraPosition_02_77C5:
LD A, $01
LD [ContinueProcessingScriptFlag], A
POP DE
LD L, E
LD H, D

INC HL
INC HL
INC HL
INC HL
PUSH HL

LD A, [ScriptTablePointer]
ADD A, E
LD E, A

LD A, [ScriptTablePointer+1]
ADC A, D
LD D, A

LD A, [DE]
INC DE
LD L, A

LD A, [DE]
INC DE
LD H, A
CALL MaybeFetchValueFromVariable_00_12AE

LD A, L
LD [CameraPositionY], A

LD A, [DE]
INC DE
LD L, A

LD A, [DE]
LD H, A
CALL MaybeFetchValueFromVariable_00_12AE

LD A, L
LD [CameraPositionX], A

LD A, $01
LD [CameraLock], A
POP DE
RET

;VariableLoadCharacter
.ScriptCommand_VariableLoadCharacter_02_77FC:
LD A, $01
LD [ContinueProcessingScriptFlag], A
POP DE
LD L, E
LD H, D
INC HL
INC HL
PUSH HL
LD A, [ScriptTablePointer]
ADD A, E
LD E, A

LD A, [ScriptTablePointer+1]
ADC A, D
LD D, A
LD A, [DE]
INC DE
LD L, A
LD A, [DE]
INC DE
LD H, A
CALL MaybeFetchValueFromVariable_00_12AE

LD A, L
LD [CurrentCharacter], A

CALL GetCharacterAppearance_00_1C8E
CALL LoadCharacterGraphicsBank_00_1CAB
CALL LoadCharacterVisuals_00_1CE0

LD A, $01
LD [CharacterDisplay_DisplayOnFlag], A

LD A, $01
LD [CharacterDisplay_UpdateFlag], A
POP DE
RET

;FixedLoadCharacter
;takes next byte input in bitwise format:
;EEEOOCCC
;C - character
;O - outfit
;E - character's expression
;outfit dictates which appearance the character takes, only possible values are 0-3 (see enums for possible values)
.ScriptCommand_FixedLoadCharacter_02_7833:
LD A, $01
LD [ContinueProcessingScriptFlag], A

POP DE
LD L, E
LD H, D
INC HL
PUSH HL
LD A, [ScriptTablePointer]
ADD A, E
LD E, A

LD A, [ScriptTablePointer+1]
ADC A, D
LD D, A

LD A, [DE]
LD L, A
AND $07
LD [CurrentCharacter], A
SRL L
SRL L
SRL L
LD A, L
AND $03
LD [CurrentCharacter_Display], A
SRL L
SRL L
LD A, L
LD [CurrentCharacter_Expression], A

CALL GetCharacterAppearance_00_1C8E
CALL LoadCharacterGraphicsBank_00_1CAB
CALL LoadCharacterVisuals_00_1CE0

LD A, $01
LD [CharacterDisplay_DisplayOnFlag], A

LD A, $01
LD [CharacterDisplay_UpdateFlag], A
POP DE
RET

;UpdateCharacterEmote
.ScriptCommand_SetCharExpression_Normal_02_7877:
LD A, $01
LD [ContinueProcessingScriptFlag], A

POP DE
XOR A                                                       ;CharProp_Emotion_Normal
LD [CurrentCharacter_Expression], A
RET

.ScriptCommand_SetCharExpression_Upset_02_7882:
LD A, $01
LD [ContinueProcessingScriptFlag], A

POP DE
LD A, CharProp_Emotion_Upset
LD [CurrentCharacter_Expression], A
RET

.ScriptCommand_SetCharExpression_Happy_02_788E:
LD A, $01
LD [ContinueProcessingScriptFlag], A

POP DE
LD A, CharProp_Emotion_Happy
LD [CurrentCharacter_Expression], A
RET

.ScriptCommand_SetCharExpression_Blush_02_789A:
LD A, $01
LD [ContinueProcessingScriptFlag], A

POP DE
LD A, CharProp_Emotion_Blush
LD [CurrentCharacter_Expression], A
RET

.ScriptCommand_SetCharExpression_Sad_02_78A6:
LD A, $01
LD [ContinueProcessingScriptFlag], A

POP DE
LD A, CharProp_Emotion_Sad
LD [CurrentCharacter_Expression], A
RET

;SetCharacterCoords
.ScriptCommand_SetCharCoordinates_02_78B2:
LD A, $01
LD [ContinueProcessingScriptFlag], A
POP DE
LD L, E
LD H, D

INC HL
INC HL
INC HL
INC HL
PUSH HL

LD A, [ScriptTablePointer]
ADD A, E
LD E, A

LD A, [ScriptTablePointer+1]
ADC A, D
LD D, A

LD A, [DE]
INC DE

LD L, A
LD A, [DE]
INC DE

LD H, A
CALL MaybeFetchValueFromVariable_00_12AE

LD A, L
LD [CharacterDisplay_BaseX], A

LD A, [DE]
INC DE
LD L, A

LD A, [DE]
LD H, A
CALL MaybeFetchValueFromVariable_00_12AE

LD A, L
LD [CharacterDisplay_BaseY], A

LD A, $01
LD [CharacterDisplay_UpdateFlag], A
POP DE
RET

;affects character image by applying or removing X or Y flip
;ApplyCharacterFlip
.ScriptCommand_FlipCharacter_02_78E9:
LD A, $01
LD [ContinueProcessingScriptFlag], A
POP DE

LD L, E
LD H, D
INC HL
INC HL
INC HL
PUSH HL

LD A, [ScriptTablePointer]
ADD A, E
LD E, A

LD A, [ScriptTablePointer+1]
ADC A, D
LD D, A

LD A, [DE]
INC DE
LD L, A

LD A, [DE]
INC DE
LD H, A
CALL MaybeFetchValueFromVariable_00_12AE

LD B, OAMProp_XFlip
LD A, [DE]
OR A
JR Z, .CODE_02_7910
SLA B                                                       ;Y flip

.CODE_02_7910:
BIT 0, L
JR Z, .CODE_02_791D

LD A, [CharacterDisplay_BaseProp]
OR B
LD [CharacterDisplay_BaseProp], A
JR .CODE_02_7928

.CODE_02_791D:
LD A, B
XOR $FF
LD B, A

LD A, [CharacterDisplay_BaseProp]
AND B
LD [CharacterDisplay_BaseProp], A

.CODE_02_7928:
LD A, $01
LD [CharacterDisplay_UpdateFlag], A
POP DE
RET

;ShowOrRemoveCharater
;used to either turn character display on or off. can be fixed or set via a variable
.ScriptCommand_ShowOrRemoveCharacter_02_792F:
LD A, $01
LD [ContinueProcessingScriptFlag], A

POP DE
LD L, E
LD H, D

INC HL
INC HL
PUSH HL

LD A, [ScriptTablePointer]
ADD A, E
LD E, A
LD A, [ScriptTablePointer+1]
ADC A, D
LD D, A
LD A, [DE]
INC DE
LD L, A
LD A, [DE]
INC DE
LD H, A
CALL MaybeFetchValueFromVariable_00_12AE

LD A, L
LD [CharacterDisplay_DisplayOnFlag], A

LD A, $01
LD [CharacterDisplay_UpdateFlag], A
POP DE
RET

;ShowCharacter
;enables character render. note: character must be loaded before hand
.ScriptCommand_ShowCharacter_02_7958:
LD A, $01
LD [ContinueProcessingScriptFlag], A
POP DE

LD A, $01
LD [CharacterDisplay_DisplayOnFlag], A
LD [CharacterDisplay_UpdateFlag], A
RET

;RemoveCharacter
;removes character render.
.ScriptCommand_RemoveCharacter_02_7967:
LD A, $01
LD [ContinueProcessingScriptFlag], A
POP DE

LD A, $00
LD [CharacterDisplay_DisplayOnFlag], A

LD A, $01
LD [CharacterDisplay_UpdateFlag], A
RET

;ClearTileLines
.ScriptCommand_ClearLinesOfTiles_02_7978:
POP DE                                                      ;
LD L, E                                                     ;
LD H, D                                                     ;

LD L, E                                                     ;accidental copy-macaroni, mmm!
LD H, D                                                     ;

LD A, $08                                                   ;skip over 8 bytes
ADD A, L
LD L, A

LD A, H
ADC A, $00
LD H, A

PUSH HL
LD A, [ScriptTablePointer]
ADD A, E
LD E, A

LD A, [ScriptTablePointer+1]
ADC A, D
LD D, A

LD A, [DE]
INC DE
LD L, A

LD A, [DE]
INC DE
LD H, A

CALL MaybeFetchValueFromVariable_00_12AE
LD A, L

PUSH DE
CALL PushToDrawingStack_00_0B5E
POP DE

LD A, [DE]
INC DE
LD L, A

LD A, [DE]
INC DE
LD H, A

CALL MaybeFetchValueFromVariable_00_12AE
LD A, L

PUSH DE
CALL PushToDrawingStack_00_0B5E
POP DE

LD A, [DE]
INC DE
LD L, A

LD A, [DE]
INC DE
LD H, A

CALL MaybeFetchValueFromVariable_00_12AE
LD A, L

PUSH DE
CALL PushToDrawingStack_00_0B5E
POP DE

LD A, [DE]
INC DE
LD L, A

LD A, [DE]
LD H, A
CALL MaybeFetchValueFromVariable_00_12AE

LD A, L
CALL PushToDrawingStack_00_0B5E

XOR A
CALL PushToDrawingStack_00_0B5E

LD A, CHARVAL(" ")                                          ;will fill with blank tiles
CALL PushToDrawingStack_00_0B5E
CALL FillLinesOfTiles_00_0E5E

LD B, $00
LD C, $06
CALL ResetDrawingStack_00_0B78
POP DE
RET

;ChangeMessagePrinting
;alters the way the message is printed.
.ScriptCommand_ChangeMessagePrinting_02_79DE:
POP DE                                                      ;
LD L, E                                                     ;
LD H, D                                                     ;

LD L, E                                                     ;someone made a copy-paste error, and that someone is not me. it's the developers.
LD H, D                                                     ;

LD A, $08                                                   ;8 bytes worth of arguments
ADD A, L                                                    ;
LD L, A                                                     ;

LD A, H                                                     ;
ADC A, $00                                                  ;
LD H, A                                                     ;
PUSH HL                                                     ;

LD A, [ScriptTablePointer]                                  ;
ADD A, E                                                    ;
LD E, A                                                     ;

LD A, [ScriptTablePointer+1]                                ;
ADC A, D                                                    ;
LD D, A                                                     ;

LD A, [DE]                                                  ;
INC DE                                                      ;
LD L, A                                                     ;

LD A, [DE]                                                  ;
INC DE                                                      ;
LD H, A                                                     ;

CALL MaybeFetchValueFromVariable_00_12AE                    ;
LD A, L                                                     ;

PUSH DE
CALL PushToDrawingStack_00_0B5E                             ;message column
POP DE

LD A, [DE]
INC DE
LD L, A

LD A, [DE]
INC DE
LD H, A

CALL MaybeFetchValueFromVariable_00_12AE
LD A, L

PUSH DE
CALL PushToDrawingStack_00_0B5E                             ;message row
POP DE

LD A, [DE]
INC DE
LD L, A

LD A, [DE]
INC DE
LD H, A

CALL MaybeFetchValueFromVariable_00_12AE
LD A, L

PUSH DE
CALL PushToDrawingStack_00_0B5E                             ;characters on a single line
POP DE

LD A, [DE]
INC DE
LD L, A

LD A, [DE]
LD H, A

CALL MaybeFetchValueFromVariable_00_12AE
LD A, L

CALL PushToDrawingStack_00_0B5E                             ;text lines

CALL StoreTextDrawingProperties_00_1922

LD B, $00
LD C, $04
CALL ResetDrawingStack_00_0B78
CALL ResetTextPrintPosition_00_191A
POP DE
RET

;EnablePlayerChoice_2Options
;plop a choice for the player
.ScriptCommand_EnablePlayerChoice_2Options_02_7A3E:
POP DE
LD L, E
LD H, D

INC HL
INC HL
PUSH HL

LD A, [ScriptTablePointer]
ADD A, E
LD E, A

LD A, [ScriptTablePointer+1]
ADC A, D
LD D, A

LD A, [DE]
INC DE
LD L, A

LD A, [DE]
LD H, A
CALL MaybeFetchValueFromVariable_00_12AE

LD A, L
LD [PlayerChoiceEntryOffset], A

LD A, H
LD [PlayerChoiceEntryOffset+1], A

LD A, LOW(DialogueChoiceData_TwoOptionPointer_00_1318)
LD [ChoiceOptions_OptionPositionOffset], A

LD A, HIGH(DialogueChoiceData_TwoOptionPointer_00_1318)
LD [ChoiceOptions_OptionPositionOffset+1], A

LD A, $C8
LD [UNKNOWN_C1D7], A

CALL InitializeTextChoiceFunctionality_00_10F4

LD A, ScriptExecutionState_WaitForPlayerChoice
LD [ScriptExecutionState], A
POP DE
RET

;EnablePlayerChoice_3Options
.ScriptCommand_EnablePlayerChoice_3Options_02_7A77:
POP DE
LD L, E
LD H, D

INC HL
INC HL
PUSH HL

LD A, [ScriptTablePointer]
ADD A, E
LD E, A

LD A, [ScriptTablePointer+1]
ADC A, D
LD D, A

LD A, [DE]
INC DE
LD L, A

LD A, [DE]
LD H, A
CALL MaybeFetchValueFromVariable_00_12AE

LD A, L
LD [PlayerChoiceEntryOffset], A

LD A, H
LD [PlayerChoiceEntryOffset+1], A

LD A, LOW(DialogueChoiceData_ThreeOptionPointer_00_1328)
LD [ChoiceOptions_OptionPositionOffset], A

LD A, HIGH(DialogueChoiceData_ThreeOptionPointer_00_1328)
LD [ChoiceOptions_OptionPositionOffset+1], A

LD A, $C8
LD [UNKNOWN_C1D7], A

CALL InitializeTextChoiceFunctionality_00_10F4

LD A, ScriptExecutionState_WaitForPlayerChoice
LD [ScriptExecutionState], A
POP DE
RET

;InviteCharacterForADate
.ScriptCommand_InviteCharacterForADate_02_7AB0:
XOR A                                                       ;
LD [OAMDMALockCheckFlag], A                                 ;

CALL LoadAndHandleCharacterInviteOnWalkScreen_00_3631       ;

LD A, $01                                                   ;
LD [OAMDMALockCheckFlag], A                                 ;

LD A, [ScriptBank]                                          ;
CALL SetProgramBank_00_037B                                 ;
POP DE                                                      ;

LD A, ScriptExecutionState_EndExecution                     ;
LD [ScriptExecutionState], A                                ;

LD A, $01                                                   ;
LD [FadedOutFromEventFlag], A                               ;the character invite while walking out screen faded out on its own, no need to do that again

LD A, [EventPoolDataStart]                                  ;
LD [EventPoolDataPointer], A                                ;

LD A, [EventPoolDataStart+1]                                ;
LD [EventPoolDataPointer+1], A                              ;
RET                                                         ;

;AffectRelationshipByGift
;used to affect relationship positively or not negatively.
.ScriptCommand_AffectRelationshipByGift_02_7ADA:
LD A, $01
LD [ContinueProcessingScriptFlag], A
POP DE
LD L, E
LD H, D
INC HL
INC HL
PUSH HL
LD A, [ScriptTablePointer]
ADD A, E
LD E, A

LD A, [ScriptTablePointer+1]
ADC A, D
LD D, A

LD A, [DE]
INC DE
LD L, A

LD A, [DE]
LD H, A
CALL MaybeFetchValueFromVariable_00_12AE
LD B, L                                                     ;which character's relationship to improve

PUSH BC
LD B, $03
LD HL, $0007
CALL GetPointerWithSize_00_0AEC                             ;
POP BC

LD A, [SelectedGift]                                        ;gift!
SLA A                                                       ;
SLA A                                                       ;
SLA A                                                       ;left shift three times
ADD A, B                                                    ;the argument to this command
ADD A, L                                                    ;offsets the table
LD L, A                                                     ;

LD A, H
ADC A, $00
LD H, A

LD A, [HL]                                                  ;value
LD C, A                                                     ;
XOR A                                                       ;this ensures that the relationship is added to
CALL ModifyCharacterRelationshipValues_00_1E1F              ;

LD A, [ScriptBank]
CALL SetProgramBank_00_037B
POP DE
RET

;PrintVariableValue8Bit
;Probably debug only, prints a value from the variable in decimal, 8-bit
.ScriptCommand_Print8BitVariableValue_02_7B20:
CALL InitializeTextBufferPointers_00_197D

LD A, $01
LD [ContinueProcessingScriptFlag], A
POP DE

LD L, E
LD H, D
INC HL
PUSH HL

LD A, [ScriptTablePointer]
ADD A, E
LD E, A

LD A, [ScriptTablePointer+1]
ADC A, D
LD D, A

LD A, [DE]
LD L, A
LD H, $00
ADD HL, HL

LD A, L
ADD A, LOW(ScriptTEMP_D31B)
LD L, A

LD A, H
ADC A, HIGH(ScriptTEMP_D31B)
LD H, A

LD A, [HL]
LD [HexToDecInput], A

XOR A
LD [HexToDecInput+1], A

LD HL, HexToDecInput
CALL GetHexToDecDigits_00_3CD5

LD DE, DecimalDigitArray

.LOOP_02_7B55:
LD A, [DE]
OR A
JR NZ, .CODE_02_7B5C

INC DE
JR .LOOP_02_7B55

.CODE_02_7B5C:
XOR A
LD [DecimalDigitArray+5], A
CALL StoreTextDataToRAM_00_19B8

LD A, TextParsingState_Parse
LD [TextParsingState], A
POP DE
RET

;PrintVariableValue16Bit
;Same as above but prints 16-bit decimal value
.ScriptCommand_Print16BitVariableValue_02_7B6A:
CALL InitializeTextBufferPointers_00_197D

LD A, $01
LD [ContinueProcessingScriptFlag], A

POP DE
LD L, E
LD H, D
INC HL
PUSH HL

LD A, [ScriptTablePointer]
ADD A, E
LD E, A

LD A, [ScriptTablePointer+1]
ADC A, D
LD D, A

LD A, [DE]
LD L, A
LD H, $00
ADD HL, HL

LD A, L
ADD A, LOW(ScriptTEMP_D31B)
LD L, A

LD A, H
ADC A, HIGH(ScriptTEMP_D31B)
LD H, A

LD A, [HL+]
LD [HexToDecInput], A

LD A, [HL]
LD [HexToDecInput+1], A

LD HL, HexToDecInput
CALL GetHexToDecDigits_00_3CD5

LD DE, DecimalDigitArray

.LOOP_02_7B9F:
LD A, [DE]
OR A
JR NZ, .CODE_02_7BA6

INC DE
JR .LOOP_02_7B9F

.CODE_02_7BA6:
XOR A
LD [DecimalDigitArray+5], A
CALL StoreTextDataToRAM_00_19B8

LD A, TextParsingState_Parse
LD [TextParsingState], A
POP DE
RET

;SeedRNG
.ScriptCommand_SeedRNG_02_7BB4:
LD A, $01                                                   ;
LD [ContinueProcessingScriptFlag], A                        ;
POP DE                                                      ;
LD L, E                                                     ;
LD H, D                                                     ;
INC HL
INC HL
PUSH HL

LD A, [ScriptTablePointer]
ADD A, E
LD E, A

LD A, [ScriptTablePointer+1]
ADC A, D
LD D, A

LD A, [DE]                                                  ;
INC DE                                                      ;
LD L, A                                                     ;

LD A, [DE]                                                  ;
LD H, A                                                     ;
CALL MaybeFetchValueFromVariable_00_12AE                    ;

LD A, L                                                     ;
LD [RandomNumber], A                                        ;

LD A, H                                                     ;
LD [RandomNumber+1], A                                      ;
POP DE                                                      ;
RET                                                         ;

;Debug_VariableEditor
;takes an argument of what variable to edit
.ScriptCommand_DebugSingleVariableEditor_02_7BDB:
POP DE
LD L, E
LD H, D
INC HL
INC HL
PUSH HL
LD A, [ScriptTablePointer]
ADD A, E
LD E, A

LD A, [ScriptTablePointer+1]
ADC A, D
LD D, A

LD A, [DE]
LD [$C184], A

XOR A
LD [$C185], A                                               ;currently selected value...?

.CODE_02_7BF3:
CALL WaitForVBlank_00_0382

LD A, [JoypadInputPress]
BitTest JoypadInput_A, A
JP NZ, ScriptCodeStorage+(.CODE_02_7C7A-ScriptCommandPointers_02_6EB2)
BitTest JoypadInput_B, A
JP NZ, ScriptCodeStorage+(.CODE_02_7C7A-ScriptCommandPointers_02_6EB2)
BitTest JoypadInput_Up, A
JR NZ, .CODE_02_7C16
BitTest JoypadInput_Down, A
JR NZ, .CODE_02_7C2B
BitTest JoypadInput_Left, A
JR NZ, .CODE_02_7C60
BitTest JoypadInput_Right, A
JR NZ, .CODE_02_7C6D
JP ScriptCodeStorage+(.CODE_02_7C7C-ScriptCommandPointers_02_6EB2)

.CODE_02_7C16:
LD A, [$C185]
SLA A
LD L, A
LD H, $00
LD A, L
ADD A, LOW(ScriptCodeStorage+(.DATA_02_7CE4-ScriptCommandPointers_02_6EB2))
LD L, A
LD A, H
ADC A, HIGH(ScriptCodeStorage+(.DATA_02_7CE4-ScriptCommandPointers_02_6EB2))
LD H, A
LD A, [HL+]
LD E, A
LD D, [HL]
JR .CODE_02_7C44

.CODE_02_7C2B:
LD A, [$C185]
SLA A
LD L, A
LD H, $00

LD A, L
ADD A, LOW(ScriptCodeStorage+(.DATA_02_7CE4-ScriptCommandPointers_02_6EB2))
LD L, A

LD A, H
ADC A, HIGH(ScriptCodeStorage+(.DATA_02_7CE4-ScriptCommandPointers_02_6EB2))
LD H, A

LD A, [HL+]
XOR $FF
LD E, A

LD A, [HL]
XOR $FF
LD D, A
INC DE

.CODE_02_7C44:
LD A, [$C184]
LD L, A
LD H, $00
ADD HL, HL

LD A, L
ADD A, LOW(ScriptTEMP_D31B)
LD L, A

LD A, H
ADC A, HIGH(ScriptTEMP_D31B)
LD H, A

LD A, [HL+]
LD C, A
LD A, [HL]
LD B, A
LD A, E
ADD A, C
LD C, A
LD A, D
ADC A, B
LD [HL-], A
LD [HL], C
JR .CODE_02_7C7C

.CODE_02_7C60:
LD HL, $C185
INC [HL]
LD A, [HL]
CP $05
JR NZ, .CODE_02_7C7C
LD [HL], $00
JR .CODE_02_7C7C

.CODE_02_7C6D:
LD HL, $C185
DEC [HL]
LD A, [HL]
CP $FF
JR NZ, .CODE_02_7C7C
LD [HL], $04
JR .CODE_02_7C7C

.CODE_02_7C7A:
JR .CODE_02_7CDF                                ;ends debug functionality

.CODE_02_7C7C:
LD A, [$C184]
LD L, A
LD H, $00
ADD HL, HL

LD A, L
ADD A, LOW(ScriptTEMP_D31B)
LD L, A

LD A, H
ADC A, HIGH(ScriptTEMP_D31B)
LD H, A
CALL GetHexToDecDigits_00_3CD5

LD HL, $9A20
LD DE, DecimalDigitArray
LD C, $05

.LOOP_02_7C96:
LD A, [DE]
CALL DrawOneBGTile_00_0C8C
INC HL
INC DE
DEC C
JR NZ, .LOOP_02_7C96

LD A, $00
CALL PushToDrawingStack_00_0B5E

LD A, $10
CALL PushToDrawingStack_00_0B5E

LD A, $05
CALL PushToDrawingStack_00_0B5E

LD A, $01
CALL PushToDrawingStack_00_0B5E

XOR A
CALL PushToDrawingStack_00_0B5E

LD A, CHARVAL(" ")
CALL PushToDrawingStack_00_0B5E
CALL FillLinesOfTiles_00_0E5E

LD B, $00
LD C, $06
CALL ResetDrawingStack_00_0B78

LD A, [$C185]
XOR $FF
LD L, A
LD H, $FF
INC HL

LD A, L
ADD A, $04
LD L, A

LD A, H
ADC A, $9A
LD H, A

LD A, BGTile_DownArrow
CALL DrawOneBGTile_00_0C8C
JP ScriptCodeStorage+(.CODE_02_7BF3-ScriptCommandPointers_02_6EB2) 

.CODE_02_7CDF:
CALL WaitForVBlank_00_0382                                  ;
POP DE                                                      ;
RET                                                         ;

.DATA_02_7CE4:
dw 1
dw 10
dw 100
dw 1000
dw 10000

;Debug_ExpandedVariableEditor
;activates debug variable viewer/editor
.ScriptCommand_DebugVariableEditorAndViewer_02_7CEE:
POP DE
LD L, E
LD H, D
PUSH HL
LD A, [ScriptTablePointer]
ADD A, E
LD E, A

LD A, [ScriptTablePointer+1]
ADC A, D
LD D, A

LD A, $0D
LD [$C184], A

LD A, $05
LD [$C185], A

.LOOP_02_7D06:
CALL WaitForVBlank_00_0382

LD A, [JoypadInputPress]
BitTest JoypadInput_A, A                                    ;if pressed either A...
JP NZ, ScriptCodeStorage+(.CODE_02_7D9C-ScriptCommandPointers_02_6EB2)
 
BitTest JoypadInput_B, A                                    ;or B, quit debugging
JP NZ, ScriptCodeStorage+(.CODE_02_7D9C-ScriptCommandPointers_02_6EB2)

BitTest JoypadInput_Up, A
JR NZ, .PressedUp_02_7D29

BitTest JoypadInput_Down, A
JR NZ, .PressedDown_02_7D3E

BitTest JoypadInput_Left, A
JR NZ, .CODE_02_7D82

BitTest JoypadInput_Right, A
JR NZ, .CODE_02_7D8F
JP ScriptCodeStorage+(.CODE_02_7D9F-ScriptCommandPointers_02_6EB2)

.PressedUp_02_7D29:
LD A, [$C185]
SLA A
LD L, A
LD H, $00

LD A, L
ADD A, LOW(ScriptCodeStorage+(.DATA_02_7E32-ScriptCommandPointers_02_6EB2))
LD L, A

LD A, H
ADC A, HIGH(ScriptCodeStorage+(.DATA_02_7E32-ScriptCommandPointers_02_6EB2))
LD H, A

LD A, [HL+]
LD E, A
LD D, [HL]
JR .CODE_02_7D57

.PressedDown_02_7D3E:
LD A, [$C185]
SLA A
LD L, A
LD H, $00

LD A, L
ADD A, LOW(ScriptCodeStorage+(.DATA_02_7E32-ScriptCommandPointers_02_6EB2))
LD L, A

LD A, H
ADC A, HIGH(ScriptCodeStorage+(.DATA_02_7E32-ScriptCommandPointers_02_6EB2))
LD H, A

LD A, [HL+]
XOR $FF
LD E, A
LD A, [HL]
XOR $FF
LD D, A
INC DE

.CODE_02_7D57:
LD A, [$C185]
CP $05
JR C, .CODE_02_7D66

LD HL, $C184
LD A, [HL]
ADD A, E
LD [HL], A
JR .CODE_02_7D9F

.CODE_02_7D66:
LD A, [$C184]
LD L, A
LD H, $00
ADD HL, HL

LD A, L
ADD A, LOW(ScriptTEMP_D31B)
LD L, A

LD A, H
ADC A, HIGH(ScriptTEMP_D31B)
LD H, A

LD A, [HL+]
LD C, A
LD A, [HL]
LD B, A
LD A, E
ADD A, C
LD C, A
LD A, D
ADC A, B
LD [HL-], A
LD [HL], C
JR .CODE_02_7D9F

.CODE_02_7D82:
LD HL, $C185
INC [HL]
LD A, [HL]
CP $08
JR NZ, .CODE_02_7D9F

LD [HL], $00
JR .CODE_02_7D9F

.CODE_02_7D8F:
LD HL, $C185
DEC [HL]
LD A, [HL]
CP $FF
JR NZ, .CODE_02_7D9F

LD [HL], $07
JR .CODE_02_7D9F

.CODE_02_7D9C:
JP ScriptCodeStorage+(.CODE_02_7E2D-ScriptCommandPointers_02_6EB2)

.CODE_02_7D9F:
LD A, [$C184]
LD [HexToDecInput], A

XOR A
LD [HexToDecInput+1], A

LD HL, HexToDecInput
CALL GetHexToDecDigits_00_3CD5

LD HL, $9A20
LD DE, DecimalDigitArray+2
LD C, $03

.LOOP_02_7DB7:
LD A, [DE]
CALL DrawOneBGTile_00_0C8C

INC HL
INC DE
DEC C
JR NZ, .LOOP_02_7DB7

LD A, CHARVAL(" ")
CALL DrawOneBGTile_00_0C8C

LD A, [$C184]
LD L, A
LD H, $00
ADD HL, HL

LD A, L
ADD A, LOW(ScriptTEMP_D31B)
LD L, A

LD A, H
ADC A, HIGH(ScriptTEMP_D31B)
LD H, A
CALL GetHexToDecDigits_00_3CD5

LD HL, $9A24
LD DE, DecimalDigitArray
LD C, $05

.LOOP_02_7DDF:
LD A, [DE]
CALL DrawOneBGTile_00_0C8C

INC HL
INC DE
DEC C
JR NZ, .LOOP_02_7DDF

LD A, $00
CALL PushToDrawingStack_00_0B5E

LD A, $10
CALL PushToDrawingStack_00_0B5E

LD A, $09
CALL PushToDrawingStack_00_0B5E

LD A, $01
CALL PushToDrawingStack_00_0B5E

XOR A
CALL PushToDrawingStack_00_0B5E

LD A, CHARVAL(" ")
CALL PushToDrawingStack_00_0B5E
CALL FillLinesOfTiles_00_0E5E

LD B, $00
LD C, $06
CALL ResetDrawingStack_00_0B78

LD A, [$C185]
CP $05
JR C, .CODE_02_7E17
INC A

.CODE_02_7E17:
XOR $FF
LD L, A

LD H, $FF
INC HL

LD A, L
ADD A, $08
LD L, A

LD A, H
ADC A, $9A
LD H, A

LD A, BGTile_DownArrow
CALL DrawOneBGTile_00_0C8C
JP ScriptCodeStorage+(.LOOP_02_7D06-ScriptCommandPointers_02_6EB2)  

.CODE_02_7E2D:
CALL WaitForVBlank_00_0382
POP DE
RET

.DATA_02_7E32:
dw 1
dw 10
dw 100
dw 1000
dw 10000
dw 1
dw 10
dw 100
.end