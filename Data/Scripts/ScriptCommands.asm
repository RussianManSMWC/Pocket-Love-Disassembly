;these macros are for script commands to make them readable

def VariableAlignment = ScriptTEMP_D31B % 2

macro ScriptArgumentVariable
  assert \1 >= ScriptTEMP_D31B && \1 <= ScriptTEMP_D31B+($FF*2), "The variable is out of range and cannot be accessed by scripting! (\1)"
  assert \1 % 2 == VariableAlignment, "Scripts cannot access high bytes of variables. Please allign the variable properly."
  db LOW((\1-ScriptTEMP_D31B)/2)
endm

macro ScriptArgumentVariableOrValue
  if \1 >= ScriptTEMP_D31B && \1 <= ScriptTEMP_D31B+($FF*2)
    assert \1 % 2 == VariableAlignment, "Scripts cannot access high bytes of variables. Please allign the variable properly."
    db LOW((\1-ScriptTEMP_D31B)/2),$80
  else
    dw \1
  endc
endm

macro EndScript
  db $00
endm

;make you able to skip intro text
macro MakeTextSkippable
  db $01
endm

macro LoadTextEntry
  db $02
  assert \1 <= $07FF, "Text entry cannot be higher than $07FF."
  db LOW(\1), HIGH(\1)+\2<<3
endm

;arguments:
;first argument is either a fixed bank or a variable containing the bank value
;second argument is either a fixed text entry OR a variable to get text entry from
;third argument is a flag, indicating if the script should keep executing while the text is being parsed or not
macro LoadVariableTextEntry
  db $03
  ScriptArgumentVariableOrValue \1

  ScriptArgumentVariableOrValue \2

  db \3
endm

macro ForceTextPrintPosition
  db $04
  db \1
  db \2
endm

;unused command in the vanilla game
macro ClearMessageBox
  db $05
endm

;input amount of frames to wait before resuming script execution and stuff
macro Sleep
  db $06
  dw \1
endm

macro ModifyVariable_StoreToVar16Bit
  db $07
  ScriptArgumentVariable \1

  ScriptArgumentVariableOrValue \2
endm

macro ModifyVariable_AddToVar16Bit
  db $08
  ScriptArgumentVariable \1

  ScriptArgumentVariableOrValue \2
endm

macro ModifyVariable_SubFromVar16Bit
  db $09
  ScriptArgumentVariable \1

  ScriptArgumentVariableOrValue \2
endm

macro ModifyVariable_LogicalANDVar16Bit
  db $0A
  ScriptArgumentVariable \1

  ScriptArgumentVariableOrValue \2
endm

macro ModifyVariable_LogicalORVar16Bit
  db $0B
  ScriptArgumentVariable \1

  ScriptArgumentVariableOrValue \2
endm

macro ModifyVariable_LogicalXORVar16Bit
  db $0C
  ScriptArgumentVariable \1

  ScriptArgumentVariableOrValue \2
endm

macro ModifyVariable_LogicalShiftVarRight
  db $0D
  ScriptArgumentVariable \1

  ScriptArgumentVariableOrValue \2
endm

macro ModifyVariable_LogicalShiftVarLeft
  db $0E
  ScriptArgumentVariable \1

  ScriptArgumentVariableOrValue \2
endm

macro ModifyVariable_MultiplyVar16Bit
  db $0F
  ScriptArgumentVariable \1

  ScriptArgumentVariableOrValue \2
endm

;unused command in the vanilla game (and redundant anyway)
macro ModifyVariable_MultiplyByVar16Bit
  db $10
  ScriptArgumentVariable \1

  ScriptArgumentVariableOrValue \2
endm

;unused command in the vanilla game
macro Skip4Bytes
  db $11
endm

macro ModifyVariable_StoreToVarFromVar
  db $12
  ScriptArgumentVariable \1
  ScriptArgumentVariable \2
endm

macro ModifyVariable_StoreToVar8Bit
  db $13
  ScriptArgumentVariable \1
  db \2
endm

;unused command in the vanilla game
macro ModifyVariable_16BitRNGStore
  db $14
  ScriptArgumentVariable \1
endm

macro ModifyVariable_8BitRNGStore
  db $15
  ScriptArgumentVariable \1
endm

macro ModifyVariable_AddToVar8Bit
  db $16
  ScriptArgumentVariable \1
  db \2
endm

macro ModifyVariable_SubFromVar8Bit
  db $17
  ScriptArgumentVariable \1
  db \2
endm

;constant branch
macro ScriptBranch
  db $18
  dw \1-POINTERS_05_4000
endm

macro LoadScript
  db $19
  ScriptArgumentVariableOrValue \1
endm

macro LoadScriptWithTransition
  db $1A
  ScriptArgumentVariableOrValue \1
endm

;Note that the last branch is just going forward
macro DecisionBranches_3Branches
  db $1B
  dw \1-POINTERS_05_4000
  dw \2-POINTERS_05_4000
endm

macro DecisionBranches_4Branches
  db $1C
  dw \1-POINTERS_05_4000
  dw \2-POINTERS_05_4000
  dw \3-POINTERS_05_4000
endm

macro DecisionBranches_5Branches
  db $1D
  dw \1-POINTERS_05_4000
  dw \2-POINTERS_05_4000
  dw \3-POINTERS_05_4000
  dw \4-POINTERS_05_4000
endm

macro DecisionBranches_6Branches
  db $1E
  dw \1-POINTERS_05_4000
  dw \2-POINTERS_05_4000
  dw \3-POINTERS_05_4000
  dw \4-POINTERS_05_4000
  dw \5-POINTERS_05_4000
endm

