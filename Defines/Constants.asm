;CONSTANTS here
def JoypadInput_A = %00000001
def JoypadInput_B = %00000010
def JoypadInput_Select = %00000100
def JoypadInput_Start = %00001000
def JoypadInput_Right = %00010000
def JoypadInput_Left = %00100000
def JoypadInput_Up = %01000000
def JoypadInput_Down = %10000000

def BGTile_DownArrow = $67
def BGTile_HandCursor = $68

def SaveFileSize = CurrentSave_End-CurrentSave_PlayerSecondName+1

def SpriteDisplayablesSlots = 10

def PlayerInfo_SecondNameMaxLength equ 4
def PlayerInfo_NameMaxLength equ 4
def PlayerInfo_NickNameMaxLength equ 6

def PlayerInfoMaxCharacters = PlayerInfo_SecondNameMaxLength
if PlayerInfo_NameMaxLength > PlayerInfoMaxCharacters
  redef PlayerInfoMaxCharacters = PlayerInfo_NameMaxLength
elif PlayerInfo_NickNameMaxLength > PlayerInfoMaxCharacters
  redef PlayerInfoMaxCharacters = PlayerInfo_NickNameMaxLength
endc

def ScheduleScreenOptionName_MaxLength equ 6
def ItemName_MaxLength equ 17
def PlaceName_MaxLength equ 17

def CharacterName_MaxLength equ 8                           ;note that this is used for contexts outside of visual novel parts (e.g. phone call)

;def CharacterBit_Ruruna = POW(CharProp_Character_Ruruna, 2)
def CharacterBit_Ruruna = %00000001
def CharacterBit_Mizuki = %00000010
def CharacterBit_Yumi = %00000100
def CharacterBit_Miri = %00001000
def CharacterBit_Mari = %00010000
def CharacterBit_Suzune = %00100000
def CharacterBit_Momoyo = %01000000

def AttendingPartyBit_Rurunas = %00000100
def AttendingPartyBit_Suzunes = %00001000

def StatProgressBit_Style = %00000001
def StatProgressBit_SkillHandicrafts = %00000010
def StatProgressBit_Fit = %00000100
def StatProgressBit_Smart = %00001000
def StatProgressBit_SmartGo = %00010000
def StatProgressBit_Sense = %00100000

def TextCommand_LineBreak = $80
def TextCommand_ClearMsg = $81
def TextCommand_InputWait = $82
def TextCommand_GetPlayerName = $FE
def TextCommand_GetDictionaryEntry = $FF
def TextCommand_End = $00

;easy OAM props, don't change these
def OAMProp_BGPriority = %10000000
def OAMProp_YFlip = %01000000
def OAMProp_XFlip = %00100000
def OAMProp_Palette0 = %00000000
def OAMProp_Palette1 = %00010000