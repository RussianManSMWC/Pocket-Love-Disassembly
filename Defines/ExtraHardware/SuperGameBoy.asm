;SGB stuffs

;SGB commands
RSRESET
def SGBCommand_SetGameBoyPal01 rb 1                         ;these are used to load colors that can be used by the Game Boy display
def SGBCommand_SetGameBoyPal23 rb 1
def SGBCommand_SetGameBoyPal03 rb 1
def SGBCommand_SetGameBoyPal12 rb 1
def SGBCommand_SetAttrRectangle rb 1
def SGBCommand_SetAttrLine rb 1
def SGBCommand_SetAttrDivide rb 1
def SGBCommand_SetAttrCHR rb 1
def SGBCommand_SoundPlay rb 1                               ;play SGB sound
def SGBCommand_SoundTransfer rb 1                           ;transfer code/data to SNES' APU
def SGBCommand_SGBGameBoyPalCopy rb 1
def SGBCommand_SGBGameBoyPalTransfer rb 1                   ;used for pre-defined palettes from SGB itself probably
def SGBCommand_AttractFlag rb 1
def SGBCommand_SpeedTest rb 1                               ;doesn't do anything in release SGB
def SGBCommand_IconToggles rb 1                             ;disable/enable SGB user functions
def SGBCommand_RAMCopy rb 1
def SGBCommand_RAMTransfer rb 1
def SGBCommand_ControllerRequest rb 1                       ;request x amount of controllers (1, 2, 4). also used for detecting SGB
def SGBCommand_JMP rb 1                                     ;set up NMI and PC to execute custom SNES code
def SGBCommand_TransferSNESGFX rb 1                         ;transfers graphics to SNES VRAM
def SGBCommand_TransferSNESTilemapAndPal rb 1               ;transfers tilemap and palette to SNES VRAM (good for borders)
def SGBCommand_SetAttributeGameBoy rb 1                     ;defines a so-called "ATF" that can be picked with transfer command
def SGBCommand_TransferAttributeGameBoy rb 1
def SGBCommand_GameBoyMask rb 1
def SGBCommand_TransferSNESSprites rb 1                     ;doesn't do anything in release SGB
def SGBCommand_PalPriority rb 1

;values for commands
RSRESET
def SGB_GameBoyPalette0 rb 1
def SGB_GameBoyPalette1 rb 1
def SGB_GameBoyPalette2 rb 1
def SGB_GameBoyPalette3 rb 1

def SGB_ControllerRequest_1Player = 0
def SGB_ControllerRequest_2Player = 1
;3 player is not available, since this is a bitwise value, where bit 0 enables multiple controllers
def SGB_ControllerRequest_4Player = 3

def SGB_Divide_DivideLineVert = %00000000
def SGB_Divide_DivideLineHorz = %01000000

RSRESET
def SGB_GameBoyMaskMode_None rb 1
def SGB_GameBoyMaskMode_FreezeFrame rb 1
def SGB_GameBoyMaskMode_Black rb 1
def SGB_GameBoyMaskMode_Color0 rb 1