macro VariableScriptBranch
  db $1F

  db \2

  ScriptArgumentVariable \1
  
  ScriptArgumentVariableOrValue \3

  dw \4-POINTERS_05_4000
endm

;conditional branches, check for variable to be equal, less, etc
macro ScriptBranch_VarEqualVal8Bit
  db $20
  ScriptArgumentVariable \1
  db \2
  dw \3-POINTERS_05_4000
endm

;unused command in the vanilla game
macro ScriptBranch_VarGreaterVal8Bit
  db $21
  ScriptArgumentVariable \1
  db \2
  dw \3-POINTERS_05_4000
endm

macro ScriptBranch_VarLessVal8Bit
  db $22
  ScriptArgumentVariable \1
  db \2
  dw \3-POINTERS_05_4000
endm

macro ScriptBranch_VarEqualVar16Bit
  db $23
  ScriptArgumentVariable \1
  ScriptArgumentVariable \2
  dw \3-POINTERS_05_4000
endm

macro ScriptBranch_VarGreaterVar16Bit
  db $24
  ScriptArgumentVariable \1
  ScriptArgumentVariable \2
  dw \3-POINTERS_05_4000
endm

macro ScriptBranch_VarLessVar16Bit
  db $25
  ScriptArgumentVariable \1
  ScriptArgumentVariable \2
  dw \3-POINTERS_05_4000
endm

;takes a branch if played on super game boy
macro ScriptBranch_SuperGameBoy
  db $26
  dw \1-POINTERS_05_4000
endm

macro ScriptBranch_StrengthCheck
  db $27
  ScriptArgumentVariableOrValue \1

  dw \2-POINTERS_05_4000
endm

;used to execute a sub script, then return back to executing current script
macro ExecuteSubScript
  db $28
  dw \1-POINTERS_05_4000
endm

;unused command in the vanilla game
macro Skip2Bytes
  db $29
endm

macro EndSubscript
  db $2A
endm

;unused command in the vanilla game (for obvious reasons)
macro DoNothing
  db $2B
endm

macro PlayMusic
  db $2C
  db \1
endm

;unused command in the vanilla game
macro PlaySFX
  db $2D
  db \1
endm

macro VariableSceneFadeIn
  db $2E
  db \1
endm

macro SceneFadeIn
  db $2F
endm

macro VariableSceneFadeOut
  db $30
  db \1
endm

macro SceneFadeOut
  db $31
endm

macro LoadBackground
  db $32

  ScriptArgumentVariableOrValue \1
endm

;only used for intro backgrounds
macro LoadBackgroundAlt
  db $33

  ScriptArgumentVariableOrValue \1
endm

;unused command in the vanilla game
macro UpdateCamera
  db $34
  ScriptArgumentVariableOrValue \1

  ScriptArgumentVariableOrValue \2
endm

macro VariableLoadCharacter
  db $35
  
  ScriptArgumentVariableOrValue \1
endm

;input: character | drip | expression
macro FixedLoadCharacter
  assert \1 <= CharProp_Character_Momoyo, "Passing an invalid character as an argument."
  assert \2 <= CharProp_Display_Sideview, "This argument can only accept the first four display values. You have to use a different setup if you want to use other display values."
  assert \3 <= CharProp_Emotion_Sad, "Passing an invalid emote as an argument."
  db $36
  db \1+(\2 << 3) | (\3 << 5)
endm

;argument is the emote (duh)
macro UpdateCharacterEmote
  assert \1 <= CharProp_Emotion_Sad, "Passing an invalid emote as an argument."
  db $37+\1
endm

macro SetCharacterCoords
  db $3C

  ScriptArgumentVariableOrValue \1

  ScriptArgumentVariableOrValue \2
endm

;unused command in the vanilla game
macro ApplyCharacterFlip
  db $3D
  
  ScriptArgumentVariableOrValue \1

  db \2
endm

;unused command in the vanilla game
macro ShowOrRemoveCharater
  db $3E
  ScriptArgumentVariableOrValue \1
endm

macro ShowCharacter
  db $3F
endm

macro RemoveCharacter
  db $40
endm

macro ClearTileLines
  db $41
  ScriptArgumentVariableOrValue \1

  ScriptArgumentVariableOrValue \2

  ScriptArgumentVariableOrValue \3

  ScriptArgumentVariableOrValue \4
endm

macro ChangeMessagePrinting
  db $42
  ScriptArgumentVariableOrValue \1

  ScriptArgumentVariableOrValue \2

  ScriptArgumentVariableOrValue \3

  ScriptArgumentVariableOrValue \4
endm

macro EnablePlayerChoice_2Options
  db $43
  ScriptArgumentVariableOrValue \1
endm

macro EnablePlayerChoice_3Options
  db $44
  ScriptArgumentVariableOrValue \1
endm

;transports player into character select for when they go on a walk and try to invite someone
macro InviteCharacterForADate
  db $45
endm

macro AffectRelationshipByGift
  db $46
  ScriptArgumentVariableOrValue \1
endm

;prints decimal number
macro PrintVariableValue8Bit
  db $47
  ScriptArgumentVariable \1
endm

;same as above but prints all 16-bits (in decimal). unused
macro PrintVariableValue16Bit
  db $48
  ScriptArgumentVariable \1
endm

;unused command in the vanilla game
macro SeedRNG
  db $49
  ScriptArgumentVariableOrValue \1
endm

;debug commands
;allows to edit one variable, which variable is determined by an argument
;the input is actually 8-bit, but it skips over two bytes as if it's 16-bit
macro Debug_VariableEditor
  db $4A
  ScriptArgumentVariable \1
  db $80
endm

;a variable editor/viewer, can edit/view any script-accessible variable.
macro Debug_ExpandedVariableEditor
  db $4B
endm