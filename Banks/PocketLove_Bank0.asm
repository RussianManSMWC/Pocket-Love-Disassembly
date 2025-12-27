;PRG ROM $0000-$3FFF

;most of these sections are unused.
;this one doesn't look like proper code?
SECTION "rst 00", ROM0[$0]
db $0E,$00,$90,$D0,$0C,$ED,$44,$C9

;would've been used to offset DE with an 8-bit value. input DE as base value and A as offset
SECTION "rst 08", ROM0[$8]
ADD A, E                                                    ;
LD E, A                                                     ;

LD A, D
ADC A, $00                                                  ;
LD D, A                                                     ;
RET                                                         ;

;would've been used to get a pointer.
;input: 
;A - offset
;HL - pointers table address
;output:
;HL - pointer entry
SECTION "rst 10", ROM0[$10]
PUSH DE                                                     ;
LD E, A                                                     ;
LD D, $00                                                   ;
SLA E                                                       ;
RL D                                                        ;

ADD HL, DE                                                  ;
LD E, [HL]                                                  ;

INC HL                                                      ;
LD H, [HL]                                                  ;
LD L, E                                                     ;
POP DE                                                      ;
RET                                                         ;

;would've been used to store a pointer into address
;input:
;DE - address to store to
;HL - pointer
;I'm guessing this would've been used for VRAM since it checks for PPU mode
SECTION "rst 20", ROM0[$20]
CheckPPUModes                                               ;
LD A, H                                                     ;
LD [DE], A                                                  ;
INC E                                                       ;

LD A, L                                                     ;
LD [DE], A                                                  ;
INC E                                                       ;
RET                                                         ;

;would've been used to do..... nothing.
;input:
;BC - amount of loops to perform
SECTION "rst 28", ROM0[$28]
LOOP_00_0028:
DEC BC                                                      ;

LD A, B                                                     ;
OR C                                                        ;
JR NZ, LOOP_00_0028                                         ;
RET                                                         ;

;the only used section. this is the "CheckPPUModes" command
SECTION "rst 30", ROM0[$30]
LOOP_00_0030:
LDH A, [Reg_LCDStatus]                                      ;checks if PPU is in "V-blank" or "drawing pixels" modes
BIT 1, A                                                    ;
JR NZ, LOOP_00_0030                                         ;loop until that isn't the case
RET                                                         ;

;would've been used to offset HL with an 8-bit value.
;input A - offset, HL - base value
SECTION "rst 38", ROM0[$38]
ADD A, L                                                    ;
LD L, A                                                     ;

LD A, H                                                     ;
ADC A, $00                                                  ;
LD H, A                                                     ;
RET                                                         ;

SECTION "VBlank_Interrupt", ROM0[$40]
JP VBlank_00_01FB                                           ;

SECTION "HBlank_Interrupt", ROM0[$48]
JP HBlank_00_037A                                           ;

SECTION "TimerInterrupt",  ROM0 [$50]
RETI                                                        ;unused

SECTION "SerialInterrupt",  ROM0 [$58]
RETI                                                        ;unused

SECTION "JoyInterrupt",  ROM0 [$60]
RETI                                                        ;unused

SECTION "Entry",  ROM0[$100]
NOP                                                         ;
JP RESET_00_0150                                            ;

SECTION "Header",  ROM0 [$104]
incbin "NintendoLogo.bin"

include "Header.asm"

include "Defines/CharacterSet.asm"

SETCHARMAP Text_VN

RESET_00_0150:
DI                                                          ;disable interrupts
LD SP, $FFFE                                                ;init stack

LD A, LCDControlEnable|LCDWindowTilemapSelect|LCDSpriteSize ;8x16 sprites and stuff
LD [Reg_LCDControlAndRender], A                             ;

XOR A                                                       ;all white
LDH [Reg_BackgroundPalette], A                              ;
LDH [Reg_SpritePalette0], A                                 ;
LDH [Reg_SpritePalette1], A                                 ;

CALL ClearSpriteData_00_0E53                                ;
CALL DisableLCD_00_0FE0                                     ;

XOR A                                                       ;
LDH [Register_LCDYCompare], A                               ;

LD A, $08                                                   ;
LDH [Reg_LCDStatus], A                                      ;

CALL StoreOAMUploadCodeToRAM_00_01E2                        ;

LD HL, $C000                                                ;RAM starts here
LD BC, $2000                                                ;all 8K of it
CALL ClearData_00_0C63                                      ;clear all RAM

CALL InitVNVariables_00_0B8C                                ;

LD A, $FF                                                   ;
LD [SoundQueue], A                                          ;nothing queued on init

CALL OAMUploadCode                                          ;update OAM

XOR A                                                       ;fix camera
LDH [Reg_CameraXPosition], A                                ;
LDH [Reg_CameraYPosition], A                                ;

CALL InitSound_00_0B2D                                      ;

CALL CheckSGB_00_0C95                                       ;
JP NC, CODE_00_019A                                         ;if not played on super game boy, skip over

LD A, $01                                                   ;
LD [SuperGameBoyFlag], A                                    ;playing with super game boy power

CALL SuperGameBoyInit_00_08A7                               ;put new borders and colors on display

CODE_00_019A:
CALL CODE_00_0D24

LD A, LCDControlEnable|LCDBackgroundRender                  ;
LDH [Reg_LCDControlAndRender], A                            ;

LD A, Interrupt_VBlank                                      ;
LD [Reg_InterruptsEnabler], A                               ;
EI                                                          ;
CALL DisableLCD_00_0FE0                                     ;

LD A, $FF                                                   ;controls are definitely enabled
LD [JoypadInputEnabler], A                                  ;

LD A, $78                                                   ;
LDH [Register_LCDYCompare], A                               ;

LD A, $44                                                   ;
LDH [Reg_LCDStatus], A                                      ;sets some LCD status triggers

LD A, LCDBackgroundRender|LCDSpriteRender|LCDSpriteSize|LCDControlEnable
LDH [Reg_LCDControlAndRender], A                            ;

LD A, Interrupt_VBlank                                      ;
LD [Reg_InterruptsEnabler], A                               ;

CALL LoadStartGameScript_00_1B26                            ;

;game "loop", in reality this is a state machine of sorts
LOOP_00_01C3:
CALL ExecuteTitleScreenCode_00_3DE0                         ;

LD A, [TransitionToGameFlag]                                ;
CP $01                                                      ;check if we transition into gameplay (loaded a save file) or starting a new game
JR Z, CODE_00_01D4                                          ;

CALL ExecuteNewGameCode_00_1EFF                             ;
CP $01                                                      ;
JR Z, LOOP_00_01C3                                          ;

CODE_00_01D4:
CALL ExecuteGameplayCode_00_1F3F                            ;
CP $02                                                      ;
JP Z, RESET_00_0150                                         ;check if we picked a quit option from the title screen

CALL MaybePlayEvent_00_2E67                                 ;play christmas event 
JP RESET_00_0150                                            ;THE END

StoreOAMUploadCodeToRAM_00_01E2:
LD DE, OAMUploadCode                                        ;appears to be a pretty standard procedure on the Game Boy. Copy this into HRAM.
LD HL, OAMUploadCode_00_01F1                                ;
LD B, OAMUploadCode_00_01F1.end-OAMUploadCode_00_01F1       ;

LOOP_00_01EA:
LD A, [HL+]                                                 ;
LD [DE], A                                                  ;
INC DE                                                      ;
DEC B                                                       ;
JR NZ, LOOP_00_01EA                                         ;
RET                                                         ;

OAMUploadCode_00_01F1:
LD A, HIGH(OAM_Y)                                           ;this is copied into HRAM
LDH [Reg_OAMDMA], A                                         ;

LD A, $28                                                   ;

.LOOP_00_01F7:
DEC A                                                       ;
JR NZ, .LOOP_00_01F7                                        ;
RET                                                         ;
.end

VBlank_00_01FB:
PUSH AF                                                     ;
PUSH BC                                                     ;
PUSH DE                                                     ;
PUSH HL                                                     ;

LD B, $18                                                   ;

LOOP_00_0201:
NOP                                                         ;
DEC B                                                       ;
JR NZ, LOOP_00_0201                                         ;waste a bunch of time for some reason

LD A, [OAMDMALockCheckFlag]                                 ;if this flag is false
OR A                                                        ;
JR Z, CODE_00_0211                                          ;always update OAM

LD A, [LockOAMDMAUpdates]                                   ;check if we're currently messing with sprite tiles
OR A                                                        ;
JR NZ, CODE_00_0214                                         ;ignore sprite DMA function

CODE_00_0211:
CALL OAMUploadCode                                          ;

CODE_00_0214:
LD A, [CurrentProgramBank]                                  ;
PUSH AF                                                     ;
LD A, [SoundDataBank]                                       ;
CALL SetProgramBank_00_037B                                 ;

CALL SoundEngine_00_0482                                    ;play beeps and boops

LD A, [SoundQueue]                                          ;
CP $FF                                                      ;check if we didnt queue anything
JR Z, CODE_00_0232                                          ;
OR $80                                                      ;SFX is indicated by 7th bit set
CALL StartPlayingSFXOrMusic_00_0420                         ;

LD A, $FF                                                   ;clear queue
LD [SoundQueue], A                                          ;

CODE_00_0232:
POP AF                                                      ;
CALL SetProgramBank_00_037B                                 ;

LD A, [CameraLock]                                          ;check if camera should be fixed (not that the game does any camera shenanigans)
OR A                                                        ;
JR Z, CODE_00_0246                                          ;

LD A, [CameraPositionY]                                     ;
LDH [Reg_CameraYPosition], A                                ;

LD A, [CameraPositionX]                                     ;
LDH [Reg_CameraXPosition], A                                ;

CODE_00_0246:
CALL ReadJoypadInputs_00_0330                               ;

LD A, [JoypadInputHolding]                                  ;
AND JoypadInput_A|JoypadInput_B|JoypadInput_Select|JoypadInput_Start
CP JoypadInput_A|JoypadInput_B|JoypadInput_Select|JoypadInput_Start
JP Z, SoftReset_00_02E3                                     ;soft reset if all buttons are held together

LD HL, FrameCounter8Bit                                     ;
INC [HL]                                                    ;8-bit frame counter

LD A, $01                                                   ;
LD [VBlankHitFlag], A                                       ;

LD A, [ScriptSleepTimer]                                    ;
LD L, A                                                     ;
LD A, [ScriptSleepTimer+1]                                  ;
LD H, A                                                     ;
OR L                                                        ;
JR Z, CODE_00_0270                                          ;check if script n

DEC HL                                                      ;tick the timer

LD A, L                                                     ;
LD [ScriptSleepTimer], A                                    ;

LD A, H                                                     ;
LD [ScriptSleepTimer+1], A                                  ;

CODE_00_0270:
LD A, [Script16BitCounter]                                  ;
LD L, A                                                     ;
LD A, [Script16BitCounter+1]                                ;16-bit counter that can be accessed by scripting

LD H, A                                                     ;
OR L                                                        ;
JR Z, CODE_00_0284                                          ;

DEC HL                                                      ;tick down

LD A, L                                                     ;
LD [Script16BitCounter], A                                  ;

LD A, H                                                     ;
LD [Script16BitCounter+1], A                                ;

CODE_00_0284:
LD A, [FrameCounter16Bit]                                   ;
LD L, A                                                     ;

LD A, [FrameCounter16Bit+1]                                 ;
LD H, A                                                     ;

INC HL                                                      ;increment frame counter

LD A, L                                                     ;
LD [FrameCounter16Bit], A                                   ;

LD A, H                                                     ;
LD [FrameCounter16Bit+1], A                                 ;

LD A, [TextDrawing_Timer]                                   ;
OR A                                                        ;
JR Z, CODE_00_029F                                          ;

DEC A                                                       ;
LD [TextDrawing_Timer], A                                   ;

CODE_00_029F:
LD A, [AButtonRequest_Press]                                ;check if we need the player to press A
OR A                                                        ;
JR Z, CODE_00_02B0                                          ;

LD A, [JoypadInputPress]                                    ;check if player pressed A 
BitTest JoypadInput_A, A                                    ;
JR Z, CODE_00_02B0                                          ;

XOR A                                                       ;player did press A
LD [AButtonRequest_Press], A                                ;

CODE_00_02B0:
LD A, [AButtonRequest_Hold]                                 ;check if we need the player to hold A
OR A                                                        ;
JR Z, CODE_00_02C1                                          ;which is pointless, unless you implement a counter for the player to hold A for several frames

LD A, [JoypadInputHolding]                                  ;check if holding A
BitTest JoypadInput_A, A                                    ;
JR Z, CODE_00_02C1                                          ;

XOR A                                                       ;
LD [AButtonRequest_Hold], A                                 ;did "hold" A (a single press also counts as "holding" A for a single frame)

CODE_00_02C1:
LD A, [SequenceSkipFlag]                                    ;check if there's a sequence that can be skipped
OR A                                                        ;
JR Z, CODE_00_02DB                                          ;

LD A, [SequenceSkippedFlag]                                 ;check if we skipped said sequence
OR A                                                        ;
JR NZ, CODE_00_02DB                                         ;

LD A, [JoypadInputPress]                                    ;check if player pressed anything
OR A                                                        ;
JR Z, CODE_00_02DB                                          ;
LD [SequenceSkippedFlag], A                                 ;skip

LD A, SFX_Confirm                                           ;confirm SFX
LD [SoundQueue], A                                          ;

CODE_00_02DB:
CALL UpdateRandomNumber_00_0ADB                             ;roll the proverbial dice!
POP HL                                                      ;
POP DE                                                      ;
POP BC                                                      ;
POP AF                                                      ;
RETI                                                        ;end Game Boy's version of NMI

SoftReset_00_02E3:
XOR A                                                       ;
LDH [Reg_BackgroundPalette], A                              ;
LDH [Reg_SpritePalette0], A                                 ;
LDH [Reg_SpritePalette1], A                                 ;
DI                                                          ;
LD A, [SoundDataBank]                                       ;
CALL SetProgramBank_00_037B                                 ;

XOR A                                                       ;go away music
CALL ChangeMusic_00_0B12                                    ;
CALL SoundEngine_00_0482                                    ;update sound

LD A, LCDControlEnable|LCDWindowTilemapSelect|LCDSpriteSize ;
LD [Reg_LCDControlAndRender], A                             ;

LOOP_00_02FD:
LD A, [Register_LCDYPos]                                    ;
OR A                                                        ;
JR NZ, LOOP_00_02FD                                         ;

LD A, $00                                                   ;the top of the screen
CALL PushToDrawingStack_00_0B5E                             ;

LD A, $00                                                   ;still top-left
CALL PushToDrawingStack_00_0B5E

LD A, 22                                                    ;lines of tiles to erase (4 extra)
CALL PushToDrawingStack_00_0B5E                             ;

LD A, 20                                                    ;amount of tiles on each line
CALL PushToDrawingStack_00_0B5E                             ;

XOR A                                                       ;
CALL PushToDrawingStack_00_0B5E                             ;

LD A, $00                                                   ;fill with blank
CALL PushToDrawingStack_00_0B5E                             ;
CALL FillLinesOfTiles_00_0E5E                               ;

LD B, $00                                                   ;
LD C, $06                                                   ;
CALL ResetDrawingStack_00_0B78                              ;
CALL ClearSpriteData_00_0E53                                ;
JP RESET_00_0150                                            ;I suppose it's not a "soft" reset if it goes through normal reset anyway

ReadJoypadInputs_00_0330:
LD A, [JoypadInputEnabler]                                  ;
OR A                                                        ;
JR Z, CODE_00_0372                                          ;

LD A, [JoypadInputHolding]                                  ;remember inputs from last frame
LD C, A                                                     ;
LD A, $20                                                   ;
LDH [Reg_JoyPad], A                                         ;read buttons

LDH A, [Reg_JoyPad]                                         ;
LDH A, [Reg_JoyPad]                                         ;twice
CPL                                                         ;
SLA A                                                       ;
SLA A                                                       ;
SLA A                                                       ;
SLA A                                                       ;
LD B, A                                                     ;

LD A, $10                                                   ;read directions
LDH [Reg_JoyPad], A                                         ;

LDH A, [Reg_JoyPad]                                         ;
LDH A, [Reg_JoyPad]                                         ;
LDH A, [Reg_JoyPad]                                         ;
LDH A, [Reg_JoyPad]                                         ;
LDH A, [Reg_JoyPad]                                         ;
LDH A, [Reg_JoyPad]                                         ;read 6 times for... stabilizing inputs
CPL                                                         ;
AND $0F                                                     ;
OR B                                                        ;
LD [JoypadInputHolding], A                                  ;

LD A, $30                                                   ;
LDH [Reg_JoyPad], A                                         ;stop reading joypad

LD A, [JoypadInputHolding]                                  ;
LD B, A                                                     ;
LD A, C                                                     ;
AND B                                                       ;
XOR B                                                       ;
LD [JoypadInputPress], A                                    ;mark inputs newly entered on this frame as presses
RET                                                         ;

;clear inputs
CODE_00_0372:
XOR A                                                       ;
LD [JoypadInputHolding], A                                  ;
LD [JoypadInputPress], A                                    ;
RET                                                         ;

HBlank_00_037A:
RETI                                                        ;does nothing

;input:
;A - bank to switch $4000-$7FFF to
SetProgramBank_00_037B:
LD [CurrentProgramBank], A                                  ;remember bank
LD [MBC1Bank], A                                            ;
RET                                                         ;

;Sync the game by waiting for VBlank
WaitForVBlank_00_0382:
HALT                                                        ;
LD A, [VBlankHitFlag]                                       ;
AND A                                                       ;
JR Z, WaitForVBlank_00_0382                                 ;

XOR A                                                       ;
LD [VBlankHitFlag], A                                       ;clear the flag
RET                                                         ;

;unused code to wait multiple frames. B - amount of Vblanks to sit through
WaitMultipleVBlanks_00_038E:
CALL WaitForVBlank_00_0382                                  ;

DEC B                                                       ;
JR NZ, WaitMultipleVBlanks_00_038E                          ;
RET                                                         ;

SendSGBPacket_00_0395:
LD A, [HL]                                                  ;number of packets determined by first 3 bits
AND $07                                                     ;
RET Z                                                       ;don't send any packets if 0

LD B, A                                                     ;
LD C, $00                                                   ;

LOOP_00_039C:
PUSH BC                                                     ;
LD A, $00
LD [$FF00+C], A

LD A, $30
LD [$FF00+C], A

LD B, $10

LOOP_00_03A5:
LD E, $08
LD A, [HL+]
LD D, A

LOOP_00_03A9:
BIT 0, D
LD A, $10
JR NZ, CODE_00_03B1

LD A, $20

CODE_00_03B1:
LD [$FF00+C], A
LD A, $30
LD [$FF00+C], A
RR D
DEC E
JR NZ, LOOP_00_03A9

DEC B
JR NZ, LOOP_00_03A5

LD A, $20
LD [$FF00+C], A

LD A, $30
LD [$FF00+C], A

POP BC
DEC B
RET Z

CALL Wait7000_00_03CB
JR LOOP_00_039C

;time wasting loop
Wait7000_00_03CB:
LD DE, 7000                                                 ;

LOOP_00_03CE:
NOP                                                         ;
NOP                                                         ;
NOP                                                         ;
DEC DE                                                      ;

LD A, D                                                     ;
OR E                                                        ;
JR NZ, LOOP_00_03CE                                         ;
RET                                                         ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Sound Engine code
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

InitSoundVariables_00_03D7:
LD A, $7F                                                   ;
LD [Sound_Volume], A                                        ;

LD A, $FF                                                   ;
LD [Sound_ChannelPan], A                                    ;

LD A, $8F                                                   ;despite the first 4 bits being read-only, it tries to set them anyway
LDH [APU_AudioStatus], A                                    ;

CALL SoundCommand_DisableSquare1Sweep_00_05E1               ;

LD HL, APU_WavePattern                                      ;
LD BC, InitialWavePattern_00_0410                           ;
LD D, $10                                                   ;

LOOP_00_03F0:
LD A, [BC]                                                  ;copy wave pattern table
INC BC                                                      ;
LD [HL+], A                                                 ;
DEC D                                                       ;
JR NZ, LOOP_00_03F0                                         ;

LD A, $80                                                   ;
LDH [APU_WaveDACPower], A                                   ;

LD A, $04                                                   ;default tempo
LD [Sound_Tempo], A                                         ;

LD A, $80                                                   ;disable each sound channel
LD H, HIGH(Sound_CurrentChannelDataPointer+1)               ;
LD C, $08                                                   ;both for music and SFX

CODE_00_0405:
LD L, LOW(Sound_CurrentChannelDataPointer+1)                ;
LD [HL], A                                                  ;

LD L, LOW(Sound_CurrentChannelDataIndex)                    ;
LD [HL], A                                                  ;
INC H                                                       ;
DEC C                                                       ;
JR NZ, CODE_00_0405                                         ;
RET                                                         ;

InitialWavePattern_00_0410:
db $01,$23,$45,$67,$89,$AB,$CD,$EF
db $FE,$DC,$BA,$98,$76,$54,$32,$10

;used to start playing SFX or music
StartPlayingSFXOrMusic_00_0420:
PUSH HL                                                     ;
PUSH BC                                                     ;
PUSH DE                                                     ;
CP $81                                                      ;check if we're playing an SFX or proper music
JR NC, CODE_00_0451                                         ;

;init music
LD DE, Sound_CurrentChannelDataIndex                        ;
CALL CODE_00_0432                                           ;

LD H, HIGH(Sound_CurrentChannelDataStack)                   ;
JP CODE_00_045B                                             ;

CODE_00_0432:
ADD A, A                                                    ;
ADD A, A                                                    ;left shift twice
LD HL, MusicAndSFXChannelConfigurations_01_4000             ;
LD B, $00                                                   ;
LD C, A                                                     ;
ADD HL, BC                                                  ;point to sound data

LD BC, Sound_ChannelSequenceID                              ;store to this array (it won't actually be used)

LD A, [HL+]                                                 ;
LD [DE], A                                                  ;
LD [BC], A                                                  ;

INC BC                                                      ;
INC D                                                       ;
LD A, [HL+]                                                 ;
LD [DE], A                                                  ;
LD [BC], A                                                  ;

INC BC                                                      ;
INC D                                                       ;
LD A, [HL+]                                                 ;
LD [DE], A                                                  ;
LD [BC], A                                                  ;

INC BC                                                      ;
INC D                                                       ;
LD A, [HL]                                                  ;
LD [DE], A                                                  ;
LD [BC], A                                                  ;
RET                                                         ;

;init SFX
CODE_00_0451:
AND $7F                                                     ;
LD DE, Sound_SFX_CurrentChannelDataIndex                    ;
CALL CODE_00_0432                                           ;

LD H, HIGH(Sound_SFX_CurrentChannelDataIndex)               ;

;input H - sound or music pool high byte
CODE_00_045B:
LD DE, Sound_ChannelSequenceID                              ;
LD D, $80                                                   ;overwrite D... why did we need E then?
LD B, $04                                                   ;
LD A, $12                                                   ;

LOOP_00_0464:
LD C, A
XOR A                                                       ;everything is a zero
LD L, LOW(Sound_CurrentChannelNoteDuration)                 ;
LD [HL], A                                                  ;

LD L, LOW(Sound_CurrentChannelNoteCounter)                  ;
LD [HL], A                                                  ;

LD L, LOW(Sound_CurrentChannelBaseFrequency)                ;
LD [HL], A                                                  ;

LD L, LOW(Sound_CurrentChannelDataPointer+1)                ;
LD [HL], D                                                  ;

LD L, LOW(Sound_CurrentChannelPanCounter)                   ;
LD [HL], A                                                  ;

LD A, [DE]                                                  ;for some reason it reads from VRAM, but A is overwritten right after
INC DE                                                      ;that's, uh, interesting
INC H                                                       ;
LD A, C                                                     ;
ADD A, $05                                                  ;
DEC B                                                       ;
JR NZ, LOOP_00_0464                                         ;

POP DE                                                      ;
POP BC                                                      ;
POP HL                                                      ;
RET                                                         ;

;The heart of the beeps and noise
SoundEngine_00_0482:
LD HL, Sound_Tempo                                          ;
LD DE, Sound_MusicTempo                                     ;
LD BC, Sound_SFXTempo                                       ;

;repeat the same bunch of instructions 6 times (to transfer the 6 SFX/music related properties)
REPT Sound_SFXTempo-Sound_Tempo
  LD A, [HL]                                                ;
  LD [DE], A                                                ;

  LD A, [BC]                                                ;
  LD [HL+], A                                               ;
  INC BC                                                    ;
  INC DE                                                    ;
ENDR

XOR A                                                       ;channels can be updated by SFX
LD HL, Sound_SFX_CurrentChannelUpdateDisabler               ;
LD [HL], A                                                  ;

INC H                                                       ;
LD [HL], A                                                  ;

INC H                                                       ;
LD [HL], A                                                  ;

INC H                                                       ;
LD [HL], A                                                  ;

LDH A, [APU_Square1DutyAndLength]                           ;
LD [Sound_Square1DutyAndLengthBackup], A                    ;preserve square 1 duty and length (do not temper  with them via SFX)

LDH A, [APU_Square2DutyAndLength]                           ;
LD [Sound_Square2DutyAndLengthBackup], A                    ;second sequare channel's duty and length

XOR A                                                       ;                  
LD [Sound_CurrentChannel], A                                ;

;handle SFX first
LD H, HIGH(Sound_SFX_CurrentChannelDataIndex)               ;
LD A, LOW(APU_Square1Sweep)                                 ;
CALL ProcessSoundData_00_052B                               ;

LD HL, Sound_Tempo                                          ;
LD DE, Sound_MusicTempo                                     ;
LD BC, Sound_SFXTempo                                       ;

;transfer music props now
REPT Sound_SFXTempo-Sound_Tempo
  LD A, [HL]                                                ;
  LD [BC], A                                                ;

  LD A, [DE]                                                ;
  LD [HL+], A                                               ;
  INC BC                                                    ;
  INC DE                                                    ;
ENDR

LD HL, Sound_SFX_CurrentChannelUpdateDisabler               ;
LD DE, Sound_CurrentChannelUpdateDisabler                   ;
LD C, $04                                                   ;

LOOP_00_0504:
LD A, [HL]                                                  ;
LD [DE], A                                                  ;

INC H                                                       ;
INC D                                                       ;
DEC C                                                       ;
JR NZ, LOOP_00_0504                                         ;

LD A, [Sound_Square1DutyAndLengthBackup]                    ;
LDH [APU_Square1DutyAndLength], A                           ;restore

LD A, [Sound_Square2DutyAndLengthBackup]                    ;
LDH [APU_Square2DutyAndLength], A                           ;

XOR A                                                       ;
LD [Sound_CurrentChannel], A                                ;

;handle music
LD H, HIGH(Sound_CurrentChannelDataStack)                   ;
LD A, LOW(APU_Square1Sweep)                                 ;
CALL ProcessSoundData_00_052B                               ;

LD A, [Sound_SpeakerVolume]                                 ;
LDH [APU_SpeakerVolume], A                                  ;

LD A, [Sound_SpeakerPan]                                    ;
LDH [APU_SpeakerPan], A                                     ;
RET                                                         ;

;input
;H - high byte
;A - offset for sound registers (they start at $FF10)
ProcessSoundData_00_052B:
LD [Sound_CurrentChannelRAMOffset], A                       ;

LD L, LOW(Sound_CurrentChannelDataIndex)
LD A, [HL]                                                  ;
LD C, $80                                                   ;
CP C                                                        ;
JR NC, CODE_00_0553                                         ;check if this channel should be initialized
LD [HL], C                                                  ;initializing...
ADD A, A                                                    ;times 2
ADD A, LOW(SequenceDataPointers_01_4068)                    ;
LD E, A                                                     ;

LD A, $00                                                   ;
ADC A, HIGH(SequenceDataPointers_01_4068)                   ;
LD D, A                                                     ;

LD L, LOW(Sound_CurrentChannelDataPointer)                  ;
LD A, [DE]                                                  ;
LD [HL], A                                                  ;set data pointer

INC DE                                                      ;
INC L                                                       ;
LD A, [DE]                                                  ;
LD [HL], A                                                  ;

LD L, LOW(Sound_CurrentChannelDataStackOffset)              ;
LD [HL], $1F                                                ;initial data stack offset

XOR A                                                       ;
LD L, LOW(Sound_CurrentChannelNoteCounter)                  ;
LD [HL], A                                                  ;

LD L, LOW(Sound_CurrentChannelNoteDuration)                 ;
LD [HL], A                                                  ;

CODE_00_0553:
LD L, LOW(Sound_CurrentChannelDataPointer+1)                ;
LD A, [HL]                                                  ;
CP C                                                        ;check if parsing data for this channel is disabled
JR NC, CODE_00_0573                                         ;

;parse data like normal
LD L, LOW(Sound_CurrentChannelNoteCounter)                  ;
LD A, [HL]                                                  ;
LD L, LOW(Sound_CurrentChannelNoteDuration)                 ;
SUB [HL]                                                    ;
JR C, CODE_00_0567                                          ;check if note is done playing

LD L, LOW(Sound_CurrentChannelNoteCounter)                  ;
LD [HL], A                                                  ;set the note counter back

CALL ParseSoundDataByte_00_070C                             ;

CODE_00_0567:
LD A, [Sound_Tempo]                                         ;
LD L, LOW(Sound_CurrentChannelNoteCounter)                  ;
ADD A, [HL]                                                 ;increment counter by current tempo
LD [HL], A                                                  ;

LD L, LOW(Sound_CurrentChannelUpdateDisabler)               ;the channel has been updated
LD A, $FF                                                   ;
LD [HL], A                                                  ;

CODE_00_0573:
LD A, [Sound_CurrentChannel]                                ;next channel
INC A                                                       ;
LD [Sound_CurrentChannel], A                                ;

INC H                                                       ;
LD A, [Sound_CurrentChannelRAMOffset]                       ;
ADD A, 5                                                    ;next set of channel registers
CP LOW(APU_SpeakerVolume)                                   ;check if went through all channels
JR C, ProcessSoundData_00_052B                              ;

LD A, [Sound_FrameCounter]                                  ;
INC A                                                       ;sound frame counter
LD [Sound_FrameCounter], A                                  ;
AND $1F                                                     ;will do something every 32 frames
LD E, A                                                     ;

LD A, [Sound_Volume]                                        ;
LD B, A                                                     ;
AND $70                                                     ;
LD C, A                                                     ;
SWAP C                                                      ;
OR C                                                        ;apply volume to both speakers
LD [Sound_SpeakerVolume], A                                 ;resulting volume

DEC E
JR NZ, CODE_00_05B1

LD A, [$D848]
ADD A, B                                                    ;volume ralated
LD C, A                                                     ;

XOR B
RLCA
JR NC, CODE_00_05AD

LD A, C                                                     ;unknown functionality.
RLCA
RLCA
SBC A, A
CPL
LD C, A

CODE_00_05AD:
LD A, C                                                     ;
LD [Sound_Volume], A                                        ;set volume in some way...

CODE_00_05B1:
LD A, [Sound_ChannelPan]                                    ;
LD C, A                                                     ;

LD A, [Sound_Volume]                                        ;check if sound is playing
AND A                                                       ;
JR NZ, CODE_00_05BD                                         ;

LD C, $00                                                   ;disable all channels on both speakers

CODE_00_05BD:
LD A, C                                                     ;
LD [Sound_SpeakerPan], A                                    ;resulting speaker pan
RET                                                         ;

;unused sound command
SoundCommand_SetLoopCounter_00_05C2:
AND $03                                                     ;
LD L, LOW(Sound_CurrentChannelLoopArray)                    ;
ADD A, L                                                    ;
LD C, A                                                     ;
CALL LoadSoundDataByte_00_078E                              ;get amount of loops

LD L, C                                                     ;
LD [HL], A                                                  ;
RET                                                         ;

SoundCommand_SetNoiseClockDivisor_00_05CE:
AND $07                                                     ;
LD [Sound_NoiseDivisor], A                                  ;
RET                                                         ;

SoundCommand_DefineVolume_00_05D4:
AND $07                                                     ;define into one of the 8 slots
LD C, A                                                     ;

CALL LoadSoundDataByte_00_078E                              ;
LD B, A                                                     ;

LD A, LOW(Sound_CurrentChannelPredefinedVolumeArray)        ;
ADD A, C                                                    ;
LD L, A                                                     ;
LD [HL], B                                                  ;store it there
RET                                                         ;

SoundCommand_DisableSquare1Sweep_00_05E1:
LD A, $08                                                   ;
LD [Sound_Square1Sweep], A                                  ;
RET                                                         ;

SoundCommand_SetSquare1Sweep_00_05E7:
CALL LoadSoundDataByte_00_078E                              ;
LD [Sound_Square1Sweep], A                                  ;
RET                                                         ;

SoundCommand_SetChannelDuty_00_05EE:
LD A, [Sound_CurrentChannel]                                ;
CP APU_Channel_Wave                                         ;return if the channel is wave or noise
JR NC, RETURN_00_0602                                       ;wave and noise do not have Duty bits

LD A, L                                                     ;
RRCA                                                        ;
RRCA                                                        ;
AND $C0                                                     ;duty cycle bits
LD B, A                                                     ;

LD A, [Sound_CurrentChannelRAMOffset]                       ;
INC A                                                       ;second sound register, which is generally a note length
LD C, A                                                     ;
LD A, B                                                     ;
LD [$FF00+C], A                                             ;

RETURN_00_0602:
RET                                                         ;

;unused command
UNKNOWN_00_0603:
CALL LoadSoundDataByte_00_078E
LD [$D848], A
RET

SoundCommand_SetChannelFrequency_00_060A:
CALL LoadSoundDataByte_00_078E                              ;

LD L, LOW(Sound_CurrentChannelBaseFrequency)                ;
LD [HL], A                                                  ;
RET                                                         ;

SoundCommand_SetSoundTempo_00_0611:
CALL LoadSoundDataByte_00_078E                              ;
LD [Sound_Tempo], A                                         ;
RET                                                         ;

;unused command
UNKNOWN_00_0618:
CALL LoadSoundDataByte_00_078E
SRL A
LD [Sound_Volume], A

XOR A
LD [$D848], A
RET

SoundCommand_ExecuteDataBlock_00_0625:
CALL LoadSoundDataByte_00_078E                              ;\get new destination
LD C, A                                                     ;|
CALL LoadSoundDataByte_00_078E                              ;|
LD B, A                                                     ;/

LD L, LOW(Sound_CurrentChannelDataStackOffset)              ;
LD E, [HL]                                                  ;current stack slot
LD D, H                                                     ;
LD L, LOW(Sound_CurrentChannelDataPointer+1)                ;
DEC E                                                       ;
LD A, E                                                     ;
AND $1F                                                     ;make sure it's in a certain range for some reason
LD E, A                                                     ;

LD A, [HL]                                                  ;remember the data location from where we executed the jump (or more specifically, after the jump)
LD [DE], A                                                  ;
LD [HL], B                                                  ;new destination high byte

DEC L                                                       ;
DEC E                                                       ;
LD A, E                                                     ;
AND $1F                                                     ;
LD E, A                                                     ;

LD A, [HL]                                                  ;remember the data location part 2
LD [DE], A                                                  ;
LD [HL], C                                                  ;new destination low byte

LD L, LOW(Sound_CurrentChannelDataStackOffset)              ;
LD [HL], E                                                  ;update offset
RET                                                         ;

;unused command
SoundCommand_CheckLoopCounter_00_0648:
AND $03                                                     ;
LD L, LOW(Sound_CurrentChannelLoopArray)                    ;
ADD A, L                                                    ;
LD L, A                                                     ;

DEC [HL]                                                    ;decrease that counter
JR NZ, SoundCommand_Branch_00_0657                          ;check if it became zero. if still non-zero, branch

CALL LoadSoundDataByte_00_078E                              ;skip the two bytes
JP LoadSoundDataByte_00_078E                                ;

;constant branch
SoundCommand_Branch_00_0657:
CALL LoadSoundDataByte_00_078E                              ;get data location to jump to
LD C, A                                                     ;
CALL LoadSoundDataByte_00_078E                              ;

LD L, LOW(Sound_CurrentChannelDataPointer+1)                ;
LD [HL], A                                                  ;pretty straightforward, set current data pointer to new location
DEC L                                                       ;
LD [HL], C                                                  ;
RET                                                         ;

;return to the previous block of data from where we executed current one
SoundCommand_DataBlockReturn_00_0664:
LD L, LOW(Sound_CurrentChannelDataStackOffset)              ;
LD D, H                                                     ;
LD E, [HL]                                                  ;

LD L, LOW(Sound_CurrentChannelDataPointer)                  ;
LD A, [DE]                                                  ;
LD [HL], A                                                  ;

INC E                                                       ;
LD A, E                                                     ;
AND $1F                                                     ;
LD E, A                                                     ;

INC L                                                       ;
LD A, [DE]                                                  ;
LD [HL], A                                                  ;

INC E                                                       ;
LD A, E                                                     ;
AND $1F                                                     ;
LD L, LOW(Sound_CurrentChannelDataStackOffset)              ;
LD [HL], A                                                  ;
RET                                                         ;

;ends sound processing for current channel
SoundCommand_DisableSoundChannel_00_067C:
LD A, $80                                                   ;disable this channel
LD L, LOW(Sound_CurrentChannelDataPointer+1)                ;
LD [HL], A                                                  ;

XOR A                                                       ;
LD L, LOW(Sound_CurrentChannelNoteCounter)                  ;
LD [HL], A                                                  ;reset note length

LD L, LOW(Sound_CurrentChannelNoteDuration)                 ;
LD [HL], A                                                  ;reset note counter

LD A, [Sound_CurrentChannelRAMOffset]                       ;
ADD A, APU_ChannelVolume                                    ;
LD C, A                                                     ;

XOR A                                                       ;silence this channel
LD [$FF00+C], A                                             ;
POP DE                                                      ;
RET                                                         ;

SoundCommandPointers_00_0692:
dw SoundCommand_SetLoopCounter_00_05C2                      ;$D0
dw SoundCommand_SetLoopCounter_00_05C2                      ;$D1
dw SoundCommand_SetLoopCounter_00_05C2                      ;$D2
dw SoundCommand_SetLoopCounter_00_05C2                      ;$D3
dw SoundCommand_CheckLoopCounter_00_0648                    ;$D4
dw SoundCommand_CheckLoopCounter_00_0648                    ;$D5
dw SoundCommand_CheckLoopCounter_00_0648                    ;$D6
dw SoundCommand_CheckLoopCounter_00_0648                    ;$D7
dw SoundCommand_DisableChannelPanning_00_077D               ;$D8
dw SoundCommand_SetChannelPan_00_077A                       ;$D9
dw SoundCommand_SetChannelPan_00_077A                       ;$DA
dw SoundCommand_SetChannelPan_00_077A                       ;$DB
dw SoundCommand_EnableChannelPanning_00_0782                ;$DC
dw SoundCommand_EnableChannelPanning_00_0782                ;$DD
dw SoundCommand_EnableChannelPanning_00_0782                ;$DE
dw SoundCommand_EnableChannelPanning_00_0782                ;$DF
dw SoundCommand_SetNoiseClockDivisor_00_05CE                ;$E0 set it from to a value from 0 to 7
dw SoundCommand_SetNoiseClockDivisor_00_05CE                ;$E1
dw SoundCommand_SetNoiseClockDivisor_00_05CE                ;$E2
dw SoundCommand_SetNoiseClockDivisor_00_05CE                ;$E3
dw SoundCommand_SetNoiseClockDivisor_00_05CE                ;$E4
dw SoundCommand_SetNoiseClockDivisor_00_05CE                ;$E5
dw SoundCommand_SetNoiseClockDivisor_00_05CE                ;$E6
dw SoundCommand_SetNoiseClockDivisor_00_05CE                ;$E7
dw SoundCommand_DefineVolume_00_05D4                        ;$E8
dw SoundCommand_DefineVolume_00_05D4                        ;$E9
dw SoundCommand_DefineVolume_00_05D4                        ;$EA
dw SoundCommand_DefineVolume_00_05D4                        ;$EB
dw SoundCommand_DefineVolume_00_05D4                        ;$EC
dw SoundCommand_DefineVolume_00_05D4                        ;$ED
dw SoundCommand_DefineVolume_00_05D4                        ;$EE
dw SoundCommand_DefineVolume_00_05D4                        ;$EF
dw SoundCommand_SetChannelDuty_00_05EE                      ;$F0 set Duty for square channels. this one sets to 12.5%
dw SoundCommand_SetChannelDuty_00_05EE                      ;$F1 25%
dw SoundCommand_SetChannelDuty_00_05EE                      ;$F2 50%
dw SoundCommand_SetChannelDuty_00_05EE                      ;$F3 75%
dw SoundCommand_DisableSoundChannel_00_067C                 ;\$F4 unused duplicates
dw SoundCommand_DisableSoundChannel_00_067C                 ;/$F5
dw SoundCommand_DisableSquare1Sweep_00_05E1                 ;$F6
dw SoundCommand_SetSquare1Sweep_00_05E7                     ;$F7
dw SoundCommand_SetChannelFrequency_00_060A                 ;$F8
dw SoundCommand_SetSoundTempo_00_0611                       ;$F9
dw UNKNOWN_00_0618                                          ;$FA
dw UNKNOWN_00_0603                                          ;$FB
dw SoundCommand_ExecuteDataBlock_00_0625                    ;$FC
dw SoundCommand_Branch_00_0657                              ;$FD
dw SoundCommand_DataBlockReturn_00_0664                     ;$FE
dw SoundCommand_DisableSoundChannel_00_067C                 ;$FF

ExecuteSoundCommand_00_070C:
PUSH BC                                                     ;jump to BC which we just preserved - command code pointer
RET                                                         ;

ParseSoundCommand_00_06F4:
AND $3F                                                     ;get the kind of command it's supposed to be
SUB $10                                                     ;minus $10 because $C0-$CF is a myth. as I will say in the future
LD L, A                                                     ;command ID
ADD A, A                                                    ;times two for pointer

LD DE, SoundCommandPointers_00_0692                         ;
ADD A, E                                                    ;
LD E, A                                                     ;

LD A, $00                                                   ;
ADC A, D                                                    ;
LD D, A                                                     ;

LD A, [DE]                                                  ;
LD C, A                                                     ;pointer low byte

INC DE                                                      ;
LD A, [DE]                                                  ;
LD B, A                                                     ;pointer high byte

LD A, L                                                     ;
CALL ExecuteSoundCommand_00_070C                            ;

ParseSoundDataByte_00_070C:
CALL LoadSoundDataByte_00_078E                              ;
CP $C0                                                      ;check if it's a command $D0-$FF. Don't believe the $C0 check, it's a lie!
JR NC, ParseSoundCommand_00_06F4                            ;

;normal note stuff
LD C, A                                                     ;remember previous byte that isn't a command

CALL LoadSoundDataByte_00_078E                              ;next data byte
LD [Sound_SecondNoteProp], A                                ;bits 5-7 are used to fetch a pre-set volume register value
SWAP A                                                      ;swap nibbles
RRCA                                                        ;shift right
AND $07                                                     ;store what were previously bits 5-7 transformed into bits 1-3 and shifted into bits 0-2. that's our index into array
LD [Sound_CurrentChannelPredefinedVolumeIndex], A           ;

LD A, C                                                     ;restore first byte
CALL SetCurrentChannelProperties_00_0799                    ;set volume, frequency and what have you

LD A, [Sound_SecondNoteProp]                                ;
LD L, LOW(Sound_CurrentChannelNoteDuration)                 ;
AND $1F                                                     ;bits 0 through 4 determine note length
INC A                                                       ;increment so it can't be zero.
ADD A, A                                                    ;
ADD A, A                                                    ;left shift twice (or times 4 I suppose)
LD [HL], A                                                  ;resulting note duration

LD L, LOW(Sound_CurrentChannelPanCounter)                   ;
LD A, [HL-]                                                 ;
AND A                                                       ;
RET Z                                                       ;if panning is not enabled, go away

INC A                                                       ;increment pan counter
AND $0F                                                     ;can be between 0 and 15
LD C, $00                                                   ;
CP [HL]                                                     ;check if reached the defined value
JR NZ, CODE_00_0741                                         ;

;I think this should alternate speakers every few frames. In reality, it changes to right speaker for note duration when the counter reaches destination, then counts up again with left speaker.
;so, the channel only effectively pans every other frame
LD C, $FF                                                   ;
XOR A                                                       ;clear counter

CODE_00_0741:
OR $F0                                                      ;keep panning
INC L                                                       ;
LD [HL+], A                                                 ;

INC L                                                       ;skip over $36
LD A, [HL]                                                  ;Sound_CurrentChannelUpdateDisabler
XOR C                                                       ;
LD [HL], A                                                  ;inverted
AND $01                                                     ;
INC A                                                       ;either right or left speaker

ApplyCurrentChannelPan_00_074C:
AND $03                                                     ;bit 0 - right speaker, bit 1 - left speaker
RRA
LD C, A                                                     ;save right speaker bit
RLA                                                         ;
AND $01                                                     ;
SWAP A                                                      ;invert for left speaker
OR C                                                        ;combine
LD B, A                                                     ;resulting pan value

LD A, [Sound_CurrentChannel]                                ;
INC A                                                       ;
LD C, A                                                     ;get current sound channel

LD A, B                                                     ;
LD B, %11101110                                             ;disabled square 1 panning bits
DEC C                                                       ;
JR Z, CODE_00_0771                                          ;check if current channel is square 1
ADD A, A                                                    ;
LD B, %11011101                                             ;disabled square 2 panning bits
DEC C                                                       ;
JR Z, CODE_00_0771                                          ;check if current channel is square 2
ADD A, A                                                    ;
LD B, %10111011                                             ;disabled wave panning bits
DEC C                                                       ;
JR Z, CODE_00_0771                                          ;check if current channel is wave
ADD A, A                                                    ;
LD B, %01110111                                             ;disabled noise panning bits

CODE_00_0771:
LD C, A                                                     ;channel pan
LD DE, Sound_ChannelPan                                     ;
LD A, [DE]                                                  ;
AND B                                                       ;disable the respective channel's pan bits
OR C                                                        ;enable them if necessary
LD [DE], A                                                  ;
RET                                                         ;

;Fix pan to a certain value
SoundCommand_SetChannelPan_00_077A:
CALL ApplyCurrentChannelPan_00_074C                         ;

SoundCommand_DisableChannelPanning_00_077D:
XOR A                                                       ;disable panning
LD L, LOW(Sound_CurrentChannelPanCounter)                   ;
LD [HL], A                                                  ;
RET                                                         ;

;Makes it so the channel alternates speakers.
SoundCommand_EnableChannelPanning_00_0782:
AND $03                                                     ;
INC A                                                       ;pan duration can't be zero
LD L, LOW(Sound_CurrentChannelPanDuration)                  ;
LD [HL+], A                                                 ;

LD A, $F0                                                   ;enables variable panning
LD [HL+], A                                                 ;Sound_CurrentChannelPanCounter

XOR A                                                       ;
LD [HL], A                                                  ;unknown
RET                                                         ;

LoadSoundDataByte_00_078E:
LD L, LOW(Sound_CurrentChannelDataPointer)                  ;
LD E, [HL]                                                  ;fetch pointer
INC L                                                       ;
LD D, [HL]                                                  ;

LD A, [DE]                                                  ;get data byte

INC DE                                                      ;increment pointer destination
LD [HL], D                                                  ;
DEC L                                                       ;
LD [HL], E                                                  ;
RET                                                         ;

;normal data byte
SetCurrentChannelProperties_00_0799:
LD C, A                                                     ;preserve the A we just fetched from C.
LD L, LOW(Sound_CurrentChannelUpdateDisabler)               ;check if the channel has already been updated (in case of playing SFX on the same channel as music)
LD A, [HL]                                                  ;
AND A                                                       ;
RET NZ                                                      ;don't update properties

LD A, C                                                     ;
LD L, LOW(Sound_FirstNoteProp)                              ;
LD [HL], A                                                  ;
CP $6F                                                      ;check for this specific value. will essentially disable the channel (temporarily)
JR NZ, CODE_00_07B4                                         ;

LD A, [Sound_CurrentChannelRAMOffset]                       ;
ADD A, APU_ChannelVolume                                    ;
LD C, A                                                     ;

XOR A                                                       ;
LD [$FF00+C], A                                             ;shut the channel up

INC C                                                       ;
LD [$FF00+C], A                                             ;clear the sound register after that (generally zeroes frequency)

INC C                                                       ;
LD [$FF00+C], A                                             ;and the last channel's register (shut the channel up for real)
RET                                                         ;

CODE_00_07B4:
LD B, A                                                     ;remember this second byte

LD A, [Sound_CurrentChannel]                                ;
CP APU_Channel_Noise                                        ;check if we're working with noise
JR Z, CODE_00_07FC                                          ;

LD A, [Sound_CurrentChannelPredefinedVolumeIndex]           ;
ADD A, LOW(Sound_CurrentChannelPredefinedVolumeArray)       ;get the volume for current note
LD L, A                                                     ;

LD A, [Sound_CurrentChannelRAMOffset]                       ;
ADD A, APU_ChannelVolume                                    ;
LD C, A                                                     ;

LD A, [HL]                                                  ;
LD [$FF00+C], A                                             ;set volume and maybe something else
INC C                                                       ;next sound register

LD L, LOW(Sound_CurrentChannelBaseFrequency)                ;
LD A, [HL]                                                  ;base frequency
ADD A, B                                                    ;add modifier that we fetched from second data byte
LD B, H                                                     ;preserve current channel RAM's high byte
ADD A, A                                                    ;times 2
LD E, A                                                     ;

LD HL, ChannelFrequencyLookup_00_0817                       ;
LD D, $00                                                   ;
ADD HL, DE                                                  ;
LD A, [HL+]                                                 ;
LD [$FF00+C], A                                             ;set frenquency
INC C                                                       ;

LD A, [Sound_CurrentChannel]
CP APU_Channel_Wave                                         ;check if we're working with wave channel
JR NZ, CODE_00_07EE

XOR A                                                       ;disable wave
LDH [APU_WaveDACPower], A                                   ;

NOP                                                         ;
NOP                                                         ;??
NOP                                                         ;

LD A, $80                                                   ;enable wave
LDH [APU_WaveDACPower], A                                   ;what the wave was that about?
JR SetLastSoundRegisterBits_00_07F6                         ;

;square channels
CODE_00_07EE:
AND A                                                       ;
JR NZ, SetLastSoundRegisterBits_00_07F6                     ;

LD A, [Sound_Square1Sweep]                                  ;
LDH [APU_Square1Sweep], A                                   ;

SetLastSoundRegisterBits_00_07F6:
LD A, [HL]                                                  ;frequency high byte
OR $80                                                      ;make sure this channel is TRIGGERED! Active I mean.
LD [$FF00+C], A                                             ;

LD H, B                                                     ;restore high byte of current channel's RAM pointer
RET                                                         ;

;code specific to noise
CODE_00_07FC:
LD A, [Sound_CurrentChannelPredefinedVolumeIndex]           ;
ADD A, LOW(Sound_CurrentChannelPredefinedVolumeArray)       ;
LD L, A                                                     ;

LD A, [HL]                                                  ;
LDH [APU_NoiseVolume], A                                    ;set noise channel volume

LD L, LOW(Sound_FirstNoteProp)                              ;
LD A, [HL]                                                  ;
ADD A, A                                                    ;
ADD A, A                                                    ;
ADD A, A                                                    ;shift left 3 times
LD B, A                                                     ;5 bits that determine width and clock shift

LD A, [Sound_NoiseDivisor]                                  ;
OR B                                                        ;
LDH [APU_NoiseClock], A                                     ;

LD A, $80                                                   ;noise channel activate!
LDH [APU_NoiseTrigger], A                                   ;
RET                                                         ;

;i wouldnt be surprised if this is a table of frequencies
ChannelFrequencyLookup_00_0817:
dw $002C,$009D,$0107,$016B                                  ;0-3
dw $01CA,$0223,$0277,$02C7                                  ;4-7
dw $0312,$0359,$039C,$03DB                                  ;8-B
dw $0416,$044F,$0484,$04B6                                  ;C-F
dw $04E5,$0512,$053C,$0564                                  ;10-13
dw $0589,$05AD,$05CE,$05EE                                  ;14-17
dw $060B,$0628,$0642,$065B                                  ;18-1B
dw $0673,$0689,$069E,$06B2                                  ;1C-1F
dw $06C5,$06D7,$06E7,$06F7                                  ;20-23
dw $0706,$0714,$0721,$072E                                  ;24-27
dw $073A,$0745,$074F,$0759                                  ;28-2B
dw $0763,$076C,$0774,$077C                                  ;2C-2F
dw $0783,$078A,$0791,$0797                                  ;30-33
dw $079D,$07A3,$07A8,$07AD                                  ;34-37
dw $07B2,$07B6,$07BA,$07BE                                  ;38-3B
dw $07C2,$07C5,$07C9,$07CC                                  ;3C-3F
dw $07CF,$07D2,$07D4,$07D7                                  ;40-43
dw $07D9,$07DB,$07DD,$07DF                                  ;44-47

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;load super game boy related stuff
SuperGameBoyInit_00_08A7:
LD HL, DATA_00_0A05
CALL SendSGBPacket_00_0395
CALL Wait7000_00_03CB

LD B, $0F

LOOP_00_08B2:
CALL Wait7000_00_03CB
DEC B
JR NZ, LOOP_00_08B2

LD HL, DATA_00_0965
CALL SendSGBPacket_00_0395
CALL Wait7000_00_03CB

LD HL, DATA_00_0975
CALL SendSGBPacket_00_0395
CALL Wait7000_00_03CB

LD HL, DATA_00_0985
CALL SendSGBPacket_00_0395
CALL Wait7000_00_03CB

LD HL, DATA_00_0995
CALL SendSGBPacket_00_0395
CALL Wait7000_00_03CB

LD HL, DATA_00_09A5
CALL SendSGBPacket_00_0395
CALL Wait7000_00_03CB

LD HL, DATA_00_09B5
CALL SendSGBPacket_00_0395
CALL Wait7000_00_03CB

LD HL, DATA_00_09C5
CALL SendSGBPacket_00_0395
CALL Wait7000_00_03CB

LD HL, DATA_00_09D5
CALL SendSGBPacket_00_0395
CALL Wait7000_00_03CB

LD A, LCDControlEnable|LCDWindowTilemapSelect
LDH [Reg_LCDControlAndRender], A

LD A, [CurrentProgramBank]
PUSH AF
LD B, $02
LD HL, $0008
CALL GetPointerWithSize_00_0AEC

LD DE, DATA_00_09E5
CALL CODE_00_0C14
CALL Wait7000_00_03CB

LD B, $02
LD HL, $0007
CALL GetPointerWithSize_00_0AEC

LD DE, DATA_00_09F5
CALL CODE_00_0C14
CALL Wait7000_00_03CB

POP AF
CALL SetProgramBank_00_037B
DI
CALL DisableLCD_00_0FE0

LD H, $20

LOOP_00_0934:
LD BC, $1000

LOOP_00_0937:
DEC BC
LD A, B
OR C
JR NZ, LOOP_00_0937

DEC H
JR NZ, LOOP_00_0934

LD HL, $8000
LD BC, $2000
CALL ClearData_00_0C63

LD A, LCDControlEnable|LCDBackgroundRender|LCDSpriteRender|LCDSpriteSize
LDH [Reg_LCDControlAndRender], A

XOR A
LDH [Reg_InterruptRequest], A

LD A, Interrupt_VBlank|Interrupt_HBlank
LDH [Reg_InterruptsEnabler], A
EI
CALL Wait7000_00_03CB

DI
CALL DisableLCD_00_0FE0

LD HL, DATA_00_0A15
CALL SendSGBPacket_00_0395
CALL Wait7000_00_03CB
RET

DATA_00_0965:
db $79,$1B,$08,$00,$0B,$EA,$EA,$EA
db $EA,$EA,$A9,$01,$CD,$4F,$0C,$D0

DATA_00_0975:
db $79,$26,$08,$00,$0B,$39,$CD,$48
db $0C,$D0,$34,$A5,$C9,$C9,$80,$D0

DATA_00_0985:
db $79,$31,$08,$00,$0B,$0C,$A5,$CA
db $C9,$7E,$D0,$06,$A5,$CB,$C9,$7E

DATA_00_0995:
db $79,$3C,$08,$00,$0B,$F0,$12,$A5
db $C9,$C9,$C8,$D0,$1C,$A5,$CA,$C9

DATA_00_09A5:
db $79,$47,$08,$00,$0B,$C4,$D0,$16
db $A5,$CB,$C9,$05,$D0,$10,$A2,$28

DATA_00_09B5:
db $79,$52,$08,$00,$0B,$A9,$E7,$9F
db $01,$C0,$7E,$E8,$E8,$E8,$E8,$E0

DATA_00_09C5:
db $79,$5D,$08,$00,$04,$8C,$D0,$F4
db $60,$00,$00,$00,$00,$00,$00,$00

DATA_00_09D5:
db $79,$10,$08,$00,$0B,$4C,$20,$08
db $EA,$EA,$EA,$EA,$EA,$60,$EA,$EA

DATA_00_09E5:
db $99,$00,$00,$00,$00,$00,$00,$00
db $00,$00,$00,$00,$00,$00,$00,$00

;send one packet
DATA_00_09F5:
db $A1,$00,$00,$00,$00,$00,$00,$00
db $00,$00,$00,$00,$00,$00,$00,$00

;send one packet
DATA_00_0A05:
db $B9,$02,$00,$00,$00,$00,$00,$00
db $00,$00,$00,$00,$00,$00,$00,$00

;send one packet
DATA_00_0A15:
db $B9,$00,$00,$00,$00,$00,$00,$00
db $00,$00,$00,$00,$00,$00,$00,$00

InitFadeIn_00_0A25:
LD A, $05                                                   ;
LD [FadeSpeed], A                                           ;
LD [FadeCounter], A                                         ;

LD A, $01                                                   ;
LD [FadeDirection], A                                       ;

LD A, $06                                                   ;
LD [FadeTimer], A                                           ;
RET                                                         ;

InitFadeOut_00_0A38:
LD A, $05                                                   ;
LD [FadeSpeed], A                                           ;
LD [FadeCounter], A                                         ;

LD A, $FF                                                   ;
LD [FadeDirection], A                                       ;

LD A, $06                                                   ;
LD [FadeTimer], A                                           ;
RET                                                         ;

FadeInLoop_00_0A4B:
CALL InitFadeIn_00_0A25                                     ;

LOOP_00_0A4E:
CALL WaitForVBlank_00_0382                                  ;
CALL HandleFading_00_0A77                                   ;keep fading in

LD A, [FadeTimer]                                           ;
OR A                                                        ;
JR NZ, LOOP_00_0A4E                                         ;

CALL WaitForVBlank_00_0382                                  ;
CALL HandleFading_00_0A77                                   ;execute this again for some reason. this won't actually do anything because FadeTimer being at zero does an immediate return
RET                                                         ;

FadeOutLoop_00_0A61:
CALL InitFadeOut_00_0A38                                    ;

LOOP_00_0A64:
CALL WaitForVBlank_00_0382                                  ;
CALL HandleFading_00_0A77                                   ;keeping fading out

LD A, [FadeTimer]                                           ;
OR A                                                        ;
JR NZ, LOOP_00_0A64                                         ;

CALL WaitForVBlank_00_0382                                  ;
CALL HandleFading_00_0A77                                   ;what's another CALL gonna do, huh? nothing, that's what.
RET                                                         ;

;only used for visual novel parts, other parts use different fading code
HandleFading_00_0A77:
LD A, [FadeTimer]                                           ;check if fading is finished
OR A                                                        ;
JR Z, RETURN_00_0AD3                                        ;return

LD A, [FadeSpeed]                                           ;check if fade speed is ever 0, which doesn't seem to be possible?
OR A                                                        ;
JR NZ, CODE_00_0A95                                         ;
LD [FadeTimer], A                                           ;but if it ever is 0, the fading is instant.

LD A, [FadeDirection]                                       ;check if we're fading in or out
CP $01                                                      ;
JR Z, CODE_00_0A91                                          ;

LD A, $00                                                   ;all white
JR CODE_00_0AB8                                             ;

CODE_00_0A91:
LD A, $06                                                   ;all not white
JR CODE_00_0AB8                                             ;

;normal fading
CODE_00_0A95:
LD A, [FadeCounter]                                         ;tick down
DEC A                                                       ;
OR A                                                        ;
JR NZ, CODE_00_0AD0                                         ;

LD A, [FadeTimer]                                           ;tick
DEC A                                                       ;
LD [FadeTimer], A                                           ;

LD A, [FadeDirection]                                       ;
LD B, A                                                     ;

LD A, [FadePaletteIndex]                                    ;
ADD A, B                                                    ;
CP $80                                                      ;check for underflow (in case we're fading out)
JR NC, CODE_00_0AB7                                         ;
CP $07                                                      ;
JR C, CODE_00_0AB8                                          ;check for overflow (fading in)

LD A, $06                                                   ;cap
JR CODE_00_0AB8                                             ;

CODE_00_0AB7:
XOR A                                                       ;cap

CODE_00_0AB8:
LD [FadePaletteIndex], A                                    ;
LD HL, FadeColors_00_0AD4                                   ;
ADD A, L                                                    ;
LD L, A                                                     ;

LD A, H                                                     ;
ADC A, $00                                                  ;
LD H, A                                                     ;

LD A, [HL]                                                  ;
LDH [Reg_BackgroundPalette], A                              ;
LDH [Reg_SpritePalette1], A                                 ;
AND $F0                                                     ;
LDH [Reg_SpritePalette0], A                                 ;

LD A, [FadeSpeed]                                           ;restore

CODE_00_0AD0:
LD [FadeCounter], A                                         ;

RETURN_00_0AD3:
RET                                                         ;

;palette configurations for each state of the fade
FadeColors_00_0AD4:
db $00,$40,$50,$90,$94,$A4,$E4

UpdateRandomNumber_00_0ADB:
LD A, [RandomNumber]                                        ;add 47981 to the number to create a pseudo-random number
ADD A, $6D                                                  ;
LD [RandomNumber], A                                        ;

LD A, [RandomNumber+1]                                      ;
ADC A, $BB                                                  ;
LD [RandomNumber+1], A                                      ;
RET                                                         ;that's all.

;input:
;B - bank to switch to
;HL - pointer offset
;output:
;HL - data pointer
;DE - data size
GetPointerWithSize_00_0AEC:
LD A, B                                                     ;put that in A temporarily
CALL SetProgramBank_00_037B                                 ;
PUSH BC                                                     ;
ADD HL, HL                                                  ;
ADD HL, HL                                                  ;times 4

LD A, L                                                     ;
ADD A, LOW(POINTERS_02_4000)                                ;
LD L, A                                                     ;

LD A, H                                                     ;
ADC A, HIGH(POINTERS_02_4000)                               ;get the pointer
LD H, A                                                     ;

LD A, [HL+]                                                 ;get offset from the base of the bank [$4000]
LD C, A                                                     ;
LD A, [HL+]                                                 ;16-bit
LD E, L                                                     ;
LD D, H                                                     ;
LD L, C                                                     ;
LD H, A                                                     ;

LD A, L                                                     ;
ADD A, LOW(POINTERS_02_4000)                                ;
LD L, A                                                     ;

LD A, H                                                     ;
ADC A, HIGH(POINTERS_02_4000)                               ;
LD H, A                                                     ;

LD A, [DE]                                                  ;now get data size that may or may not be useful
INC DE                                                      ;
LD C, A                                                     ;

LD A, [DE]                                                  ;
LD E, C                                                     ;
LD D, A                                                     ;

POP BC                                                      ;
RET                                                         ;

ChangeMusic_00_0B12:
LD HL, CurrentMusic                                         ;
CP [HL]                                                     ;if the music we're about to play is already the same as what we're playing, do nothing.
JR Z, RETURN_00_0B2C                                        ;
LD [HL], A                                                  ;remember what music we're playing

LD B, A                                                     ;
LD A, [CurrentProgramBank]                                  ;
PUSH AF                                                     ;
LD A, [SoundDataBank]                                       ;
CALL SetProgramBank_00_037B                                 ;

LD A, B                                                     ;
CALL StartPlayingSFXOrMusic_00_0420                         ;
POP AF                                                      ;
CALL SetProgramBank_00_037B                                 ;

RETURN_00_0B2C:
RET                                                         ;

;init sound stuff
InitSound_00_0B2D:
LD A, $01                                                   ;sound stuff is in bank 1
LD [SoundDataBank], A                                       ;

;these appear to be 16-bit pointers to sound data, but they're not used by the engine.
StoreWord MusicAndSFXChannelConfigurations_01_4000, SoundInitialDataPointer             
StoreWord SequenceDataPointers_01_4068, SoundDataPointer

LD A, $FF                                                   ;
LD [SoundQueue], A                                          ;

XOR A                                                       ;
LD [APU_SpeakerVolume], A                                   ;
LD [APU_SpeakerPan], A                                      ;
LD [APU_AudioStatus], A                                     ;reset all this stuff (only to set them later)

CALL InitSoundVariables_00_03D7                             ;

LD A, $FF                                                   ;
LD [CurrentMusic], A                                        ;
RET                                                         ;

PushToDrawingStack_00_0B5E:
PUSH AF                                                     ;
LD HL, DrawingStackPointer                                  ;
LD A, [HL+]                                                 ;
LD E, A                                                     ;
LD D, [HL]                                                  ;
DEC DE                                                      ;
LD A, D                                                     ;
LD [HL-], A                                                 ;
LD [HL], E                                                  ;

POP AF                                                      ;
LD [DE], A                                                  ;
RET                                                         ;

;unused
PullFromDrawingStack_00_0B6C:
LD HL, DrawingStackPointer                                  ;
LD A, [HL+]                                                 ;
LD E, A                                                     ;
LD D, [HL]                                                  ;
LD A, [DE]                                                  ;
INC DE                                                      ;
LD [HL], D                                                  ;

DEC HL                                                      ;
LD [HL], E                                                  ;
RET                                                         ;

;input BC - offset that was used for prior drawing to restore the stack. must the the same amount as the amount of PushToDrawingStack_00_0B5E calls (or 64 when first initializing the stack)
;...though surely you could've made this simpler.
ResetDrawingStack_00_0B78:
LD HL, DrawingStackPointer                                  ;
LD A, [HL]                                                  ;
ADD A, C                                                    ;
LD [HL+], A                                                 ;

LD A, [HL]                                                  ;
ADC A, B                                                    ;
LD [HL], A                                                  ;
RET                                                         ;

;unused
UNKNOWN_00_0B82:
LD HL, DrawingStackPointer
LD A, [HL]
SUB C
LD [HL+], A
LD A, [HL]
SBC A, B
LD [HL], A
RET

;initialize some stuff related to visual novel segments
InitVNVariables_00_0B8C:
CALL InitDrawingStack_00_0BDF                               ;
CALL InitializeTextVariables_00_1A94                        ;
CALL InitScriptVariables_00_12C2                            ;
CALL InitEventVariables_00_14B5                             ;
CALL InitPlayerNameVariables_00_1AF5                        ;
CALL InitFadeVariables_00_0BEF                              ;
CALL InitCharacterDisplayVariablesAndCamera_00_0BC4         ;
CALL SeedRandomNumber_00_0BF7                               ;
CALL MoveScriptCommandsToRAM_02_0C02                        ;

XOR A                                                       ;
LD [AButtonRequest_Press], A                                ;
LD [AButtonRequest_Hold], A                                 ;
LD [CharacterDisplay_UpdateFlag], A                         ;
LD [UNKNOWN_C168], A                                        ;
LD [OAMDMALockCheckFlag], A                                 ;
LD [LockOAMDMAUpdates], A                                   ;

LD A, $FF                                                   ;
LD [CharacterDisplay_Expression], A                         ;
RET                                                         ;

InitTextProcessingVariablesCall_00_0BC0:
CALL InitTextProcessingVariables_00_1AC7                    ;what's the point?
RET                                                         ;

InitCharacterDisplayVariablesAndCamera_00_0BC4:
XOR A                                                       ;
LD [CharacterDisplay_BaseProp], A                           ;
LD [CameraPositionY], A                                     ;
LD [CameraPositionX], A                                     ;
LD [CameraLock], A                                          ;
LD [CharacterDisplay_DisplayOnFlag], A                      ;

;default character display coordinates
LD A, $50                                                   ;
LD [CharacterDisplay_BaseX], A                              ;

LD A, $38                                                   ;
LD [CharacterDisplay_BaseY], A                              ;
RET                                                         ;

InitDrawingStack_00_0BDF:
LD HL, DrawingStackPointer                                  ;
LD DE, DrawingStack                                         ;

LD [HL], E                                                  ;
INC HL                                                      ;
LD [HL], D                                                  ;

LD BC, 64                                                   ;
CALL ResetDrawingStack_00_0B78                              ;
RET                                                         ;

InitFadeVariables_00_0BEF:
XOR A                                                       ;
LD [FadeTimer], A                                           ;
LD [FadePaletteIndex], A                                    ;
RET                                                         ;

SeedRandomNumber_00_0BF7:
LD A, $76                                                   ;
LD [RandomNumber], A                                        ;

LD A, $54                                                   ;
LD [RandomNumber+1], A                                      ;
RET                                                         ;

;copies script commands from bank 2 to RAM for global access
MoveScriptCommandsToRAM_02_0C02:
LD B, $02                                                   ;
LD HL, $000A                                                ;
CALL GetPointerWithSize_00_0AEC                             ;

LD DE, ScriptCodeStorage                                    ;
LD BC, ScriptCommandPointers_02_6EB2.end-ScriptCommandPointers_02_6EB2;the size output is in DE, so it has to awkwardly and manually load data size into BC
CALL CopyData2_00_0C7D                                      ;
RET                                                         ;

;this routine will load a custom SGB border
CODE_00_0C14:
DI
PUSH DE
CALL DisableLCD_00_0FE0

LD A, $E4
LD [Reg_BackgroundPalette], A

LD DE, $8800
LD BC, $1000
CALL CopyData2_00_0C7D

LD HL, $9800
LD DE, $000C
LD A, $80
LD C, $0D

LOOP_00_0C31:
LD B, $14

LOOP_00_0C33:
LD [HL+], A
INC A
DEC B
JR NZ, LOOP_00_0C33
ADD HL, DE
DEC C
JR NZ, LOOP_00_0C31

LD A, LCDControlEnable|LCDBackgroundRender
LD [Reg_LCDControlAndRender], A

LD BC, $0005
CALL CODE_00_0C52

POP HL
CALL SendSGBPacket_00_0395

LD BC, $0006
CALL CODE_00_0C52
RET

CODE_00_0C52:
LD DE, 1750

LOOP_00_0C55:
NOP
NOP
NOP
DEC DE

LD A, D
OR E
JR NZ, LOOP_00_0C55

DEC BC
LD A, B
OR C
JR NZ, CODE_00_0C52
RET

;input:
;HL - pointer to data that must be cleared
;BC - data size
ClearData_00_0C63:
CheckPPUModes                                               ;
XOR A                                                       ;
LD [HL], A                                                  ;
LDH A, [Reg_LCDStatus]                                      ;
BIT 1, A                                                    ;
JR NZ, ClearData_00_0C63                                    ;
INC HL                                                      ;
DEC BC                                                      ;

LD A, C                                                     ;
OR B                                                        ;
JR NZ, ClearData_00_0C63                                    ;
RET                                                         ;

;input:
;HL - data to transfer from
;DE - data to transfer to
;BC - amount of bytes to transfer
CopyData_00_0C73:
CheckPPUModes                                               ;
LD A, [HL+]                                                 ;copy HL
LD [DE], A                                                  ;into DE
INC DE                                                      ;

DEC BC                                                      ;
LD A, B                                                     ;
OR C                                                        ;
JR NZ, CopyData_00_0C73                                     ;do it BC times
RET                                                         ;

;seemingly identical except for a strange check
CopyData2_00_0C7D:
CheckPPUModes                                               ;
LD A, [HL]                                                  ;
LD [DE], A                                                  ;

LD A, [DE]                                                  ;
CP [HL]                                                     ;
JR NZ, CopyData2_00_0C7D                                    ;I'm guessing this is a "protected" kind of write, because it checks if the write failed... to lock the game then?

INC DE                                                      ;
INC HL                                                      ;
DEC BC                                                      ;
LD A, B                                                     ;
OR C                                                        ;
JR NZ, CopyData2_00_0C7D                                    ;
RET                                                         ;

;store character to VRAM.
;input:
;A - tile
;HL - VRAM offset
DrawOneBGTile_00_0C8C:
LD B, A                                                     ;backup

LOOP_00_0C8D:
CheckPPUModes                                               ;wait for a moment to draw
LD A, B                                                     ;
LD [HL], A                                                  ;
LD A, [HL]                                                  ;
CP B                                                        ;
JR NZ, LOOP_00_0C8D                                         ;lock the game if the write failed somehow?
RET                                                         ;

CheckSGB_00_0C95:
LD HL, MltReq2Packet_00_0D14
CALL SendSGBPacket_00_0395

CALL Wait7000_00_03CB
CALL Wait7000_00_03CB

LD A, [Reg_JoyPad]
AND $03
CP $03
JR NZ, CODE_00_0CF6

LD A, $20
LD [Reg_JoyPad], A

LD A, [Reg_JoyPad]
LD A, [Reg_JoyPad]

LD A, $30
LD [Reg_JoyPad], A

LD A, $10
LD [Reg_JoyPad], A
LD A, [Reg_JoyPad]
LD A, [Reg_JoyPad]
LD A, [Reg_JoyPad]
LD A, [Reg_JoyPad]
LD A, [Reg_JoyPad]
LD A, [Reg_JoyPad]

LD A, $30
LD [Reg_JoyPad], A

LD A, [Reg_JoyPad]
LD A, [Reg_JoyPad]
LD A, [Reg_JoyPad]
LD A, [Reg_JoyPad]
AND $03
CP $03
JR NZ, CODE_00_0CF6

LD HL, MltReq1Packet_00_0D04
CALL SendSGBPacket_00_0395
CALL Wait7000_00_03CB
CALL Wait7000_00_03CB
SUB A
RET

CODE_00_0CF6:
LD HL, MltReq1Packet_00_0D04
CALL SendSGBPacket_00_0395
CALL Wait7000_00_03CB
CALL Wait7000_00_03CB
SCF
RET

MltReq1Packet_00_0D04:
db $89,$00,$00,$00,$00,$00,$00,$00
db $00,$00,$00,$00,$00,$00,$00,$00

MltReq2Packet_00_0D14:;whatever MLT is (i took this from pokemon red and blue disassembly)
db $89,$01,$00,$00,$00,$00,$00,$00
db $00,$00,$00,$00,$00,$00,$00,$00

CODE_00_0D24:
LD HL, DATA_00_0D37
CALL SendSGBPacket_00_0395
CALL Wait7000_00_03CB

LD HL, DATA_00_0D47
CALL SendSGBPacket_00_0395
CALL Wait7000_00_03CB
RET

DATA_00_0D37:
db $01,$FF,$7F,$17,$12,$2C,$01,$00
db $00,$3B,$03,$14,$00,$00,$00,$00

DATA_00_0D47:
db $31,$00,$00,$00,$00,$00,$00,$00
db $00,$00,$00,$00,$00,$00,$00,$00

;manually searches for specific "expression" display data for each character appearance
;input:
;C - expression display data to look for
;HL - base data pointer
;output:
;HL - specific data pointer
GetExpressionDisplayDataOffset_00_0D57:
LD A, C                                                     ;
OR A                                                        ;check if we found the set of data for the expression we're looking for
JR Z, RETURN_00_0D66                                        ;

DEC C                                                       ;next set of data

LOOP_00_0D5C:
INC HL                                                      ;
INC HL                                                      ;
INC HL                                                      ;
LD A, [HL+]                                                 ;
AND $01                                                     ;bit 0 is end drawing bit. look until we find it
JR Z, LOOP_00_0D5C                                          ;
JR GetExpressionDisplayDataOffset_00_0D57                   ;

RETURN_00_0D66:
RET                                                         ;

InitializeOAMForVN_00_0D67:
LD A, $01                                                   ;don't mess with stuff, VBlank!
LD [LockOAMDMAUpdates], A                                   ;

CALL ResetCurrentSpriteSlot_00_0E2F                         ;
CALL RemoveRemainingSpriteSlots_00_0E34                     ;clear all OAM slots

XOR A                                                       ;
LD [LockOAMDMAUpdates], A                                   ;we're done

LD A, $01                                                   ;set this unknown flag
LD [UNKNOWN_C168], A                                        ;
RET                                                         ;

;display character in VN segments (and in character profile screen)
;Argument 1 - character base X-position
;Argument 2 - character base Y-position
;Argument 3 - character base OAM property
;Arguments 4 and 5 are display data table high and low bytes, respectively
DisplayCharacter_00_0D7C:
LD DE, OAM_Y                                                ;
LD A, [LatestOAMSlot]                                       ;
SLA A                                                       ;
SLA A                                                       ;
ADD A, E                                                    ;

LD E, A                                                     ;
LD A, D                                                     ;
ADC A, $00                                                  ;
LD D, A                                                     ;

PUSH HL                                                     ;
PUSH DE                                                     ;
LD HL, DrawingStackPointer                                  ;
LD A, [HL+]                                                 ;
LD E, A                                                     ;
LD D, [HL]                                                  ;

LD A, [DE]                                                  ;get argument 5 - low byte
POP DE                                                      ;
POP HL                                                      ;
LD L, A                                                     ;store low byte

PUSH HL                                                     ;
PUSH DE                                                     ;
LD HL, DrawingStackPointer                                  ;
LD A, [HL+]                                                 ;
ADD A, $01                                                  ;
LD E, A                                                     ;

LD A, [HL]                                                  ;
ADC A, $00                                                  ;
LD D, A                                                     ;

LD A, [DE]                                                  ;get argument 4 - high byte
POP DE                                                      ;
POP HL                                                      ;
LD H, A                                                     ;store high byte

PUSH HL                                                     ;
PUSH DE                                                     ;
LD HL, DrawingStackPointer                                  ;
LD A, [HL+]                                                 ;
ADD A, $02                                                  ;
LD E, A                                                     ;

LD A, [HL]                                                  ;
ADC A, $00                                                  ;
LD D, A                                                     ;

LD A, [DE]                                                  ;get argument 3 - OAM prop
POP DE                                                      ;
POP HL                                                      ;
LD [CharacterDisplay_DrawingProp], A                        ;

PUSH HL                                                     ;
PUSH DE                                                     ;
LD HL, DrawingStackPointer                                  ;
LD A, [HL+]                                                 ;
ADD A, $03                                                  ;
LD E, A                                                     ;

LD A, [HL]                                                  ;
ADC A, $00                                                  ;
LD D, A                                                     ;

LD A, [DE]                                                  ;get argument 2
POP DE                                                      ;
POP HL                                                      ;
ADD A, $10                                                  ;always 10 pixels off to the bottom
LD [CharacterDisplay_DrawingY], A                           ;store base Y-pos

PUSH HL                                                     ;
PUSH DE                                                     ;
LD HL, DrawingStackPointer                                  ;
LD A, [HL+]                                                 ;
ADD A, $04                                                  ;
LD E, A                                                     ;

LD A, [HL]                                                  ;
ADC A, $00                                                  ;
LD D, A                                                     ;

LD A, [DE]                                                  ;get argument 1
POP DE                                                      ;
POP HL                                                      ;
ADD A, $08                                                  ;x-position will always be 8 pixels to the right
LD [CharacterDisplay_DrawingX], A                           ;store base x-pos

;sprite drawing loop
LOOP_00_0DE6:
LD A, E                                                     ;
CP 40*4                                                     ;
JR NC, RETURN_00_0E2E                                       ;return if no sprite slots remain

LD A, [CharacterDisplay_DrawingProp]                        ;
LD C, A                                                     ;

LD A, [HL+]                                                 ;
BitTest OAMProp_YFlip, C                                    ;check if Y-flip is set
JR Z, CODE_00_0DF9                                          ;

XOR $FF                                                     ;the image will be flipped
INC A                                                       ;
SUB $10                                                     ;

CODE_00_0DF9:
LD B, A                                                     ;

LD A, [CharacterDisplay_DrawingY]                           ;
ADD A, B                                                    ;
LD [DE], A                                                  ;
INC DE                                                      ;

LD A, [HL+]                                                 ;
BitTest OAMProp_XFlip, C                                    ;check if X-flip is set
JR Z, CODE_00_0E0A                                          ;

XOR $FF                                                     ;the image will be flipped
INC A                                                       ;
SUB $08                                                     ;

CODE_00_0E0A:
LD B, A                                                     ;
LD A, [CharacterDisplay_DrawingX]                           ;
ADD A, B                                                    ;
LD [DE], A                                                  ;
INC DE                                                      ;

LD A, [HL+]                                                 ;
LD [DE], A                                                  ;store tile
INC DE                                                      ;

LD C, $00                                                   ;
LD A, [HL+]                                                 ;
AND $01                                                     ;check if should stop drawing
JR Z, CODE_00_0E1C                                          ;
INC C                                                       ;indicate the end of character image data

CODE_00_0E1C:
LD B, A                                                     ;
LD A, [CharacterDisplay_DrawingProp]                        ;
OR B                                                        ;
LD [DE], A                                                  ;

INC DE                                                      ;
LD A, [LatestOAMSlot]                                       ;
INC A                                                       ;
LD [LatestOAMSlot], A                                       ;

LD A, C                                                     ;
OR A                                                        ;
JR Z, LOOP_00_0DE6                                          ;

RETURN_00_0E2E:
RET                                                         ;

ResetCurrentSpriteSlot_00_0E2F:
XOR A                                                       ;
LD [LatestOAMSlot], A                                       ;
RET                                                         ;

RemoveRemainingSpriteSlots_00_0E34:
LD DE, OAM_Y                                                ;
LD A, [LatestOAMSlot]                                       ;
SLA A                                                       ;
SLA A                                                       ;
ADD A, E                                                    ;
LD E, A                                                     ;
LD A, D                                                     ;
ADC A, $00                                                  ;
LD D, A                                                     ;

LOOP_00_0E44:
LD A, E                                                     ;
CP 40*4                                                     ;check if gone through all slots
JR NC, RETURN_00_0E52                                       ;

INC DE                                                      ;
LD A, $00                                                   ;
LD [DE], A                                                  ;

INC DE                                                      ;
INC DE                                                      ;
INC DE                                                      ;
JR LOOP_00_0E44                                             ;

RETURN_00_0E52:
RET                                                         ;

ClearSpriteData_00_0E53:
LD HL, OAM_Y                                                ;

XOR A                                                       ;
LD B, 40*4                                                  ;

LOOP_00_0E59:
LD [HL+], A                                                 ;
DEC B                                                       ;
JR NZ, LOOP_00_0E59                                         ;
RET                                                         ;

;Fills lines of tiles.
;Push several arguments into drawing stack.
;First argument - VRAM line
;Second argument - VRAM column
;Third argument - Amount of tiles on each line
;Fourth argument - Amount of lines to fill
;Fifth argument - Data pointer high byte. If it's zero, the lines will be filled with one tile
;Sixth argument - Data pointer low byte OR fill tile. If fifth argument didn't point to any data, this argument is used as a fill tile.
FillLinesOfTiles_00_0E5E:
PUSH HL                                                     ;
PUSH DE                                                     ;
LD HL, DrawingStackPointer                                  ;
LD A, [HL+]                                                 ;
ADD A, $04                                                  ;
LD E, A                                                     ;

LD A, [HL]                                                  ;
ADC A, $00                                                  ;
LD D, A                                                     ;

LD A, [DE]                                                  ;get first argument
POP DE                                                      ;
POP HL                                                      ;

LD L, A                                                     ;
LD H, $00                                                   ;
ADD HL, HL                                                  ;
ADD HL, HL                                                  ;
ADD HL, HL                                                  ;
ADD HL, HL                                                  ;
ADD HL, HL                                                  ;calculate VRAM vertical offset

PUSH HL                                                     ;
PUSH DE                                                     ;
LD HL, DrawingStackPointer                                  ;
LD A, [HL+]                                                 ;
ADD A, $05                                                  ;

LD E, A                                                     ;
LD A, [HL]                                                  ;
ADC A, $00                                                  ;

LD D, A                                                     ;
LD A, [DE]                                                  ;second argument
POP DE                                                      ;

POP HL                                                      ;
ADD A, L                                                    ;VRAM horizontal offset
LD L, A                                                     ;

LD A, H                                                     ;
ADC A, $00                                                  ;
LD H, A                                                     ;

LD A, L                                                     ;
ADD A, LOW($9800)                                           ;combine with VRAM base address
LD L, A                                                     ;

LD A, H                                                     ;
ADC A, HIGH($9800)                                          ;
LD H, A                                                     ;resulting VRAM pointer - HL

PUSH HL                                                     ;
PUSH DE                                                     ;
LD HL, DrawingStackPointer                                  ;
LD A, [HL+]                                                 ;
LD E, A                                                     ;
LD D, [HL]                                                  ;

LD A, [DE]                                                  ;get sixth argument
POP DE                                                      ;
POP HL                                                      ;

LD E, A                                                     ;which may be data pointer or fill tile (store into E)
PUSH HL                                                     ;
PUSH DE                                                     ;

LD HL, DrawingStackPointer                                  ;
LD A, [HL+]                                                 ;
ADD A, $01                                                  ;
LD E, A                                                     ;

LD A, [HL]                                                  ;
ADC A, $00                                                  ;
LD D, A                                                     ;

LD A, [DE]                                                  ;get fifth argument
POP DE                                                      ;
POP HL                                                      ;

LD D, A                                                     ;data pointer high byte (or lack of)
PUSH HL                                                     ;
PUSH DE                                                     ;

LD HL, DrawingStackPointer                                  ;
LD A, [HL+]                                                 ;
ADD A, $02                                                  ;
LD E, A                                                     ;

LD A, [HL]                                                  ;
ADC A, $00                                                  ;
LD D, A                                                     ;

LD A, [DE]                                                  ;get third argument
POP DE                                                      ;
POP HL                                                      ;
LD C, A                                                     ;amount of lines to fill (store into C)

LOOP_00_0EC2:
PUSH BC                                                     ;
PUSH HL                                                     ;
PUSH HL                                                     ;
PUSH DE                                                     ;
LD HL, DrawingStackPointer                                  ;

LD A, [HL+]                                                 ;
ADD A, $03                                                  ;
LD E, A                                                     ;

LD A, [HL]                                                  ;
ADC A, $00                                                  ;
LD D, A                                                     ;

LD A, [DE]                                                  ;get fourth argument
POP DE                                                      ;
POP HL                                                      ;
LD B, A                                                     ;amount of tiles per line (store into B)

LOOP_00_0ED5:
LD A, D                                                     ;check if D was zero
OR A                                                        ;
JR NZ, CODE_00_0EDC                                         ;if not, DE - pointer to tilemap

LD A, E                                                     ;otherwise E - fill tile
JR CODE_00_0EDE                                             ;

CODE_00_0EDC:
LD A, [DE]                                                  ;takes tiles from some data
INC DE                                                      ;

CODE_00_0EDE:
LD C, A                                                     ;

LOOP_00_0EDF:
CheckPPUModes                                               ;
LD A, C                                                     ;
LD [HL], A                                                  ;

LD A, [HL]                                                  ;check if the tile didn't change?
CP C                                                        ;
JR NZ, LOOP_00_0EDF                                         ;

INC HL                                                      ;
DEC B                                                       ;
JR NZ, LOOP_00_0ED5                                         ;

POP HL                                                      ;
LD A, L                                                     ;
ADD A, $20                                                  ;next line
LD L, A                                                     ;

LD A, H                                                     ;
ADC A, $00                                                  ;
LD H, A                                                     ;
POP BC                                                      ;

DEC C                                                       ;
JR NZ, LOOP_00_0EC2                                         ;
RET                                                         ;

;draws an info box
;Argument 1 - VRAM column to draw at
;Argument 2 - VRAM row to draw at
;Argument 3 - box width
;Argument 4 - box height
DrawInfoBox_00_0EF8:
PUSH HL                                                     ;
PUSH DE                                                     ;
LD HL, DrawingStackPointer                                  ;
LD A, [HL+]                                                 ;
ADD A, $02                                                  ;
LD E, A                                                     ;

LD A, [HL]                                                  ;
ADC A, $00                                                  ;
LD D, A                                                     ;

LD A, [DE]                                                  ;second argument
POP DE                                                      ;
POP HL                                                      ;
LD L, A                                                     ;row to draw at

LD H, $00                                                   ;
ADD HL, HL                                                  ;
ADD HL, HL                                                  ;
ADD HL, HL                                                  ;
ADD HL, HL                                                  ;
ADD HL, HL                                                  ;

PUSH HL                                                     ;
PUSH DE                                                     ;
LD HL, DrawingStackPointer                                  ;
LD A, [HL+]                                                 ;
ADD A, $03                                                  ;
LD E, A                                                     ;

LD A, [HL]                                                  ;
ADC A, $00                                                  ;
LD D, A                                                     ;

LD A, [DE]                                                  ;first argument
POP DE                                                      ;
POP HL                                                      ;
ADD A, L                                                    ;VRAM column (or in other words, tile on the same line)
LD L, A

LD A, H                                                     ;
ADC A, $00                                                  ;
LD H, A                                                     ;

LD A, L                                                     ;
ADD A, LOW($9800)                                           ;
LD L, A                                                     ;

LD A, H                                                     ;
ADC A, HIGH($9800)                                          ;
LD H, A                                                     ;

PUSH HL                                                     ;
PUSH DE                                                     ;
LD HL, DrawingStackPointer                                  ;
LD A, [HL+]                                                 ;
LD E, A                                                     ;
LD D, [HL]                                                  ;

LD A, [DE]                                                  ;fourth argument
POP DE                                                      ;
POP HL                                                      ;
LD C, A                                                     ;height (amount of rows)

LOOP_00_0F3A:
PUSH HL                                                     ;
PUSH HL                                                     ;
PUSH DE                                                     ;
LD HL, DrawingStackPointer                                  ;
LD A, [HL+]                                                 ;
ADD A, $01                                                  ;
LD E, A

LD A, [HL]                                                  ;
ADC A, $00                                                  ;
LD D, A                                                     ;

LD A, [DE]                                                  ;third argument
POP DE                                                      ;
POP HL                                                      ;
LD B, A                                                     ;width

LOOP_00_0F4C:
LD A, B                                                     ;checks if we're drawing the last tile of the message box (right side)
DEC A                                                       ;
JR Z, CODE_00_0F9F                                          ;

PUSH HL                                                     ;
PUSH DE                                                     ;
LD HL, DrawingStackPointer                                  ;
LD A, [HL+]                                                 ;
ADD A, $01                                                  ;
LD E, A                                                     ;

LD A, [HL]                                                  ;
ADC A, $00                                                  ;
LD D, A                                                     ;

LD A, [DE]                                                  ;reload argument 3 (info box width)
POP DE                                                      ;
POP HL                                                      ;
CP B                                                        ;
JR Z, CODE_00_0F81                                          ;check if we just started drawing the message box's line (left side)

;drawing middle of the message box
LD A, C                                                     ;
DEC A                                                       ;
JR Z, CODE_00_0F7D                                          ;

PUSH HL                                                     ;
PUSH DE                                                     ;
LD HL, DrawingStackPointer                                  ;
LD A, [HL+]                                                 ;
LD E, A                                                     ;
LD D, [HL]                                                  ;
LD A, [DE]                                                  ;
POP DE                                                      ;
POP HL                                                      ;
CP C                                                        ;
JR Z, CODE_00_0F79                                          ;

LD E, CHARVAL(" ")                                          ;empty
JR LOOP_00_0FBB                                             ;

CODE_00_0F79:
LD E, $04                                                   ;message box top line tile
JR LOOP_00_0FBB                                             ;

CODE_00_0F7D:
LD E, $05                                                   ;message box bottom line tile
JR LOOP_00_0FBB                                             ;

;drawing left side of the message box
CODE_00_0F81:
LD A, C                                                     ;
DEC A                                                       ;
JR Z, CODE_00_0F9B                                          ;

PUSH HL                                                     ;
PUSH DE                                                     ;
LD HL, DrawingStackPointer                                  ;
LD A, [HL+]                                                 ;
LD E, A                                                     ;
LD D, [HL]                                                  ;
LD A, [DE]                                                  ;
POP DE                                                      ;
POP HL                                                      ;
CP C                                                        ;
JR Z, CODE_00_0F97                                          ;

LD E, $02                                                   ;message box left line tile
JR LOOP_00_0FBB                                             ;

CODE_00_0F97:
LD E, $01                                                   ;message box top-left corner tile
JR LOOP_00_0FBB                                             ;

CODE_00_0F9B:
LD E, $03                                                   ;message box bottom-left corner tile
JR LOOP_00_0FBB                                             ;

;drawing right side of the message box
CODE_00_0F9F:
LD A, C                                                     ;check if we're drawing the bottom of the info box
DEC A                                                       ;
JR Z, CODE_00_0FB9                                          ;

PUSH HL                                                     ;
PUSH DE                                                     ;
LD HL, DrawingStackPointer                                  ;
LD A, [HL+]                                                 ;
LD E, A                                                     ;
LD D, [HL]                                                  ;
LD A, [DE]                                                  ;
POP DE                                                      ;
POP HL                                                      ;
CP C                                                        ;
JR Z, CODE_00_0FB5                                          ;check if we're drawing top

LD E, $07                                                   ;message box right line tile
JR LOOP_00_0FBB                                             ;

CODE_00_0FB5:
LD E, $06                                                   ;message box top-right corner tile
JR LOOP_00_0FBB                                             ;

CODE_00_0FB9:
LD E, $08                                                   ;message box bottom-right corner tile

LOOP_00_0FBB:
CheckPPUModes                                               ;
LD A, E                                                     ;
LD [HL], A                                                  ;
LD A, [HL]                                                  ;check if VRAM didn't update somehow
CP E                                                        ;
JR NZ, LOOP_00_0FBB                                         ;

INC HL                                                      ;
DEC B                                                       ;
JR NZ, LOOP_00_0F4C                                         ;

POP HL                                                      ;
LD A, L                                                     ;
ADD A, $20                                                  ;
LD L, A                                                     ;

LD A, H                                                     ;
ADC A, $00                                                  ;
LD H, A                                                     ;

DEC C                                                       ;next line of tiles
JP NZ, LOOP_00_0F3A                                         ;
RET                                                         ;

;a couple of unused routines
;DisableRender
LD A, LCDControlEnable|LCDWindowTilemapSelect|LCDSpriteSize
LD [Reg_LCDControlAndRender], A
RET

;EnableRender
LD A, LCDControlEnable|LCDWindowTilemapSelect|LCDSpriteSize|LCDSpriteRender|LCDBackgroundRender
LD [Reg_LCDControlAndRender], A
RET

;thanks to pokemon red and blue disassembly, I now know what this routine does!
DisableLCD_00_0FE0:
LD A, [Reg_LCDControlAndRender]                             ;check if LCD control is already off
BitTest LCDControlEnable, A                                 ;
RET Z                                                       ;

LD A, [Reg_InterruptsEnabler]                               ;
LD [InterruptDisablerMirror], A                             ;
ResetBit Interrupt_VBlank, A                                ;
LD [Reg_InterruptsEnabler], A                               ;

LOOP_00_0FF1:
LD A, [Register_LCDYPos]                                    ;
CP $91                                                      ;LCD can only be disabled during VBlank, or the hardware can get damaged. serious stuff.
JR NZ, LOOP_00_0FF1                                         ;

LD A, [Reg_LCDControlAndRender]                             ;
AND ~LCDControlEnable                                       ;preserve all bits except for LCD control
LD [Reg_LCDControlAndRender], A                             ;

LD A, [InterruptDisablerMirror]                             ;
LD [Reg_InterruptsEnabler], A                               ;
RET                                                         ;

LoadAndHandleVNSegment_00_1007:
CALL GetScriptEntry_00_10A9                                 ;load what script we're gonna execute
CALL InitCharacterDisplayVariablesAndCamera_00_0BC4         ;
CALL ClearSpriteData_00_0E53                                ;

XOR A                                                       ;
LD [FadedOutFromEventFlag], A                               ;

CALL ExecuteVNSegment_00_102D                               ;

LD A, [FadedOutFromEventFlag]                               ;if the event faded out (which generally isn't the case)
OR A                                                        ;
JR NZ, CODE_00_1022                                         ;

CALL FadeOutLoop_00_0A61                                    ;automatically fade out from the event
JR CODE_00_1026                                             ;

CODE_00_1022:
XOR A                                                       ;
LD [FadePaletteIndex], A                                    ;

CODE_00_1026:
CALL InitCharacterDisplayVariablesAndCamera_00_0BC4         ;
CALL ClearSpriteData_00_0E53                                ;
RET                                                         ;

ExecuteVNSegment_00_102D:
XOR A                                                       ;
LD [SequenceSkippedFlag], A                                 ;
LD [SkippedSequenceFadingFlag], A                           ;

HandleVNSegment_00_1034:
CALL WaitForVBlank_00_0382                                  ;
CALL ResetCurrentSpriteSlot_00_0E2F                         ;

LD HL, CharacterDisplay_Expression                          ;
LD A, [CurrentCharacter_Expression]                         ;
CP [HL]                                                     ;
JR Z, CODE_00_1048                                          ;

LD [CharacterDisplay_Expression], A                         ;remember this expression
JR CODE_00_104E                                             ;most definitely need redrawing

CODE_00_1048:
LD A, [CharacterDisplay_UpdateFlag]                         ;check if character updated in some other way (e.g. changed coordinates)
OR A                                                        ;
JR Z, CODE_00_1066                                          ;

CODE_00_104E:
LD A, $01                                                   ;we're gonna mess with OAM
LD [LockOAMDMAUpdates], A                                   ;

CALL HandleCharacterDisplay_00_1B54                         ;
CALL RemoveRemainingSpriteSlots_00_0E34                     ;

XOR A                                                       ;done
LD [LockOAMDMAUpdates], A                                   ;

LD A, $01                                                   ;
LD [UNKNOWN_C168], A                                        ;

XOR A                                                       ;
LD [CharacterDisplay_UpdateFlag], A                         ;

CODE_00_1066:
CALL ExecuteScripting_00_11C7                               ;do scripts
CALL HandleDialogueChoice_00_1610                           ;do dialogue choice
CALL HandleTextAdvanceSymbolAnimation_00_15E9               ;do text advance animation
CALL ExecuteTextParsing_00_1723                             ;do text
CALL HandleFading_00_0A77                                   ;do fades

LD A, [SequenceSkippedFlag]                                 ;
OR A                                                        ;
JR Z, CODE_00_1094                                          ;

LD A, [SkippedSequenceFadingFlag]                           ;check if we're fading out now
OR A                                                        ;
JR NZ, CODE_00_1089                                         ;

CALL InitFadeOut_00_0A38                                    ;

LD [SkippedSequenceFadingFlag], A                           ;now we do!
JR CODE_00_1094                                             ;

CODE_00_1089:
LD A, [FadePaletteIndex]                                    ;continue fading until done
OR A                                                        ;
JR NZ, CODE_00_1094                                         ;
LD [FadeTimer], A                                           ;

JR CODE_00_109B                                             ;get out of the VN segment

CODE_00_1094:
LD A, [ScriptExecutionState]                                ;
CP ScriptExecutionState_EndExecution                        ;check if we ended execution of the script
JR NZ, HandleVNSegment_00_1034                              ;if not, continue as normal

CODE_00_109B:
CALL InitTextProcessingVariables_00_1AC7                    ;

XOR A                                                       ;
LD [SequenceSkipFlag], A                                    ;
LD [SequenceSkippedFlag], A                                 ;
LD [SkippedSequenceFadingFlag], A                           ;
RET                                                         ;

;fetch a script
GetScriptEntry_00_10A9:
LD B, $02                                                   ;
LD HL, $0005                                                ;
CALL GetPointerWithSize_00_0AEC                             ;

LD A, [ScriptEntryOffset+1]                                 ;
LD C, A                                                     ;
LD A, [ScriptEntryOffset]                                   ;
SLA A                                                       ;
RL C                                                        ;
ADD A, L                                                    ;
LD E, A                                                     ;
LD A, C                                                     ;
ADC A, H                                                    ;
LD D, A                                                     ;

LD A, [DE]                                                  ;low byte
INC DE                                                      ;
LD L, A                                                     ;

LD A, [DE]                                                  ;high byte
AND $07                                                     ;is the first 3 bits
LD H, A                                                     ;

LD A, [DE]                                                  ;
SRL A                                                       ;
SRL A                                                       ;
SRL A                                                       ;
LD [ScriptBank], A                                          ;the 5 remaining bits are the bank where the script is located (which just so happens to be between 0 and 1F, which is the max amount of program banks)

LD A, [ScriptBank]
CALL SetProgramBank_00_037B                                 ;set bank where we're gonna parse the script from
ADD HL, HL                                                  ;script ID times 2

LD A, [ScriptTablePointer]                                  ;get proper script location
ADD A, L                                                    ;
LD L, A                                                     ;

LD A, [ScriptTablePointer+1]                                ;
ADC A, H                                                    ;
LD H, A                                                     ;

LD A, [HL+]                                                 ;script location in that bank
LD [ScriptPointerOffset], A                                 ;

LD A, [HL]                                                  ;
LD [ScriptPointerOffset+1], A                               ;

LD A, ScriptExecutionState_Execute                          ;default to execution, of course
LD [ScriptExecutionState], A                                ;

CALL InitSubscriptStack_00_12DC                             ;
RET                                                         ;

InitializeTextChoiceFunctionality_00_10F4:
LD A, [ChoiceOptions_DefaultOption]                         ;set selected option default. seems a bit pointless to have it be in RAM...
LD [ChoiceOptions_CurrentOption], A                         ;

CALL CalculateTextChoiceCursorPosition_00_1705              ;

LD A, [TextDrawing_VRAMRow]                                 ;calculate where the cursor will appear horizontally
INC A                                                       ;
LD L, A                                                     ;
LD H, $00                                                   ;
ADD HL, HL                                                  ;
ADD HL, HL                                                  ;
ADD HL, HL                                                  ;
ADD HL, HL                                                  ;
ADD HL, HL                                                  ;

LD A, [TextDrawing_VRAMColumn]                              ;where it'll appear vertically
ADD A, L                                                    ;
LD L, A                                                     ;

LD A, H                                                     ;
ADC A, $00                                                  ;
LD H, A                                                     ;

LD A, L                                                     ;
ADD A, LOW($9800)                                           ;
LD L, A                                                     ;

LD A, H                                                     ;
ADC A, HIGH($9800)                                          ;
LD H, A                                                     ;

LD A, L                                                     ;
LD [ChoiceOptions_CursorBaseVRAMLoc], A                     ;

LD A, H                                                     ;
LD [ChoiceOptions_CursorBaseVRAMLoc+1], A                   ;

CALL EnablePlayerChoice_00_16BE                             ;
RET                                                         ;

VariableBranchCheck_00_1126:
LD HL, RETURN_00_115B                                       ;return once done
PUSH HL                                                     ;

LD A, [ScriptVariableCheck_WhichCheck]                      ;which check to perform?
LD L, A                                                     ;
LD H, $00                                                   ;
ADD HL, HL                                                  ;
LD A, L                                                     ;
ADD A, LOW(ScriptVariableCheckPointers_00_115C)             ;
LD L, A                                                     ;

LD A, H                                                     ;
ADC A, HIGH(ScriptVariableCheckPointers_00_115C)            ;
LD H, A                                                     ;

LD A, [HL+]                                                 ;get the code pointer into BC
LD C, A                                                     ;
LD B, [HL]                                                  ;
PUSH BC                                                     ;will go execute the respective compare on RET

LD A, [ScriptVariableCheck_FirstValue]                      ;
LD L, A                                                     ;
LD H, $00                                                   ;
ADD HL, HL                                                  ;

LD A, L                                                     ;the first thing we compare is definitely a variable
ADD A, LOW(ScriptTEMP_D31B)                                 ;
LD L, A                                                     ;

LD A, H                                                     ;
ADC A, HIGH(ScriptTEMP_D31B)                                ;
LD H, A                                                     ;

LD A, [HL+]                                                 ;
LD E, A                                                     ;
LD D, [HL]                                                  ;

LD A, [ScriptVariableCheck_SecondValue]                     ;
LD L, A                                                     ;

LD A, [ScriptVariableCheck_SecondValue+1]                   ;
LD H, A                                                     ;
CALL MaybeFetchValueFromVariable_00_12AE                    ;second thing is either a variable value or a fixed value
RET                                                         ;

RETURN_00_115B:
RET                                                         ;

ScriptVariableCheckPointers_00_115C:
dw CompareScriptVariables_Equals_00_1168
dw CompareScriptVariables_NotEquals_00_1178
dw CompareScriptVariables_MoreThanOrEquals_00_1181
dw CompareScriptVariables_MoreThan_00_1193
dw CompareScriptVariables_LessThanOrEquals_00_11A4
dw CompareScriptVariables_LessThan_00_11B8

CompareScriptVariables_Equals_00_1168:
LD A, D                                                     ;
CP H                                                        ;
JR NZ, CODE_00_1174                                         ;

LD A, E                                                     ;
CP L                                                        ;
JR NZ, CODE_00_1174                                         ;

LD A, $01                                                   ;
OR A                                                        ;
RET                                                         ;

CODE_00_1174:
LD A, $00                                                   ;
OR A                                                        ;
RET                                                         ;

CompareScriptVariables_NotEquals_00_1178:
LD A, D                                                     ;
CP H                                                        ;
JR NZ, RETURN_00_1180                                       ;

LD A, E                                                     ;
CP L                                                        ;
JR NZ, RETURN_00_1180                                       ;uhh...

RETURN_00_1180:
RET                                                         ;

CompareScriptVariables_MoreThanOrEquals_00_1181:
LD A, D                                                     ;
CP H                                                        ;
JR C, CODE_00_118F                                          ;
JR NZ, RETURN_00_118E                                       ;

LD A, E                                                     ;
CP L                                                        ;
JR C, CODE_00_118F                                          ;

LD A, $01                                                   ;
OR A                                                        ;

RETURN_00_118E:
RET                                                         ;

CODE_00_118F:
LD A, $00                                                   ;
OR A                                                        ;
RET                                                         ;

CompareScriptVariables_MoreThan_00_1193:
LD A, D                                                     ;
CP H                                                        ;
JR C, CODE_00_11A0                                          ;
JR NZ, RETURN_00_119F                                       ;

LD A, E                                                     ;
CP L                                                        ;
JR C, CODE_00_11A0                                          ;
JR Z, CODE_00_11A0                                          ;

RETURN_00_119F:
RET                                                         ;

CODE_00_11A0:
LD A, $00                                                   ;
OR A                                                        ;
RET                                                         ;

CompareScriptVariables_LessThanOrEquals_00_11A4:
LD A, D                                                     ;
CP H                                                        ;
JR C, RETURN_00_11B3                                        ;
JR NZ, CODE_00_11B4                                         ;

LD A, E                                                     ;
CP L                                                        ;
JR C, RETURN_00_11B3                                        ;
JR NZ, CODE_00_11B4                                         ;

LD A, $01                                                   ;
OR A                                                        ;

RETURN_00_11B3:
RET                                                         ;

CODE_00_11B4:
LD A, $00                                                   ;
OR A                                                        ;
RET                                                         ;

CompareScriptVariables_LessThan_00_11B8:
LD A, D                                                     ;
CP H                                                        ;
JR C, RETURN_00_11C2                                        ;
JR NZ, CODE_00_11C3                                         ;

LD A, E                                                     ;
CP L                                                        ;
JR NC, CODE_00_11C3                                         ;

RETURN_00_11C2:
RET                                                         ;

CODE_00_11C3:
LD A, $00                                                   ;
OR A                                                        ;
RET                                                         ;

ExecuteScripting_00_11C7:
LD HL, RETURN_00_11DF                                       ;will perform a return upon... a return.
PUSH HL                                                     ;
LD A, [ScriptExecutionState]                                ;
LD L, A                                                     ;

LD H, $00                                                   ;
ADD HL, HL                                                  ;

LD A, L                                                     ;
ADD A, LOW(ScriptExecutionStatePointers_00_11E0)            ;
LD L, A                                                     ;

LD A, H                                                     ;
ADC A, HIGH(ScriptExecutionStatePointers_00_11E0)           ;
LD H, A                                                     ;

LD A, [HL+]                                                 ;
LD E, A                                                     ;
LD D, [HL]                                                  ;
PUSH DE                                                     ;execute the state
RET                                                         ;

RETURN_00_11DF:
RET                                                         ;

ScriptExecutionStatePointers_00_11E0:
dw ScriptExecutionStateCode_Execute_00_11EC
dw ScriptExecutionStateCode_EndExecution_00_11FC
dw ScriptExecutionStateCode_Sleep_00_11FD
dw ScriptExecutionStateCode_WaitForTextEnd_00_120F
dw ScriptExecutionStateCode_WaitForFade_00_121C
dw ScriptExecutionStateCode_WaitForPlayerChoice_00_1228

ScriptExecutionStateCode_Execute_00_11EC:
CALL ProcessScript_00_124B                                  ;

LD A, [StopExecutingScriptFlag]                             ;
OR A                                                        ;
JR NZ, RETURN_00_11FB                                       ;

LD A, [ContinueProcessingScriptFlag]                        ;
OR A                                                        ;
JR NZ, ScriptExecutionStateCode_Execute_00_11EC             ;keep executing until forced not to

RETURN_00_11FB:
RET                                                         ;

ScriptExecutionStateCode_EndExecution_00_11FC:
RET                                                         ;

;Waits for the 16-bit timer to run out
ScriptExecutionStateCode_Sleep_00_11FD:
LD A, [ScriptSleepTimer+1]                                  ;
OR A                                                        ;
JR NZ, RETURN_00_120E                                       ;

LD A, [ScriptSleepTimer]                                    ;
OR A                                                        ;
JR NZ, RETURN_00_120E                                       ;hope you brought a Game Boy with you, it's gonna take a variable time from 0 to 65535 frames

LD A, ScriptExecutionState_Execute                          ;wake up, continue executing scripting
LD [ScriptExecutionState], A                                ;

RETURN_00_120E:
RET                                                         ;

ScriptExecutionStateCode_WaitForTextEnd_00_120F:
LD A, [TextParsingState]                                    ;wait until text stuff is done
CP TextParsingState_EndParsing                              ;
JR NZ, RETURN_00_121B                                       ;

LD A, ScriptExecutionState_Execute                          ;continue with scripting
LD [ScriptExecutionState], A                                ;

RETURN_00_121B:
RET                                                         ;

ScriptExecutionStateCode_WaitForFade_00_121C:
LD A, [FadeTimer]                                           ;wait until the scene has faded in or out
OR A                                                        ;
JR NZ, RETURN_00_1227                                       ;

LD A, ScriptExecutionState_Execute                          ;continue script shenanigans
LD [ScriptExecutionState], A                                ;

RETURN_00_1227:
RET                                                         ;

ScriptExecutionStateCode_WaitForPlayerChoice_00_1228:
LD A, [ChoiceOptions_PlayerInputEnableFlag]                 ;check if choice is disabled (after picking something)
OR A                                                        ;
JR NZ, RETURN_00_124A                                       ;

LD A, ScriptExecutionState_Execute                          ;picked something, continue executing scripting
LD [ScriptExecutionState], A                                ;

LD A, [ChoiceOptions_CurrentOption]                         ;remember what we chose
LD [DecisionVariable], A                                    ;

CALL AffectRelationshipByPlayerChoice_00_1D50               ;alter relationships with that choice. choices have consequences (sometimes)

XOR A                                                       ;
LD [DecisionVariable+1], A                                  ;make sure the high byte is clear

CALL ClearMessageBox_00_18E2                                ;
CALL ResetTextPrintPosition_00_191A                         ;

XOR A                                                       ;
LD [ChoiceOptions_DefaultOption], A                         ;

RETURN_00_124A:
RET                                                         ;

;execute script commands
ProcessScript_00_124B:
XOR A                                                       ;
LD [ContinueProcessingScriptFlag], A                        ;by default don't continue processing scripting, should be set manually by commands

XOR A                                                       ;
LD [LoadScriptFlag], A                                      ;

XOR A                                                       ;
LD [StopExecutingScriptFlag], A                             ;

LD A, [TextParsingState]                                    ;
CP TextParsingState_EndParsing                              ;
JR NZ, CODE_00_1261                                         ;

XOR A                                                       ;
JR CODE_00_1263                                             ;

CODE_00_1261:
LD A, $01                                                   ;parsing text now

CODE_00_1263:
LD [Scripting_ParsingTextFlag], A                           ;

LD A, [CurrentProgramBank]                                  ;
PUSH AF                                                     ;
LD A, [ScriptBank]                                          ;
CALL SetProgramBank_00_037B                                 ;

LD HL, CODE_00_129A                                         ;go here after doing script stuff
PUSH HL                                                     ;

LD HL, ScriptPointerOffset                                  ;
LD A, [HL+]                                                 ;get 16-bit offset
LD E, A                                                     ;
LD D, [HL]                                                  ;

LD H, D                                                     ;
LD L, E                                                     ;

INC HL                                                      ;
PUSH HL                                                     ;
LD A, [ScriptTablePointer]                                  ;
ADD A, E                                                    ;
LD E, A

LD A, [ScriptTablePointer+1]                                ;
ADC A, D                                                    ;
LD D, A                                                     ;

LD A, [DE]                                                  ;get script command
LD L, A                                                     ;
LD H, $00                                                   ;
ADD HL, HL                                                  ;

LD A, L                                                     ;
ADD A, LOW(ScriptCodeStorage)                               ;
LD L, A                                                     ;

LD A, H                                                     ;
ADC A, HIGH(ScriptCodeStorage)                              ;
LD H, A                                                     ;

LD A, [HL+]                                                 ;get code pointer for that command
LD E, A                                                     ;
LD D, [HL]                                                  ;
PUSH DE                                                     ;execute that command
RET                                                         ;

CODE_00_129A:
LD HL, ScriptPointerOffset                                  ;
LD A, E                                                     ;
LD [HL+], A                                                 ;
LD [HL], D                                                  ;

LD A, [LoadScriptFlag]                                      ;check if we decided to load a new script
OR A                                                        ;
JR Z, CODE_00_12A9                                          ;

CALL GetScriptEntry_00_10A9                                 ;let's go load it

CODE_00_12A9:
POP AF                                                      ;
CALL SetProgramBank_00_037B                                 ;
RET                                                         ;

;if H == $80, will fetch an HL value from a variable offset from ScriptTEMP_D31B.
;L will act as offset for variable (times 2).
;output HL
;otherwise, does nothing.
MaybeFetchValueFromVariable_00_12AE:
LD A, H                                                     ;
CP $80                                                      ;checks if H == $80
JR NZ, RETURN_00_12C1                                       ;if not, treat it as a constant

LD H, $00                                                   ;
ADD HL, HL                                                  ;get the variable (all 16-bit)

LD A, L                                                     ;
ADD A, LOW(ScriptTEMP_D31B)                                 ;
LD L, A                                                     ;

LD A, H                                                     ;
ADC A, HIGH(ScriptTEMP_D31B)                                ;
LD H, A                                                     ;

LD A, [HL+]                                                 ;
LD H, [HL]                                                  ;get HL from RAM address
LD L, A                                                     ;

RETURN_00_12C1:
RET                                                         ;

InitScriptVariables_00_12C2:
XOR A                                                       ;
LD [ScriptSleepTimer], A                                    ;
LD [ScriptSleepTimer+1], A                                  ;

LD A, LOW(POINTERS_05_4000)                                 ;script pointers always start at $4000
LD [ScriptTablePointer], A                                  ;

LD A, HIGH(POINTERS_05_4000)                                ;
LD [ScriptTablePointer+1], A                                ;

LD A, ScriptExecutionState_EndExecution                     ;not executing any scripts
LD [ScriptExecutionState], A                                ;

CALL InitSubscriptStack_00_12DC                             ;
RET                                                         ;

InitSubscriptStack_00_12DC:
LD HL, SubscriptStackPointer                                ;
LD DE, SubscriptStack                                       ;
LD A, E                                                     ;
LD [HL+], A                                                 ;
LD [HL], D                                                  ;

LD BC, 64                                                   ;
CALL SetSubscriptStack_00_1304                              ;
RET                                                         ;

PushToSubscriptStack_00_12EC:
LD HL, SubscriptStackPointer                                ;
LD E, [HL]                                                  ;
INC HL                                                      ;
LD D, [HL]                                                  ;
DEC DE                                                      ;

LD [HL], D                                                  ;
DEC HL                                                      ;
LD [HL], E                                                  ;
LD [DE], A                                                  ;
RET                                                         ;

PullFromSubscriptStack_00_12F8:
LD HL, SubscriptStackPointer                                ;
LD A, [HL+]                                                 ;
LD E, A                                                     ;
LD D, [HL]                                                  ;
LD A, [DE]                                                  ;
INC DE                                                      ;

LD [HL], D                                                  ;
DEC HL                                                      ;
LD [HL], E                                                  ;
RET                                                         ;

SetSubscriptStack_00_1304:
LD HL, SubscriptStackPointer                                ;
LD A, [HL]                                                  ;
ADD A, C                                                    ;
LD [HL+], A                                                 ;

LD A, [HL]                                                  ;
ADC A, B                                                    ;
LD [HL], A                                                  ;
RET                                                         ;

;an unused routine related to stack pointer
UNKNOWN_00_130E:
LD HL, SubscriptStackPointer
LD A, [HL]
SUB C
LD [HL+], A

LD A, [HL]
SBC A, B
LD [HL], A
RET

DialogueChoiceData_TwoOptionPointer_00_1318:
dw DATA_00_131C
dw DATA_00_1322

;first two bytes are where the cursor is located relative to ChoiceOptions_OptionPositionOffset
;the last 4 bytes are reactions to d-pad inputs, which are left, right, up and down, respectively
;if the value matches current choice value, no change will happen (e.g. currently selected option is 0, that means $00 won't change selection)
DATA_00_131C:
db $00,$00
db $00,$00,$01,$01                                          ;pressing either up or down will change to second option

DATA_00_1322:
db $00,$01
db $01,$01,$00,$00                                          ;pressing up or down will change to first option

DialogueChoiceData_ThreeOptionPointer_00_1328:
dw DATA_00_132E
dw DATA_00_1334
dw DATA_00_133A

DATA_00_132E:
db $00,$00
db $00,$00,$02,$01

DATA_00_1334:
db $00,$01
db $01,$01,$00,$02

DATA_00_133A:
db $00,$02
db $02,$02,$01,$00

;maybe play an event
EventHandler_00_1340:
LD A, $01                                                   ;
LD [OAMDMALockCheckFlag], A                                 ;

CALL StoreTimeVariablesForScripts_00_155C                   ;

LD A, [CurrentSave_DaysPassed]                              ;get current day
LD C, A                                                     ;
LD B, $00                                                   ;which cannot be higher than 255

LD HL, EventPerDay_1E_5476                                  ;
ADD HL, BC                                                  ;
LD A, [HL]                                                  ;check what event can happen
LD E, A                                                     ;
LD D, $00                                                   ;

PUSH DE                                                     ;
LD B, $03                                                   ;
LD HL, $0009                                                ;
CALL GetPointerWithSize_00_0AEC                             ;
POP DE                                                      ;

PUSH HL                                                     ;
ADD HL, DE                                                  ;
ADD HL, DE                                                  ;get offset to the table
LD A, [HL+]                                                 ;
LD H, [HL]                                                  ;
LD L, A                                                     ;offset into HL
POP DE                                                      ;
ADD HL, DE                                                  ;add offset to base table of pointers to get a pointer

LD A, L                                                     ;
LD [EventPoolDataPointer], A                                ;store event pool start
LD [EventPoolDataStart], A                                  ;remember it just in case the player decides to call someone while walking outside

LD A, H                                                     ;
LD [EventPoolDataPointer+1], A                              ;
LD [EventPoolDataStart+1], A                                ;

LD A, B                                                     ;bank
LD [EventPoolDataBank], A                                   ;

LD A, $01                                                   ;
LD [CalendarCountdownUninterruptedFlag], A                  ;

EventLoadingLoop_00_137F:
CALL HandleEventPool_00_13F6                                ;

LD HL, ScriptEntryOffset                                    ;
LD A, [HL+]                                                 ;
AND [HL]                                                    ;
INC A                                                       ;
JR Z, CODE_00_13E7                                          ;check if got to the end of the event pool (ScriptEntryOffset == $FFFF)

;Something maybe good maybe bad idk might happen~!
LD A, [CalendarCountdownUninterruptedFlag]                  ;
JR Z, CODE_00_1392                                          ;this is not 6502/65c816, this won't work (LD A does not affect any of the flags, including Zero)

CALL FadeOutLoop_00_0A61                                    ;fade out

CODE_00_1392:
XOR A                                                       ;calendar countdown is actually interrupted now
LD [CalendarCountdownUninterruptedFlag], A                  ;

CALL AffectRelationshipByScriptEntry_00_1D50                ;apply any relationship modifiers that are applicable for current event
CALL LoadFontGraphics_00_1E66                               ;reload font

XOR A                                                       ;standard VN display
CALL DrawInfoBoxForVisualNovelSection_00_1E77               ;

LD A, $01                                                   ;
CALL DrawInfoBoxForVisualNovelSection_00_1E77               ;

CALL DisplayTimeOnStatusBar_00_14DB                         ;
CALL DisplayCashOnTopDisplay_00_153F                        ;

LOOP_00_13AB:
LD B, $03                                                   ;
LD HL, $0002                                                ;
CALL GetPointerWithSize_00_0AEC                             ;

LD A, [ScriptEntryOffset]                                   ;
LD E, A                                                     ;

LD A, [ScriptEntryOffset+1]                                 ;
LD D, A                                                     ;
ADD HL, DE                                                  ;
ADD HL, DE                                                  ;times two
CALL WaitForVBlank_00_0382                                  ;

LD A, [HL+]                                                 ;load music
CP $FF                                                      ;
JR Z, CODE_00_13CA                                          ;or not

PUSH HL                                                     ;
CALL ChangeMusic_00_0B12                                    ;
POP HL                                                      ;

CODE_00_13CA:
LD A, [HL]                                                  ;change background
CP $FF                                                      ;
JR Z, CODE_00_13D5                                          ;or not

LD [BackgroundGraphicsID], A                                ;store background
CALL LoadBackground_00_1B97                                 ;load

CODE_00_13D5:
CALL InitializeOAMForVN_00_0D67                             ;

XOR A                                                       ;
LD [SequenceSkipFlag], A                                    ;most normal events don't need this

CALL LoadAndHandleVNSegment_00_1007                         ;

LD A, [StopExecutingScriptFlag]                             ;
OR A                                                        ;
JR NZ, LOOP_00_13AB                                         ;
JR EventLoadingLoop_00_137F                                 ;

;Not playing an event
CODE_00_13E7:
LD A, [CalendarCountdownUninterruptedFlag]                  ;
OR A                                                        ;
JR NZ, CODE_00_13F0                                         ;

SCF                                                         ;
JR CODE_00_13F1                                             ;

CODE_00_13F0:
AND A                                                       ;

CODE_00_13F1:
XOR A                                                       ;
LD [OAMDMALockCheckFlag], A                                 ;
RET                                                         ;

;Dive into a pool of script entries that may or may not happen on this lovely day
HandleEventPool_00_13F6:
LD A, [EventPoolDataBank]                                   ;
CALL SetProgramBank_00_037B                                 ;

LD A, [EventPoolDataPointer]                                ;
LD L, A                                                     ;

LD A, [EventPoolDataPointer+1]                              ;
LD H, A                                                     ;

XOR A                                                       ;
DEC A                                                       ;LD A, $FF would've sufficed just as well
LD [ScriptEntryOffset], A                                   ;anyway, reset script entry variables
LD [ScriptEntryOffset+1], A                                 ;

LOOP_00_140C:
LD A, [HL+]                                                 ;
LD C, A                                                     ;script entry that might get executed, low byte
LD E, A                                                     ;

LD A, [HL+]                                                 ;script entry that might get executed, high byte
LD B, A                                                     ;
LD D, A                                                     ;

INC DE                                                      ;
LD A, E                                                     ;end if encountered $FFFF
OR D                                                        ;
JP Z, CODE_00_14AC                                          ;end

PUSH BC                                                     ;>becomes DE later
PUSH HL                                                     ;

LD L, C                                                     ;offset event condition data by (script entry)*6
LD H, B                                                     ;
ADD HL, HL                                                  ;

LD A, L                                                     ;
ADD A, C                                                    ;
LD L, A                                                     ;

LD A, H                                                     ;
ADC A, B                                                    ;
LD H, A                                                     ;
ADD HL, HL                                                  ;

LD A, [EventConditionDataPointer]                           ;
ADD A, L                                                    ;
LD L, A                                                     ;

LD A, [EventConditionDataPointer+1]                         ;
ADC A, H                                                    ;
LD H, A                                                     ;get proper pointer to the event condition data

LD A, [EventConditionDataBank]                              ;
CALL SetProgramBank_00_037B                                 ;

LD A, [HL+]                                                 ;bitwise check flag
LD C, A                                                     ;

LD A, [HL+]                                                 ;variable to check
LD E, A

LD A, [HL+]                                                 ;bit to check if applicable
LD B, A                                                     ;

LD D, $00                                                   ;
SLA E                                                       ;
RL D                                                        ;

LD A, E                                                     ;
ADD A, LOW(ScriptTEMP_D31B)                                 ;
LD E, A                                                     ;

LD A, D                                                     ;
ADC A, HIGH(ScriptTEMP_D31B)                                ;
LD D, A                                                     ;

LD A, [DE]                                                  ;variable's value...
LD E, A                                                     ;into E

LD A, C                                                     ;check if we're checking bits or whole value
OR A                                                        ;
JR Z, CODE_00_145B                                          ;if whole value, skip

LD A, B                                                     ;check if the variable check is bitwise. this will determine which bit we need
OR A                                                        ;
JR Z, CODE_00_1457                                          ;if we're checking for bit 0, don't do bit shifting loop

LOOP_00_1452:
SRL E                                                       ;shift right B times to get the bit we need
DEC B                                                       ;
JR NZ, LOOP_00_1452                                         ;

CODE_00_1457:
LD A, E                                                     ;
AND $01                                                     ;reduce to 1 or 0 because that's how bits work
LD E, A                                                     ;

CODE_00_145B:
LD B, $00                                                   ;event is not happening, but you can convince me otherwise

LD A, [HL+]                                                 ;check how we're gonna check if the event happens?
OR A                                                        ;
JR Z, CODE_00_146A                                          ;check if variable is >=
DEC A                                                       ;
JR Z, CODE_00_1472                                          ;check if variable is <=
DEC A                                                       ;
JR Z, CODE_00_1478                                          ;check if variable ==
DEC A                                                       ;
JR Z, CODE_00_147E                                          ;check if variable !=

CODE_00_146A:
LD A, [HL+]                                                 ;compare value
CP E                                                        ;
JR Z, CODE_00_1484                                          ;check if variable is equal
JR C, CODE_00_1484                                          ;or greater (remember: we're comparing table value against variable value, not the other way around)
JR CODE_00_149D                                             ;if checks fail, event is not happening

CODE_00_1472:
LD A, [HL+]                                                 ;
CP E                                                        ;
JR NC, CODE_00_1484                                         ;if variable's value is less or equal
JR CODE_00_149D                                             ;

CODE_00_1478:
LD A, [HL+]                                                 ;
CP E                                                        ;
JR Z, CODE_00_1484                                          ;check if equals
JR CODE_00_149D                                             ;

CODE_00_147E:
LD A, [HL+]                                                 ;
CP E                                                        ;
JR NZ, CODE_00_1484                                         ;check if NOT equals
JR CODE_00_149D                                             ;

;let RNG decide if an event happens
CODE_00_1484:
CALL UpdateRandomNumber_00_0ADB                             ;

LD A, [HL]                                                  ;index for current event's chance of happening
LD HL, EventOccuranceChances                                ;
ADD A, L                                                    ;
LD L, A                                                     ;

LD A, H                                                     ;
ADC A, $00                                                  ;
LD H, A                                                     ;

LD A, [HL]                                                  ;check if non-zero probability
OR A                                                        ;
JR Z, CODE_00_149D                                          ;not happening if the chance is a big fat 0

LD HL, RandomNumber                                         ;
CP [HL]                                                     ;check if there's a chance of the event happening
JR C, CODE_00_149D                                          ;if chance of happening is less than RNG, not happening

LD B, $01                                                   ;Nice argument, but RNG decided the event is happening.

CODE_00_149D:
POP HL                                                      ;
POP DE                                                      ;script to execute

LD A, B                                                     ;check if something is gonna happen
OR A                                                        ;
JP Z, LOOP_00_140C                                          ;keep going

LD A, E                                                     ;a new script will happen
LD [ScriptEntryOffset], A                                   ;

LD A, D                                                     ;
LD [ScriptEntryOffset+1], A                                 ;

CODE_00_14AC:
LD A, L                                                     ;remember where we left off
LD [EventPoolDataPointer], A                                ;

LD A, H                                                     ;
LD [EventPoolDataPointer+1], A                              ;
RET                                                         ;

InitEventVariables_00_14B5:
LD B, $03                                                   ;
LD HL, $0000                                                ;
CALL GetPointerWithSize_00_0AEC                             ;

LD A, L                                                     ;
LD [EventConditionDataPointer], A                           ;remember where the conditional data is

LD A, H                                                     ;
LD [EventConditionDataPointer+1], A                         ;

LD A, B                                                     ;
LD [EventConditionDataBank], A                              ;contains the bank of the table

LD B, $03                                                   ;
LD HL, $0001                                                ;
CALL GetPointerWithSize_00_0AEC                             ;

LD DE, EventOccuranceChances                                ;
LD BC, EventOccuranceChances_03_4E9E.end-EventOccuranceChances_03_4E9E ;DE is not BC, so it has to load that manually.
CALL CopyData2_00_0C7D                                      ;
RET                                                         ;

DisplayTimeOnStatusBar_00_14DB:
LD A, [CurrentSave_Month]                                   ;
INC A                                                       ;
LD [HexToDecInput], A                                       ;

XOR A                                                       ;
LD [HexToDecInput+1], A                                     ;

LD HL, HexToDecInput                                        ;
CALL GetHexToDecDigits_00_3CD5                              ;

LD HL, $9821                                                ;
LD DE, DecimalDigitArray+3                                  ;
LD A, [DE]                                                  ;
CALL DrawOneBGTile_00_0C8C                                  ;draw month number

INC HL                                                      ;
INC DE                                                      ;
LD A, [DE]                                                  ;
CALL DrawOneBGTile_00_0C8C                                  ;still draw month number

INC HL                                                      ;
LD A, CHARVAL("月")                                          ;month symbol
CALL DrawOneBGTile_00_0C8C                                  ;

LD A, [CurrentSave_DayOfTheMonth]                           ;
INC A                                                       ;
LD [HexToDecInput], A                                       ;

XOR A                                                       ;
LD [HexToDecInput+1], A                                     ;

LD HL, HexToDecInput                                        ;
CALL GetHexToDecDigits_00_3CD5                              ;

LD HL, $9824                                                ;
LD DE, DecimalDigitArray+3                                  ;
LD A, [DE]                                                  ;
CALL DrawOneBGTile_00_0C8C                                  ;draw month number

INC HL                                                      ;
INC DE                                                      ;
LD A, [DE]                                                  ;
CALL DrawOneBGTile_00_0C8C                                  ;draw month number part 2

INC HL                                                      ;
LD A, CHARVAL("日")                                         ;
CALL DrawOneBGTile_00_0C8C                                  ;

INC HL                                                      ;
LD A, CHARVAL("(")                                          ;
CALL DrawOneBGTile_00_0C8C                                  ;

INC HL                                                      ;
LD A, [CurrentDayOfTheWeek]                                 ;
ADD A, CHARVAL("月")                                         ;will display a correct week day symbol, starting from monday
CALL DrawOneBGTile_00_0C8C                                  ;

INC HL                                                      ;
LD A, CHARVAL(")")                                          ;
CALL DrawOneBGTile_00_0C8C                                  ;
RET                                                         ;

DisplayCashOnTopDisplay_00_153F:
LD HL, CurrentSave_Cash                                     ;
CALL GetHexToDecDigits_00_3CD5                              ;

LD HL, $982D                                                ;
LD DE, DecimalDigitArray                                    ;
LD C, 5                                                     ;

LOOP_00_154D:
LD A, [DE]                                                  ;
CALL DrawOneBGTile_00_0C8C                                  ;draw a cash digit

INC HL                                                      ;
INC DE                                                      ;
DEC C                                                       ;
JR NZ, LOOP_00_154D                                         ;loop until all are drawn

LD A, CHARVAL("円")                                         ;cash symbol
CALL DrawOneBGTile_00_0C8C                                  ;
RET                                                         ;

;used to store time variables to RAM used for scripts/saving
StoreTimeVariablesForScripts_00_155C:
LD A, [CurrentMonth]                                        ;
LD [CurrentSave_Month], A                                   ;

LD A, [CurrentDayOfTheMonth]                                ;
LD [CurrentSave_DayOfTheMonth], A                           ;

LD A, [CurrentWeekOfTheMonth]                               ;
LD [CurrentSave_WeekOfTheMonth], A                          ;

LD A, [CurrentYearHalf]                                     ;
LD [CurrentSave_YearHalf], A                                ;

LD A, [CurrentSeason]                                       ;
LD [CurrentSave_Season], A                                  ;
RET                                                         ;

;used to draw some information to the top-left, most likely used during development
;input HL - 16-bit address to draw the value of.
;note that the game's font lacks letters C-F, they will use hiragana characters, which is why the value will look odd.
DebugDisplayValue_00_157B:
PUSH HL
PUSH DE
PUSH BC
PUSH AF
PUSH HL
POP BC
LD HL, $9804
LD D, 4                                                     ;draw this many tiles

LOOP_00_1586:
PUSH DE
LD A, C
SRL B
RR C
SRL B
RR C
SRL B
RR C
SRL B
RR C
AND $0F
LD DE, DATA_00_15B1
ADD A, E
LD E, A

LD A, D
ADC A, $00
LD D, A

CheckPPUModes
LD A, [DE]
LD [HL-], A
POP DE
DEC D
LD A, D
OR A
JR NZ, LOOP_00_1586
POP AF
POP BC
POP DE
POP HL
RET

;digit tiles including hex ones, 0 through F
DATA_00_15B1:
db "0123456789ABしていえ" ;C-F are not present in the font, which is why they won't appear correctly

;prints frame counter, and locks game until player presses A. was used as a frame advance debug function of sorts?
PUSH HL
PUSH DE
PUSH BC
PUSH AF
PUSH HL
PUSH DE
PUSH BC
PUSH AF
CALL FadeInLoop_00_0A4B                                     ;fade in
POP AF
POP BC
POP DE
POP HL
LD A, [FrameCounter16Bit]                                   ;will draw current frame counter to the top-left
LD L, A

LD A, [FrameCounter16Bit+1]
LD H, A
CALL DebugDisplayValue_00_157B

LOOP_00_15DB:
CALL WaitForVBlank_00_0382
LD A, [JoypadInputPress]
BitTest JoypadInput_A, A
JR Z, LOOP_00_15DB
POP AF
POP BC
POP DE
POP HL                                                      ;flow into text advance symbol animation. that probably means the debug routine was called earlier to handle both?

HandleTextAdvanceSymbolAnimation_00_15E9:
LD A, [TextAdvance_SymbolEnabledFlag]                       ;
OR A                                                        ;
JR Z, RETURN_00_160F                                        ;

LD A, [TextAdvance_SymbolBlinkingCounter]                   ;
OR A                                                        ;
JR Z, CODE_00_1601                                          ;
CP $08                                                      ;alternate between drawing and not drawing symbol every 8 frames
JR NZ, CODE_00_160B                                         ;

CALL RemoveTextAdvanceSymbol_00_1A86                        ;

LD A, [TextAdvance_SymbolBlinkingCounter]                   ;
JR CODE_00_160B                                             ;

CODE_00_1601:
CALL CalculateTextAdvanceSymbolPositionAndDraw_00_1A50      ;

LD A, $10                                                   ;
LD [TextAdvance_SymbolBlinkingCounter], A                   ;
JR RETURN_00_160F                                           ;

CODE_00_160B:
DEC A                                                       ;
LD [TextAdvance_SymbolBlinkingCounter], A                   ;

RETURN_00_160F:
RET                                                         ;

;handle cursor and button reactions here
HandleDialogueChoice_00_1610:
LD A, [ChoiceOptions_PlayerInputEnableFlag]                 ;
OR A                                                        ;
JP Z, RETURN_00_16A7                                        ;

LD A, [ChoiceOptions_CurrentOption]                         ;
LD C, A                                                     ;

LD A, [JoypadInputPress]                                    ;
BitTest JoypadInput_A, A                                    ;
JR NZ, PressedA_00_167D                                     ;

BitTest JoypadInput_Up, A                                   ;
JR NZ, PressedUp_1D_163C                                    ;

BitTest JoypadInput_Down, A                                 ;
JR NZ, PressedDown_1D_1640                                  ;

BitTest JoypadInput_Left, A                                 ;
JR NZ, PressedLeft_00_1634                                  ;

BitTest JoypadInput_Right, A                                ;
JR NZ, PressedRight_00_1638                                 ;
JR HandleHandCursorBlinking_00_1687                         ;

PressedLeft_00_1634:
LD E, $02
JR CODE_00_1642

PressedRight_00_1638:
LD E, $03
JR CODE_00_1642

PressedUp_1D_163C:
LD E, $04
JR CODE_00_1642

PressedDown_1D_1640:
LD E, $05

CODE_00_1642:
LD A, [ChoiceOptions_CurrentOption]                         ;
LD L, A                                                     ;
LD H, $00                                                   ;
ADD HL, HL                                                  ;double

LD A, [ChoiceOptions_OptionPositionOffset]                  ;
ADD A, L                                                    ;
LD L, A                                                     ;

LD A, [ChoiceOptions_OptionPositionOffset+1]                ;
ADC A, H                                                    ;
LD H, A                                                     ;

LD A, [HL+]                                                 ;
LD H, [HL]                                                  ;
LD L, A                                                     ;

LD A, E                                                     ;
ADD A, L                                                    ;
LD L, A                                                     ;

LD A, H                                                     ;
ADC A, $00                                                  ;
LD H, A                                                     ;

LD A, [HL]                                                  ;
CP C                                                        ;
JR Z, HandleHandCursorBlinking_00_1687                      ;check if cursor can change position

PUSH AF                                                     ;
LD A, $10                                                   ;refresh blinking counter
LD [ChoiceOptions_CursorBlinkingCounter], A                 ;

CALL RemoveHandCursor_00_16DD                               ;remove cursor
POP AF                                                      ;
LD [ChoiceOptions_CurrentOption], A                         ;

CALL CalculateTextChoiceCursorPosition_00_1705              ;new cursor position
CALL DrawHandCursor_00_16D4                                 ;draw at the new location

LD A, SFX_ChangeOption                                      ;
LD A, SFX_ChangeOption                                      ;and here I was thinking I duped the line by accident, but no! someone on the dev team made an oopsie.
LD [SoundQueue], A                                          ;
JR RETURN_00_16A7                                           ;can be replaced with RET

PressedA_00_167D:
LD A, SFX_Confirm                                           ;
LD [SoundQueue], A                                          ;

CALL DisablePlayerChoice_00_16CC                            ;made a choice, remove cursor
JR RETURN_00_16A7                                           ;I think you can figure out an obvious optimization here

HandleHandCursorBlinking_00_1687:
LD A, [ChoiceOptions_CursorBlinkingCounter]                 ;
OR A                                                        ;
JR Z, CODE_00_1699                                          ;
CP $08                                                      ;alternate between showing hand cursor and not every 8 frames
JR NZ, CODE_00_16A3                                         ;

CALL RemoveHandCursor_00_16DD                               ;look ma, no hand

LD A, [ChoiceOptions_CursorBlinkingCounter]                 ;
JR CODE_00_16A3                                             ;

CODE_00_1699:
CALL DrawHandCursor_00_16D4                                 ;

LD A, $10                                                   ;restore counter
LD [ChoiceOptions_CursorBlinkingCounter], A                 ;
JR RETURN_00_16A7                                           ;

CODE_00_16A3:
DEC A                                                       ;tick down
LD [ChoiceOptions_CursorBlinkingCounter], A                 ;

RETURN_00_16A7:
RET                                                         ;

EnableAdvanceSymbol_00_16A8:
CALL CalculateTextAdvanceSymbolPositionAndDraw_00_1A50      ;

LD A, $01                                                   ;
LD [TextAdvance_SymbolEnabledFlag], A                       ;

LD A, $10                                                   ;
LD [TextAdvance_SymbolBlinkingCounter], A                   ;
RET                                                         ;

DisableAdvanceSymbol_00_16B6:
CALL RemoveTextAdvanceSymbol_00_1A86                        ;

XOR A                                                       ;
LD [TextAdvance_SymbolEnabledFlag], A                       ;
RET                                                         ;

EnablePlayerChoice_00_16BE:
CALL DrawHandCursor_00_16D4                                 ;

LD A, $01                                                   ;
LD [ChoiceOptions_PlayerInputEnableFlag], A                 ;

LD A, $10                                                   ;
LD [ChoiceOptions_CursorBlinkingCounter], A                 ;
RET

DisablePlayerChoice_00_16CC:
CALL RemoveHandCursor_00_16DD                               ;

XOR A                                                       ;
LD [ChoiceOptions_PlayerInputEnableFlag], A                 ;
RET                                                         ;

DrawHandCursor_00_16D4:
CALL GetCursorVRAMLoc_00_16E6                               ;

LD A, BGTile_HandCursor                                     ;
CALL DrawOneBGTile_00_0C8C                                  ;
RET                                                         ;

RemoveHandCursor_00_16DD:
CALL GetCursorVRAMLoc_00_16E6                               ;

LD A, CHARVAL(" ")                                          ;
CALL DrawOneBGTile_00_0C8C                                  ;
RET                                                         ;

GetCursorVRAMLoc_00_16E6:
LD A, [ChoiceOptions_ChosenOptionVert]                      ;
LD L, A                                                     ;
LD H, $00                                                   ;
ADD HL, HL                                                  ;
ADD HL, HL                                                  ;
ADD HL, HL                                                  ;
ADD HL, HL                                                  ;
ADD HL, HL                                                  ;offset vertically

LD A, [ChoiceOptions_ChosenOptionHorz]                      ;
ADD A, L                                                    ;
LD L, A                                                     ;

LD A, H                                                     ;
ADC A, $00                                                  ;
LD H, A                                                     ;offset horizontally

LD A, [ChoiceOptions_CursorBaseVRAMLoc]                     ;
ADD A, L                                                    ;
LD L, A                                                     ;

LD A, [ChoiceOptions_CursorBaseVRAMLoc+1]                   ;
ADC A, H                                                    ;
LD H, A                                                     ;
RET                                                         ;

CalculateTextChoiceCursorPosition_00_1705:
LD A, [ChoiceOptions_CurrentOption]                         ;
LD L, A                                                     ;
LD H, $00                                                   ;
ADD HL, HL                                                  ;

LD A, [ChoiceOptions_OptionPositionOffset]                  ;
ADD A, L                                                    ;
LD L, A                                                     ;

LD A, [ChoiceOptions_OptionPositionOffset+1]                ;
ADC A, H                                                    ;
LD H, A                                                     ;

LD A, [HL+]                                                 ;
LD E, A                                                     ;
LD D, [HL]                                                  ;

LD A, [DE]                                                  ;first two bytes are cursor's position for currently selected choice
INC DE                                                      ;
LD [ChoiceOptions_ChosenOptionHorz], A                      ;

LD A, [DE]                                                  ;
LD [ChoiceOptions_ChosenOptionVert], A                      ;
RET                                                         ;

ExecuteTextParsing_00_1723:
LD HL, RETURN_00_173B                                       ;will return after done
PUSH HL                                                     ;
LD A, [TextParsingState]                                    ;
LD L, A                                                     ;

LD H, $00                                                   ;
ADD HL, HL                                                  ;

LD A, L                                                     ;
ADD A, LOW(TextParsingStatePointers_00_173C)                ;
LD L, A                                                     ;

LD A, H                                                     ;
ADC A, HIGH(TextParsingStatePointers_00_173C)               ;
LD H, A                                                     ;

LD A, [HL+]                                                 ;
LD E, A                                                     ;
LD D, [HL]                                                  ;
PUSH DE                                                     ;execute appropriate state
RET                                                         ;

RETURN_00_173B:
RET                                                         ;

TextParsingStatePointers_00_173C:
dw TextParsingStateCode_Parse_00_1744
dw TextParsingStateCode_EndParse_00_1777
dw TextParsingStateCode_WaitForPlayerInput_00_1778
dw TextParsingStateCode_WaitForTimer_00_178C

TextParsingStateCode_Parse_00_1744:
LD A, [TextDrawing_ProcessingAmount]                        ;setup amount of characters/commands to parse at once
LD [TextParsing_CharactersToParseCounter], A                ;

LOOP_00_174A:
CALL ParseText_00_1798                                      ;

LD A, [TextParsingState]                                    ;if the processing state has changed in the meantime (hit some command)
CP TextParsingState_Parse                                   ;
JR NZ, CODE_00_175D                                         ;if so, prematurely exit

LD A, [TextParsing_CharactersToParseCounter]                ;
DEC A                                                       ;
LD [TextParsing_CharactersToParseCounter], A                ;
JR NZ, LOOP_00_174A                                         ;

CODE_00_175D:
XOR A                                                       ;
LD [TextParsing_CharactersToParseCounter], A                ;

LD A, [TextParsingState]                                    ;
CP TextParsingState_EndParsing                              ;
JR Z, RETURN_00_1776                                        ;if text ended, then so be it

LD A, [TextDrawing_ProcessingTiming]                        ;
OR A                                                        ;
JR Z, RETURN_00_1776                                        ;
LD [TextDrawing_Timer], A                                   ;

LD A, TextParsingState_WaitForTimer                         ;
LD [TextParsingState], A                                    ;

RETURN_00_1776:
RET                                                         ;

TextParsingStateCode_EndParse_00_1777:
RET                                                         ;do nothing because not parsing anything

TextParsingStateCode_WaitForPlayerInput_00_1778:
LD A, [AButtonRequest_Press]                                ;check if player pressed A
OR A                                                        ;
JR NZ, RETURN_00_178B                                       ;

LD A, TextParsingState_Parse                                ;continue parsing
LD [TextParsingState], A                                    ;

CALL DisableAdvanceSymbol_00_16B6                           ;

LD A, SFX_Confirm                                           ;advance SFX
LD [SoundQueue], A                                          ;

RETURN_00_178B:
RET                                                         ;

TextParsingStateCode_WaitForTimer_00_178C:
LD A, [TextDrawing_Timer]                                   ;
OR A                                                        ;
JR NZ, RETURN_00_1797                                       ;

LD A, TextParsingState_Parse                                ;
LD [TextParsingState], A                                    ;

RETURN_00_1797:
RET                                                         ;

ParseText_00_1798:
LD HL, TextBufferPointer_Read                               ;
LD A, [HL+]                                                 ;
LD E, A                                                     ;
LD D, [HL]                                                  ;
LD A, [DE]                                                  ;
OR A                                                        ;check if hit command $00 (which would be empty space character for non-VN segments)
JR NZ, CODE_00_17A9                                         ;

LD A, TextParsingState_EndParsing                           ;
LD [TextParsingState], A                                    ;text end
JR RETURN_00_17B2                                           ;can be replaced with RET

CODE_00_17A9:
CALL CheckForTextCommands_00_17B3

LD HL, TextBufferPointer_Read                               ;
LD A, E                                                     ;
LD [HL+], A                                                 ;
LD [HL], D                                                  ;

RETURN_00_17B2:
RET

CheckForTextCommands_00_17B3:
LD A, [DE]                                                  ;
CP $80                                                      ;check for a command ($80-$FE, $FF is used during text decompression)
JR C, CODE_00_17D1                                          ;

LD HL, CODE_00_17CF                                         ;does a JUMP to a return. that's different from just returning.
PUSH HL                                                     ;
SUB $80                                                     ;
LD L, A                                                     ;
LD H, $00                                                   ;
ADD HL, HL                                                  ;times 2...

LD A, L                                                     ;
ADD A, LOW(TextCommandCodePointers_00_17D5)                 ;
LD L, A                                                     ;

LD A, H                                                     ;
ADC A, HIGH(TextCommandCodePointers_00_17D5)                ;
LD H, A                                                     ;

LD A, [HL+]                                                 ;
LD C, A                                                     ;
LD B, [HL]                                                  ;
PUSH BC                                                     ;
RET                                                         ;

CODE_00_17CF:
JR RETURN_00_17D4                                           ;

CODE_00_17D1:
CALL DrawTextCharacter_00_188C                              ;draw text character

RETURN_00_17D4:
RET                                                         ;

TextCommandCodePointers_00_17D5:
dw TextCommand_LineBreak_00_17DF
dw TextCommand_ClearMessage_00_17E4
dw TextCommand_InputWait_00_17EE
dw TextCommand_ChangeMessagePrinting_00_17FD
dw TextCommand_RestoreMessagePrinting_00_1863

;line break command
TextCommand_LineBreak_00_17DF:
CALL GoToNextTextLine_00_190E                               ;line break

INC DE                                                      ;continue
RET                                                         ;

;clears message box
TextCommand_ClearMessage_00_17E4:
PUSH DE                                                     ;
CALL ClearMessageBox_00_18E2                                ;
CALL ResetTextPrintPosition_00_191A                         ;text will start from the beginning
POP DE                                                      ;
INC DE                                                      ;
RET                                                         ;

TextCommand_InputWait_00_17EE:
LD A, $01                                                   ;set button press request
LD [AButtonRequest_Press], A                                ;

LD A, TextParsingState_WaitForPlayerAdvance                 ;
LD [TextParsingState], A                                    ;wait for said button press
CALL EnableAdvanceSymbol_00_16A8                            ;

INC DE                                                      ;
RET                                                         ;

;An unused text command that would change the way messages are printed. It appears the command was dummied out, as functionally it doesn't do anything if used without modification (aside from skipping 4 bytes).
TextCommand_ChangeMessagePrinting_00_17FD:
LD A, [TextDrawing_VRAMColumn]                              ;
LD [TextDrawing_CurrentVRAMColumn], A                       ;pretty sure that won't do anything.

LD A, [TextDrawing_VRAMRow]                                 ;
LD [TextDrawing_CurrentVRAMRow], A                          ;

LD A, [TextDrawing_CharactersPerLine]                       ;
LD [TextDrawing_CurrentCharactersPerLine], A                ;

LD A, [TextDrawing_LineMaximum]                             ;
LD [TextDrawing_CurrentLineMaximum], A                      ;
INC DE                                                      ;
INC DE                                                      ;
INC DE                                                      ;
INC DE                                                      ;
INC DE                                                      ;
JR RETURN_00_1862                                           ;doesn't actually do anything aside from skipping 4 bytes
  
;it looks like the command was stubbed, the actual code appears to be skipped over
;maybe it was dummied in favor of the script command? it also appears to be a little broken. would've been used to "shrink" message box printing dimensions
XOR A                                                       ;
LD [TextDrawing_CurrentCharacterInLine], A                  ;
LD [TextDrawing_CurrentLine], A                             ;

PUSH DE                                                     ;
CALL ClearMessageBox_00_18E2                                ;clears message
CALL ResetTextPrintPosition_00_191A                         ;we're off to a great start, as we already did reset text print position earlier
POP DE                                                      ;

INC DE                                                      ;
LD A, [DE]                                                  ;
INC DE                                                      ;
LD B, A                                                     ;
LD A, [TextDrawing_VRAMColumn]                              ;adds to column
ADD A, B                                                    ;
LD [TextDrawing_VRAMColumn], A                              ;

LD A, [TextDrawing_CharactersPerLine]                       ;amount of characters on a line shrinks if we move the column (decreases message size proportionally on both sides)
SUB B                                                       ;
LD [TextDrawing_CharactersPerLine], A                       ;

LD A, [DE]                                                  ;
INC DE                                                      ;
LD B, A                                                     ;
LD A, [TextDrawing_VRAMRow]                                 ;
ADD A, B                                                    ;
LD [TextDrawing_VRAMRow], A                                 ;

LD A, [TextDrawing_LineMaximum]                             ;line max shrinks on both sides as well
SUB B                                                       ;
LD [TextDrawing_LineMaximum], A                             ;

LD A, [DE]                                                  ;
INC DE                                                      ;
LD A, [TextDrawing_CharactersPerLine]                       ;the third argument is overwritten, making it useless
SUB B                                                       ;note B is now amount of rows the message shrink by, which also affects length...
LD [TextDrawing_CharactersPerLine], A                       ;
LD B, A                                                     ;B will be overwritten after. this is likely a misplaced instruction and supposed to be used earlier (after INC DE just above).

LD A, [DE]                                                  ;
INC DE                                                      ;
LD B, A                                                     ;
LD A, [TextDrawing_LineMaximum]                             ;
SUB B                                                       ;then line shrink on its own, without row adjustments
LD [TextDrawing_LineMaximum], A                             ;

RETURN_00_1862:
RET                                                         ;

;unused text command. restore message printing properties that would've been messed with with above command, but as it is, it's useless.
TextCommand_RestoreMessagePrinting_00_1863:
LD A, [TextDrawing_CurrentVRAMColumn]                       ;
LD [TextDrawing_VRAMColumn], A                              ;

LD A, [TextDrawing_CurrentVRAMRow]                          ;
LD [TextDrawing_VRAMRow], A                                 ;

LD A, [TextDrawing_CurrentCharactersPerLine]                ;
LD [TextDrawing_CharactersPerLine], A                       ;

LD A, [TextDrawing_CurrentLineMaximum]                      ;
LD [TextDrawing_LineMaximum], A                             ;

XOR A                                                       ;
LD [TextDrawing_CurrentCharacterInLine], A                  ;
LD [TextDrawing_CurrentLine], A                             ;

PUSH DE                                                     ;
CALL ClearMessageBox_00_18E2                                ;
CALL ResetTextPrintPosition_00_191A                         ;again, we already did reset text position...
POP DE                                                      ;
INC DE                                                      ;
RET                                                         ;

DrawTextCharacter_00_188C:
PUSH DE                                                     ;
CALL HandleTextParsingSafeguards_00_18C4                    ;
POP DE                                                      ;

LD A, [TextDrawing_CurrentCharacterInLine]                  ;
LD C, A                                                     ;

LD A, [TextDrawing_CurrentLine]                             ;
LD B, A                                                     ;

LD A, [TextDrawing_VRAMRow]                                 ;
ADD A, B                                                    ;
LD L, A                                                     ;
LD H, $00                                                   ;
ADD HL, HL                                                  ;
ADD HL, HL                                                  ;
ADD HL, HL                                                  ;
ADD HL, HL                                                  ;
ADD HL, HL                                                  ;where to draw character vertically

LD A, [TextDrawing_VRAMColumn]                              ;
ADD A, C                                                    ;
ADD A, L                                                    ;where to draw horizontally
LD L, A

LD A, H                                                     ;
ADC A, $00                                                  ;
LD H, A                                                     ;

LD A, L                                                     ;
ADD A, LOW($9800)                                           ;
LD L, A                                                     ;

LD A, H                                                     ;
ADC A, HIGH($9800)                                          ;
LD H, A                                                     ;final VRAM position

LD A, [DE]                                                  ;
CALL DrawOneBGTile_00_0C8C                                  ;draw the tile
INC DE                                                      ;next character or command

LD A, [TextDrawing_CurrentCharacterInLine]                  ;
INC A                                                       ;next character on the same line
LD [TextDrawing_CurrentCharacterInLine], A                  ;
RET                                                         ;

;What is a good message system that doesn't handle text errors?
;This code handles wrapping around if went over character limit on a single line and automatically refreshing message box if went over line limit.
;Obviously you don't want to have these errors in the first place, but at least line break can be used strategically.
HandleTextParsingSafeguards_00_18C4:
LD A, [TextDrawing_CharactersPerLine]                       ;
LD B, A                                                     ;
LD A, [TextDrawing_CurrentCharacterInLine]                  ;automatic line break if going above character limit on a single line
CP B                                                        ;
JR C, CODE_00_18D1                                          ;

CALL GoToNextTextLine_00_190E                               ;line break

CODE_00_18D1:
LD A, [TextDrawing_LineMaximum]                             ;
LD B, A                                                     ;
LD A, [TextDrawing_CurrentLine]                             ;check if we accidently went above the line limit
CP B                                                        ;
JR C, RETURN_00_18E1                                        ;

CALL ClearMessageBox_00_18E2                                ;automatically clears the message and starts printing from the blank slate
CALL ResetTextPrintPosition_00_191A                         ;

RETURN_00_18E1:
RET                                                         ;

ClearMessageBox_00_18E2:
LD A, [TextDrawing_VRAMColumn]                              ;
CALL PushToDrawingStack_00_0B5E                             ;

LD A, [TextDrawing_VRAMRow]                                 ;
CALL PushToDrawingStack_00_0B5E                             ;

LD A, [TextDrawing_CharactersPerLine]                       ;
CALL PushToDrawingStack_00_0B5E                             ;

LD A, [TextDrawing_LineMaximum]                             ;
CALL PushToDrawingStack_00_0B5E                             ;

XOR A                                                       ;
CALL PushToDrawingStack_00_0B5E                             ;

LD A, CHARVAL(" ")                                          ;fill with space
CALL PushToDrawingStack_00_0B5E                             ;
CALL FillLinesOfTiles_00_0E5E                               ;

LD B, $00                                                   ;
LD C, $06                                                   ;
CALL ResetDrawingStack_00_0B78                              ;
RET                                                         ;

GoToNextTextLine_00_190E:
XOR A                                                       ;start from the beginning
LD [TextDrawing_CurrentCharacterInLine], A                  ;

LD A, [TextDrawing_CurrentLine]                             ;next line
INC A                                                       ;
LD [TextDrawing_CurrentLine], A                             ;
RET                                                         ;

ResetTextPrintPosition_00_191A:
XOR A                                                       ;
LD [TextDrawing_CurrentCharacterInLine], A                  ;
LD [TextDrawing_CurrentLine], A                             ;
RET                                                         ;

;Argument 1 - Text printing position within message box, column
;Argument 2 - Text printing position within message box, row
;Argument 2 - Amount of character per row
;Argument 2 - Amount of character lines (rows)
StoreTextDrawingProperties_00_1922:
PUSH HL                                                     ;
PUSH DE                                                     ;
LD HL, DrawingStackPointer                                  ;
LD A, [HL+]                                                 ;
ADD A, $03                                                  ;
LD E, A                                                     ;

LD A, [HL]                                                  ;
ADC A, $00                                                  ;
LD D, A                                                     ;

LD A, [DE]                                                  ;get first argument
POP DE                                                      ;
POP HL                                                      ;
LD [TextDrawing_VRAMColumn], A                              ;store VRAM column
LD [TextDrawing_CurrentVRAMColumn], A                       ;

PUSH HL                                                     ;
PUSH DE                                                     ;
LD HL, DrawingStackPointer                                  ;
LD A, [HL+]                                                 ;
ADD A, $02                                                  ;
LD E, A                                                     ;

LD A, [HL]                                                  ;
ADC A, $00                                                  ;
LD D, A                                                     ;

LD A, [DE]                                                  ;second argument
POP DE                                                      ;
POP HL                                                      ;
LD [TextDrawing_VRAMRow], A                                 ;VRAM row
LD [TextDrawing_CurrentVRAMRow], A                          ;

PUSH HL                                                     ;
PUSH DE                                                     ;
LD HL, DrawingStackPointer                                  ;
LD A, [HL+]                                                 ;
ADD A, $01                                                  ;
LD E, A                                                     ;

LD A, [HL]                                                  ;
ADC A, $00                                                  ;
LD D, A                                                     ;

LD A, [DE]                                                  ;third argument
POP DE                                                      ;
POP HL                                                      ;
LD [TextDrawing_CharactersPerLine], A                       ;maximum amount of characters on a single line
LD [TextDrawing_CurrentCharactersPerLine], A                ;

PUSH HL                                                     ;
PUSH DE                                                     ;
LD HL, DrawingStackPointer                                  ;
LD A, [HL+]                                                 ;
LD E, A                                                     ;
LD D, [HL]                                                  ;

LD A, [DE]                                                  ;fourth argument
POP DE                                                      ;
POP HL                                                      ;
LD [TextDrawing_LineMaximum], A                             ;maximum amount of lines per-message
LD [TextDrawing_CurrentLineMaximum], A                      ;

XOR A                                                       ;
LD [TextDrawing_CurrentCharacterInLine], A                  ;
LD [TextDrawing_CurrentLine], A                             ;
RET                                                         ;

InitializeTextBufferPointers_00_197D:
LD A, LOW(TextBufferStorage)                                ;
LD [TextBufferPointer_Read], A                              ;
LD [TextBufferPointer_Write], A                             ;

LD A, HIGH(TextBufferStorage)                               ;
LD [TextBufferPointer_Read+1], A                            ;
LD [TextBufferPointer_Write+1], A                           ;
RET                                                         ;

;This loads the text entry and stores it into RAM to read from
;input:
;E - TextBanks offset (which bank to take text entry from?)
;HL - text ID
ProcessTextEntry_00_198E:
LD D, $00                                                   ;
LD A, E                                                     ;
ADD A, LOW(TextBanks)                                       ;
LD E, A                                                     ;

LD A, D                                                     ;
ADC A, HIGH(TextBanks)                                      ;
LD D, A                                                     ;

LD A, [DE]                                                  ;
CALL SetProgramBank_00_037B                                 ;
ADD HL, HL                                                  ;

LD A, [TextDataPointer]                                     ;
ADD A, L                                                    ;
LD L, A                                                     ;

LD A, [TextDataPointer+1]                                   ;
ADC A, H                                                    ;
LD H, A                                                     ;

LD A, [HL+]                                                 ;
LD E, A                                                     ;
LD D, [HL]                                                  ;

LD A, [TextDataPointer]                                     ;
ADD A, E                                                    ;
LD E, A                                                     ;

LD A, [TextDataPointer+1]                                   ;
ADC A, D                                                    ;
LD D, A                                                     ;

CALL StoreTextDataToRAM_00_19B8                             ;
RET                                                         ;

StoreTextDataToRAM_00_19B8:
LD A, [TextBufferPointer_Write]                             ;
LD L, A                                                     ;

LD A, [TextBufferPointer_Write+1]                           ;
LD H, A                                                     ;

LOOP_00_19C0:
LD A, [DE]                                                  ;
INC DE                                                      ;
CP $F0                                                      ;data byte less than $F0...
JR C, CODE_00_19D4                                          ;treated as normal character (or text command)
CP TextCommand_GetPlayerName                                ;
JR NZ, CODE_00_19CF                                         ;treated as dictionary command

CALL GetPlayerNameString_00_1A23                            ;otherwise it's a player name string
JR LOOP_00_19C0                                             ;

CODE_00_19CF:
CALL GetDictionaryEntry_00_19E2                             ;get dictionary entry and decompress it into RAM
JR LOOP_00_19C0                                             ;

CODE_00_19D4:
LD [HL+], A                                                 ;store as-is
OR A                                                        ;loop until we encounter a command $00, stop command
JR NZ, LOOP_00_19C0                                         ;

DEC HL                                                      ;
LD A, L                                                     ;update pointer
LD [TextBufferPointer_Write], A                             ;

LD A, H                                                     ;
LD [TextBufferPointer_Write+1], A                           ;
RET                                                         ;

;Get dictionary entry's contents into RAM
GetDictionaryEntry_00_19E2:
LD A, [DE]                                                  ;the next byte after the command
INC DE                                                      ;
PUSH DE                                                     ;
LD C, A                                                     ;store dictionary entry value

LD A, [CurrentProgramBank]                                  ;
PUSH AF                                                     ;
LD A, [DictionaryBank]                                      ;
CALL SetProgramBank_00_037B                                 ;load the program bank where dictionary is stored
PUSH HL                                                     ;
LD L, C                                                     ;
LD H, $00                                                   ;
ADD HL, HL                                                  ;table offset

LD A, [DictionaryTablePointer]                              ;
ADD A, L                                                    ;
LD L, A                                                     ;

LD A, [DictionaryTablePointer+1]                            ;
ADC A, H                                                    ;
LD H, A                                                     ;

LD A, [HL+]                                                 ;
LD E, A                                                     ;
LD D, [HL]                                                  ;

LD A, [DictionaryTablePointer]                              ;
ADD A, E                                                    ;
LD E, A                                                     ;

LD A, [DictionaryTablePointer+1]                            ;
ADC A, D                                                    ;
LD D, A                                                     ;
POP HL                                                      ;

LOOP_00_1A0D:
LD A, [DE]                                                  ;
OR A                                                        ;
JR Z, CODE_00_1A15                                          ;check if hit the end of the dictionary entry

INC DE                                                      ;
LD [HL+], A                                                 ;store one text character of the dictionary entry
JR LOOP_00_1A0D                                             ;keep doing it until dictionary entry ends

CODE_00_1A15:
LD A, L                                                     ;
LD [TextBufferPointer_Write], A                             ;

LD A, H                                                     ;
LD [TextBufferPointer_Write+1], A                           ;

POP AF                                                      ;
CALL SetProgramBank_00_037B                                 ;
POP DE                                                      ;
RET                                                         ;

;Get player string infomation (name, second name, nickname)
;the command is followed by information byte.
;$00 - second name
;$01 - first name
;$02 - nickname
;In the text files themselves, the commands are [2ndName], [Name] and [NickName], which fetch the respective player name
GetPlayerNameString_00_1A23:
LD A, [DE]                                                  ;get player info type
INC DE                                                      ;
PUSH DE                                                     ;
LD C, A                                                     ;
LD E, C                                                     ;
LD D, $00                                                   ;
SLA E                                                       ;
RL D                                                        ;
SLA E                                                       ;
RL D                                                        ;
SLA E                                                       ;
RL D                                                        ;times 8, because the names are stored as 8 bytes long

LD A, E                                                     ;
ADD A, LOW(CurrentSave_PlayerSecondName)                    ;
LD E, A                                                     ;

LD A, D                                                     ;
ADC A, HIGH(CurrentSave_PlayerSecondName)                   ;
LD D, A                                                     ;

LOOP_00_1A3E:
LD A, [DE]                                                  ;
OR A                                                        ;keep getting player's name etc. until hitting $00 (empty space or end of player's information)
JR Z, CODE_00_1A46                                          ;

INC DE                                                      ;
LD [HL+], A                                                 ;will draw player's particular name
JR LOOP_00_1A3E                                             ;

CODE_00_1A46:
LD A, L                                                     ;
LD [TextBufferPointer_Write], A                             ;

LD A, H                                                     ;
LD [TextBufferPointer_Write+1], A                           ;
POP DE                                                      ;
RET                                                         ;

CalculateTextAdvanceSymbolPositionAndDraw_00_1A50:
LD A, [TextDrawing_CharactersPerLine]                       ;
DEC A                                                       ;
LD C, A                                                     ;

LD A, [TextDrawing_LineMaximum]                             ;
DEC A                                                       ;
LD B, A                                                     ;

LD A, [TextDrawing_VRAMRow]                                 ;
ADD A, B                                                    ;
LD L, A                                                     ;

LD H, $00                                                   ;
ADD HL, HL                                                  ;
ADD HL, HL                                                  ;
ADD HL, HL                                                  ;
ADD HL, HL                                                  ;
ADD HL, HL                                                  ;

LD A, [TextDrawing_VRAMColumn]                              ;
ADD A, C                                                    ;
ADD A, L                                                    ;
LD L, A                                                     ;
LD A, H                                                     ;
ADC A, $00                                                  ;
LD H, A                                                     ;

LD A, L                                                     ;
ADD A, LOW($9800)                                           ;
LD L, A                                                     ;

LD A, H                                                     ;
ADC A, HIGH($9800)                                          ;
LD H, A                                                     ;

LD A, L                                                     ;
LD [TextAdvance_SymbolVRAMLoc], A                           ;

LD A, H                                                     ;
LD [TextAdvance_SymbolVRAMLoc+1], A                         ;store where the tile is

LD A, BGTile_DownArrow                                      ;
CALL DrawOneBGTile_00_0C8C                                  ;draw it
RET                                                         ;

RemoveTextAdvanceSymbol_00_1A86:
LD A, [TextAdvance_SymbolVRAMLoc]                           ;do you remember where the tile was drawn at?
LD L, A                                                     ;

LD A, [TextAdvance_SymbolVRAMLoc+1]                         ;
LD H, A                                                     ;

LD A, CHARVAL(" ")                                          ;remove it
CALL DrawOneBGTile_00_0C8C                                  ;
RET                                                         ;

;loads text data pointer/banks and dictionary pointer/bank into RAM
InitializeTextVariables_00_1A94:
LD B, $02                                                   ;
LD HL, $0004                                                ;
CALL GetPointerWithSize_00_0AEC                             ;

LD DE, TextBanks                                            ;
LD BC, $000A                                                ;7 text banks + 3 unrelated values (that are actually a part of script pointers)
CALL CopyData2_00_0C7D                                      ;

LD B, $02                                                   ;
LD HL, $0006                                                ;
CALL GetPointerWithSize_00_0AEC                             ;

LD A, L                                                     ;
LD [DictionaryTablePointer], A                              ;

LD A, H                                                     ;
LD [DictionaryTablePointer+1], A                            ;store where dictionary's at

LD A, B                                                     ;store same data bank 
LD [DictionaryBank], A

LD A, LOW(POINTERS_04_4000)                                 ;
LD [TextDataPointer], A                                     ;store where text data pointers should be in each bank

LD A, HIGH(POINTERS_04_4000)                                ;
LD [TextDataPointer+1], A                                   ;

CALL InitTextProcessingVariables_00_1AC7                    ;
RET                                                         ;

;init other text-related variables
InitTextProcessingVariables_00_1AC7:
LD A, LOW(TextBufferStorage)                                ;
LD [TextBufferPointer_Write], A                             ;

LD A, HIGH(TextBufferStorage)                               ;
LD [TextBufferPointer_Write+1], A                           ;

LD A, $01                                                   ;process one character/command at a time. no more, no less.
LD [TextDrawing_ProcessingAmount], A                        ;

XOR A                                                       ;
LD [TextDrawing_ProcessingAmount+1], A                      ;

LD A, TextParsingState_EndParsing                           ;currently not parsing
LD [TextParsingState], A                                    ;
LD [Scripting_ParsingTextFlag], A                           ;but the flag is on by default

XOR A                                                       ;
LD [Scripting_ParsingTextFlag+1], A                         ;

XOR A                                                       ;
LD [TextAdvance_SymbolEnabledFlag], A                       ;
LD [ChoiceOptions_PlayerInputEnableFlag], A                 ;

XOR A                                                       ;
LD [TextDrawing_ProcessingTiming], A                        ;the devs decided not to make text parsing slow by default. good.
LD [TextDrawing_ProcessingTiming+1], A                      ;
RET                                                         ;

InitPlayerNameVariables_00_1AF5:
LD HL, CurrentSave_PlayerSecondName                         ;start from second name
LD B, $03                                                   ;3 types of name

LOOP_00_1AFA:
XOR A                                                       ;only clears the first byte, good enough.
LD [HL], A                                                  ;

LD A, L                                                     ;
ADD A, $08                                                  ;every name variable is 8 bytes long even if not all of these bytes are used
LD L, A                                                     ;go to next name thing

LD A, H                                                     ;
ADC A, $00                                                  ;
LD H, A                                                     ;

DEC B                                                       ;keep going through names
JR NZ, LOOP_00_1AFA                                         ;
RET                                                         ;

LoadCharacterGraphicsBank_Profile_00_1B08:
LD A, [CurrentCharacter]                                    ;
LD E, A                                                     ;dunno why we gotta back this up

LD A, [CurrentCharacter_Appearance]                         ;back up appearance for some reason
LD D, A                                                     ;
PUSH DE                                                     ;
LD A, L                                                     ;chosen character will be the displayed character
LD [CurrentCharacter], A                                    ;

LD A, H                                                     ;
LD [CurrentCharacter_Appearance], A                         ;
CALL LoadCharacterGraphicsBank_00_1CAB                      ;
POP DE                                                      ;
LD A, E                                                     ;
LD [CurrentCharacter], A                                    ;restore it because we can

LD A, D                                                     ;
LD [CurrentCharacter_Appearance], A                         ;removing these lines doesn't seem to affect anything. just so you know. so it really doesn't seem very important.
RET                                                         ;

LoadStartGameScript_00_1B26:
LD A, $01                                                   ;
LD [OAMDMALockCheckFlag], A                                 ;

CALL LoadFontGraphics_00_1E66                               ;

LD A, $02                                                   ;set text drawing without message box
CALL DrawInfoBoxForVisualNovelSection_00_1E77               ;

StoreWord $0255, ScriptEntryOffset                          ;load initial script when booting the game

CALL ResetCurrentSpriteSlot_00_0E2F                         ;
CALL RemoveRemainingSpriteSlots_00_0E34                     ;

LD A, $01                                                   ;
LD [UNKNOWN_C168], A                                        ;

XOR A                                                       ;
LD [SequenceSkipFlag], A                                    ;

CALL LoadAndHandleVNSegment_00_1007                         ;execute the starting script without fancy stuff like background and etc.

XOR A                                                       ;
LD [OAMDMALockCheckFlag], A                                 ;
RET                                                         ;done, go to title screen now

HandleCharacterDisplay_00_1B54:
LD A, [CharacterDisplay_DisplayOnFlag]                      ;is there a character to display?
OR A                                                        ;
JR Z, RETURN_00_1B96                                        ;if not, well then, moving on.

LD A, [CharacterDisplay_BaseX]                              ;start throwing some of this stuff into drawing stack for display
CALL PushToDrawingStack_00_0B5E                             ;

LD A, [CharacterDisplay_BaseY]                              ;
CALL PushToDrawingStack_00_0B5E                             ;

LD A, [CharacterDisplay_BaseProp]                           ;
CALL PushToDrawingStack_00_0B5E                             ;

LD A, [CharacterDisplay_DataPointer]                        ;
LD L, A                                                     ;

LD A, [CharacterDisplay_DataPointer+1]                      ;
LD H, A                                                     ;

LD A, [CharacterDisplay_DataBank]                           ;
LD B, A                                                     ;

LD A, [CurrentCharacter_Expression]                         ;
LD C, A                                                     ;

LD A, B                                                     ;
CALL SetProgramBank_00_037B                                 ;
CALL GetExpressionDisplayDataOffset_00_0D57                 ;

LD B, L                                                     ;
LD A, H                                                     ;data pointer into stack, high byte
CALL PushToDrawingStack_00_0B5E                             ;

LD A, B                                                     ;low byte
CALL PushToDrawingStack_00_0B5E                             ;

CALL DisplayCharacter_00_0D7C                               ;

LD B, $00                                                   ;
LD C, $05                                                   ;
CALL ResetDrawingStack_00_0B78                              ;done drawing, restore drawing stack

RETURN_00_1B96:
RET                                                         ;

LoadBackground_00_1B97:
LD B, $02                                                   ;
LD HL, $0000                                                ;
CALL GetPointerWithSize_00_0AEC                             ;

LD A, [BackgroundGraphicsID]                                ;
LD E, A                                                     ;
LD D, $00                                                   ;
SLA E                                                       ;
RL D                                                        ;
SLA E                                                       ;
RL D                                                        ;times 4
ADD HL, DE                                                  ;
LD A, [HL+]                                                 ;bank where background data resides
LD B, A                                                     ;

LD A, [HL+]                                                 ;
PUSH HL                                                     ;
LD L, A                                                     ;data pointer
LD H, $00                                                   ;
CALL GetPointerWithSize_00_0AEC                             ;

LD A, B                                                     ;
LD [BackgroundGraphicsBank], A                              ;background's bank

LD A, L                                                     ;preserve where we left off reading background data from
LD [BackgroundGraphicsPointer], A                           ;

LD A, H                                                     ;
LD [BackgroundGraphicsPointer+1], A                         ;

LD A, E                                                     ;
LD [BackgroundGraphicsSize], A                              ;

LD A, D                                                     ;
LD [BackgroundGraphicsSize+1], A                            ;
POP HL                                                      ;
LD A, $02                                                   ;
CALL SetProgramBank_00_037B                                 ;

LD A, [HL+]                                                 ;then bank again, this time for the background's tilemap
LD B, A

LD L, [HL]                                                  ;data offset for the tilemap
LD H, $00                                                   ;
CALL GetPointerWithSize_00_0AEC                             ;
LD A, B                                                     ;
LD [BackgroundTilemapBank], A                               ;

LD A, L                                                     ;
LD [BackgroundTilemapPointer], A                            ;

LD A, H                                                     ;
LD [BackgroundTilemapPointer+1], A                          ;

CALL DrawBackground_00_1C3D                                 ;start putting funny tiles together to form an image what we call "background"
RET                                                         ;

;load a background from a different set of pointers. used for intro.
LoadBackgroundAlt_00_1BEA:
LD B, $02                                                   ;
LD HL, $0001                                                ;
CALL GetPointerWithSize_00_0AEC                             ;

LD A, [BackgroundGraphicsID]                                ;
LD E, A                                                     ;
LD D, $00                                                   ;
SLA E                                                       ;
RL D                                                        ;
SLA E                                                       ;
RL D                                                        ;
ADD HL, DE                                                  ;
LD A, [HL+]                                                 ;
LD B, A                                                     ;background's bank

LD A, [HL+]                                                 ;background's data pointer
PUSH HL                                                     ;
LD L, A                                                     ;
LD H, $00                                                   ;
CALL GetPointerWithSize_00_0AEC                             ;

LD A, B                                                     ;
LD [BackgroundGraphicsBank], A                              ;

LD A, L                                                     ;
LD [BackgroundGraphicsPointer], A                           ;

LD A, H                                                     ;
LD [BackgroundGraphicsPointer+1], A                         ;

LD A, E                                                     ;
LD [BackgroundGraphicsSize], A                              ;

LD A, D                                                     ;
LD [BackgroundGraphicsSize+1], A                            ;
POP HL                                                      ;
LD A, $02                                                   ;
CALL SetProgramBank_00_037B                                 ;

LD A, [HL+]                                                 ;tilemap bank
LD B, A                                                     ;
LD L, [HL]                                                  ;tilemap pointer
LD H, $00                                                   ;
CALL GetPointerWithSize_00_0AEC                             ;

LD A, B                                                     ;
LD [BackgroundTilemapBank], A                               ;

LD A, L                                                     ;
LD [BackgroundTilemapPointer], A                            ;

LD A, H                                                     ;
LD [BackgroundTilemapPointer+1], A                          ;

CALL DrawBackground_00_1C3D                                 ;start putting background together to form an image of what we call "funny tiles"
RET                                                         ;

;loads graphics and draws the background
DrawBackground_00_1C3D:
LD A, [BackgroundGraphicsBank]                              ;
CALL SetProgramBank_00_037B                                 ;

LD A, [BackgroundGraphicsPointer]                           ;
LD L, A                                                     ;

LD A, [BackgroundGraphicsPointer+1]                         ;
LD H, A                                                     ;

LD DE, $8A00                                                ;where graphics are stored in VRAM

LD A, [BackgroundGraphicsSize]                              ;
LD C, A                                                     ;

LD A, [BackgroundGraphicsSize+1]                            ;
LD B, A                                                     ;
CALL TransferData_00_2FA1                                   ;copy them graphics over

LD A, [BackgroundTilemapBank]                               ;
CALL SetProgramBank_00_037B                                 ;

LD A, [BackgroundTilemapPointer]                            ;
LD C, A                                                     ;

LD A, [BackgroundTilemapPointer+1]                          ;
LD B, A                                                     ;

LD A, $00                                                   ;which tile to start from horizontally
CALL PushToDrawingStack_00_0B5E                             ;

LD A, $03                                                   ;which vertical line to start from
CALL PushToDrawingStack_00_0B5E

LD A, 20                                                    ;how many tiles on a single row
CALL PushToDrawingStack_00_0B5E

LD A, 8                                                     ;amount of rows
CALL PushToDrawingStack_00_0B5E

LD A, B                                                     ;background tilemap data data
CALL PushToDrawingStack_00_0B5E

LD A, C                                                     ;background tilemap data data still
CALL PushToDrawingStack_00_0B5E                             ;
CALL FillLinesOfTiles_00_0E5E                               ;

LD B, $00                                                   ;
LD C, $06                                                   ;
CALL ResetDrawingStack_00_0B78                              ;
RET                                                         ;

;transforms character "display" into "appearance"
GetCharacterAppearance_00_1C8E:
LD B, $02                                                   ;
LD HL, $0002                                                ;
CALL GetPointerWithSize_00_0AEC                             ;

LD A, [CurrentCharacter_Display]                            ;
SLA A                                                       ;
LD B, A                                                     ;

LD A, [CurrentYearHalf]                                     ;appearance will be determined by current half of the year.
ADD A, B                                                    ;due to how the table is laid out by default, only casual transforms into warm clothing in the second half.
ADD A, L                                                    ;
LD L, A                                                     ;

LD A, H                                                     ;
ADC A, $00                                                  ;
LD H, A                                                     ;

LD A, [HL]                                                  ;
LD [CurrentCharacter_Appearance], A                         ;resulting appearance.
RET                                                         ;

;set the bank for character's graphics to load
LoadCharacterGraphicsBank_00_1CAB:
LD B, $02                                                   ;
LD HL, $0003                                                ;
CALL GetPointerWithSize_00_0AEC                             ;

LD A, [CurrentCharacter]                                    ;
SLA A                                                       ;
LD E, L                                                     ;
LD D, H                                                     ;
ADD A, E                                                    ;
LD E, A                                                     ;

LD A, D                                                     ;
ADC A, $00                                                  ;
LD D, A                                                     ;

LD A, [DE]                                                  ;
INC DE                                                      ;
LD B, A                                                     ;

LD A, [DE]                                                  ;
LD E, B                                                     ;
LD D, A                                                     ;

LD A, L                                                     ;
ADD A, E                                                    ;
LD L, A                                                     ;

LD A, H                                                     ;
ADC A, D                                                    ;
LD H, A                                                     ;

LD A, [CurrentCharacter_Appearance]                         ;
SLA A                                                       ;
ADD A, L                                                    ;
LD L, A                                                     ;

LD A, H                                                     ;
ADC A, $00                                                  ;
LD H, A                                                     ;

LD A, [HL+]                                                 ;
LD B, A                                                     ;
LD L, [HL]                                                  ;

LD H, $00                                                   ;
CALL GetPointerWithSize_00_0AEC                             ;get gfx pointer
RET                                                         ;

;loads graphics, then gets character appearance data. does not display on its own, a flag must be set to do so
LoadCharacterVisuals_00_1CE0:
LD DE, $8000                                                ;store graphics to sprite VRAM (the bank is what we got from LoadCharacterGraphicsBank_00_1CAB)
LD BC, $0800                                                ;2 kilobytes of low definition graphics
CALL TransferData_00_2FA1                                   ;

LD A, [CurrentCharacter]                                    ;
CP CharProp_Character_Mari                                  ;different data bank for miri onward
JR NC, CODE_00_1CF7                                         ;

LD B, $0E                                                   ;
LD HL, $0000                                                ;
JR CODE_00_1CFC                                             ;

CODE_00_1CF7:
LD B, $0F                                                   ;
LD HL, $0000                                                ;

CODE_00_1CFC:
CALL GetPointerWithSize_00_0AEC                             ;

LD A, B                                                     ;
LD [CharacterDisplay_DataBank], A                           ;
CALL SetProgramBank_00_037B                                 ;we already set the bank with GetPointerWithSize_00_0AEC before, this is redundant.

LD A, L                                                     ;
LD [CharacterDisplay_DataPointer], A                        ;base data pointer

LD A, H                                                     ;
LD [CharacterDisplay_DataPointer+1], A                      ;

LD A, [CurrentCharacter]                                    ;
SLA A                                                       ;
LD L, A                                                     ;
LD H, $00                                                   ;

LD A, [CharacterDisplay_DataPointer]                        ;
ADD A, L                                                    ;
LD L, A                                                     ;character display data pointer

LD A, [CharacterDisplay_DataPointer+1]                      ;
ADC A, H                                                    ;
LD H, A                                                     ;

LD A, [HL+]                                                 ;
LD E, A                                                     ;
LD D, [HL]                                                  ;get character appearance data pointer

LD A, [CurrentCharacter_Appearance]                         ;
SLA A                                                       ;
ADD A, E                                                    ;and depending on current appearance
LD E, A                                                     ;

LD A, D                                                     ;
ADC A, $00                                                  ;
LD D, A                                                     ;

LD A, [CharacterDisplay_DataPointer]                        ;
ADD A, E                                                    ;
LD E, A                                                     ;

LD A, [CharacterDisplay_DataPointer+1]                      ;
ADC A, D                                                    ;
LD D, A                                                     ;

LD A, [DE]                                                  ;a new set of pointers for emotes for said appearance
INC DE                                                      ;
LD L, A                                                     ;
LD A, [DE]                                                  ;
LD H, A                                                     ;

LD A, [CharacterDisplay_DataPointer]                        ;
ADD A, L                                                    ;
LD L, A                                                     ;

LD A, [CharacterDisplay_DataPointer+1]                      ;
ADC A, H                                                    ;
LD H, A                                                     ;

LD A, L
LD [CharacterDisplay_DataPointer], A                        ;final character display data pointer

LD A, H                                                     ;
LD [CharacterDisplay_DataPointer+1], A                      ;
RET                                                         ;

;Affect relationship by the fact of the event itself happening
AffectRelationshipByScriptEntry_00_1D50:
LD B, $03                                                   ;
LD HL, $0004                                                ;
CALL GetRelationshipModifierArrayByScriptEntry_00_1D86      ;

LD C, $01                                                   ;maybe substract from relationship values
CALL ApplyRelationshipModifierArray_00_1E03                 ;

LD B, $03                                                   ;
LD HL, $0003                                                ;
CALL GetRelationshipModifierArrayByScriptEntry_00_1D86      ;

LD C, $00                                                   ;maybe add to relationship values
CALL ApplyRelationshipModifierArray_00_1E03                 ;
RET                                                         ;

;affect relationship values based on player choice
AffectRelationshipByPlayerChoice_00_1D50:
LD B, $03                                                   ;
LD HL, $0006                                                ;
CALL GetRelationshipModifierArrayByPlayerChoice_00_1DB9     ;

LD C, $01                                                   ;maybe substract from relationship values
CALL ApplyRelationshipModifierArray_00_1E03                 ;

LD B, $03                                                   ;
LD HL, $0005                                                ;
CALL GetRelationshipModifierArrayByPlayerChoice_00_1DB9     ;

LD C, $00                                                   ;maybe add to relationship values
CALL ApplyRelationshipModifierArray_00_1E03                 ;
RET                                                         ;

GetRelationshipModifierArrayByScriptEntry_00_1D86:
CALL GetPointerWithSize_00_0AEC                             ;
PUSH HL                                                     ;
LD A, [ScriptEntryOffset]                                   ;
LD E, A                                                     ;
AND $07                                                     ;this is used as a space-saving measure by reducing amount of pointers, with each pointer having 8 different values
LD B, A                                                     ;

LD A, [ScriptEntryOffset+1]                                 ;
LD D, A                                                     ;
SRL D                                                       ;
RR E                                                        ;
SRL D                                                       ;
RR E                                                        ;
SRL D                                                       ;>>3
RR E                                                        ;

ADD HL, DE                                                  ;
ADD HL, DE                                                  ;

LD A, [HL+]                                                 ;get relationship modificators
LD H, [HL]                                                  ;
LD L, A                                                     ;
POP DE
ADD HL, DE                                                  ;HL - pointer to relationship modificators

LD A, B                                                     ;check if script entry & 7 is 0
OR A                                                        ;
JR Z, RETURN_00_1DB8                                        ;no further offset

LOOP_00_1DAC:
LD A, [HL+]                                                 ;skip over entries to get to the one we need
SLA A                                                       ;
ADD A, L                                                    ;

LD L, A                                                     ;
LD A, H                                                     ;
ADC A, $00                                                  ;
LD H, A                                                     ;

DEC B                                                       ;
JR NZ, LOOP_00_1DAC                                         ;

RETURN_00_1DB8:
RET                                                         ;

GetRelationshipModifierArrayByPlayerChoice_00_1DB9:
CALL GetPointerWithSize_00_0AEC                             ;
PUSH HL                                                     ;
LD A, [PlayerChoiceEntryOffset]                             ;
LD E, A                                                     ;
AND $07                                                     ;just like before, save space that would be occupied by pointers
LD B, A                                                     ;

LD A, [PlayerChoiceEntryOffset+1]                           ;
LD D, A                                                     ;
SRL D                                                       ;
RR E                                                        ;
SRL D                                                       ;
RR E                                                        ;
SRL D                                                       ;
RR E                                                        ;
ADD HL, DE                                                  ;
ADD HL, DE                                                  ;

LD A, [HL+]                                                 ;
LD H, [HL]                                                  ;
LD L, A                                                     ;
POP DE                                                      ;
ADD HL, DE                                                  ;

LD A, B                                                     ;check if player choice relationship modifier entry & 7 is 0
OR A                                                        ;
JR Z, CODE_00_1DEF                                          ;

SLA A                                                       ;
ADD A, B                                                    ;
LD B, A                                                     ;

LOOP_00_1DE3:
LD A, [HL+]                                                 ;
SLA A                                                       ;
ADD A, L                                                    ;

LD L, A                                                     ;
LD A, H                                                     ;
ADC A, $00                                                  ;
LD H, A                                                     ;

DEC B                                                       ;
JR NZ, LOOP_00_1DE3                                         ;keep skipping over entries

CODE_00_1DEF:
LD A, [ChoiceOptions_CurrentOption]                         ;if player picked first choice, ignore
OR A                                                        ;
JR Z, RETURN_00_1E02                                        ;
LD B, A                                                     ;

LOOP_00_1DF6:
LD A, [HL+]                                                 ;offset by subsequent choices
SLA A                                                       ;
ADD A, L                                                    ;
LD L, A                                                     ;

LD A, H                                                     ;
ADC A, $00                                                  ;
LD H, A                                                     ;

DEC B                                                       ;
JR NZ, LOOP_00_1DF6                                         ;

RETURN_00_1E02:
RET                                                         ;

;this routine is used to check if character relationships should be modified, and do so if necessary
;input:
;C - substract or add flag (if true, substract, otherwise add)
;HL - pointer to a table where character modification data is stored
ApplyRelationshipModifierArray_00_1E03:
LD A, [HL+]                                                 ;
OR A                                                        ;
JR Z, RETURN_00_1E1E                                        ;check if some character relationship should be affected. if not, return

LD B, A                                                     ;how many characters should be affected

LOOP_00_1E08:
PUSH BC                                                     ;
LD E, C                                                     ;
LD A, [HL+]                                                 ;
LD B, A                                                     ;which character's relationship values to mess with

LD A, [HL+]                                                 ;
LD C, A                                                     ;where to get character relationship modifiers

LD A, [CurrentProgramBank]                                  ;
PUSH AF                                                     ;
LD A, E                                                     ;substract or add flag
CALL ModifyCharacterRelationshipValues_00_1E1F              ;

POP AF                                                      ;
CALL SetProgramBank_00_037B                                 ;

POP BC                                                      ;
DEC B                                                       ;
JR NZ, LOOP_00_1E08                                         ;

RETURN_00_1E1E:
RET                                                         ;

;input:
;A - substract flag, if set - substract value, clear - add
;B - relationship address offset (in other words, whose relationship to modify)
;C - relationship modifiers offset
ModifyCharacterRelationshipValues_00_1E1F:
PUSH HL                                                     ;
PUSH AF                                                     ;

LD DE, CurrentSave_CharacterRelationship                    ;
LD A, B                                                     ;
SLA A                                                       ;
ADD A, B                                                    ;times 3
SLA A                                                       ;and times 2 because each value is 16-bit
ADD A, E                                                    ;

LD E, A                                                     ;
LD A, D                                                     ;
ADC A, $00                                                  ;
LD D, A                                                     ;DE - addresses which we're gonna modify

PUSH DE                                                     ;
LD B, $03                                                   ;
LD HL, $0008                                                ;
CALL GetPointerWithSize_00_0AEC                             ;get relationship modifers' location

LD A, C                                                     ;
LD D, $00                                                   ;
SLA A                                                       ;
RL D                                                        ;
ADD A, C                                                    ;also times 3
LD E, A                                                     ;

LD A, D                                                     ;
ADC A, $00                                                  ;
LD D, A                                                     ;
ADD HL, DE                                                  ;HL - resulting pointer to the three relationship modifiers

POP DE                                                      ;
POP AF                                                      ;

LD C, A                                                     ;
LD B, $03                                                   ;

LOOP_00_1E4C:
LD A, C                                                     ;
OR A                                                        ;check if relationship value should be decreased or increased
JR Z, CODE_00_1E57                                          ;

LD A, [DE]                                                  ;sub
SUB [HL]                                                    ;
JR NC, CODE_00_1E5D                                         ;

XOR A                                                       ;don't underflow
JR CODE_00_1E5D                                             ;

CODE_00_1E57:
LD A, [DE]                                                  ;add
ADD A, [HL]                                                 ;
JR NC, CODE_00_1E5D                                         ;

LD A, 255                                                   ;cap relationship value

CODE_00_1E5D:
LD [DE], A                                                  ;
INC HL                                                      ;
INC DE                                                      ;\next relationship address
INC DE                                                      ;/
DEC B                                                       ;
JR NZ, LOOP_00_1E4C                                         ;loop until done

POP HL                                                      ;
RET                                                         ;

LoadFontGraphics_00_1E66:
LD B, $02                                                   ;
LD HL, $0009                                                ;get a pointer for graphics
CALL GetPointerWithSize_00_0AEC                             ;

LD C, E                                                     ;
LD B, D                                                     ;
LD DE, $9000                                                ;where font graphics will be located in VRAM
CALL TransferData_00_2FA1                                   ;
RET                                                         ;

;draw a different info box for visual novel segments (or lack thereof) depending on input A
DrawInfoBoxForVisualNovelSection_00_1E77:
OR A                                                        ;
JR Z, DrawStandardMessageBox_00_1E82                        ;A = 0
DEC A                                                       ;
JR Z, DrawStatusBar_00_1EC0                                 ;A = 1
DEC A                                                       ;
JR Z, SetupTextAreaWithoutMessageBox_00_1EE0                ;A = 2
JR RETURN_00_1EFE                                           ;invalid values do nothing

;normal message box
DrawStandardMessageBox_00_1E82:
CODE_00_1E82:
LD A, $00                                                   ;box column
CALL PushToDrawingStack_00_0B5E                             ;

LD A, $0B                                                   ;box row
CALL PushToDrawingStack_00_0B5E                             ;

LD A, 20                                                    ;box width
CALL PushToDrawingStack_00_0B5E                             ;

LD A, 7                                                     ;how tall the box is
CALL PushToDrawingStack_00_0B5E                             ;

CALL DrawInfoBox_00_0EF8                                    ;

LD B, $00                                                   ;
LD C, $04                                                   ;
CALL ResetDrawingStack_00_0B78                              ;

LD A, $01                                                   ;message column
CALL PushToDrawingStack_00_0B5E                             ;

LD A, $0C                                                   ;message row
CALL PushToDrawingStack_00_0B5E                             ;

LD A, 18                                                    ;characters on a single line
CALL PushToDrawingStack_00_0B5E                             ;

LD A, 5                                                     ;text lines
CALL PushToDrawingStack_00_0B5E                             ;

CALL StoreTextDrawingProperties_00_1922                     ;

LD B, $00                                                   ;
LD C, $04                                                   ;
CALL ResetDrawingStack_00_0B78                              ;
JR RETURN_00_1EFE                                           ;

;draw the top date/cash display
DrawStatusBar_00_1EC0:
LD A, $00                                                   ;
CALL PushToDrawingStack_00_0B5E                             ;

LD A, $00                                                   ;
CALL PushToDrawingStack_00_0B5E                             ;

LD A, 20                                                    ;width
CALL PushToDrawingStack_00_0B5E                             ;

LD A, 3                                                     ;
CALL PushToDrawingStack_00_0B5E                             ;

CALL DrawInfoBox_00_0EF8                                    ;

LD B, $00                                                   ;
LD C, $04                                                   ;
CALL ResetDrawingStack_00_0B78                              ;
JR RETURN_00_1EFE                                           ;

;no message box but display text in almost the same area 
SetupTextAreaWithoutMessageBox_00_1EE0:
LD A, $01                                                   ;
CALL PushToDrawingStack_00_0B5E                             ;

LD A, $0D                                                   ;will draw lower than normal
CALL PushToDrawingStack_00_0B5E                             ;

LD A, 18                                                    ;
CALL PushToDrawingStack_00_0B5E                             ;

LD A, $04                                                   ;less text lines as a result
CALL PushToDrawingStack_00_0B5E                             ;

CALL StoreTextDrawingProperties_00_1922                     ;

LD B, $00                                                   ;
LD C, $04                                                   ;
CALL ResetDrawingStack_00_0B78                              ;

RETURN_00_1EFE:
RET                                                         ;


;VN CODE FROM BANK 0 ENDS HERE
;code for other game aspects here

SETCHARMAP Text_Other

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; New Game Code
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;name entry code
ExecuteNewGameCode_00_1EFF:
LD A, $FF                                                   ;
LD [JoypadInputEnabler], A                                  ;

LD A, LCDControlEnable                                      ;
LDH [Reg_LCDControlAndRender], A                            ;

LD B, $02                                                   ;
LD HL, $0009                                                ;get pointer for font graphics
CALL GetPointerWithSize_00_0AEC                             ;

LD DE, $8000                                                ;
LD BC, $0800                                                ;
CALL CopyData_00_0C73                                       ;come on, we have LoadFontGraphics_00_1E66!

LD A, $1F                                                   ;
CALL SetProgramBank_00_037B                                 ;

LD HL, GFX_Underscore_1F_6DE0                               ;
LD DE, $8800                                                ;
LD BC, $0010                                                ;a single underscore tile
CALL CopyData_00_0C73                                       ;

LD A, $1D                                                   ;
CALL SetProgramBank_00_037B                                 ;

LD A, Music_NewGame                                         ;
CALL ChangeMusic_00_0B12                                    ;music for new game screens

CALL HandleNewGameFunctionality_1D_7082                     ;

PUSH AF                                                     ;
LD A, $1E                                                   ;
CALL SetProgramBank_00_037B                                 ;this doesn't seem necessary
POP AF                                                      ;
RET                                                         ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Gameplay Code (Schedule and a lot of other stuff)
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ExecuteGameplayCode_00_1F3F:
LD A, $1E                                                   ;
CALL SetProgramBank_00_037B                                 ;

CALL CalculateIngameTime_00_3C4E                            ;
CALL SetOffDayFlag_1E_6DAA                                  ;

LD A, $63                                                   ;
LD [TransitionToScheduleScreenFromTitleScreenFlag], A       ;

LD A, %00001111                                             ;
LD [ScheduleScreenDrawBits], A                              ;

LD A, [CurrentSave_DayOffFlag]                              ;check if current save has loaded into a day off
CP $00                                                      ;
JR NZ, CODE_00_1FC8                                         ;

WorkWeekScheduleScreenLoop_00_1F5B:
CALL RemoveCalendarSprites_00_2EF2                          ;

CALL LoadAndHandleWorkWeekScheduleScreen_00_2042            ;

LD A, [QuitGameFlag]                                        ;check if we confirmed selected quit option
CP $00                                                      ;
JR NZ, QuitGame_00_1FBF                                     ;

GoThroughSchedule_00_1F68:
CALL SetOffDayFlag_1E_6DAA                                  ;

LD A, [DayOffFlag]                                          ;check if encountered a day off before reaching sunday (holiday)
CP $00                                                      ;
JR NZ, HolidayScheduleScreen_00_1F9C                        ;

XOR A                                                       ;
LD [HolidayOrWeekendFlag], A                                ;another way to indicate day off. seems kind of redundant, but eh.

LD HL, TimePassingWindow_1E_5C5F                            ;
CALL DrawFromTilemap_1E_79B0                                ;
CALL DrawScheduleScreenElements_1E_6F3A                     ;

CALL PerformActivity_WorkWeek_1E_68C5                       ;
CALL MaybePlayEvent_00_2E67                                 ;maybe something happens on this day...

LD HL, TimePassingWindow_1E_5C5F                            ;reload this in case an event happens
CALL DrawFromTilemap_1E_79B0                                ;

LD A, Music_ScheduleScreenWorkWeek                          ;
CALL ChangeMusic_00_0B12                                    ;and load this music in case it changed

CALL AnimateTimePassing_00_2EA1                             ;

LD A, [CurrentSave_DaysPassed]                              ;check if reached christmas
CP 255                                                      ;
JR Z, CODE_00_1FB9                                          ;
JR CODE_00_1FA6                                             ;

HolidayScheduleScreen_00_1F9C:
CALL LoadAndHandleOffDayScheduleScreen_00_1FD1              ;

LD A, [QuitGameFlag]                                        ;check if quit the game during a holiday
CP $00                                                      ;
JR NZ, QuitGame_00_1FBF                                     ;

CODE_00_1FA6:
LD A, [CurrentDayOfTheWeek]                                 ;check if we transitioned into sunday, which is also a day off
CP Weekday_Sunday                                           ;
JR NZ, GoThroughSchedule_00_1F68                            ;keep going through schedule things

SundayScheduleScreen_00_1FAD:
CALL LoadAndHandleOffDayScheduleScreen_00_1FD1              ;

LD A, [QuitGameFlag]                                        ;check if we quit the game during sunday
CP $00                                                      ;
JR NZ, QuitGame_00_1FBF                                     ;

JR WorkWeekScheduleScreenLoop_00_1F5B                       ;transition into work week

CODE_00_1FB9:
CALL CalculateTop3CharacterRleationships_1E_6733            ;get characters that care about you the most for the final choice

LD A, $01                                                   ;the game will transition into ending event
RET                                                         ;

;or ExiT if you will
QuitGame_00_1FBF:
CALL WaitForVBlank_00_0382                                  ;
CALL HandleFadingOut_1E_6D06                                ;game fades out

LD A, $02                                                   ;indicate that the game should reset itself
RET                                                         ;

CODE_00_1FC8:
LD A, [CurrentDayOfTheWeek]                                 ;check if we reached sunday
CP Weekday_Sunday                                           ;
JR Z, SundayScheduleScreen_00_1FAD                          ;
JR HolidayScheduleScreen_00_1F9C                            ;off day is holiday

LoadAndHandleOffDayScheduleScreen_00_1FD1:
CALL RemoveCalendarSprites_00_2EF2                          ;

LD A, %00001111                                             ;
LD [ScheduleScreenDrawBits], A                              ;

LD A, $01                                                   ;
LD [CurrentSave_DayOffFlag], A                              ;
LD [HolidayOrWeekendFlag], A                                ;even if it's just a sunday, it FEELS like a special day

LD A, [DayOffTime]                                          ;
CP $01                                                      ;
JR Z, OffDayLaterDay_00_2011                                ;

LD A, $FF                                                   ;
LD [CurrentSave_DayOffActivities], A                        ;
LD [CurrentSave_DayOffActivities+1], A                      ;

XOR A                                                       ;
LD [DayOffTime], A                                          ;
LD [CurrentSave_CurrentTimeOfDay], A                        ;

CALL MaybeGoOnDate_00_224B                                  ;
JR NC, OffDayEarlyDay_00_2003                               ;

LD A, ScheduleOption_Relationships                          ;went on a date with someone
CALL ScheduleOffDayActivity_1E_691A                         ;
JR OffDayLaterDay_00_2011                                   ;

OffDayEarlyDay_00_2003:
CALL HandleActivityChoice_OffDay_00_23AA                    ;

LD A, [QuitGameFlag]                                        ;check player quitting game during this time frame
CP $00                                                      ;
RET NZ                                                      ;

CALL PerformActivity_OffDay_1E_692C                         ;
JR CODE_00_2016                                             ;

OffDayLaterDay_00_2011:
LD A, $FF                                                   ;
LD [CurrentSave_DayOffActivities+1], A                      ;

CODE_00_2016:
LD A, $01                                                   ;
LD [DayOffTime], A                                          ;
LD [CurrentSave_CurrentTimeOfDay], A                        ;

CALL MaybeGoOnDate_00_224B
JR NC, CODE_00_202A

LD A, ScheduleOption_Relationships                          ;went on a date with someone
CALL ScheduleOffDayActivity_1E_691A                         ;
JR CODE_00_2036                                             ;

CODE_00_202A:
CALL HandleActivityChoice_OffDay_00_23AA                    ;you're given a choice to do something (or not if you're sick)

LD A, [QuitGameFlag]                                        ;
CP $00                                                      ;
RET NZ                                                      ;

CALL PerformActivity_OffDay_1E_692C                         ;you did something

CODE_00_2036:
LD HL, TilemapClear_ScheduleScreen_ActionInfoBox_1E_5465    ;
CALL ClearTilemap_1E_79F0                                   ;

CALL WaitForVBlank_00_0382                                  ;
JP AnimateTimePassing_00_2EA1                               ;transition from off day to next day (which may also be an off day, who knows)

LoadAndHandleWorkWeekScheduleScreen_00_2042:
LD A, %00001111                                             ;
LD [ScheduleScreenDrawBits], A                              ;

CALL InitializeScheduleScreenVariables_1E_7C1C              ;
CALL MarkDaysOffOnWorkWeekSchedule_1E_6DC1                  ;
CALL CalculateIngameTime_00_3C4E                            ;

LD A, Music_ScheduleScreenWorkWeek                          ;
CALL ChangeMusic_00_0B12                                    ;load normal schedule music

XOR A                                                       ;reset various things when going into work week
LD [HolidayOrWeekendFlag], A                                ;
LD [CurrentSave_DayOffFlag], A                              ;
LD [DayOffTime], A                                          ;
LD [CurrentSave_CurrentTimeOfDay], A                        ;
LD [ScheduleScreen_PickedOption], A                         ;

CALL DrawScheduleScreenThings_00_21C4                       ;

LD HL, WhatWillYouWorkHardOnMessage_1E_460E                 ;
CALL ClearTilemap_1E_79F0                                   ;remove the message

CALL CheckIfPlayerIsTired_1E_7D7A                           ;
JP C, CODE_00_20C4                                          ;if player is tired, fill the entire schedule with rest option

LD A, [CurrentSave_PlayerTiredFlag]                         ;check if player was previously tired
CP $01                                                      ;
JR NZ, CODE_00_2093                                         ;

XOR A                                                       ;
LD [CurrentSave_PlayerTiredFlag], A                         ;player has recovered

LD HL, PlayerRecoveredMessage_1E_4C5C                       ;notify the player they can do what ever. but please, do take better care of yourself...
CALL DrawFromTilemap_1E_79B0                                ;

CALL HandleTransitionIntoScheduleScreen_00_3702             ;
CALL GenericMessageHandling_00_3023                         ;

LD HL, WorkWeekStartedMessage_1E_4000                       ;
CALL ScheduleScreen_ClearSelectionWindowAndDraw_00_3BB1     ;
JR CODE_00_209C                                             ;

CODE_00_2093:
LD HL, WorkWeekStartedMessage_1E_4000                       ;lets work hard! and just work.
CALL DrawFromTilemap_1E_79B0                                ;

CALL HandleTransitionIntoScheduleScreen_00_3702             ;

CODE_00_209C:
CALL GenericMessageHandling_00_3023                         ;

CALL DrawSelectedScheduleScreenOptionIconAndName_1E_6F02    ;

HandleWorkWeekLoop_00_20A2:
CALL ExecuteScheduleScreen_WorkWeek_00_20F9                 ;

CALL WalkThroughSchedule_1E_6EBE                            ;

LD A, [QuitGameFlag]                                        ;
CP $00                                                      ;
JR NZ, RETURN_00_20C3                                       ;

LD A, [ScheduleScreen_CurrentSelectionIndex]                ;
CP $0E                                                      ;
JR C, HandleWorkWeekLoop_00_20A2                            ;

CALL LoadAndHandleScheduleConfirmation_00_2159              ;
JR NC, RETURN_00_20C3                                       ;

CALL CancelLastScheduleSelection_1E_6ECE                    ;
CALL DrawScheduleScreenElements_1E_6F3A                     ;
JR HandleWorkWeekLoop_00_20A2                               ;

RETURN_00_20C3:
RET                                                         ;

;player got sick working too hard going into work week, forced to rest (even though events still happen, implying you still go out there)
CODE_00_20C4:
CALL FillWorkWeekScheduleWithRelaxActivity_00_20E7          ;oops, all Relax!
CALL DrawScheduleScreenElements_1E_6F3A                     ;
CALL HandleTransitionIntoScheduleScreen_00_3702             ;

LD A, [CurrentSave_PlayerTiredFlag]                         ;check if player isn't tired
CP $01                                                      ;
JR Z, CODE_00_20DE                                          ;

LD A, $01                                                   ;become tired
LD [CurrentSave_PlayerTiredFlag], A                         ;

LD HL, PlayerGotTiredMessage_1E_4C40                        ;
JR CODE_00_20E1                                             ;

CODE_00_20DE:
LD HL, PlayerStillTiredMessage_1E_4C99                      ;

CODE_00_20E1:
CALL DrawFromTilemap_1E_79B0                                ;
JP GenericMessageHandling_00_3023                           ;

;The player character can't take it anymore, they have to rest for a while
FillWorkWeekScheduleWithRelaxActivity_00_20E7:
LD B, 14                                                    ;
LD HL, CurrentSave_ScheduledActivities                      ;

LOOP_00_20EC:
LD A, [HL]                                                  ;
CP ScheduleOption_DayOff                                    ;day off cannot be replaced with relax activity
JR Z, CODE_00_20F4                                          ;

LD A, ScheduleOption_Relax                                  ;
LD [HL], A                                                  ;

CODE_00_20F4:
INC HL                                                      ;
DEC B                                                       ;
JR NZ, LOOP_00_20EC                                         ;
RET                                                         ;

ExecuteScheduleScreen_WorkWeek_00_20F9:
CALL Wait8VBlanks_1E_65BA                                   ;

XOR A                                                       ;
LD [SelectedScheduleOptionFlag], A                          ;didn't schedule anything by default

CODE_00_2100:
CALL RefreshScheduleScreenChoice_00_223B                    ;

HandleScheduleScreen_WorkWeek_00_2103:
CALL HandleScheduleScreenFunctionality_1E_6E2D              ;
CALL GenericScreenHandling_00_2FC3                          ;
JR NC, HandleScheduleScreen_WorkWeek_00_2103                ;
CP GenericStateChange_Confirm                               ;
JR Z, CODE_00_2117                                          ;check if player confirmed option

CALL CancelLastScheduleSelection_1E_6ECE                    ;
CALL DrawScheduleScreenElements_1E_6F3A                     ;
JR ExecuteScheduleScreen_WorkWeek_00_20F9                   ;

CODE_00_2117:
CALL HandleScheduleScreenSelectedOptionCode_00_2194         ;

LD A, [QuitClubOrJobFlag]                                   ;
CP $00                                                      ;
JR Z, CODE_00_2127                                          ;

XOR A                                                       ;
LD [QuitClubOrJobFlag], A                                   ;
JR CODE_00_213B                                             ;

CODE_00_2127:
LD A, [SelectedScheduleOptionFlag]                          ;mark scheduled activities on the, well... schedule
CP $01                                                      ;
RET Z                                                       ;

LD A, [QuitGameFlag]                                        ;
CP $00                                                      ;
JR NZ, RETURN_00_2158                                       ;

LD A, [GenericStateChangeIndicator]                         ;
CP GenericStateChange_Refresh                               ;
JR Z, CODE_00_2100                                          ;

CODE_00_213B:
LD A, SpriteDisplayable_None                                ;
LD [SpriteDisplayables_ID+1], A                             ;remove cursor sprite that we summoned with that other code

CALL HandleSpriteDisplayables_00_3F25                       ;

LD HL, TilemapClear_ScheduleScreen_ActionInfoBox_1E_5465    ;refresh
CALL ClearTilemap_1E_79F0                                   ;

CALL WaitForVBlank_00_0382                                  ;
CALL DrawScheduleSelectionMessage_00_220F                   ;
CALL DrawSelectedScheduleScreenOptionIconAndName_1E_6F02    ;

XOR A                                                       ;
LD [GenericStateChangeIndicator], A                         ;
JR HandleScheduleScreen_WorkWeek_00_2103                    ;

RETURN_00_2158:
RET                                                         ;quits the game

;confirm schedule
LoadAndHandleScheduleConfirmation_00_2159:
LD A, SpriteDisplayable_None                                ;
LD [SpriteDisplayables_ID+1], A                             ;

CALL WaitForVBlank_00_0382                                  ;

LD HL, ScheduleScreen_ConfirmSelectionMessage_1E_43F4       ;the game asks you if you're sure the schedule you made up is what you REALLY want.
CALL ScheduleScreen_ClearSelectionWindowAndDraw_00_3BB1     ;
CALL ScheduleScreen_DrawAAndBButtonPrompts_1E_799E          ;
CALL Wait8VBlanks_1E_65BA                                   ;

HandleScheduleConfirmationFunctionality_00_216D:
CALL HandleSpriteDisplayables_00_3F25                       ;

LD A, [JoypadInputPress]                                    ;
BitTest JoypadInput_A, A                                    ;
JR NZ, PressedA_00_2187                                     ;

BitTest JoypadInput_B, A                                    ;
JR NZ, PressedB_00_2180                                     ;

CALL WaitForVBlank_00_0382                                  ;
JR HandleScheduleConfirmationFunctionality_00_216D          ;

PressedB_00_2180:
LD A, SFX_Cancel                                            ;you changed your mind
LD [SoundQueue], A                                          ;
SCF                                                         ;
RET                                                         ;

PressedA_00_2187:
LD A, SFX_Confirm                                           ;
LD [SoundQueue], A                                          ;

LD HL, ScheduleScreen_ActionInfoBoxTop_1E_4E98              ;
CALL ScheduleScreen_ClearSelectionWindowAndDraw_00_3BB1     ;queue training montage. oh wait, this game doesn't have one...
XOR A                                                       ;
RET                                                         ;

;picked an option in schedule screen
HandleScheduleScreenSelectedOptionCode_00_2194:
CALL Wait8VBlanks_1E_65BA                                   ;wait for not-so-dramatic effect

LD HL, RETURN_00_21A5                                       ;
PUSH HL                                                     ;
LD HL, ScheduleScreenOptionCodePointers_00_21A6             ;
LD A, [ScheduleScreen_PickedOption]                         ;
CALL GetPointer_00_2F03                                     ;
JP HL                                                       ;

RETURN_00_21A5:
RET                                                         ;

;reaction to every option from schedule screen
ScheduleScreenOptionCodePointers_00_21A6:
dw GenericActivityOption_00_3263                            ;study
dw GenericActivityOption_00_3263                            ;look after your appearance
dw InitClubOption_00_3A08                                   ;club
dw GenericActivityOption_00_3263                            ;karaoke
dw GenericActivityOption_00_3263                            ;game
dw InitJobOption_00_3B60                                    ;work for cash
dw GenericActivityOption_00_3263                            ;take rest
dw TransitionToMapScreen_00_277B                            ;go out for a walk
dw TransitionToPhoneCallOption_00_2956                      ;phone call
dw TransitionToRelationshipViewer_00_360F                   ;relationship viewer
dw InitInfoOption_00_2516                                   ;bring up INFO options
dw TransitionToCalendarScreen_00_3288                       ;check calendar
dw InitSaveGameOption_00_34ED                               ;save game
dw InitGameOptions_00_352B                                  ;game options
dw InitQuitGameOption_00_35E4                               ;quit game

DrawScheduleScreenThings_00_21C4:
LD A, [ScheduleScreenDrawBits]                              ;
AND %00000001                                               ;
JR Z, CODE_00_21CE                                          ;

CALL LoadScheduleScreenEssentials_00_21F4                   ;bit 0 is responsible for loading graphics and clearing a few variables

CODE_00_21CE:
LD A, [ScheduleScreenDrawBits]                              ;
AND %00000100                                               ;
JR Z, CODE_00_21D8                                          ;

CALL DrawScheduleScreenElements_1E_6F3A                     ;bit 2 is responsible for drawing schedule screen elements (from what little testing I did, it doesnt seem too important since the routine is called in other places as well)

CODE_00_21D8:
LD A, [ScheduleScreenDrawBits]                              ;
AND %00000010                                               ;check bit 1
JR Z, CODE_00_21E2                                          ;

CALL DrawScheduleSelectionMessageAndUpdateSelector_00_2209  ;add schedule selector (seems to only really affect schedule selector sprite not immediately spawning when loading in...?)

CODE_00_21E2:
LD A, [ScheduleScreenDrawBits]                              ;
AND %00001000                                               ;bit 3 - draw player stats
JR Z, CODE_00_21EC                                          ;

CALL DrawScheduleScreenStats_00_2F0F                        ;

CODE_00_21EC:
XOR A                                                       ;
LD [ScheduleScreenDrawBits], A                              ;
LD [$D25A], A
RET                                                         ;

LoadScheduleScreenEssentials_00_21F4:
XOR A                                                       ;
LD [GenericStateChangeIndicator], A                         ;
LD [$D242], A
LD [$D243], A
LD [ScheduleScreen_PickedOption], A                         ;

LD A, $FF                                                   ;inputs are enabled
LD [JoypadInputEnabler], A                                  ;
JP LoadScheduleScreenVisuals_00_381D                        ;

DrawScheduleSelectionMessageAndUpdateSelector_00_2209:
CALL DrawScheduleSelectionMessage_00_220F                   ;
JP SpawnScheduleSelectorSprite_1E_6E0F                      ;

DrawScheduleSelectionMessage_00_220F:
LD A, [ScheduleScreen_CurrentSelectionIndex]                ;
CP $07                                                      ;
JR NC, CODE_00_221B                                         ;

LD HL, WhatWillYouWorkHardOnMessage_1E_460E                 ;keep this message for the first 6 selections
JR CODE_00_221E                                             ;

CODE_00_221B:
LD HL, WhatWillYouJustWorkOnMessage_1E_462A                 ;for the 6 last selections

CODE_00_221E:
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, WhatWillYouWorkOnWeekdayTilemapPosition_1E_4D7A      ;
CALL StoreTilemapLocationToRAM_1E_7333                      ;

LD A, [ScheduleScreen_CurrentSelectionIndex]                ;
CP $07                                                      ;
JR C, CODE_00_2230                                          ;
SUB $07                                                     ;

CODE_00_2230:
ADD A, CHARVAL("月")                                        ;display appropriate weekday symbol based on current selection
LD [DynamicTilemapArray+4], A                               ;

LD HL, DynamicTilemapArray                                  ;
JP DrawFromTilemap_1E_79B0                                  ;

RefreshScheduleScreenChoice_00_223B:
XOR A                                                       ;
LD [GenericStateChangeIndicator], A                         ;
LD [$D242], A
LD [$D243], A
CALL DrawSelectedScheduleScreenOptionIconAndName_1E_6F02    ;
JP DrawScheduleSelectionMessageAndUpdateSelector_00_2209    ;

MaybeGoOnDate_00_224B:
CALL CheckDatingConditions_1E_6BC3                          ;
CP $01                                                      ;
JR Z, CODE_00_225C                                          ;
CP $02                                                      ;
JR Z, CODE_00_2264                                          ;
CP $03                                                      ;
JR Z, CODE_00_2269                                          ;

XOR A                                                       ;nothing happens
RET                                                         ;

;go to promised date
CODE_00_225C:
CALL CheckForSpecialDateEvent_1E_6AEA                       ;
CALL LoadAndHandleMapScreen_PromisedDate_00_2270            ;

SCF                                                         ;
RET                                                         ;

;agreed to go somewhere on a date
CODE_00_2264:
CALL LoadAndHandleMapScreen_WalkingOutWithSomeone_00_2306   ;

SCF                                                         ;
RET                                                         ;

;just got tired when you were supposed to go on a date
CODE_00_2269:
LD A, $01                                                   ;
LD [MissedDateDueToExhastionFlag], A                        ;you had a date planned, but you overworked yourself.

XOR A                                                       ;
RET                                                         ;

LoadAndHandleMapScreen_PromisedDate_00_2270:
CALL LoadMapVisuals_00_30B6                                 ;

LD HL, DateTodayMessage_1E_4B04                             ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, DateCharacterNameTilemapLocation_1E_4B0C             ;
CALL StoreTilemapLocationToRAM_1E_7333                      ;

LD A, [SelectedCharacterForDateOrGift]                      ;
LD [SelectedOption], A                                      ;
CALL GetCharacterNameForPhoneCall_00_320D                   ;character name from the phone call we made

XOR A                                                       ;empty space before character name
LD [DynamicTilemapArray+4], A                               ;
LD HL, DynamicTilemapArray                                  ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, DatePlaceWentToMessage_1E_4B10                       ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, DateSpotNameYouWentToTilemapLocation_1E_4B15         ;
CALL StoreTilemapLocationToRAM_1E_7333                      ;

LD HL, LocationNamePointers_1E_557A                         ;
LD A, [CurrentlyChosenDateSpot]                             ;
CALL GetPointer_00_2F03                                     ;

LD DE, DynamicTilemapArray+4                                ;
LD B, PlaceName_MaxLength                                   ;
CALL CopyData8Bit_1E_6CD5                                   ;

LD HL, DynamicTilemapArray                                  ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, WentToDateSpotLastMessage_1E_4B19                    ;
CALL DrawFromTilemap_1E_79B0                                ;

XOR A                                                       ;
LD [GenericStateChangeIndicator], A                         ;

LD A, SpriteDisplayable_None                                ;
LD [SpriteDisplayables_ID], A                               ;

LD HL, Map_PlayerXPosPerLocation_1E_57A3                    ;place the map sprite
LD A, [CurrentlyChosenDateSpot]                             ;
LD C, A                                                     ;
ADD HL, BC                                                  ;
LD A, [HL]                                                  ;
LD [SpriteDisplayables_XPos+2], A                           ;

LD HL, Map_PlayerYPosPerLocation_1E_57C1                    ;
LD A, [CurrentlyChosenDateSpot]                             ;
LD C, A                                                     ;
ADD HL, BC                                                  ;
LD A, [HL]                                                  ;
LD [SpriteDisplayables_YPos+2], A                           ;

CALL AnimateWalkingSprite_1E_752F                           ;
CALL GenericScreenTransition_00_2FB2                        ;
CALL MapScreenMessageHandling_00_306B                       ;wait for the player to dismiss the message and automatically trigger the date event

LD A, SpriteDisplayable_None                                ;
LD [SpriteDisplayables_ID+2], A                             ;

CALL HandleSpriteDisplayables_00_3F25                       ;
CALL WaitForVBlank_00_0382                                  ;
CALL MaybePlayEvent_00_2E67                                 ;

LD A, Music_ScheduleScreenOffDay                            ;
CALL ChangeMusic_00_0B12                                    ;

LD A, ScheduleOption_Relationships                          ;
CALL ScheduleOffDayActivity_1E_691A                         ;went on a date

LD A, $01                                                   ;date is a schedule activity
LD [SelectedScheduleOptionFlag], A                          ;

CALL DrawScheduleScreenElements_1E_6F3A                     ;
RET                                                         ;

;transition into a map screen for a date with a character (via walking option, not phone call)
LoadAndHandleMapScreen_WalkingOutWithSomeone_00_2306:
CALL LoadMapVisuals_00_30B6                                 ;

LD A, $1F                                                   ;
CALL SetProgramBank_00_037B                                 ;

LD HL, GFX_ScheduleSprites_1F_5A40                          ;
LD DE, $8000                                                ;
LD BC, $0800                                                ;
CALL CopyData_00_0C73                                       ;

LD A, $1E                                                   ;
CALL SetProgramBank_00_037B                                 ;

CALL GetTheAmountOfAvailableMapLocations_1E_6BB4            ;

XOR A                                                       ;
LD [GenericStateChangeIndicator], A                         ;

LD A, SpriteDisplayable_None                                ;
LD [SpriteDisplayables_ID], A                               ;

LD A, $01                                                   ;by default you're not going out on the second date, unless you are.
LD [NotGoingOutOnDateFlag], A

XOR A                                                       ;
LD [SelectedOption], A                                      ;
LD [$D25A], A

LD HL, PreviousDateSpotStorage                              ;
LD A, [CharacterOnADate]                                    ;calculate whose date spot that was
SLA A                                                       ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;

LD A, [HL]                                                  ;
LD [PreviousDateSpot], A                                    ;will skip over when on the map screen
CALL InitializeDateSpotSelection_00_3806                    ;

LD HL, MapWhereToGoOnDateMessage_1E_4B24                    ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, AButtonPrompt_1E_48F5                                ;
CALL DrawFromTilemap_1E_79B0                                ;

CALL GenericScreenTransition_00_2FB2                        ;
CALL MapScreenMessageHandling_00_306B                       ;
CALL DrawMapScreen_TextBox_1E_666F                          ;

XOR A                                                       ;
LD [SelectedOption], A                                      ;not sure why we had to do that twice, but sure.
CALL InitializeDateSpotSelection_00_3806                    ;I guess its to ensure that the player REALLY isn't at shopping center or previous date spot.

;going out with a character after inviting them (map screen)
HandleMapScreenForDate_00_2366:
CALL AnimateWalkingSprite_1E_752F                           ;
CALL HandleMapScreenForDateFunctionality_00_37B9            ;
CALL GenericScreenHandling_00_2FC3                          ;
JR NC, HandleMapScreenForDate_00_2366                       ;
CP GenericStateChange_Cancel                                ;check if player pressed B
JR NZ, CODE_00_237B                                         ;

XOR A                                                       ;you can't actually cancel out of the date spot selection.
LD [GenericStateChangeIndicator], A                         ;
JR HandleMapScreenForDate_00_2366                           ;

CODE_00_237B:
LD HL, CurrentDateSpotStorage                               ;
LD A, [CharacterOnADate]                                    ;
SLA A                                                       ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;
LD A, [CurrentlySelectedMapSpot]                            ;
LD [HL], A                                                  ;save this spot you went to
LD [ChosenMapSpot], A                                       ;

CALL CheckIfMissedADate_1E_7BB1                             ;Are you a bad enough dude to miss a date?
CALL MaybePlayEvent_00_2E67                                 ;Play currently selected date spot dating event.

CALL InitSpriteDisplayables_1E_6E21                         ;

LD A, Music_ScheduleScreenOffDay                            ;
CALL ChangeMusic_00_0B12                                    ;

LD A, ScheduleOption_Relationships                          ;mark activity as "had a date"
CALL ScheduleOffDayActivity_1E_691A                         ;

LD A, $01                                                   ;date is an activity the player took
LD [SelectedScheduleOptionFlag], A                          ;

CALL DrawScheduleScreenElements_1E_6F3A                     ;
RET                                                         ;

HandleActivityChoice_OffDay_00_23AA:
CALL InitializeScheduleScreenVariables_1E_7C1C              ;

LD A, [DayOffTime]                                          ;
CP $00                                                      ;
JR Z, CODE_00_23B6                                          ;

LD A, ScheduleOption_GoingOut                               ;simply went out on a walk (or bought item)

CODE_00_23B6:
LD [ScheduleScreen_CurrentSelectionIndex], A                ;
CALL CalculateIngameTime_00_3C4E                            ;

LD A, $01                                                   ;
LD [HolidayOrWeekendFlag], A                                ;

CALL CODE_00_24E9

LD A, Music_ScheduleScreenOffDay                            ;music for schedule screen on day off
CALL ChangeMusic_00_0B12                                    ;

LD HL, TilemapClear_ScheduleScreen_ActionInfoBox_1E_5465    ;
CALL ClearTilemap_1E_79F0                                   ;

LD A, [MissedDateDueToExhastionFlag]                        ;
CP $01                                                      ;
JR NZ, CODE_00_23F1                                         ;

CALL CheckIfMissedADate_1E_7BB1                             ;you DEFINITELY missed a date! technically your fault, you should treat yourself better!

LD HL, TiredAndCantGoOnPlannedDate_1E_4C72                  ;
CALL DrawFromTilemap_1E_79B0                                ;

CALL HandleTransitionIntoScheduleScreen_00_3702             ;
CALL GenericMessageHandling_00_3023                         ;

LD HL, TilemapClear_ScheduleScreen_ActionInfoBox_1E_5465    ;
CALL ClearTilemap_1E_79F0                                   ;

XOR A                                                       ;
LD [MissedDateDueToExhastionFlag], A                        ;may recalculate this
JR ScheduleRelaxActivity_OffDay_00_245D                     ;

CODE_00_23F1:
CALL CheckIfPlayerIsTired_1E_7D7A                           ;check your health...
JR C, ScheduleRelaxActivity_OffDay_00_245D                  ;

LD A, [CurrentSave_PlayerTiredFlag]                         ;
CP $01                                                      ;
JR NZ, CODE_00_241E                                         ;

XOR A                                                       ;player recovers
LD [CurrentSave_PlayerTiredFlag], A                         ;

LD HL, PlayerRecoveredMessage_1E_4C5C                       ;
CALL DrawFromTilemap_1E_79B0                                ;
CALL HandleTransitionIntoScheduleScreen_00_3702             ;
CALL GenericMessageHandling_00_3023                         ;

LD HL, OffDayStartedMessage_1E_4C1A                         ;
CALL ScheduleScreen_ClearSelectionWindowAndDraw_00_3BB1     ;
CALL GenericMessageHandling_00_3023                         ;
CALL DrawSelectedScheduleScreenOptionIconAndName_1E_6F02    ;

CALL DrawOffDayScheduleMessage_1E_6DFA                      ;
JR CODE_00_2430                                             ;

CODE_00_241E:
LD HL, OffDayStartedMessage_1E_4C1A                         ;yay!
CALL DrawFromTilemap_1E_79B0                                ;

CALL HandleTransitionIntoScheduleScreen_00_3702             ;
CALL GenericMessageHandling_00_3023                         ;
CALL DrawSelectedScheduleScreenOptionIconAndName_1E_6F02    ;
CALL DrawOffDayScheduleMessage_1E_6DFA                      ;

CODE_00_2430:
CALL ExecuteScheduleScreen_OffDay_00_2487                   ;

LD A, [QuitGameFlag]                                        ;
CP $00                                                      ;
JR NZ, RETURN_00_245C                                       ;

CALL GetOffDayActivity_1E_690B                              ;
CP ScheduleOption_GoingOut                                  ;
RET NC                                                      ;

CALL LoadAndHandleScheduleConfirmation_00_2159              ;
JR NC, RETURN_00_245C                                       ;

LD A, ScheduleOption_None                                   ;mark the last spot that was selected as empty
CALL ScheduleOffDayActivity_1E_691A                         ;
CALL DrawScheduleScreenElements_1E_6F3A                     ;

XOR A
LD [$D228], A
LD [ScheduleScreen_PickedOption], A                         ;
LD [SelectedScheduleOptionFlag], A                          ;
CALL DrawSelectedScheduleScreenOptionIconAndName_1E_6F02    ;

JR CODE_00_2430

RETURN_00_245C:
RET                                                         ;

ScheduleRelaxActivity_OffDay_00_245D:
LD A, ScheduleOption_Relax                                  ;forced into relax mode
CALL ScheduleOffDayActivity_1E_691A                         ;

LD A, $01                                                   ;relaxation is most certainly an activity the player does
LD [SelectedScheduleOptionFlag], A                          ;

CALL DrawScheduleScreenElements_1E_6F3A                     ;
CALL HandleTransitionIntoScheduleScreen_00_3702             ;

LD A, [CurrentSave_PlayerTiredFlag]                         ;
CP $01                                                      ;
JR Z, CODE_00_247E                                          ;

LD A, $01                                                   ;player has become tired
LD [CurrentSave_PlayerTiredFlag], A                         ;

LD HL, PlayerGotTiredMessage_1E_4C40                        ;
JR CODE_00_2481                                             ;

CODE_00_247E:
LD HL, PlayerStillTiredMessage_1E_4C99                      ;

CODE_00_2481:
CALL DrawFromTilemap_1E_79B0                                ;
JP GenericMessageHandling_00_3023                           ;

ExecuteScheduleScreen_OffDay_00_2487:
CALL Wait8VBlanks_1E_65BA                                   ;

CODE_00_248A:
CALL CODE_00_2501
CALL PlaceScheduleSelectorSprite_1E_6E97                    ;
CALL DrawSelectedScheduleScreenOptionIconAndName_1E_6F02    ;

HandleScheduleScreen_OffDay_00_2493:
CALL HandleSpriteDisplayables_00_3F25                       ;
CALL HandleScheduleScreenFunctionality_1E_6E2D              ;

LD A, [GenericStateChangeIndicator]                         ;
CP GenericStateChange_Nothing                               ;
JR NZ, CODE_00_24A5                                         ;

CALL WaitForVBlank_00_0382                                  ;
JR HandleScheduleScreen_OffDay_00_2493                      ;

CODE_00_24A5:
CP GenericStateChange_Confirm                               ;
JR Z, CODE_00_24B5                                          ;

LD A, [$D228]
CP $00
RET NZ

XOR A                                                       ;
LD [GenericStateChangeIndicator], A                         ;
JR HandleScheduleScreen_OffDay_00_2493                      ;

CODE_00_24B5:
CALL HandleScheduleScreenSelectedOptionCode_00_2194         ;

LD A, [QuitGameFlag]                                        ;
CP $00                                                      ;
RET NZ                                                      ;call it quits if player calls it quits

LD A, [SelectedScheduleOptionFlag]                          ;
CP $01                                                      ;check if picked a normal schedule option
RET Z                                                       ;mark it as such

LD A, [GenericStateChangeIndicator]                         ;
CP GenericStateChange_Refresh                               ;
JR Z, CODE_00_248A                                          ;

LD A, SpriteDisplayable_None                                ;
LD [SpriteDisplayables_ID+1], A                             ;

CALL HandleSpriteDisplayables_00_3F25                       ;

LD HL, TilemapClear_ScheduleScreen_ActionInfoBox_1E_5465    ;
CALL ClearTilemap_1E_79F0                                   ;

CALL WaitForVBlank_00_0382                                  ;
CALL DrawOffDayScheduleMessage_1E_6DFA                      ;
CALL DrawSelectedScheduleScreenOptionIconAndName_1E_6F02    ;

XOR A                                                       ;
LD [GenericStateChangeIndicator], A                         ;
JR HandleScheduleScreen_OffDay_00_2493                      ;can't back out or anything

RET                                                         ;inaccessible return

CODE_00_24E9:
LD A, [ScheduleScreenDrawBits]                              ;
AND %00000001                                               ;
JR Z, CODE_00_24F3                                          ;

CALL LoadScheduleScreenEssentials_00_21F4                   ;

CODE_00_24F3:
CALL DrawScheduleScreenStatsAndSpawnScheduleSelector_00_24FB;

XOR A                                                       ;
LD [ScheduleScreenDrawBits], A                              ;
RET                                                         ;

DrawScheduleScreenStatsAndSpawnScheduleSelector_00_24FB:
CALL DrawScheduleScreenStats_00_2F0F                        ;
JP SpawnScheduleSelectorSprite_1E_6E0F                      ;

CODE_00_2501:
LD A, $01                                                   ;
LD [HolidayOrWeekendFlag], A                                ;

XOR A                                                       ;
LD [GenericStateChangeIndicator], A                         ;
LD [$D242], A
LD [$D243], A
LD [ScheduleScreen_PickedOption], A                         ;
JP DrawScheduleScreenStatsAndSpawnScheduleSelector_00_24FB  ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Info option code
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

InitInfoOption_00_2516:
LD HL, InfoOptionWindow_1E_40AD                             ;
CALL DrawFromTilemap_1E_79B0                                ;

XOR A                                                       ;
LD [GenericStateChangeIndicator], A                         ;
LD [SelectedOption], A                                      ;
CALL ScheduleScreen_WindowScrollingUp_00_2FD4               ;

ReloadInfoChoicesWindow_00_2526:
CALL DrawSidewayCursor_WindowLayer_1E_66AB                  ;

ExecuteInfoChoicesWindow_00_2529:
CALL HandleInfoWindowFunctionality_1E_7052                  ;

CALL GenericScreenHandling_00_2FC3                          ;
JR NC, ExecuteInfoChoicesWindow_00_2529                     ;
CP GenericStateChange_Confirm                               ;
JR NZ, CODE_00_253D                                         ;if didn't confirm, then cancelled

CALL ExecutePickedInfoOption_00_2577                        ;transition to a different screen

CALL ReloadScheduleScreenWithInfoOptionsWindow_00_254E      ;
JR ReloadInfoChoicesWindow_00_2526                          ;

CODE_00_253D:
JP ScheduleScreen_WindowScrollingDown_00_3001               ;info window moves down

;returning to the schedule screen, draw its things
DrawScheduleScreenThingsOnReturn_00_2540:
LD A, %00001101                                             ;
LD [ScheduleScreenDrawBits], A                              ;

CALL DrawScheduleScreenThings_00_21C4                       ;
CALL SpawnScheduleSelectorSprite_1E_6E0F                    ;
JP PlaceScheduleSelectorSprite_1E_6E97                      ;

ReloadScheduleScreenWithInfoOptionsWindow_00_254E:
CALL DrawScheduleScreenThingsOnReturn_00_2540               ;

LD HL, InfoOptionWindow_1E_40AD                             ;
CALL DrawFromTilemap_1E_79B0                                ;

XOR A                                                       ;
LD [GenericStateChangeIndicator], A                         ;
LD [SelectedOption], A                                      ;

LD A, LCDControlEnable|LCDSpriteSize                        ;
LDH [Reg_LCDControlAndRender], A                            ;

LD A, SpriteDisplayable_None                                ;
LD [SpriteDisplayables_ID], A                               ;

CALL WaitForVBlank_00_0382                                  ;

LD HL, Reg_LCDControlAndRender                              ;
SetBit LCDBackgroundRender, [HL]                            ;
SetBit LCDSpriteRender, [HL]                                ;

CALL EnableScheduleScreenWindowLayer_00_30FA                ;
JP HandleFadingIn_1E_6CDC                                   ;

ExecutePickedInfoOption_00_2577:
LD B, $08                                                   ;wait 8 frames

LOOP_00_2579:
CALL WaitForVBlank_00_0382                                  ;
DEC B                                                       ;
JR NZ, LOOP_00_2579                                         ;

LD HL, RETURN_00_258D                                       ;
PUSH HL                                                     ;
LD HL, InfoOptionCodePointers_00_258E                       ;
LD A, [SelectedOption]                                      ;
CALL GetPointer_00_2F03                                     ;
JP HL                                                       ;transition to respective screen

RETURN_00_258D:
RET                                                         ;

InfoOptionCodePointers_00_258E:
dw LoadAndHandleTownInfoScreen_00_2596                      ;
dw LoadAndHandleInventoryScreen_00_2626                     ;
dw LoadAndHandleCharacterProfileViewer_00_2687              ;
dw LoadAndHandleRelationshipViewer_00_270E                  ;an unused pointer. This suggests the relationship viewer was accessible from the info window instead of being a separate option

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Info option - town info code
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LoadAndHandleTownInfoScreen_00_2596:
CALL HandleFadingOut_1E_6D06                                ;

LD A, LCDControlEnable                                      ;
LDH [Reg_LCDControlAndRender], A                            ;

CALL LoadTownInfoScreenVisuals_00_25C4                      ;
CALL HandleSpriteDisplayablesAndWaitForVBlank_00_3C48       ;

LD HL, Reg_LCDControlAndRender                              ;
SetBit LCDBackgroundRender, [HL]                            ;
SetBit LCDSpriteRender, [HL]                                ;

CALL HandleFadingIn_1E_6CDC                                 ;

HandleTownInfoScreen_00_25AD:
CALL HandleSpriteDisplayables_00_3F25                       ;

LD A, [JoypadInputPress]                                    ;
BitTest JoypadInput_B, A                                    ;
JR NZ, PressedB_00_25BC                                     ;

CALL WaitForVBlank_00_0382                                  ;
JR HandleTownInfoScreen_00_25AD                             ;

PressedB_00_25BC:
LD A, SFX_Cancel                                            ;
LD [SoundQueue], A                                          ;
JP HandleFadingOut_1E_6D06                                  ;

LoadTownInfoScreenVisuals_00_25C4:
CALL CheckPurchasedInfoForCurrentMonth_1E_7D3E              ;
JR C, CODE_00_2610                                          ;don't have current month's town info

CALL LoadTownInfoScreenGeneralLayout_1E_7F85                ;

LD A, [CurrentMonth]                                        ;
CALL ExtractDateDigits_1E_65CF                              ;

LD HL, TEMP_ARRAY                                           ;
LD DE, $9841                                                ;
LD BC, $0002                                                ;
CALL CopyData_00_0C73                                       ;draw current month

LD A, [CurrentMonth]                                        ;
LD HL, TownInfo_MoviePerMonth_1E_623A                       ;
CALL GetPointer_00_2F03                                     ;
CALL DrawFromTilemap_1E_79B0                                ;draw current month's movie string

LD A, [CurrentMonth]                                        ;
LD HL, TownInfo_RecommendedSpotPerMonth_1E_6252             ;
CALL GetPointer_00_2F03                                     ;
CALL DrawFromTilemap_1E_79B0                                ;draw current month's spot recommendation

LD A, [CurrentMonth]                                        ;
LD HL, TownInfo_Bargain1PerMonth_1E_626A                    ;
CALL GetPointer_00_2F03                                     ;
CALL DrawFromTilemap_1E_79B0                                ;bargain item 1

LD A, [CurrentMonth]                                        ;
LD HL, TownInfo_Bargain2PerMonth_1E_6282                    ;
CALL GetPointer_00_2F03                                     ;
CALL DrawFromTilemap_1E_79B0                                ;bargain item 2
JR CODE_00_2619                                             ;

;don't have current month's info
CODE_00_2610:
CALL DrawFullScreenInfoBox_1E_6648                          ;

LD HL, NoCurrentTownInfo_1E_4C05                            ;
CALL DrawFromTilemap_1E_79B0                                ;

CODE_00_2619:
XOR A                                                       ;
LD [GenericStateChangeIndicator], A                         ;

LD A, SpriteDisplayable_None                                ;
LD [SpriteDisplayables_ID], A                               ;
LD [SpriteDisplayables_ID+1], A                             ;
RET                                                         ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Info option - inventory screen code
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LoadAndHandleInventoryScreen_00_2626:
CALL HandleFadingOut_1E_6D06                                ;

LD A, LCDControlEnable                                      ;
LDH [Reg_LCDControlAndRender], A                            ;

CALL LoadInventoryScreenVisuals_00_2652                     ;
CALL HandleSpriteDisplayables_00_3F25                       ;
CALL GenericScreenTransition_00_2FB2                        ;

HandleInventoryScreen_00_2636:
CALL HandleInventoryScreenFunctionality_1E_728D             ;

LD A, [ChangedSelectionPageFlag]                            ;
CP $00                                                      ;
JR Z, CODE_00_264A                                          ;

CALL DrawItemNamesInInventory_00_3878                       ;draw new item selection
CALL DrawItemPageCount_Inventory_1E_7CFC                    ;redraw page count, update current page number

XOR A                                                       ;
LD [ChangedSelectionPageFlag], A                            ;

CODE_00_264A:
CALL GenericScreenHandling_00_2FC3                          ;
JR NC, HandleInventoryScreen_00_2636                        ;

JP HandleFadingOut_1E_6D06                                  ;

LoadInventoryScreenVisuals_00_2652:
CALL DrawFullScreenInfoBox_1E_6648                          ;

LD HL, Inventory_Header_1E_41B6                             ;
CALL DrawFromTilemap_1E_79B0                                ;

CALL CheckPlayerInventory_1E_6829                           ;

LD A, [PlayerInventoryItemAmount]                           ;
CP $00                                                      ;
JR Z, CODE_00_2671                                          ;if there are no items in the player's inventory, say so

;player has items
XOR A                                                       ;
LD [CurrentSelectionPage], A                                ;

CALL DrawItemNamesInInventory_00_3878
CALL DrawItemPageCount_Inventory_1E_7CFC                    ;
JR CODE_00_2677                                             ;

;player has no items
CODE_00_2671:
LD HL, Inventory_NoItemsMessage_1E_41C5                     ;
CALL DrawFromTilemap_1E_79B0                                ;

CODE_00_2677:
XOR A                                                       ;
LD [GenericStateChangeIndicator], A                         ;
LD [ChangedSelectionPageFlag], A                            ;

LD A, SpriteDisplayable_None                                ;
LD [SpriteDisplayables_ID], A                               ;
LD [SpriteDisplayables_ID+1], A                             ;
RET                                                         ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Info option - character profile viewer screen code
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LoadAndHandleCharacterProfileViewer_00_2687:
CALL HandleFadingOut_1E_6D06                                ;

LD A, $1F                                                   ;
CALL SetProgramBank_00_037B                                 ;

LD HL, GFX_ScheduleSprites_1F_5A40                          ;
LD DE, $8000                                                ;
LD BC, $0800                                                ;
CALL CopyData_00_0C73                                       ;

LD A, $1E                                                   ;
CALL SetProgramBank_00_037B                                 ;

LD A, LCDControlEnable|LCDSpriteSize                        ;
LDH [Reg_LCDControlAndRender], A                            ;

XOR A                                                       ;
LD [GenericStateChangeIndicator], A                         ;

CALL LoadCharacterProfileSelectionScreen_00_26CB
CALL HandleSpriteDisplayables_00_3F25
CALL GenericScreenTransition_00_2FB2

HandleCharacterProfileSelectScreen_00_26B1:
CALL HandleCharacterSelectFunctionality_1E_7426              ;
CALL GenericScreenHandling_00_2FC3                           ;
JR NC, HandleCharacterProfileSelectScreen_00_26B1            ;
CP GenericStateChange_Confirm                                ;
JR NZ, CODE_00_26C2                                          ;

CALL LoadAndHandleCharacterProfile_00_26DD                   ;
JR LoadAndHandleCharacterProfileViewer_00_2687               ;

CODE_00_26C2:
CALL HandleFadingOut_1E_6D06                                 ;
CALL InitSpriteDisplayables_1E_6E21                          ;
JP HandleSpriteDisplayablesAndWaitForVBlank_00_3C48          ;

LoadCharacterProfileSelectionScreen_00_26CB:
CALL DrawFullScreenInfoBox_1E_6648                          ;

LD HL, CharacterProfile_ChooseCharacterMessage_1E_41D5      ;
CALL DrawFromTilemap_1E_79B0                                ;
CALL SeparateScreen_DrawAAndBButtonPrompts_1E_79A4          ;
CALL DrawCharacterNameOptions_1E_72CD                       ;
JP InitVariablesAndMaybeSpawnCursor_00_313C                 ;

;character info menu, just picked one
LoadAndHandleCharacterProfile_00_26DD:
CALL HandleFadingOut_1E_6D06                                ;

LD A, [SelectedOption]                                      ;
LD L, A                                                     ;will display a respective character
LD H, CharProp_Appearance_School                            ;they are displayed in school uniform
CALL LoadCharacterGraphicsBank_Profile_00_1B08              ;

LD DE, $8000                                                ;
LD BC, $0800                                                ;
CALL CopyData_00_0C73                                       ;load character's graphics

LD A, $1E                                                   ;
CALL SetProgramBank_00_037B                                 ;

CALL LoadCharacterProfileVisuals_1E_7540                    ;
CALL HandleSpriteDisplayables_00_3F25                       ;
CALL GenericScreenTransition_00_2FB2                        ;

HandleCharacterProfile_00_2700:
CALL HandleCharacterProfileFunctionality_1E_74A7            ;
CALL GenericScreenHandling_00_2FC3                          ;
JR NC, HandleCharacterProfile_00_2700                       ;

LD A, SpriteDisplayable_None                                ;
LD [SpriteDisplayables_ID+2], A                             ;
RET                                                         ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Relationship viewer screen code
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;relationship viewer screen
LoadAndHandleRelationshipViewer_00_270E:
CALL HandleFadingOut_1E_6D06                                ;
CALL LoadRelationshipViewerVisuals_00_2737                  ;
CALL HandleSpriteDisplayables_00_3F25                       ;
CALL GenericScreenTransition_00_2FB2                        ;

HandleRelationshipViewer_00_271A:
CALL HandleSpriteDisplayables_00_3F25                       ;

LD A, [JoypadInputPress]                                    ;
BitTest JoypadInput_B, A                                    ;wait for player to press B to get out of this screen
JR NZ, PressedB_00_2729                                     ;

CALL WaitForVBlank_00_0382                                  ;
JR HandleRelationshipViewer_00_271A                         ;

PressedB_00_2729:
LD A, SFX_Cancel                                            ;
LD [SoundQueue], A                                          ;

CALL HandleFadingOut_1E_6D06                                ;
CALL InitSpriteDisplayables_1E_6E21                         ;
JP HandleSpriteDisplayablesAndWaitForVBlank_00_3C48         ;

;load relationship viewer visuals
LoadRelationshipViewerVisuals_00_2737:
LD A, $1F                                                   ;
CALL SetProgramBank_00_037B                                 ;

LD HL, GFX_RelationshipViewerBGTiles_1F_61E0                ;
LD DE, $8800                                                ;
LD BC, $0600
CALL CopyData_00_0C73                                       ;

LD HL, GFX_RelationshipViewerSpriteTiles_1F_67E0            ;
LD DE, $8000                                                ;
LD BC, $0600
CALL CopyData_00_0C73                                       ;

LD A, $1E                                                   ;
CALL SetProgramBank_00_037B                                 ;

LD HL, TilemapClearData_FullScreen_1E_4E0C                  ;
CALL ClearTilemap_1E_79F0                                   ;

LD HL, Relationships_Message_1E_423A                        ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, Relationships_PlayerSilhouette_1E_424A               ;
CALL DrawFromTilemap_1E_79B0                                ;

CALL RelationshipViewer_DrawCharactersAndRelationships_1E_733F

XOR A                                                       ;
LD [GenericStateChangeIndicator], A                         ;

LD A, SpriteDisplayable_None                                ;
LD [SpriteDisplayables_ID], A                               ;
LD [SpriteDisplayables_ID+1], A                             ;
RET                                                         ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Map screen code
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;transition to map screen from schedule screen
TransitionToMapScreen_00_277B:
CALL LoadMapVisuals_00_30B6                                 ;

LD HL, MapWhereToGoMessage_1E_4674                          ;
CALL DrawFromTilemap_1E_79B0                                ;

CALL GetTheAmountOfAvailableMapLocations_1E_6BB4            ;

XOR A                                                       ;
LD [GenericStateChangeIndicator], A                         ;

LD A, SpriteDisplayable_None                                ;
LD [SpriteDisplayables_ID], A                               ;
LD [SpriteDisplayables_ID+1], A                             ;
CALL GenericScreenTransition_00_2FB2                        ;
CALL GenericMessageHandling_00_3023                         ;

XOR A                                                       ;
LD [SelectedOption], A                                      ;clear selected spot

CALL UpdatePlayerPlacementAndSpotNameOnMap_00_3711          ;place player on map
CALL SeparateScreen_DrawAAndBButtonPrompts_1E_79A4          ;
CALL Wait8VBlanks_1E_65BA                                   ;

HandleMapScreen_00_27A6:
CALL AnimateWalkingSprite_1E_752F                           ;animate map spot selection sprite
CALL HandleMapScreenFunctionality_00_375E

CALL GenericScreenHandling_00_2FC3                          ;
JR NC, HandleMapScreen_00_27A6                              ;
CP GenericStateChange_Cancel                                ;
JR Z, CODE_00_27BF                                          ;

;player confirmed location
CALL PickedMapSpot_00_27EB                                  ;
LD A, [GenericStateChangeIndicator]                         ;
CP GenericStateChange_Cancel                                ;
JR Z, TransitionToMapScreen_00_277B                         ;return to the map screen (in case we checked shopping center)

CODE_00_27BF:
LD A, [$D25B]
CP $01
JR Z, CODE_00_27E6

LD A, [NotGoingOutOnDateFlag]
OR A
JR Z, CODE_00_27E6

LD A, [$D25A]
CP $00
JR NZ, CODE_00_27D6

CALL HandleFadingOut_1E_6D06                                ;quit map screen

CODE_00_27D6:
XOR A
LD [$D25A], A

CALL InitSpriteDisplayables_1E_6E21                         ;
CALL HandleSpriteDisplayablesAndWaitForVBlank_00_3C48       ;
CALL DrawScheduleScreenThingsOnReturn_00_2540               ;
JP GenericScreenTransition_00_2FB2                          ;

CODE_00_27E6:
XOR A
LD [$D25B], A
RET

PickedMapSpot_00_27EB:
LD A, [CurrentlySelectedMapSpot]                            ;
CP MapSpot_ShoppingCenter                                   ;
JR NZ, CODE_00_281D                                         ;if didn't pick the shopping center, it acts as a normal spot

CALL DrawFullScreenInfoBox_1E_6648                          ;present with new options

HandleShoppingCenterScreen_00_27F5:
CALL InitAndHandleShoppingCenterInitialChoices_00_2840      ;
LD A, [GenericStateChangeIndicator]                         ;
CP GenericStateChange_Cancel                                ;
RET Z                                                       ;return from the shopping center if player cancelled out

LD A, [SelectedOption]                                      ;check if you picked either walking somehwere, or shop
CP $00                                                      ;
JR NZ, CODE_00_2811                                         ;

;walk options
CALL InitAndHandleShoppingCenterWalkingChoices_00_284F      ;walk around at your leisure

LD A, [GenericStateChangeIndicator]                         ;
CP GenericStateChange_Cancel                                ;
JR Z, HandleShoppingCenterScreen_00_27F5                    ;go back to the initial choices if cancelled out
JR CODE_00_2824                                             ;

;shop options
CODE_00_2811:
CALL InitAndHandleShoppingCenterShoppingChoices_00_285E     ;

LD A, [GenericStateChangeIndicator]                         ;
CP GenericStateChange_Cancel                                ;
JR Z, HandleShoppingCenterScreen_00_27F5                    ;
JR CODE_00_2831                                             ;

CODE_00_281D:
LD HL, ChosenMapSpot                                        ;
LD A, [CurrentlySelectedMapSpot]                            ;
LD [HL], A                                                  ;

CODE_00_2824:
LD A, $01                                                   ;
LD [$D25A], A

CALL MaybePlayEvent_00_2E67                                 ;walking out and about

LD A, Music_ScheduleScreenOffDay                            ;
CALL ChangeMusic_00_0B12                                    ;

CODE_00_2831:
XOR A                                                       ;
LD [GenericStateChangeIndicator], A                         ;

LD A, ScheduleOption_GoingOut                               ;
CALL ScheduleOffDayActivity_1E_691A                         ;

LD A, $01                                                   ;
LD [SelectedScheduleOptionFlag], A                          ;mark going out as an activity the player has done
RET                                                         ;

InitAndHandleShoppingCenterInitialChoices_00_2840:
CALL LoadShoppingCenterInitialChoiceGeneralLayout_1E_7903   ;

CALL HandleSpriteDisplayablesAndWaitForVBlank_00_3C48       ;

HandleShoppingCenterInitialChoices_00_2846:
CALL HandleShoppingCenterInitialChoiceFunctionality_1E_75AA ;

CALL GenericScreenHandling_00_2FC3                          ;
JR NC, HandleShoppingCenterInitialChoices_00_2846           ;keep player stuck on this screen until they confirm or cancel out
RET                                                         ;

InitAndHandleShoppingCenterWalkingChoices_00_284F:
CALL LoadShoppingCenterWalkGeneralLayout_1E_791D            ;

CALL HandleSpriteDisplayablesAndWaitForVBlank_00_3C48       ;

HandleShoppingCenterWalkingChoices_00_2855:
CALL HandleShoppingCenterWalkingChoiceFunctionality_1E_75D1 ;

CALL GenericScreenHandling_00_2FC3                          ;
JR NC, HandleShoppingCenterWalkingChoices_00_2855           ;wait for player to press A or B
RET                                                         ;

InitAndHandleShoppingCenterShoppingChoices_00_285E:
CALL ClearFullSizeInfoBoxContents_1E_6669                   ;

CALL CheckPlayerInventory_1E_6829                           ;check what player already posesses

LD A, [PlayerInventoryItemAmount]                           ;
CP 35                                                       ;check if player's inventory is filled to the brim
JR Z, CODE_00_28B4                                          ;

CALL LoadShoppingCenterBuyChoiceGeneralLayout_1E_7932       ;

XOR A                                                       ;
LD [CurrentSelectionPage], A                                ;

CALL DrawItemNamesInShop_00_38DA                            ;
CALL DrawItemPageCount_Shopping_1E_7D1D                     ;

LD HL, CurrentSave_Cash                                     ;
CALL GetHexToDecDigits_00_3CD5                              ;print cash the player is currently posessing

LD HL, DecimalDigitArray                                    ;
LD DE, $984D                                                ;
LD BC, $0005                                                ;all 5 digits
CALL CopyData_00_0C73                                       ;draw money digits

CALL DrawSidewayCursor_SeparateScreen_1E_66CB               ;
CALL HandleSpriteDisplayablesAndWaitForVBlank_00_3C48       ;

HandleShoppingCenterShoppingChoices_00_2890:
CALL HandleShoppingCenterShoppingChoiceFunctionality_1E_7619;
CALL GenericScreenHandling_00_2FC3                          ;
JR NC, HandleShoppingCenterShoppingChoices_00_2890          ;
CP GenericStateChange_Confirm                               ;
JR NZ, CODE_00_28A2                                         ;

CALL SelectedChoiceInShop_00_28C6                           ;
JR C, InitAndHandleShoppingCenterShoppingChoices_00_285E    ;
RET                                                         ;

CODE_00_28A2:
CP GenericStateChange_Cancel                                ;
RET Z                                                       ;quit if cancelled

CALL DrawItemNamesInShop_00_38DA                            ;refresh display otherwise
CALL DrawItemPageCount_Shopping_1E_7D1D                     ;
CALL Wait8VBlanks_1E_65BA                                   ;

XOR A                                                       ;
LD [GenericStateChangeIndicator], A                         ;
JR HandleShoppingCenterShoppingChoices_00_2890              ;

;Tell player their inventory is full. Hoarder you!
CODE_00_28B4:
LD HL, ShoppingCenterFullInventoryMessage_1E_4759           ;
CALL DrawFromTilemap_1E_79B0                                ;

CALL InitSpriteDisplayables_1E_6E21                         ;
CALL GenericMessageHandling_00_3023                         ;

LD A, GenericStateChange_Cancel                             ;automatically cancel out because there's nothing to buy
LD [GenericStateChangeIndicator], A                         ;
RET                                                         ;

;selected item, maybe buy it
SelectedChoiceInShop_00_28C6:
CALL InitSpriteDisplayables_1E_6E21                         ;
CALL HandleSpriteDisplayablesAndWaitForVBlank_00_3C48       ;

LD HL, CurrentItemDisplayArray                              ;
LD A, [SelectedOption]                                      ;
CP $05                                                      ;
JP Z, CODE_00_293D                                          ;selected dedicated quit option, count as if you just walked around. kind of a scam option, since you lose an ability to do something else

LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;
LD A, [HL]                                                  ;
CALL GetItemPrice_00_310D                                   ;

LD HL, CurrentSave_Cash                                     ;
LD E, [HL]                                                  ;
INC HL                                                      ;
LD D, [HL]                                                  ;

LD A, [ItemPrice+1]                                         ;compare item price against the amount of money
CP D                                                        ;
JR Z, CODE_00_28EF                                          ;
JR NC, CODE_00_292F                                         ;
JR CODE_00_28F9                                             ;

CODE_00_28EF:
LD A, [ItemPrice]                                           ;
CP E                                                        ;
JR C, CODE_00_28F9                                          ;
JR Z, CODE_00_28F9                                          ;
JR CODE_00_292F                                             ;

;can afford item, you buy it
CODE_00_28F9:
CALL LoadBoughtItemMessage_1E_7947                          ;

LD HL, CurrentItemDisplayArray                              ;
LD A, [SelectedOption]                                      ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;
LD A, [HL]                                                  ;
LD HL, ItemNamePointers_1E_591C                             ;
CALL GetPointer_00_2F03                                     ;

LD DE, DynamicTilemapArray+4                                ;
LD B, ItemName_MaxLength                                    ;
CALL CopyData8Bit_1E_6CD5                                   ;store the item's name

LD HL, DynamicTilemapArray                                  ;
CALL DrawFromTilemap_1E_79B0                                ;display item name

LD HL, PurchasedItemPriceTilemapData_1E_4784                ;
CALL StoreTilemapLocationToRAM_1E_7333                      ;

LD HL, ItemPrice                                            ;
CALL DisplayItemPrice_00_293F                               ;

CALL BoughtItemProcedure_1E_6C8D                            ;

CALL GenericMessageHandling_00_3023                         ;
JR CODE_00_293D                                             ;

;can't afford item
CODE_00_292F:
CALL ClearFullSizeInfoBoxContents_1E_6669                   ;

LD HL, NotEnoughMoneyForItemMessage_1E_476F                 ;tell player they don't have enough money
CALL DrawFromTilemap_1E_79B0                                ;

CALL GenericMessageHandling_00_3023                         ;

SCF                                                         ;
RET                                                         ;

CODE_00_293D:
XOR A                                                       ;will quit the shopping center and map screen, count it as though you did the walk out activity
RET                                                         ;

DisplayItemPrice_00_293F:
CALL GetHexToDecDigits_00_3CD5                              ;extract digits
LD HL, DecimalDigitArray                                    ;
LD DE, DynamicTilemapArray+4                                ;

LD B, 5                                                     ;
CALL CopyData8Bit_1E_6CD5                                   ;

LD A, CHARVAL("円")                                         ;add yen symbol at the end
LD [DE], A                                                  ;
LD HL, DynamicTilemapArray                                  ;
JP DrawFromTilemap_1E_79B0                                  ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Phone call code
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

TransitionToPhoneCallOption_00_2956:
LD HL, PhoneCallWhatToDoMessage_1E_479A                     ;
CALL ScheduleScreen_ClearSelectionWindowAndDraw_00_3BB1     ;
CALL GenericMessageHandling_00_3023                         ;

LD HL, PhoneCallOptionStrings_1E_47A5                       ;
CALL ScheduleScreen_ClearSelectionWindowAndDraw_00_3BB1     ;
CALL ScheduleScreen_DrawAAndBButtonPrompts_1E_799E          ;
CALL DrawSidewayCursor_ActionWindow_1E_66BB                 ;

XOR A                                                       ;
LD [SelectedOption], A                                      ;
LD [GenericStateChangeIndicator], A                         ;
CALL HandleSpriteDisplayablesAndWaitForVBlank_00_3C48       ;

HandlePhoneCallOptions_00_2975:
CALL HandlePhoneCallOptionsFunctionality_1E_76B8            ;
CALL GenericScreenHandling_00_2FC3                          ;
JR NC, HandlePhoneCallOptions_00_2975                       ;

LD A, SpriteDisplayable_None                                ;
LD [SpriteDisplayables_ID+1], A                             ;

CALL HandleSpriteDisplayables_00_3F25                       ;
CALL WaitForVBlank_00_0382                                  ;

LD A, [GenericStateChangeIndicator]                         ;
CP GenericStateChange_Confirm                               ;
RET NZ                                                      ;if didn't confirm option, return

LD A, [SelectedOption]                                      ;check if selected date option
CP $00                                                      ;
JR NZ, CODE_00_29BB                                         ;

;date schedule option
CALL CheckIfDateArrayIsFull_00_31F8                         ;
JR NC, CODE_00_29AD

LD A, [CurrentSave_DaysPassed]                              ;
CP 203                                                      ;check if it's very late in the year
JR NC, CODE_00_29E1                                         ;can't invite on any more dates

;date option
CALL LoadAndHandleDatePhoneCallScreen_00_29EF               ;
LD A, [GenericStateChangeIndicator]                         ;
CP GenericStateChange_Cancel                                ;
JR Z, CODE_00_29D7                                          ;if cancelled out, return to schedule screen
JR CODE_00_29C5                                             ;did the phone call

CODE_00_29AD:
LD A, SpriteDisplayable_None                                ;
LD [SpriteDisplayables_ID+1], A                             ;

LD HL, TooManyPlannedDatesMessage_1E_4A33                   ;
CALL ScheduleScreen_ClearSelectionWindowAndDraw_00_3BB1     ;
JP GenericMessageHandling_00_3023                           ;

;gift option
CODE_00_29BB:
CALL LoadAndHandleGiftPhoneCallScreen_00_2D8A               ;
LD A, [GenericStateChangeIndicator]                         ;
CP GenericStateChange_Cancel                                ;
JR Z, CODE_00_29D7                                          ;

CODE_00_29C5:
XOR A                                                       ;
LD [GenericStateChangeIndicator], A                         ;

LD A, ScheduleOption_PhoneCall                              ;made a successful phone call
CALL ScheduleOffDayActivity_1E_691A                         ;

LD A, $01                                                   ;phone call is an activity opportunity spent
LD [SelectedScheduleOptionFlag], A                          ;

CALL DrawScheduleScreenElements_1E_6F3A                     ;
RET                                                         ;

CODE_00_29D7:
CALL HandleFadingOut_1E_6D06                                ;
CALL DrawScheduleScreenThingsOnReturn_00_2540
CALL GenericScreenTransition_00_2FB2                        ;
RET                                                         ;

CODE_00_29E1:
LD A, SpriteDisplayable_None                                ;
LD [SpriteDisplayables_ID+1], A                             ;

LD HL, CantPromiseDateMessage_1E_4D62                       ;
CALL ScheduleScreen_ClearSelectionWindowAndDraw_00_3BB1     ;
JP GenericMessageHandling_00_3023                           ;

LoadAndHandleDatePhoneCallScreen_00_29EF:
CALL HandleFadingOut_1E_6D06                                ;

LD A, LCDControlEnable|LCDSpriteSize                        ;
LDH [Reg_LCDControlAndRender], A                            ;
CALL DrawFullScreenInfoBox_1E_6648                          ;

LD HL, WhomToPhoneCallMessage_1E_47B9                       ;
CALL DrawFromTilemap_1E_79B0                                ;
CALL SeparateScreen_DrawAAndBButtonPrompts_1E_79A4          ;
CALL DrawCharacterNameOptions_1E_72CD                       ;

CALL InitVariablesAndMaybeSpawnCursor_00_313C               ;
CALL HandleSpriteDisplayables_00_3F25                       ;
CALL GenericScreenTransition_00_2FB2                        ;

HandleDatePhoneCallScreen_00_2A0E:
CALL HandleCharacterSelectFunctionality_1E_7426             ;
CALL GenericScreenHandling_00_2FC3                          ;
JR NC, HandleDatePhoneCallScreen_00_2A0E                    ;
CP GenericStateChange_Confirm                               ;
JR NZ, CODE_00_2A2D                                         ;

CALL InvitingCharacterToADateOnPhone_00_2A35                ;
CALL HandleFadingOut_1E_6D06                                ;
CALL DrawScheduleScreenThingsOnReturn_00_2540

XOR A                                                       ;
LD [GenericStateChangeIndicator], A                         ;
LD [SelectedOption], A                                      ;
JP GenericScreenTransition_00_2FB2                          ;

CODE_00_2A2D:
LD A, SpriteDisplayable_None                                ;
LD [SpriteDisplayables_ID+1], A                             ;
JP HandleSpriteDisplayablesAndWaitForVBlank_00_3C48         ;

;Try to invite a character
InvitingCharacterToADateOnPhone_00_2A35:
CALL DrawPhoneCallGeneralMessages_00_3159                   ;
CALL DrawCharacterMessagesAfterProposingADate_1E_7C54       ;

LD A, [SelectedOption]
LD B, $00                                                   ;can't use an item when calling them
CALL CheckDateInvitationSuccess_00_3D9B                     ;the important question is, do they like you well enough?
JR C, CODE_00_2A57                                          ;if so, then can schedule a date

LD HL, PhoneCallCharacterRefusedDateMessage_1E_484F         ;
CALL DrawFromTilemap_1E_79B0                                ;

CALL Wait50Frames_1E_6706                                   ;let that message sink in for 50 frames

LD HL, PhoneCallDateRejectedMessage_1E_4863                 ;
CALL DrawFromTilemap_1E_79B0                                ;
JP GenericMessageHandling_00_3023                           ;that didn't work out

CODE_00_2A57:
LD HL, PhoneCallCharacterAcceptedDateMessage_1E_483D        ;
CALL DrawFromTilemap_1E_79B0                                ;

CALL GenericMessageHandling_00_3023                         ;

CALL LoadAndHandleDatePlannerScreen_00_2A72                 ;
CALL LoadAndHandleDateSpotChoiceScreen_00_2C17              ;
CALL LoadAndHandleDatePhoneCallConfirmationScreen_00_2D44   ;this is just a formality, you already chose time and place, just a few messages to go

LD A, [CurrentDayBackup]                                    ;
LD [CurrentSave_DaysPassed], A                              ;restore current day
JP CalculateIngameTime_00_3C4E                              ;

;Draw date scheduling interface?
LoadAndHandleDatePlannerScreen_00_2A72:
CALL LoadDatePlannerGeneralLayout_1E_795C                   ;
LD HL, AvailableDaysForDateArray                            ;
LD B, 10                                                    ;
LD A, $FF                                                   ;default

CODE_00_2A7C:
LD [HL+], A                                                 ;
DEC B                                                       ;
JR NZ, CODE_00_2A7C                                         ;

LD B, 20                                                    ;
XOR A                                                       ;

CODE_00_2A83:
LD [HL+], A                                                 ;
DEC B                                                       ;
JR NZ, CODE_00_2A83                                         ;

LD A, [CurrentSave_DaysPassed]                              ;
LD [CurrentDayBackup], A                                    ;temporarily save current day
INC A
LD [DatePlanner_DayCount], A                                ;start searching for day offs after current day

LD HL, AvailableDaysForDateArray
LD B, $00                                                   ;

LOOP_00_2A96:
LD A, [DatePlanner_DayCount]                                ;
CALL CheckIfInputDayIsOffDay_1E_78EE                        ;
JR NC, CODE_00_2AA8                                         ;

LD A, [DatePlanner_DayCount]                                ;found available day
LD [HL+], A                                                 ;
INC B                                                       ;
LD A, B                                                     ;
CP 10                                                       ;check if we got all 10 days
JR Z, CODE_00_2AB3                                          ;

CODE_00_2AA8:
LD A, [DatePlanner_DayCount]                                ;
INC A                                                       ;stop counting if reached christmas (or whatever day happens to be the day 256)
JR Z, CODE_00_2AB3                                          ;

LD [DatePlanner_DayCount], A                                ;
JR LOOP_00_2A96                                             ;

CODE_00_2AB3:
LD HL, $0000                                                ;
LD DE, AvailableDaysForDateArray                            ;
LD B, 10                                                    ;

LOOP_00_2ABB:
LD A, [DE]                                                  ;
CALL DrawAvailableDateTimes_00_2BD7                         ;
INC DE                                                      ;
PUSH DE                                                     ;
LD DE, $0020                                                ;next row
ADD HL, DE                                                  ;
POP DE                                                      ;
DEC B                                                       ;
JR NZ, LOOP_00_2ABB                                         ;keep drawing months and days

LD HL, CurrentSave_PlannedDatesArray                        ;
LD B, 10                                                    ;

LOOP_00_2ACE:
LD A, [HL+]                                                 ;check if this slot is available
CP $FF                                                      ;
JR Z, CODE_00_2AFF                                          ;
PUSH HL                                                     ;
PUSH BC                                                     ;
INC HL                                                      ;skip over high byte
LD A, [HL+]                                                 ;now check which day it occurs
LD C, $00                                                   ;
LD B, A                                                     ;
LD DE, AvailableDaysForDateArray                            ;

LOOP_00_2ADD:
LD A, [DE]                                                  ;does this slot match the occupied day slot?
CP B                                                        ;
JR NZ, CODE_00_2AF6                                         ;

INC HL                                                      ;
LD A, [HL+]                                                 ;check if it happens in ealier in the day or later
CP $00                                                      ;
JR NZ, CODE_00_2AEC                                         ;

LD HL, DateOccupiedEarlyDaySlotArray                        ;
JR CODE_00_2AEF                                             ;

CODE_00_2AEC:
LD HL, DateOccupiedLateDaySlotArray                         ;

CODE_00_2AEF:
LD B, $00                                                   ;
ADD HL, BC                                                  ;
LD [HL], $01                                                ;that date is occupied
JR CODE_00_2AFD                                             ;

CODE_00_2AF6:
INC DE                                                      ;
INC C                                                       ;
LD A, C                                                     ;
CP 10                                                       ;
JR NZ, LOOP_00_2ADD                                         ;

CODE_00_2AFD:
POP BC                                                      ;
POP HL                                                      ;

CODE_00_2AFF:
LD DE, $0005                                                ;check next set of planned date data
ADD HL, DE                                                  ;
DEC B                                                       ;
JR NZ, LOOP_00_2ACE                                         ;

LD HL, $0000                                                ;
LD DE, DateOccupiedEarlyDaySlotArray                        ;
LD B, 10                                                    ;

LOOP_00_2B0E:
LD A, [DE]                                                  ;if this time slot is not occupied
CP $00                                                      ;
JR Z, CODE_00_2B28                                          ;don't draw a symbol indicating as such

PUSH HL                                                     ;
PUSH DE                                                     ;
PUSH BC                                                     ;
LD DE, $9882                                                ;
ADD HL, DE                                                  ;
PUSH HL                                                     ;
POP DE                                                      ;
LD HL, PlannedDateIndicator_00_2BD6                         ;
LD BC, $0001                                                ;
CALL CopyData_00_0C73                                       ;display a heart icon where a planned date is
POP BC                                                      ;
POP DE                                                      ;
POP HL                                                      ;

CODE_00_2B28:
INC DE                                                      ;
PUSH DE                                                     ;
LD DE, $0020                                                ;
ADD HL, DE                                                  ;
POP DE                                                      ;
DEC B                                                       ;
JR NZ, LOOP_00_2B0E                                         ;

LD HL, $0000                                                ;
LD DE, DateOccupiedLateDaySlotArray                         ;
LD B, $0A                                                   ;

LOOP_00_2B3A:
LD A, [DE]                                                  ;
CP $00                                                      ;
JR Z, CODE_00_2B54                                          ;is THIS time slot occupied?

PUSH HL                                                     ;
PUSH DE                                                     ;
PUSH BC                                                     ;
LD DE, $9888                                                ;
ADD HL, DE                                                  ;
PUSH HL                                                     ;
POP DE                                                      ;
LD HL, PlannedDateIndicator_00_2BD6                         ;
LD BC, $0001                                                ;
CALL CopyData_00_0C73                                       ;display a heart icon where a planned date is
POP BC                                                      ;
POP DE                                                      ;
POP HL                                                      ;

CODE_00_2B54:
INC DE                                                      ;
PUSH DE                                                     ;
LD DE, $0020                                                ;
ADD HL, DE                                                  ;
POP DE                                                      ;
DEC B                                                       ;
JR NZ, LOOP_00_2B3A                                         ;

CALL DrawSidewayCursor_SeparateScreen_1E_66CB               ;

XOR A                                                       ;
LD [DatePlanner_EarlyOrLateDayChoice], A                    ;
LD [DatePlanner_CurrentSlotChoice], A                       ;

HandleDatePlannerScreen_00_2B68:
CALL HandleDatePlannerScreenFunctionality_1E_76DE           ;
CALL GenericScreenHandling_00_2FC3                          ;
JR NC, HandleDatePlannerScreen_00_2B68                      ;

LD A, SpriteDisplayable_None                                ;
LD [SpriteDisplayables_ID+1], A                             ;

CALL HandleSpriteDisplayablesAndWaitForVBlank_00_3C48       ;
CALL ClearFullSizeInfoBoxContents_1E_6669                   ;

LD HL, PlannedDateAndTimeMessage_1E_48FF                    ;
CALL DrawFromTilemap_1E_79B0                                ;

CALL Wait50Frames_1E_6706                                   ;

LD HL, PlannedDayTemplateMessage_1E_4910                    ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, CurrentSave_DaysPassed                               ;
LD A, [SelectedDateDaySlot]                                 ;
LD [HL], A                                                  ;
CALL CalculateIngameTime_00_3C4E                            ;calculate the date of selected slot

LD A, [CurrentMonth]                                        ;
CALL ExtractDateDigits_1E_65CF                              ;

LD HL, TEMP_ARRAY                                           ;
LD DE, $9841                                                ;
LD BC, $0002                                                ;
CALL CopyData_00_0C73                                       ;display the day

LD A, [CurrentDayOfTheMonth]                                ;
CALL ExtractDateDigits_1E_65CF                              ;

LD HL, TEMP_ARRAY                                           ;
LD DE, $9844                                                ;
LD BC, $0002                                                ;
CALL CopyData_00_0C73                                       ;display the month

LD A, [SelectedDateDayTime]                                 ;check time of day the date is happening
CP $00                                                      ;
JR NZ, CODE_00_2BC4                                         ;

LD HL, PlannedDateEarlyDayString_1E_4923                    ;
JR CODE_00_2BC7                                             ;

CODE_00_2BC4:
LD HL, PlannedDateLaterDayString_1E_4929                    ;

CODE_00_2BC7:
CALL DrawFromTilemap_1E_79B0                                ;

CALL Wait50Frames_1E_6706                                   ;

LD HL, PlannedDateTransitionToSpotSelectMessage_1E_492F     ;
CALL DrawFromTilemap_1E_79B0                                ;
JP GenericMessageHandling_00_3023                           ;

PlannedDateIndicator_00_2BD6:
db "❤"

;Draws days and month for each available date slots
DrawAvailableDateTimes_00_2BD7:
PUSH HL                                                     ;
PUSH DE                                                     ;
PUSH BC                                                     ;
CP $FF                                                      ;check if the day cannot be used for dates
JR Z, CODE_00_2C13                                          ;
PUSH HL                                                     ;
LD HL, CurrentSave_DaysPassed                               ;
LD [HL], A                                                  ;
CALL CalculateIngameTime_00_3C4E                            ;calculate the month and day of the month for that date

LD A, [CurrentMonth]                                        ;
CALL ExtractDateDigits_1E_65CF                              ;

LD DE, $988C                                                ;
POP HL                                                      ;
PUSH HL                                                     ;
ADD HL, DE                                                  ;add offset
PUSH HL                                                     ;
POP DE                                                      ;
LD HL, TEMP_ARRAY                                           ;
LD BC, $0002                                                ;
CALL CopyData_00_0C73                                       ;draw month

LD A, [CurrentDayOfTheMonth]                                ;
CALL ExtractDateDigits_1E_65CF                              ;
LD DE, $988F                                                ;
POP HL                                                      ;
ADD HL, DE                                                  ;
PUSH HL                                                     ;
POP DE                                                      ;
LD HL, TEMP_ARRAY                                           ;
LD BC, $0002                                                ;
CALL CopyData_00_0C73                                       ;draw day

CODE_00_2C13:                                               ;
POP BC                                                      ;
POP DE                                                      ;
POP HL                                                      ;
RET                                                         ;

LoadAndHandleDateSpotChoiceScreen_00_2C17:
CALL ClearFullSizeInfoBoxContents_1E_6669                   ;

LD HL, PlannedDateWhereToMeetString_1E_493A                 ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, AButtonPrompt_1E_48F5                                ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, DateSpotArray                                        ;
LD B, 30                                                    ;
LD A, $FF                                                   ;intiialize available date spots

LOOP_00_2C2D:
LD [HL+], A                                                 ;
DEC B                                                       ;
JR NZ, LOOP_00_2C2D                                         ;

XOR A                                                       ;
LD [CurrentSelectionPage], A                                ;
LD [CurrentSelectionPageOption], A                          ;
LD [ChangedSelectionPageFlag], A                            ;

LD HL, AmountOfAvailableSpots_PhoneCall_1E_5390             ;
LD A, [CurrentMonth]                                        ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;
LD A, [HL]                                                  ;

LD [DateSpotAmount], A                                      ;
CP 22-1                                                     ;
JR NC, CODE_00_2C51                                         ;if the amount of date spots is at or exceeds 22, there will be more selection pages

LD A, $02                                                   ;
JR CODE_00_2C53                                             ;

CODE_00_2C51:
LD A, $03                                                   ;

CODE_00_2C53:
LD [DateSpotMaxPages], A                                    ;

LD HL, AvailableSpotsPerMonth_PhoneCall_1E_539C             ;
LD A, C                                                     ;
CALL GetPointer_00_2F03                                     ;

LD DE, DateSpotArray                                        ;
LD A, [DateSpotAmount]                                      ;
LD B, A                                                     ;
CALL CopyData8Bit_1E_6CD5                                   ;copy these date spots into an array

CALL CheckExtraDateSpotAvailability_1E_6B32                 ;
CALL DrawLocationNamesForPhoneCallInvite_00_2CE3            ;
CALL DrawSidewayCursor_SeparateScreen_1E_66CB               ;

HandleSpotChoiceForInviteScreen_00_2C70:
CALL HandleSpotChoiceForInviteScreenFunctionality_1E_7789   ;

LD A, [ChangedSelectionPageFlag]                            ;
CP $00                                                      ;check if flipped the page
JR Z, CODE_00_2C81                                          ;

CALL DrawLocationNamesForPhoneCallInvite_00_2CE3            ;refresh selection

XOR A                                                       ;
LD [ChangedSelectionPageFlag], A                            ;

CODE_00_2C81:
CALL GenericScreenHandling_00_2FC3                          ;
JR NC, HandleSpotChoiceForInviteScreen_00_2C70              ;

CALL CheckValidDateSpotSelection_1E_780E                    ;
LD A, [HL]                                                  ;
LD [CurrentlyChosenDateSpot], A                             ;become the spot

LD A, SpriteDisplayable_None                                ;
LD [SpriteDisplayables_ID+1], A                             ;

CALL HandleSpriteDisplayablesAndWaitForVBlank_00_3C48       ;
CALL ClearFullSizeInfoBoxContents_1E_6669                   ;

LD HL, PhoneCallDateLocationIsMessage_1E_4952               ;
CALL DrawFromTilemap_1E_79B0                                ;

CALL Wait50Frames_1E_6706                                   ;

LD A, [CurrentlyChosenDateSpot]                             ;check if the date spot is between some values (inside of a shopping center)
CP $07
JR C, CODE_00_2CB5                                          ;
CP $0F
JR NC, CODE_00_2CB5                                         ;

LD HL, PhoneCallDateSpotInShoppingCenterString_1E_495D      ;tell em it's in shopping center
CALL DrawFromTilemap_1E_79B0                                ;

CALL Wait50Frames_1E_6706                                   ;

CODE_00_2CB5:
LD HL, SelectedDateSpotTilemapPosition_1E_4972              ;
LD DE, DateLocationTilemapArray                             ;
LD B, $04                                                   ;
CALL CopyData8Bit_1E_6CD5                                   ;

LD HL, LocationNamePointers_1E_557A                         ;
LD A, [CurrentlyChosenDateSpot]                             ;
CALL GetPointer_00_2F03                                     ;

LD DE, DateLocationTilemapArray+4                           ;
LD B, PlaceName_MaxLength                                   ;
CALL CopyData8Bit_1E_6CD5                                   ;

LD HL, DateLocationTilemapArray                             ;
CALL DrawFromTilemap_1E_79B0                                ;

CALL Wait50Frames_1E_6706                                   ;

LD HL, PhoneCallDateSpotConfirmMessage_1E_4976              ;
CALL DrawFromTilemap_1E_79B0                                ;
JP GenericMessageHandling_00_3023                           ;

DrawLocationNamesForPhoneCallInvite_00_2CE3:
LD HL, LocationChoicesForInviteTilemapPosition_1E_494E      ;
LD DE, DateLocationTilemapArray                             ;
LD B, $04                                                   ;
CALL CopyData8Bit_1E_6CD5                                   ;copy the initial tilemap data

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

LD B, 10                                                    ;display up to 10 locations at once

LOOP_00_2D02:
PUSH HL                                                     ;
PUSH DE                                                     ;
PUSH BC                                                     ;

LD A, [HL]                                                  ;
CP $FF                                                      ;
JR Z, CODE_00_2D20                                          ;skip over invalid locations

LD HL, LocationNamePointers_1E_557A                         ;
CALL GetPointer_00_2F03                                     ;

LD DE, DateLocationTilemapArray+4                           ;
LD B, PlaceName_MaxLength                                   ;
CALL CopyData8Bit_1E_6CD5                                   ;copy the name of the location

LD HL, DateLocationTilemapArray                             ;
CALL DrawFromTilemap_1E_79B0                                ;draw the name

JR CODE_00_2D26                                             ;

CODE_00_2D20:
LD HL, DateLocationTilemapArray                             ;
CALL ClearTilemap_1E_79F0                                   ;this spot is empty

CODE_00_2D26:
POP BC                                                      ;
POP DE                                                      ;
POP HL                                                      ;

INC HL                                                      ;
LD A, [DateLocationTilemapArray]                            ;
LD E, A                                                     ;
LD A, [DateLocationTilemapArray+1]                          ;
LD D, A                                                     ;

PUSH HL                                                     ;
LD HL, $0020                                                ;next row of tiles
ADD HL, DE                                                  ;

LD A, L                                                     ;
LD [DateLocationTilemapArray], A                            ;update VRAM location

LD A, H                                                     ;
LD [DateLocationTilemapArray+1], A                          ;
POP HL                                                      ;

DEC B                                                       ;
JR NZ, LOOP_00_2D02                                         ;
RET                                                         ;

LoadAndHandleDatePhoneCallConfirmationScreen_00_2D44:
CALL DrawPlayerMessagesForDateConfirmation_1E_7983          ;

LD HL, CurrentSave_DaysPassed                               ;
LD A, [SelectedDateDaySlot]                                 ;
LD [HL], A                                                  ;
CALL CalculateIngameTime_00_3C4E                            ;

LD A, [CurrentMonth]                                        ;
CALL ExtractDateDigits_1E_65CF                              ;

LD HL, TEMP_ARRAY                                           ;
LD DE, $9861                                                ;
LD BC, $0002                                                ;
CALL CopyData_00_0C73                                       ;draw date month

LD A, [CurrentDayOfTheMonth]                                ;
CALL ExtractDateDigits_1E_65CF                              ;

LD HL, TEMP_ARRAY                                           ;
LD DE, $9864                                                ;
LD BC, $0002                                                ;
CALL CopyData_00_0C73                                       ;draw date day

CALL DrawTimeAndPlaceConfirmationMessages_1E_7DE8           ;

LD HL, LocationNamePointers_1E_557A                         ;
LD A, [CurrentlyChosenDateSpot]                             ;
CALL GetPointer_00_2F03                                     ;
CALL DrawDatePlanEndMessages_1E_7D9E                        ;
CALL GenericMessageHandling_00_3023                         ;
JP MarkPlannedDateInArray_1E_7E25                           ;

LoadAndHandleGiftPhoneCallScreen_00_2D8A:
CALL HandleFadingOut_1E_6D06                                ;

LD A, LCDControlEnable|LCDSpriteSize                        ;
LDH [Reg_LCDControlAndRender], A                            ;

CALL DrawFullScreenInfoBox_1E_6648                          ;

LD HL, WhomToPhoneCallMessage_1E_47B9                       ;
CALL DrawFromTilemap_1E_79B0                                ;
CALL SeparateScreen_DrawAAndBButtonPrompts_1E_79A4          ;
CALL DrawCharacterNameOptions_1E_72CD                       ;

CALL InitVariablesAndMaybeSpawnCursor_00_313C               ;
CALL HandleSpriteDisplayables_00_3F25                       ;
CALL GenericScreenTransition_00_2FB2                        ;

HandleGiftPhoneCallScreen_00_2DA9:
CALL HandleCharacterSelectFunctionality_1E_7426             ;
CALL GenericScreenHandling_00_2FC3                          ;
JR NC, HandleGiftPhoneCallScreen_00_2DA9                    ;
CP GenericStateChange_Confirm                               ;
JR NZ, CODE_00_2DC0                                         ;

CALL HandleGiftingProcess_00_2DC8                           ;chose to give something, do all the related things, like drawing messages, picking gift and playing an event

XOR A                                                       ;
LD [GenericStateChangeIndicator], A                         ;
LD [SelectedOption], A                                      ;
RET                                                         ;

CODE_00_2DC0:
LD A, SpriteDisplayable_None                                ;
LD [SpriteDisplayables_ID+1], A                             ;
JP HandleSpriteDisplayablesAndWaitForVBlank_00_3C48         ;return from gift character choice

HandleGiftingProcess_00_2DC8:
CALL DrawPhoneCallGeneralMessages_00_3159                   ;
CALL DrawGiftPhoneConversation_1E_7C7C                      ;
CALL GenericMessageHandling_00_3023                         ;

CALL LoadAndHandleGiftSelection_00_2DE0                     ;
CALL HandleMessagesAfterPickingGift_00_2E3E                 ;

CALL MaybePlayEvent_00_2E67                                 ;defintitely play event

LD A, Music_ScheduleScreenOffDay                            ;
CALL ChangeMusic_00_0B12                                    ;
RET                                                         ;

LoadAndHandleGiftSelection_00_2DE0:
CALL DrawGiftChoiceGeneralStrings_1E_6C3A                   ;
CALL CheckPlayerInventory_1E_6829                           ;
CALL CheckPlayerInventoryForGifts_1E_6B65                   ;

XOR A                                                       ;
LD [CurrentSelectionPage], A                                ;

CALL DrawItemNamesInGiftScreen_00_39A7                      ;
CALL DrawItemPageCount_Inventory_1E_7CFC                    ;

XOR A                                                       ;
LD [CurrentSelectionPageOption], A                          ;
LD [ChangedSelectionPageFlag], A                            ;

CALL DrawSidewayCursor_SeparateScreen_1E_66CB               ;

LD A, [PlayerInventoryItemAmount]                           ;check if player has no gifts
CP $00                                                      ;
JR NZ, HandleGiftSelectionScreen_00_2E0E                    ;

LD A, $78                                                   ;automatically place cursor on "go with no gift" option
LD [SpriteDisplayables_YPos+1], A                           ;

LD A, $05                                                   ;place at last option
LD [CurrentSelectionPageOption], A                          ;

HandleGiftSelectionScreen_00_2E0E:
CALL HandleGiftSelectionScreenFunctionality_1E_7830         ;

LD A, [ChangedSelectionPageFlag]                            ;
CP $00                                                      ;
JR Z, CODE_00_2E22                                          ;

CALL DrawItemNamesInGiftScreen_00_39A7                      ;update selection of gifts
CALL DrawItemPageCount_Inventory_1E_7CFC                    ;and update page counter

XOR A                                                       ;
LD [ChangedSelectionPageFlag], A                            ;

CODE_00_2E22:
CALL GenericScreenHandling_00_2FC3                          ;
JR NC, HandleGiftSelectionScreen_00_2E0E                    ;

LD A, [CurrentSelectionPageOption]                          ;
CP $05                                                      ;
JR Z, CODE_00_2E38                                          ;check if picked the option is to not take a present

LD HL, CurrentItemDisplayArray                              ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;
LD A, [HL]                                                  ;selected gift
JR CODE_00_2E3A                                             ;

CODE_00_2E38:
LD A, $FF                                                   ;you decided to invite a character to give them something without actually taking anything

CODE_00_2E3A:
LD [CurrentlyChosenGift], A                                 ;
RET                                                         ;

;continue gift conversation after picking something (or nothing)
HandleMessagesAfterPickingGift_00_2E3E:
LD A, SpriteDisplayable_None                                ;
LD [SpriteDisplayables_ID+1], A                             ;remove cursor sprite

CALL HandleSpriteDisplayablesAndWaitForVBlank_00_3C48       ;

CALL DrawPlayerMessagesAfterPickingGift_1E_6C50             ;
CALL GetCharacterNameForPhoneCall_00_320D                   ;

LD HL, CharacterNameMeetingForGiftTilemapPosition_1E_4AC9   ;
CALL DrawStringInParetheses_1E_7C41                         ;

CALL DrawCharacterMessagesAfterPickingGift_1E_6C6C          ;

CALL GenericMessageHandling_00_3023                         ;

LD A, [SelectedCharacterForDateOrGift]                      ;
LD [SelectedCharacterForGift], A                            ;

LD A, [CurrentlyChosenGift]                                 ;
LD [SelectedGift], A                                        ;
JP RemoveItemFromPlayerInventory_1E_78CA                    ;

;Will load an event maybe
MaybePlayEvent_00_2E67:
CALL EventHandler_00_1340                                   ;

LD A, [CalendarCountdownUninterruptedFlag]                  ;
OR A                                                        ;
JR NZ, CODE_00_2E9C                                         ;check if an event happened. if not, don't need to reload schedule screen things

LD A, [NotGoingOutOnDateFlag]                               ;
OR A                                                        ;
JR Z, CODE_00_2E9C                                          ;

LD A, [CurrentSave_DaysPassed]                              ;
INC A                                                       ;
JR Z, CODE_00_2E9C                                          ;check if christmas time is upon us (game ending, don't need to draw anything schedule screen related)

LD A, [$D25A]
CP $01
JR Z, CODE_00_2E9C

LD A, %00001101                                             ;
LD [ScheduleScreenDrawBits], A                              ;
CALL DrawScheduleScreenThings_00_21C4                       ;

LD A, LCDControlEnable|LCDSpriteSize                        ;
LDH [Reg_LCDControlAndRender], A                            ;
CALL WaitForVBlank_00_0382                                  ;

LD HL, Reg_LCDControlAndRender
SetBit LCDBackgroundRender, [HL]
SetBit LCDSpriteRender, [HL]

CALL FadeInLoop_00_0A4B

CODE_00_2E9C:
LD A, $1E                                                   ;
JP SetProgramBank_00_037B                                   ;

AnimateTimePassing_00_2EA1:
LD A, [CurrentDayOfTheMonth]                                ;
CALL ExtractDateDigits_1E_65CF                              ;
CALL DisplayCalendarSprite_1E_7C9A                          ;display calendar digit sprites based on current day of the month
CALL HandleSpriteDisplayables_00_3F25                       ;

CALL Wait50Frames_1E_6706                                   ;

LD A, SpriteDisplayable_None                                ;
LD [SpriteDisplayables_ID+4], A                             ;remove digits (tearing page)
LD [SpriteDisplayables_ID+5], A                             ;

LOOP_00_2EB8:
CALL AnimateCalendarPageTearing_1E_7CED                     ;
CALL HandleSpriteDisplayables_00_3F25                       ;
CALL WaitForVBlank_00_0382                                  ;

LD A, [TimePassingCounter]                                  ;
INC A                                                       ;
CP $10                                                      ;
JR Z, CODE_00_2ECE

LD [TimePassingCounter], A                                  ;
JR LOOP_00_2EB8                                             ;

CODE_00_2ECE:
LD HL, CurrentSave_DaysPassed                               ;
INC [HL]                                                    ;one day passed

XOR A                                                       ;
LD [DayOffTime], A                                          ;

CALL SetOffDayFlag_1E_6DAA                                  ;
CALL DrawScheduleScreenStats_00_2F0F                        ;

LD A, [CurrentDayOfTheMonth]                                ;
CALL ExtractDateDigits_1E_65CF                              ;
CALL DisplayCalendarSprite_1E_7C9A                          ;respawn calendar sprites to show the next day
CALL HandleSpriteDisplayables_00_3F25                       ;

CALL Wait50Frames_1E_6706                                   ;

CALL HandleSpriteDisplayables_00_3F25                       ;
CALL WaitForVBlank_00_0382                                  ;
RET                                                         ;

;used for transition between work week and off day
RemoveCalendarSprites_00_2EF2:
LD A, SpriteDisplayable_None                                ;
LD [SpriteDisplayables_ID+6], A                             ;remove calendar
LD [SpriteDisplayables_ID+4], A                             ;and its digits
LD [SpriteDisplayables_ID+5], A                             ;
CALL HandleSpriteDisplayables_00_3F25                       ;
JP Wait8VBlanks_1E_65BA                                     ;

;input:
;HL - base data/pointer address
;A - pointer/data pair ID
;output:
;HL - resulting data pointer
GetDataPair_00_2F03:
GetPointer_00_2F03:
SLA A                                                       ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;

LD E, [HL]                                                  ;
INC HL                                                      ;
LD D, [HL]                                                  ;
PUSH DE                                                     ;
POP HL                                                      ;
RET                                                         ;

;Stats AND time+cash display at the top
DrawScheduleScreenStats_00_2F0F:
CALL CalculateIngameTime_00_3C4E                            ;

LD A, [CurrentMonth]                                        ;
CALL ExtractDateDigits_1E_65CF                              ;

LD HL, DecimalDigitArray                                    ;
LD DE, $9821                                                ;
LD BC, $0002                                                ;
CALL TransferData_00_2FA1                                   ;draw month

LD A, [CurrentDayOfTheMonth]                                ;
CALL ExtractDateDigits_1E_65CF                              ;

LD HL, DecimalDigitArray                                    ;
LD DE, $9824                                                ;
LD BC, $0002                                                ;
CALL TransferData_00_2FA1                                   ;draw day

LD A, [CurrentDayOfTheWeek]                                 ;
ADD A, CHARVAL("月")                                         ;
LD [TEMP_ARRAY], A                                          ;

LD HL, TEMP_ARRAY                                           ;
LD DE, $9828                                                ;
LD BC, $0001                                                ;
CALL TransferData_00_2FA1                                   ;draw day of the week symbol

LD HL, CurrentSave_Cash                                     ;
CALL GetHexToDecDigits_00_3CD5                              ;

LD HL, DecimalDigitArray                                    ;
LD DE, $982D                                                ;
LD BC, $0005                                                ;
CALL TransferData_00_2FA1                                   ;draw money

LD HL, CurrentSave_SmartStat                                ;
LD DE, $9946                                                ;
CALL DrawStatNumber_00_2F93                                 ;draw smart value

LD HL, CurrentSave_StyleStat                                ;
LD DE, $9966                                                ;
CALL DrawStatNumber_00_2F93                                 ;draw style value

LD HL, CurrentSave_FitStat                                  ;
LD DE, $9986                                                ;
CALL DrawStatNumber_00_2F93                                 ;draw fit value

LD HL, CurrentSave_SkillStat                                ;
LD DE, $99A6                                                ;
CALL DrawStatNumber_00_2F93                                 ;draw skill value

LD HL, CurrentSave_EnergyStat                               ;
LD DE, $99C6                                                ;
CALL DrawStatNumber_00_2F93                                 ;draw energy value

LD HL, CurrentSave_SenseStat                                ;
LD DE, $99E6                                                ;
CALL DrawStatNumber_00_2F93                                 ;draw sense value
RET                                                         ;

;input:
;HL - address
;DE - VRAM locarion to draw decimal number (3 digits)
DrawStatNumber_00_2F93:
PUSH DE                                                     ;
CALL GetHexToDecDigits_00_3CD5                              ;extract digits from input stat value
LD HL, DecimalDigitArray+2                                  ;
POP DE                                                      ;
LD BC, $0003                                                ;3 digits
JP TransferData_00_2FA1                                     ;transfer to VRAM

;input:
;HL - pointer to data to transfer from
;DE - pointer to location to transfer to
;BC - data size
TransferData_00_2FA1:
CheckPPUModes                                               ;
LD A, [HL]                                                  ;
LD [DE], A                                                  ;
LDH A, [Reg_LCDStatus]                                      ;
BIT 1, A                                                    ;
JR NZ, TransferData_00_2FA1                                 ;

INC HL                                                      ;
INC DE                                                      ;
DEC BC                                                      ;
LD A, B                                                     ;
OR C                                                        ;
JR NZ, TransferData_00_2FA1                                 ;
RET                                                         ;

GenericScreenTransition_00_2FB2:
LD A, LCDControlEnable|LCDSpriteSize                        ;
LDH [Reg_LCDControlAndRender], A                            ;
CALL WaitForVBlank_00_0382                                  ;

LD HL, Reg_LCDControlAndRender                              ;
SetBit LCDBackgroundRender, [HL]                            ;
SetBit LCDSpriteRender, [HL]                                ;
JP HandleFadingIn_1E_6CDC                                   ;

;handles sprite displayables and check if player transitions from current scene
GenericScreenHandling_00_2FC3:
CALL HandleSpriteDisplayables_00_3F25                       ;

LD A, [GenericStateChangeIndicator]                         ;
CP GenericStateChange_Nothing                               ;
JR NZ, CODE_00_2FD2                                         ;

CALL WaitForVBlank_00_0382                                  ;

XOR A                                                       ;nothing happens
RET                                                         ;

CODE_00_2FD2:
SCF                                                         ;something happens
RET                                                         ;

ScheduleScreen_WindowScrollingUp_00_2FD4:
LD A, SpriteDisplayable_None                                ;remove schedule selector sprite
LD [SpriteDisplayables_ID], A                               ;

LDH A, [Reg_LCDControlAndRender]                            ;
OR LCDWindowTilemapSelect|LCDWindowDisplay                  ;
LDH [Reg_LCDControlAndRender], A                            ;enable window layer

LD A, $07                                                   ;initialize its position
LD [Reg_WindowXPosition], A                                 ;

LD A, $8E                                                   ;
LD [Reg_WindowYPosition], A                                 ;

LOOP_00_2FE9:
CALL HandleSpriteDisplayables_00_3F25                       ;
CALL WaitForVBlank_00_0382                                  ;

LD A, [Reg_WindowYPosition]                                 ;
SUB $04                                                     ;scroll up
LD [Reg_WindowYPosition], A                                 ;
CP $40                                                      ;until this value
JR NC, LOOP_00_2FE9                                         ;

LD A, $40                                                   ;fix y-position
LD [Reg_WindowYPosition], A                                 ;
RET                                                         ;

ScheduleScreen_WindowScrollingDown_00_3001:
LD A, SpriteDisplayable_None                                ;
LD [SpriteDisplayables_ID+1], A                             ;

LOOP_00_3006:
CALL HandleSpriteDisplayables_00_3F25                       ;
CALL WaitForVBlank_00_0382                                  ;

LD A, [Reg_WindowYPosition]                                 ;
ADD A, $04                                                  ;
LD [Reg_WindowYPosition], A                                 ;
CP $8E                                                      ;
JR C, LOOP_00_3006                                          ;

;LD A, SpriteDisplayable_ScheduleSelector
XOR A                                                       ;re-enable schedule selector
LD [SpriteDisplayables_ID], A                               ;

LDH A, [Reg_LCDControlAndRender]                            ;
AND ~(LCDWindowTilemapSelect|LCDWindowDisplay)              ;
LDH [Reg_LCDControlAndRender], A                            ;
RET                                                         ;

;Generic message that needs to be dismissed by the player
GenericMessageHandling_00_3023:
XOR A                                                       ;
LD [CurrentScreen_AdvanceSymbolTimer], A                    ;
LD [CurrentScreen_AdvanceSymbolFlag], A                     ;

LOOP_00_302A:
CALL WaitForVBlank_00_0382                                  ;
CALL HandleSpriteDisplayables_00_3F25                       ;

LD A, [JoypadInputPress]                                    ;
BitTest JoypadInput_A, A                                    ;wait for the player to press A
JR NZ, PressedA_00_305D                                     ;

LD A, [CurrentScreen_AdvanceSymbolTimer]                    ;handle blinking cursor animation
INC A                                                       ;
LD [CurrentScreen_AdvanceSymbolTimer], A                    ;
CP $08                                                      ;
JR NZ, LOOP_00_302A                                         ;

XOR A                                                       ;
LD [CurrentScreen_AdvanceSymbolTimer], A                    ;

LD HL, MessageBlinkingCursorTilemapData_1E_5471
LD A, [CurrentScreen_AdvanceSymbolFlag]                     ;
XOR $01                                                     ;
LD [CurrentScreen_AdvanceSymbolFlag], A                     ;
JR NZ, CODE_00_3058                                         ;

CALL DrawFromTilemap_1E_79B0                                ;draw advance symbol
JR LOOP_00_302A                                             ;

CODE_00_3058:
CALL ClearTilemap_1E_79F0                                   ;remove advance symbol
JR LOOP_00_302A                                             ;

PressedA_00_305D:
LD A, SFX_Confirm                                           ;dismissed message
LD [SoundQueue], A                                          ;

LD HL, MessageBlinkingCursorTilemapData_1E_5471             ;remove cursor for sure
CALL ClearTilemap_1E_79F0                                   ;

JP Wait8VBlanks_1E_65BA                                     ;wait a little bit

;Message that happens on the map
MapScreenMessageHandling_00_306B:
XOR A                                                       ;
LD [CurrentScreen_AdvanceSymbolTimer], A                    ;
LD [CurrentScreen_AdvanceSymbolFlag], A                     ;

LOOP_00_3072:
CALL AnimateWalkingSprite_1E_752F                           ;
CALL WaitForVBlank_00_0382                                  ;
CALL HandleSpriteDisplayables_00_3F25                       ;

LD A, [JoypadInputPress]                                    ;
BitTest JoypadInput_A, A                                    ;
JR NZ, CODE_00_30A8                                         ;wait for player to press A to transition from message

LD A, [CurrentScreen_AdvanceSymbolTimer]                    ;
INC A                                                       ;
LD [CurrentScreen_AdvanceSymbolTimer], A                    ;
CP $08                                                      ;
JR NZ, LOOP_00_3072                                         ;

XOR A                                                       ;
LD [CurrentScreen_AdvanceSymbolTimer], A                    ;

LD HL, MessageBlinkingCursorTilemapData_1E_5471             ;
LD A, [CurrentScreen_AdvanceSymbolFlag]                     ;
XOR $01                                                     ;
LD [CurrentScreen_AdvanceSymbolFlag], A                     ;
JR NZ, CODE_00_30A3                                         ;

CALL DrawFromTilemap_1E_79B0                                ;
JR LOOP_00_3072                                             ;

CODE_00_30A3:
CALL ClearTilemap_1E_79F0                                   ;
JR LOOP_00_3072                                             ;

CODE_00_30A8:
LD A, SFX_Confirm                                           ;dismissed message, can continue
LD [SoundQueue], A                                          ;

LD HL, MessageBlinkingCursorTilemapData_1E_5471             ;
CALL ClearTilemap_1E_79F0                                   ;make sure the cursor is removed

JP Wait8VBlanks_1E_65BA                                     ;

LoadMapVisuals_00_30B6:
LD A, [NotGoingOutOnDateFlag]                               ;
OR A                                                        ;check if invited someone to a date
JR Z, CODE_00_30BF                                          ;

CALL HandleFadingOut_1E_6D06                                ;I guess the going on a date procedure does fading on its own

CODE_00_30BF:
CALL InitSpriteDisplayables_1E_6E21                         ;
CALL HandleSpriteDisplayables_00_3F25                       ;
CALL WaitForVBlank_00_0382                                  ;

LD A, $1F                                                   ;
CALL SetProgramBank_00_037B                                 ;

LD HL, GFX_Map_1F_7460                                      ;load map graphics
LD DE, $8800                                                ;
LD BC, $0800                                                ;
CALL CopyData_00_0C73                                       ;

LD A, $1E                                                   ;
CALL SetProgramBank_00_037B                                 ;

LD HL, MapScreenTilemap_1E_5D0B                             ;
CALL DrawFromTilemap_1E_79B0                                ;
JP DrawMapScreen_TextBox_1E_666F                            ;

ReloadOptionsWindow_00_30E7:
LD HL, OptionsWindow_1E_4294                                ;
CALL DrawFromTilemap_1E_79B0                                ;

XOR A                                                       ;
LD [GenericStateChangeIndicator], A                         ;
LD [SelectedOption], A                                      ;

CALL EnableScheduleScreenWindowLayer_00_30FA                ;
JP WaitForVBlank_00_0382                                    ;

EnableScheduleScreenWindowLayer_00_30FA:
LDH A, [Reg_LCDControlAndRender]                            ;
OR LCDWindowTilemapSelect|LCDWindowDisplay                  ;
LDH [Reg_LCDControlAndRender], A                            ;

LD A, $07                                                   ;
LD [Reg_WindowXPosition], A                                 ;

LD A, $40                                                   ;
LD [Reg_WindowYPosition], A                                 ;
JP DrawSidewayCursor_WindowLayer_1E_66AB                    ;

;get item price
;input:
;A - item
;output:
;ItemPrice (16-bit)
GetItemPrice_00_310D:
PUSH AF                                                     ;
LD HL, ItemPrices_1E_587E                                   ;
CALL GetDataPair_00_2F03                                    ;

LD A, L                                                     ;
LD [ItemPrice], A                                           ;

LD A, H                                                     ;
LD [ItemPrice+1], A                                         ;

LD A, [CurrentMonth]                                        ;
LD HL, DiscountedItemsPerMonth_1E_58C4                      ;
CALL GetDataPair_00_2F03                                    ;

POP AF                                                      ;
CP L                                                        ;check first item byte
JR Z, CODE_00_312C                                          ;if matches, this item comes at a discount
CP H                                                        ;check second item byte
JR NZ, RETURN_00_313B                                       ;if doesn't match, return

CODE_00_312C:
LD A, [ItemPrice+1]                                         ;
SRL A                                                       ;slash the price
LD [ItemPrice+1], A                                         ;

LD A, [ItemPrice]                                           ;
RRA                                                         ;50%. Quite a bargain, don't you think?
LD [ItemPrice], A                                           ;

RETURN_00_313B:
RET                                                         ;

InitVariablesAndMaybeSpawnCursor_00_313C:
XOR A                                                       ;
LD [GenericStateChangeIndicator], A                         ;
LD [SelectedOption], A                                      ;

LD A, SpriteDisplayable_None                                ;
LD [SpriteDisplayables_ID], A                               ;

LD A, [CursorSpriteEnabler]                                 ;if this isn't set to $FF, a cursor will spawn
LD [SpriteDisplayables_ID+1], A                             ;

LD A, $18                                                   ;
LD [SpriteDisplayables_XPos+1], A                           ;

LD A, $28                                                   ;
LD [SpriteDisplayables_YPos+1], A                           ;
RET                                                         ;

;using a phone and calling a character
DrawPhoneCallGeneralMessages_00_3159:
CALL InitSpriteDisplayables_1E_6E21                         ;
CALL HandleSpriteDisplayables_00_3F25                       ;
CALL ClearFullSizeInfoBoxContents_1E_6669                   ;
CALL GetCharacterNameForPhoneCall_00_320D                   ;

LD HL, CharacterNameForCallTilemapPosition_1E_4879          ;
CALL StoreTilemapLocationToRAM_1E_7333                      ;

LD A, $02                                                   ;left side of the info box
LD [DynamicTilemapArray+4], A                               ;

LD A, CHARVAL(" ")                                          ;
LD [DynamicTilemapArray+4+CharacterName_MaxLength+1], A     ;space after character name

LD HL, DynamicTilemapArray                                  ;
CALL DrawFromTilemap_1E_79B0                                ;you're calling that character

LD A, [SelectedOption]                                      ;
LD [SelectedCharacterForDateOrGift], A                      ;

LD HL, DecidedToPhoneCallMessage_1E_47CD                    ;
CALL DrawFromTilemap_1E_79B0                                ;

CALL Wait50Frames_1E_6706                                   ;lets go to the phone

LD HL, TypingPhoneNumberOnomatopoeia_1E_47D9                ;
CALL DrawFromTilemap_1E_79B0                                ;typing...

CALL Wait50Frames_1E_6706                                   ;

LD A, SFX_PhoneRing                                         ;
LD [SoundQueue], A                                          ;ring-a-ding-ding

LD HL, PhoneRingOnomatopoeia1_1E_47E5                       ;
CALL DrawFromTilemap_1E_79B0                                ;

CALL Wait50Frames_1E_6706                                   ;
CALL Wait50Frames_1E_6706                                   ;wait whopping 100 frames

LD HL, PhoneRingOnomatopoeia2_1E_47F0                       ;
CALL DrawFromTilemap_1E_79B0                                ;

CALL Wait50Frames_1E_6706                                   ;
CALL Wait50Frames_1E_6706                                   ;wait some more

LD HL, CharacterSpeakingNameTilemapPosition_1E_487D         ;this character is saying...
CALL DrawStringInParetheses_1E_7C41                         ;

LD HL, PhoneCallSuccessMessage_1E_47FB                      ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, CharacterContactedNameTilemapPosition_1E_4881        ;this character is speaking
CALL StoreTilemapLocationToRAM_1E_7333                      ;

LD A, CHARVAL(" ")                                          ;
LD [DynamicTilemapArray+4], A                               ;

LD A, CHARVAL(" ")                                          ;
LD [DynamicTilemapArray+4+CharacterName_MaxLength+1], A     ;

LD HL, DynamicTilemapArray                                  ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, PhoneCallCharacterSpeakingMessage_1E_4802            ;
CALL DrawFromTilemap_1E_79B0                                ;

CALL Wait50Frames_1E_6706                                   ;

LD HL, PhoneCallGreetingMessage_1E_4808                     ;
CALL DrawFromTilemap_1E_79B0                                ;

LD A, PlayerString_SecondName                               ;
LD [PlayerStringType], A                                    ;
CALL GetPlayerStringFromSaveFile_1E_6628                    ;

LD HL, TEMP_ARRAY                                           ;
LD DE, $9926                                                ;
LD BC, PlayerInfo_SecondNameMaxLength                       ;
CALL CopyData_00_0C73                                       ;paste player's name into chat

JP Wait50Frames_1E_6706                                     ;

CheckIfDateArrayIsFull_00_31F8:
LD HL, CurrentSave_PlannedDatesArray                        ;
LD B, 10                                                    ;

LOOP_00_31FD:
LD A, [HL+]                                                 ;check if at least one time slot is available
CP $FF                                                      ;
JR Z, CODE_00_320B                                          ;

LD DE, $0005                                                ;
ADD HL, DE                                                  ;
DEC B                                                       ;
JR NZ, LOOP_00_31FD                                         ;

XOR A                                                       ;if somehow all date slots are occupied, can't invite anymore
RET                                                         ;

CODE_00_320B:
SCF                                                         ;can invite on dates
RET                                                         ;

GetCharacterNameForPhoneCall_00_320D:
LD A, [SelectedOption]                                      ;remember the character we selected previously

LD HL, CharacterNameListOffsets_00_322B                     ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;

LD A, [HL]                                                  ;
LD HL, CharacterNameList_1E_45BE                            ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;
LD DE, DynamicTilemapArray+5                                ;will draw it later
LD B, CharacterName_MaxLength                               ;

LOOP_00_3224:
LD A, [HL+]                                                 ;
LD [DE], A                                                  ;
INC DE                                                      ;
DEC B                                                       ;
JR NZ, LOOP_00_3224                                         ;
RET                                                         ;

;4 skips over intiial tilemap info
CharacterNameListOffsets_00_322B:
db 4
db 4+(CharacterName_MaxLength*1)
db 4+(CharacterName_MaxLength*2)
db 4+(CharacterName_MaxLength*3)
db 4+(CharacterName_MaxLength*4)
db 4+(CharacterName_MaxLength*5)
db 4+(CharacterName_MaxLength*6)

;input:
;B - item ID
;C - position of the string index
DrawItemName_00_3232:
PUSH HL
PUSH DE
PUSH BC
LD A, B
LD [$D231], A

LD A, C
LD [$D22F], A
LD HL, ItemNameStringPositionPointers_1E_58DC
CALL GetPointer_00_2F03
CALL StoreTilemapLocationToRAM_1E_7333

PUSH DE
LD A, [$D231]
LD HL, ItemNamePointers_1E_591C
CALL GetPointer_00_2F03
POP DE

LD B, ItemName_MaxLength                                    ;

LOOP_00_3253:
LD A, [HL+]                                                 ;copy item's name
LD [DE], A                                                  ;
INC DE                                                      ;
DEC B                                                       ;
JR NZ, LOOP_00_3253                                         ;

LD HL, DynamicTilemapArray                                  ;
CALL DrawFromTilemap_1E_79B0                                ;draw that item name
POP BC                                                      ;
POP DE                                                      ;
POP HL                                                      ;
RET                                                         ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Generic activity option code
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

GenericActivityOption_00_3263:
LD A, [HolidayOrWeekendFlag]                                ;check if selecting activity on a weekend
CP $00                                                      ;
JR NZ, CODE_00_3280                                         ;

LD A, [ScheduleScreen_CurrentSelectionIndex]                ;calculate where we're scheduling this
LD C, A                                                     ;
LD B, $00                                                   ;
LD HL, CurrentSave_ScheduledActivities                      ;
ADD HL, BC                                                  ;

LD A, [ScheduleScreen_PickedOption]                         ;
LD [HL], A                                                  ;schedule the picked option

CODE_00_3278:
LD A, $01                                                   ;
LD [SelectedScheduleOptionFlag], A                          ;any normal activity certainly counts as something scheduled
JP DrawScheduleScreenElements_1E_6F3A                       ;update everything

CODE_00_3280:
LD A, [ScheduleScreen_PickedOption]                         ;schedule the picked option for the off day
CALL ScheduleOffDayActivity_1E_691A                         ;
JR CODE_00_3278                                             ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Calendar screen code
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

TransitionToCalendarScreen_00_3288:
CALL HandleFadingOut_1E_6D06                                ;

LD A, LCDControlEnable                                      ;
LDH [Reg_LCDControlAndRender], A                            ;

CALL LoadCalendarVisuals_00_32B3                            ;
CALL HandleSpriteDisplayables_00_3F25                       ;
CALL WaitForVBlank_00_0382                                  ;

LD HL, Reg_LCDControlAndRender                              ;
SetBit LCDBackgroundRender, [HL]                            ;
SetBit LCDSpriteRender, [HL]                                ;
CALL HandleFadingIn_1E_6CDC                                 ;

HandleCalendarScreen_00_32A2:
CALL HandleCalendarScreenFunctionality_1E_6FD2              ;buttons do things

CALL GenericScreenHandling_00_2FC3                          ;
JR NC, HandleCalendarScreen_00_32A2                         ;

CALL HandleFadingOut_1E_6D06                                ;fade out

CALL DrawScheduleScreenThingsOnReturn_00_2540
JP GenericScreenTransition_00_2FB2                          ;

;calendar drawing code here
LoadCalendarVisuals_00_32B3:
LD A, $1F                                                   ;
CALL SetProgramBank_00_037B                                 ;

LD HL, GFX_Calendar_1F_5400                                 ;load calendar graphics
LD DE, $8800                                                ;
LD BC, $0640
CALL CopyData_00_0C73                                       ;

LD A, $1E                                                   ;
CALL SetProgramBank_00_037B                                 ;

LD HL, TilemapClearData_FullScreen_1E_4E0C                  ;wipe full screen
CALL ClearTilemap_1E_79F0                                   ;

LD HL, TilemapClear_WindowLayer_1E_406F                     ;and window as well
CALL ClearTilemap_1E_79F0                                   ;

LD HL, Calendar_Weekdays_1E_4073                            ;draw MON through SUN
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, Calendar_Weekdays_NextMonth_1E_408B                  ;MON through SUN on the next page
CALL DrawFromTilemap_1E_79B0                                ;

LD HL,Calendar_NextPageCursor_1E_40A3                       ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, Calendar_PreviousPageCursor_1E_40A8                  ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, Calendar_CurrentMonthNumberTilemapLocation_1E_5DFF   ;
LD A, [CurrentMonth]                                        ;
SUB $03                                                     ;don't forget that we're skipping first three months since they are unplayable
LD [Calendar_MonthForNumber], A                        ;
CALL DisplayMonthNumberForCalendar_00_3353                  ;

LD HL, Calendar_NextMonthNumbeTilemapLocation_1E_5E03       ;
LD A, [CurrentMonth]                                        ;
SUB $02                                                     ;next month is current month +1
LD [Calendar_MonthForNumber], A                             ;
CALL DisplayMonthNumberForCalendar_00_3353                  ;

LD A, [CurrentMonth]                                        ;
LD [Calendar_Month], A                                      ;

StoreWord $9860, Calendar_DayAndEventBaseVRAM               ;
CALL DisplayDaysOnCalendar_00_3377                          ;draw days/events of the current month

LD A, [CurrentMonth]                                        ;
CP Month_December                                           ;check if current month is december
JR NZ, CODE_00_3329                                         ;

LD HL, TilemapClear_Calendar_NextMonthCursor_1E_4D5E        ;can't check month if at the end of the year
CALL ClearTilemap_1E_79F0                                   ;(despite that, it'll still try to draw something on the window layer)

CODE_00_3329:
LD A, [CurrentMonth]                                        ;
INC A                                                       ;
LD [Calendar_Month], A                                      ;

StoreWord $9C60, Calendar_DayAndEventBaseVRAM               ;
CALL DisplayDaysOnCalendar_00_3377                          ;draw days/events of the next month

XOR A                                                       ;
LD [Calendar_DayWithinMonth], A                             ;
LD [Calendar_CurrentPage], A                                ;
LD [$D229], A
LD [GenericStateChangeIndicator], A                         ;

LD A, SpriteDisplayable_None                                ;
LD [SpriteDisplayables_ID], A                               ;no sprite displayables in calendar screen
LD [SpriteDisplayables_ID+1], A                             ;
RET                                                         ;

DisplayMonthNumberForCalendar_00_3353:
CALL StoreTilemapLocationToRAM_1E_7333                      ;

LD HL, MonthNumberTiles_1E_5E07                             ;start calculating what number we're gonna display
LD A, [Calendar_MonthForNumber]                             ;
SLA A                                                       ;
SLA A                                                       ;
SLA A                                                       ;
LD B, $00                                                   ;
LD C, A                                                     ;
ADD HL, BC                                                  ;

LD DE, DynamicTilemapArray+4                                ;
LD B, $08                                                   ;8 tiles

LOOP_00_336B:
LD A, [HL+]                                                 ;
LD [DE], A                                                  ;
INC DE                                                      ;
DEC B                                                       ;
JR NZ, LOOP_00_336B                                         ;

LD HL, DynamicTilemapArray                                  ;display that number
JP DrawFromTilemap_1E_79B0                                  ;

;input A - month to display days of
DisplayDaysOnCalendar_00_3377:
LD HL, Calendar_MonthStartingWeekday_1E_5E4F                ;
LD A, [Calendar_Month]                                      ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;

LD A, [HL]                                                  ;initial weekday to start drawing days on the calendar from
LD [Calendar_Weekday], A                                    ;

LD HL, Calendar_MonthStartingDay_1E_5E69                    ;
ADD HL, BC                                                  ;
LD A, [HL]                                                  ;
LD [Calendar_Day], A                                        ;

LD HL, Calendar_MonthDuration_1E_5E5C                       ;
ADD HL, BC                                                  ;
LD E, [HL]                                                  ;month duration

LD A, $01                                                   ;every month starts from day 1. Shocking, I know.
LD [Calendar_DayWithinMonth], A

XOR A                                                       ;
LD [Calendar_DayWithinMonth+1], A                           ;limit days to 8-bit

LD A, [Calendar_DayAndEventBaseVRAM]                        ;
LD L, A                                                     ;HL - VRAM

LD A, [Calendar_DayAndEventBaseVRAM+1]                      ;
LD H, A                                                     ;

LD A, [Calendar_Weekday]                                    ;
LD C, A                                                     ;
ADD HL, BC                                                  ;
ADD HL, BC                                                  ;
ADD HL, BC                                                  ;VRAM + (weekday*3)

LD B, E                                                     ;month duration for real

LOOP_00_33AB:
PUSH BC                                                     ;
PUSH HL                                                     ;

LD HL, Calendar_DayWithinMonth                              ;
CALL GetHexToDecDigits_00_3CD5                              ;
CALL CalendarDisplay_CheckIfCurrentDayIsFree_00_341A        ;

LD HL, DecimalDigitArray+3                                  ;
POP DE                                                      ;pops HL as DE (which is VRAM)
PUSH DE                                                     ;
LD BC, $0002                                                ;
CALL CopyData_00_0C73                                       ;draw day digit(s)
POP HL                                                      ;pops DE back as HL

PUSH HL                                                     ;
CALL CalendarDisplay_MaybeDisplayEventIcon_00_3476          ;
POP HL                                                      ;

LD BC, $0003                                                ;next day VRAM
ADD HL, BC                                                  ;

LD A, [Calendar_Weekday]                                    ;
INC A                                                       ;
CP Weekday_Sunday+1                                         ;check if we should move to next week
JR NZ, CODE_00_33D8                                         ;

LD BC, $004B                                                ;VRAM wrap around
ADD HL, BC                                                  ;

XOR A                                                       ;reset to monday

CODE_00_33D8:
LD [Calendar_Weekday], A                                    ;
POP BC                                                      ;

LD A, [Calendar_DayWithinMonth]                             ;
INC A                                                       ;
LD [Calendar_DayWithinMonth], A                             ;

LD A, [Calendar_Day]                                        ;
INC A                                                       ;
LD [Calendar_Day], A                                        ;

LD A, [Calendar_Month]                                      ;
CP Month_April                                              ;
JR NZ, CODE_00_33FC                                         ;

LD A, [Calendar_DayWithinMonth]                             ;
CP 14                                                       ;
JR NZ, CODE_00_33FC                                         ;

XOR A                                                       ;
LD [Calendar_Day], A                                        ;

CODE_00_33FC:
LD A, [Calendar_DayWithinMonth]                             ;check if reached the end of the month and drew all days and stuff
CP B                                                        ;
JR NZ, LOOP_00_33AB                                         ;

LD A, [Calendar_Month]                                      ;
CP Month_June                                               ;
RET NZ                                                      ;

LD A, [Calendar_DayAndEventBaseVRAM+1]                      ;
CP $98                                                      ;check if June's page is current page or next
JR NZ, CODE_00_3414                                         ;

LD HL, Tilemap_Calendar_JuneSharedWeekend_1E_4D4E           ;draw shared weekend special tiles
JR CODE_00_3417                                             ;

CODE_00_3414:
LD HL, Tilemap_Calendar_JuneSharedWeekend_NextMonth_1E_4D56 ;draw shared weekend special tiles but on window layer

CODE_00_3417:
JP DrawFromTilemap_1E_79B0                                  ;

CalendarDisplay_CheckIfCurrentDayIsFree_00_341A:
PUSH HL                                                     ;
PUSH DE                                                     ;
PUSH BC                                                     ;
LD A, [Calendar_Month]                                      ;
CP Month_April                                              ;check if current month is april
JR NZ, CODE_00_342B                                         ;

LD A, [Calendar_DayWithinMonth]                             ;
CP 14                                                       ;days before april 14 cannot have events (game starts on April 14)
JR C, CODE_00_3439                                          ;

CODE_00_342B:
LD A, [Calendar_Month]                                      ;
CP Month_December                                           ;
JR NZ, CODE_00_3446                                         ;

LD A, [Calendar_DayWithinMonth]                             ;
CP 25                                                       ;check for days beyond christmas
JR C, CODE_00_3446                                          ;there cannot be any events past that, because the game ends on christmas

CODE_00_3439:
XOR A                                                       ;
LD [Calendar_Event], A                                      ;

LD A, [Calendar_Weekday]                                    ;inaccessible days, print weekends like normal
CP Weekday_Sunday                                           ;
JR Z, CODE_00_3458                                          ;sunday is always the free day, indicated with dark numbers
JR CODE_00_3472                                             ;

CODE_00_3446:
LD HL, EventPerDay_1E_5476                                  ;
LD A, [Calendar_Day]                                        ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;

LD A, [HL]                                                  ;
LD [Calendar_Event], A                                      ;check if the event on this day is.....
CP Event_OffDay                                             ;
JR NZ, CODE_00_3472                                         ;...not holiday, skip

CODE_00_3458:
LD A, [TEMP_ARRAY+3]                                        ;check if empty space
CP $00                                                      ;
JR Z, CODE_00_3464                                          ;
ADD A, $58                                                  ;white number against black background, indicating it's a holiday or weekend
LD [TEMP_ARRAY+3], A                                        ;

CODE_00_3464:
LD A, [TEMP_ARRAY+4]                                        ;
CP $00                                                      ;
JR Z, CODE_00_3472                                          ;
ADD A, $58                                                  ;
LD [TEMP_ARRAY+4], A                                        ;
JR CODE_00_3472                                             ;very easy optimization for those who care

CODE_00_3472:
POP BC                                                      ;
POP DE                                                      ;
POP HL                                                      ;
RET                                                         ;

CalendarDisplay_MaybeDisplayEventIcon_00_3476:
PUSH HL                                                     ;
PUSH DE                                                     ;
PUSH BC                                                     ;
LD A, [Calendar_Event]                                      ;check if event is...
CP Event_RandomCharStatCheck                                ;
JR NC, CODE_00_349A                                         ;under a certain threshold. don't display every single event!

LD BC, $0020                                                ;draw icon under the day number
ADD HL, BC                                                  ;

LD A, L                                                     ;
LD [DynamicTilemapArray], A                                 ;

LD A, H                                                     ;
LD [DynamicTilemapArray+1], A                               ;

LD HL, CODE_00_349A                                         ;
PUSH HL                                                     ;

LD HL, Calendar_EventIconDrawCodePointers_00_349E           ;
LD A, [Calendar_Event]                                      ;
CALL GetPointer_00_2F03                                     ;
JP HL                                                       ;

CODE_00_349A:
POP BC                                                      ;
POP DE                                                      ;
POP HL                                                      ;
RET                                                         ;

Calendar_EventIconDrawCodePointers_00_349E:
dw RETURN_00_34B0                                           ;Christmas (draw nothing)
dw CalendarDisplay_MaybeDrawDateIcon_00_34B1
dw CalendarDisplay_DisplayJobOrClubIcon_00_34B8
dw CalendarDisplay_DisplayEventIcon_00_34CE
dw CalendarDisplay_DisplayEventIcon_00_34CE
dw CalendarDisplay_DisplayEventIcon_00_34CE
dw CalendarDisplay_DisplayEventIcon_00_34CE
dw CalendarDisplay_DisplayJobOrClubIcon_00_34B8
dw RETURN_00_34B0                                           ;draw nothing

RETURN_00_34B0:
RET                                                         ;

CalendarDisplay_MaybeDrawDateIcon_00_34B1:
CALL CalendarDisplay_CheckForPlannedDates_1E_7A4F           ;
RET NC                                                      ;if date is not planned on this free day, return
JP CalendarDisplay_DisplayEventIcon_00_34CE                 ;will display an icon

CalendarDisplay_DisplayJobOrClubIcon_00_34B8:
LD A, [CurrentSave_SelectedJobOrClub]                       ;check if player is...
CP ClubOrJob_None                                           ;unemployed
RET Z                                                       ;don't display anything
CP ClubOrJob_PartTimeJob                                    ;display job icon if applied to part-time job
JR NZ, CODE_00_34C6                                         ;

LD A, $07                                                   ;part-time job day
JR CODE_00_34C8                                             ;

CODE_00_34C6:
LD A, $02                                                   ;club day

CODE_00_34C8:
LD [Calendar_Event], A                                      ;
JP CalendarDisplay_DisplayEventIcon_00_34CE                 ;

CalendarDisplay_DisplayEventIcon_00_34CE:
LD A, $02                                                   ;size of the icon is 16x16
LD [DynamicTilemapArray+2], A                               ;
LD [DynamicTilemapArray+3], A                               ;

LD HL, Calendar_IconTilemapPointers_1E_5E76                 ;
LD A, [Calendar_Event]                                      ;
CALL GetPointer_00_2F03                                     ;

LD B, $04                                                   ;copy these tiles into tilemap array
LD DE, DynamicTilemapArray+4                                ;
CALL CopyData8Bit_1E_6CD5                                   ;

LD HL, DynamicTilemapArray                                  ;display the icon
JP DrawFromTilemap_1E_79B0                                  ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Save option code
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

InitSaveGameOption_00_34ED:
LD HL, SaveOptionMessage_1E_4257                            ;
CALL ScheduleScreen_ClearSelectionWindowAndDraw_00_3BB1     ;

XOR A                                                       ;
LD [SelectedOption], A                                      ;default to first save file (or diary as the game calls it)
LD [$D229], A                                               ;
LD [GenericStateChangeIndicator], A                         ;

CALL GenericMessageHandling_00_3023                         ;

LD HL, DiarySelectionForSave_1E_426B ;
CALL ScheduleScreen_ClearSelectionWindowAndDraw_00_3BB1     ;

CALL DrawSidewayCursor_ActionWindow_1E_66BB                 ;

HandleSaveWindow_00_3509:
CALL HandleSaveWindowFunctionality_1E_70A6                  ;

CALL GenericScreenHandling_00_2FC3                          ;
JR NC, HandleSaveWindow_00_3509                             ;
CP GenericStateChange_Confirm                               ;check if pressed A to save the game
RET NZ                                                      ;

;save to this diary
CALL SaveToSaveFile_1E_6D3F                                 ;

LD A, SpriteDisplayable_None                                ;
LD [SpriteDisplayables_ID+1], A                             ;
CALL HandleSpriteDisplayables_00_3F25                       ;

CALL WaitForVBlank_00_0382                                  ;

LD HL, ProgressSavedMessage_1E_427E  ;
CALL ScheduleScreen_ClearSelectionWindowAndDraw_00_3BB1     ;
JP GenericMessageHandling_00_3023                           ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Game options... option code
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

InitGameOptions_00_352B:
LD HL, OptionsWindow_1E_4294                                ;
CALL DrawFromTilemap_1E_79B0                                ;

XOR A                                                       ;
LD [GenericStateChangeIndicator], A                         ;
LD [SelectedOption], A                                      ;
CALL ScheduleScreen_WindowScrollingUp_00_2FD4               ;

LOOP_00_353B:
CALL DrawSidewayCursor_WindowLayer_1E_66AB                  ;

HandleGameOptionWindow_00_353E:
CALL HandleOptionsWindowFunctionality_1E_70FA               ;
CALL GenericScreenHandling_00_2FC3                          ;
JR NC, HandleGameOptionWindow_00_353E                       ;
CP GenericStateChange_Confirm                               ;
JR NZ, CODE_00_3552                                         ;

CALL ExecuteSelectedGameOptionCode_00_3555                  ;
CALL ReloadOptionsWindow_00_30E7                            ;
JR LOOP_00_353B                                             ;return to the options window

CODE_00_3552:
JP ScheduleScreen_WindowScrollingDown_00_3001               ;

ExecuteSelectedGameOptionCode_00_3555:
CALL Wait8VBlanks_1E_65BA                                   ;
LD HL, RETURN_00_3566                                       ;
PUSH HL                                                     ;
LD HL, GameOptionsCodePointers_00_3567                      ;
LD A, [SelectedOption]                                      ;
CALL GetPointer_00_2F03                                     ;
JP HL                                                       ;

RETURN_00_3566:
RET                                                         ;

GameOptionsCodePointers_00_3567:
dw LoadAndHandleCDOption_00_356B
dw LoadAndHandleSaveDeletionOption_00_3597

LoadAndHandleCDOption_00_356B:
CALL LoadCDLinkOptionGeneralLayout_1E_7A71                  ;

LD A, SpriteDisplayable_SidewayCursor                       ;
LD [SpriteDisplayables_ID+1], A                             ;

LD A, $18                                                   ;
LD [SpriteDisplayables_XPos+1], A                           ;

LD A, $70                                                   ;
LD [SpriteDisplayables_YPos+1], A                           ;

XOR A                                                       ;
LD [SelectedOption], A                                      ;
LD [GenericStateChangeIndicator], A                         ;

HandleCDLinkOption_00_3584:
CALL HandleCDLinkOptionFunctionality_1E_7A9E                ;
CALL GenericScreenHandling_00_2FC3                          ;
JR NC, HandleCDLinkOption_00_3584                           ;
CP GenericStateChange_Confirm                               ;
JR NZ, RETURN_00_3596                                       ;

LD A, [SelectedOption]                                      ;change
LD [CurrentSave_CDLinkFlag], A                              ;

RETURN_00_3596:
RET                                                         ;

LoadAndHandleSaveDeletionOption_00_3597:
LD HL, TilemapClear_WindowContents_1E_5469                  ;
CALL ClearTilemap_1E_79F0                                   ;

LD HL, DiarySelectionForDeleteStrings_1E_4360               ;
CALL DrawFromTilemap_1E_79B0                                ;

LD A, SpriteDisplayable_SidewayCursor                       ;
LD [SpriteDisplayables_ID+1], A                             ;

LD A, $18                                                   ;
LD [SpriteDisplayables_XPos+1], A                           ;

LD A, $68                                                   ;
LD [SpriteDisplayables_YPos+1], A                           ;

XOR A                                                       ;
LD [SelectedOption], A                                      ;
LD [GenericStateChangeIndicator], A                         ;

HandleSaveDeletionOption_00_35B9:
CALL HandleSaveDeletionOptionFunctionality_1E_7AD2          ;
CALL GenericScreenHandling_00_2FC3                          ;
JR NC, HandleSaveDeletionOption_00_35B9                     ;
CP GenericStateChange_Confirm                               ;
RET NZ                                                      ;

LD A, SpriteDisplayable_None                                ;
LD [SpriteDisplayables_ID+1], A                             ;

CALL GenericScreenHandling_00_2FC3                          ;
CALL DrawCurrentSaveSelectedForDeletionMessage_1E_7B1E      ;

XOR A                                                       ;
LD [GenericStateChangeIndicator], A                         ;

HandleSaveDeletionConfirmation_00_35D3:
CALL HandleSaveDeletionConfirmationFunctionality_1E_7B69    ;
CALL GenericScreenHandling_00_2FC3                          ;
JR NC, HandleSaveDeletionConfirmation_00_35D3               ;
CP GenericStateChange_Confirm                               ;check if player confirmed save deletion
RET NZ                                                      ;

CALL HandleSaveFileDeletion_1E_7B4B                         ;bye bye to diary
JP Wait50Frames_1E_6706                                     ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Quit option code
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

InitQuitGameOption_00_35E4:
LD HL, ConfirmQuitGameMessage_1E_4646                       ;
CALL ScheduleScreen_ClearSelectionWindowAndDraw_00_3BB1     ;

CALL ScheduleScreen_DrawAAndBButtonPrompts_1E_799E          ;
CALL Wait8VBlanks_1E_65BA                                   ;

HandleQuitGameOption_00_35F0:
CALL HandleSpriteDisplayables_00_3F25                       ;

LD A, [JoypadInputPress]                                    ;
BitTest JoypadInput_A, A                                    ;
JR NZ, PressedA_00_3603                                     ;

BitTest JoypadInput_B, A                                    ;
JR NZ, PressedB_00_3609                                     ;

CALL WaitForVBlank_00_0382                                  ;
JR HandleQuitGameOption_00_35F0                             ;

;quit game
PressedA_00_3603:
LD A, $02                                                   ;quit game, game will reset itself
LD [QuitGameFlag], A                                        ;
RET                                                         ;

;did not quit game
PressedB_00_3609:
LD A, SFX_Cancel                                            ;
LD [SoundQueue], A                                          ;
RET                                                         ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Relationship viewer option code
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

TransitionToRelationshipViewer_00_360F:
CALL LoadAndHandleRelationshipViewer_00_270E                ;

CALL DrawScheduleScreenThingsOnReturn_00_2540               ;

XOR A                                                       ;
LD [GenericStateChangeIndicator], A                         ;
LD [SelectedOption], A                                      ;

LD A, LCDControlEnable|LCDSpriteSize                        ;
LDH [Reg_LCDControlAndRender], A                            ;

;LD A, SpriteDisplayable_ScheduleSelector
XOR A                                                       ;
LD [SpriteDisplayables_ID], A                               ;
CALL WaitForVBlank_00_0382                                  ;

LD HL, Reg_LCDControlAndRender                              ;
SetBit LCDBackgroundRender, [HL]                            ;
SetBit LCDSpriteRender, [HL]                                ;

JP HandleFadingIn_1E_6CDC                                   ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;go to a screen where you pick a character to invite while taking a walk
LoadAndHandleCharacterInviteOnWalkScreen_00_3631:
LD A, [CurrentProgramBank]                                  ;
PUSH AF                                                     ;
LD A, $1E                                                   ;
CALL SetProgramBank_00_037B                                 ;

LD A, LCDControlEnable|LCDSpriteSize                        ;
LDH [Reg_LCDControlAndRender], A                            ;
CALL DrawFullScreenInfoBox_1E_6648                          ;

LD HL, WhomToInviteOnWalkMessage_1E_4CAD                    ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, AButtonPrompt_1E_48F5                                ;
CALL DrawFromTilemap_1E_79B0                                ;

CALL DrawCharacterNameOptions_1E_72CD                       ;
CALL InitSpriteDisplayables_1E_6E21                         ;
CALL InitVariablesAndMaybeSpawnCursor_00_313C               ;
CALL HandleSpriteDisplayables_00_3F25                       ;
CALL GenericScreenTransition_00_2FB2                        ;

HandleCharacterInviteOnWalk_00_365C:
CALL HandleCharacterSelectFunctionality_1E_7426             ;
CALL GenericScreenHandling_00_2FC3                          ;
JR NC, HandleCharacterInviteOnWalk_00_365C                  ;
CP GenericStateChange_Cancel                                ;
JR NZ, CODE_00_366E                                         ;

XOR A                                                       ;
LD [GenericStateChangeIndicator], A                         ;can't back out
JR HandleCharacterInviteOnWalk_00_365C                      ;

CODE_00_366E:
LD A, [SelectedOption]                                      ;
LD [SelectedCharacterForDateOrGift], A                      ;
CALL ClearFullSizeInfoBoxContents_1E_6669                   ;

LD HL, WhatItemToUseOnWalkMessage_1E_4CBC                   ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, AButtonPrompt_1E_48F5                                ;
CALL DrawFromTilemap_1E_79B0                                ;

CALL DrawItemNamesForCharacterInviteOnWalk_1E_7E4A          ;
CALL InitVariablesAndMaybeSpawnCursor_00_313C               ;
CALL HandleSpriteDisplayables_00_3F25                       ;

HandleItemSelectionForCharacterInviteOnWalk_00_368C:
CALL HandleItemSelectForCharacterInviteOnWalkFunctionality_1E_7E8F

CALL GenericScreenHandling_00_2FC3                          ;
JR NC, HandleItemSelectionForCharacterInviteOnWalk_00_368C  ;

LD A, SpriteDisplayable_None                                ;
LD [SpriteDisplayables_ID+1], A                             ;
CALL HandleSpriteDisplayables_00_3F25                       ;

CALL WaitForVBlank_00_0382                                  ;

CALL DrawWaitForCharacterToComeMessages_1E_7EDC             ;
CALL CheckCharacterInviteSyccessWhileWalkingOut_00_36BD     ;
JR C, CODE_00_36B2                                          ;skip over if the character did come

LD A, $01                                                   ;
LD [NotGoingOutOnDateFlag], A                               ;

LD HL, CharacterDidntComeMessage_1E_4D30                    ;draw a fail message
CALL DrawFromTilemap_1E_79B0                                ;

CODE_00_36B2:
CALL GenericMessageHandling_00_3023                         ;
CALL HandleFadingOut_1E_6D06                                ;
POP AF                                                      ;
CALL SetProgramBank_00_037B                                 ;
RET                                                         ;

CheckCharacterInviteSyccessWhileWalkingOut_00_36BD:
LD A, [ChosenMapSpot]                                       ;
CP $14
JR NC, CharacterInviteFail_00_36FD                          ;the character will never show up in some areas (season-specific like a beach or sakura woods)

LD A, [SelectedOption]                                      ;selected character may or may not come
LD B, A                                                     ;
LD A, [SelectedCharacterForDateOrGift]                      ;
CALL CheckDateInvitationSuccess_00_3D9B                     ;
JR NC, CharacterInviteFail_00_36FD                          ;

;success!
LD HL, CurrentDateSpotStorage                               ;
LD A, [SelectedCharacterForDateOrGift]                      ;
SLA A                                                       ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;

LD A, [ChosenMapSpot]                                       ;
LD [HL], A                                                  ;

LD HL, CurrentDateSpotStorageCopy                           ;you'll have an opportunity to invite them somewhere with this
LD A, [SelectedCharacterForDateOrGift]                      ;
SLA A                                                       ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;

LD A, [ChosenMapSpot]                                       ;
LD [HL], A                                                  ;

LD A, [SelectedCharacterForDateOrGift]                      ;
LD [CharacterOnADate], A                                    ;summon that character

LD A, $01
LD [$D25A], A

SCF                                                         ;
RET                                                         ;

;failed to invite someone that someone
CharacterInviteFail_00_36FD:
XOR A                                                       ;
LD [ChosenMapSpot], A                                       ;
RET                                                         ;

HandleTransitionIntoScheduleScreen_00_3702:
LD A, [TransitionToScheduleScreenFromTitleScreenFlag]       ;
CP $63                                                      ;
JR NZ, RETURN_00_3710                                       ;

XOR A                                                       ;
LD [TransitionToScheduleScreenFromTitleScreenFlag], A       ;other screens do the transition so this is not needed anymore
CALL GenericScreenTransition_00_2FB2                        ;

RETURN_00_3710:
RET                                                         ;

;related to moving on map and stuff
UpdatePlayerPlacementAndSpotNameOnMap_00_3711:
LD HL, AvailableSpotsPerMonth_MapScreen_1E_57EB             ;
LD A, [CurrentMonth]                                        ;
CALL GetPointer_00_2F03                                     ;

LD A, [SelectedOption]                                      ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;

LD A, [HL]                                                  ;
LD [CurrentlySelectedMapSpot], A                            ;update selected date spot

LD HL, Map_PlayerXPosPerLocation_1E_57A3                    ;
LD C, A                                                     ;
ADD HL, BC                                                  ;
LD A, [HL]                                                  ;
LD [SpriteDisplayables_XPos+2], A                           ;

LD HL, Map_PlayerYPosPerLocation_1E_57C1                    ;
LD A, [CurrentlySelectedMapSpot]                            ;
LD C, A                                                     ;
ADD HL, BC                                                  ;
LD A, [HL]                                                  ;
LD [SpriteDisplayables_YPos+2], A                           ;

CALL AnimateWalkingSprite_1E_752F                           ;

LD HL, SelectedMapSpotNameTilemapLocation_1E_5576           ;
LD DE, DynamicTilemapArray                                  ;
LD B, 4                                                     ;
CALL CopyData8Bit_1E_6CD5                                   ;
PUSH DE                                                     ;
LD HL, LocationNamePointers_1E_557A                         ;
LD A, [CurrentlySelectedMapSpot]                            ;
CALL GetPointer_00_2F03                                     ;get name for the currently selected location
POP DE                                                      ;
LD B, PlaceName_MaxLength                                   ;length of the location name
CALL CopyData8Bit_1E_6CD5                                   ;

LD HL, DynamicTilemapArray                                  ;
JP DrawFromTilemap_1E_79B0                                  ;display current location name

HandleMapScreenFunctionality_00_375E:
LD A, [JoypadInputPress]                                    ;
BitTest JoypadInput_A, A                                    ;
JP NZ, GenericAButtonResponse_1E_66E2                       ;

BitTest JoypadInput_B, A                                    ;
JR NZ, PressedB_00_3775                                     ;

BitTest JoypadInput_Left, A                                 ;
JP NZ, PressedLeft_00_377C                                  ;

BitTest JoypadInput_Right, A                                ;
JP NZ, PressedRight_00_378D                                 ;
RET                                                         ;

PressedB_00_3775:
XOR A                                                       ;
LD [$D25A], A
JP GenericBButtonResponse_1E_66ED                           ;

PressedLeft_00_377C:
LD A, [SelectedOption]                                      ;handle wrap-around
DEC A                                                       ;
CP $FF                                                      ;
JR NZ, CODE_00_3788                                         ;

LD A, [AmountOfAvailableMapSpots]                           ;place at the latest available spot
DEC A                                                       ;

CODE_00_3788:
LD [SelectedOption], A                                      ;
JR CODE_00_379C                                             ;

PressedRight_00_378D:
LD A, [AmountOfAvailableMapSpots]                           ;
LD B, A                                                     ;

LD A, [SelectedOption]                                      ;
INC A                                                       ;
CP B                                                        ;check if exceeded the amount of available spots
JR NZ, CODE_00_3799                                         ;

XOR A                                                       ;loop back to the first one

CODE_00_3799:
LD [SelectedOption], A                                      ;

CODE_00_379C:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;
JP UpdatePlayerPlacementAndSpotNameOnMap_00_3711            ;

SkipOverShoppingCenterAndPreviousDateSpot_00_37A4:
CALL UpdatePlayerPlacementAndSpotNameOnMap_00_3711          ;

LD A, [CurrentlySelectedMapSpot]                            ;
CP MapSpot_ShoppingCenter                                   ;
JR Z, CODE_00_37B7                                          ;skip over shopping center
LD C, A                                                     ;

LD A, [PreviousDateSpot]                                    ;check if hovering over the same spot as before
CP C                                                        ;
JR Z, CODE_00_37B7                                          ;

XOR A                                                       ;different spot seleected
RET                                                         ;

CODE_00_37B7:
SCF                                                         ;skip current spot
RET                                                         ;

HandleMapScreenForDateFunctionality_00_37B9:
LD A, [JoypadInputPress]                                    ;
BitTest JoypadInput_A, A                                    ;
JP NZ, GenericAButtonResponse_1E_66E2                       ;

BitTest JoypadInput_B, A                                    ;
JP NZ, GenericBButtonResponse_1E_66ED                       ;

BitTest JoypadInput_Left, A                                 ;
JP NZ, PressedLeft_00_37D1                                  ;

BitTest JoypadInput_Right, A                                ;
JP NZ, PressedRight_00_37EC                                 ;
RET                                                         ;

PressedLeft_00_37D1:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, [SelectedOption]                                      ;
DEC A                                                       ;
CP $FF                                                      ;
JR NZ, CODE_00_37E2                                         ;

LD A, [AmountOfAvailableMapSpots]                           ;place at the last option
DEC A                                                       ;

CODE_00_37E2:
LD [SelectedOption], A                                      ;

CALL SkipOverShoppingCenterAndPreviousDateSpot_00_37A4      ;
JR C, PressedLeft_00_37D1                                   ;
JR RETURN_00_3805                                           ;

PressedRight_00_37EC:
LD A, SFX_ChangeOption                                      ;
LD [SoundQueue], A                                          ;

LD A, [AmountOfAvailableMapSpots]                           ;
LD B, A                                                     ;
LD A, [SelectedOption]                                      ;
INC A                                                       ;
CP B                                                        ;
JR NZ, CODE_00_37FD                                         ;

XOR A                                                       ;

CODE_00_37FD:
LD [SelectedOption], A                                      ;
CALL SkipOverShoppingCenterAndPreviousDateSpot_00_37A4      ;
JR C, PressedRight_00_37EC                                  ;

RETURN_00_3805:
RET                                                         ;

InitializeDateSpotSelection_00_3806:
CALL SkipOverShoppingCenterAndPreviousDateSpot_00_37A4      ;check previous date spot
JR NC, RETURN_00_381C                                       ;

LD A, [AmountOfAvailableMapSpots]                           ;
LD B, A                                                     ;
LD A, [SelectedOption]                                      ;
INC A                                                       ;
CP B                                                        ;
JR NZ, CODE_00_3817                                         ;

XOR A                                                       ;

CODE_00_3817:
LD [SelectedOption], A                                      ;
JR InitializeDateSpotSelection_00_3806                      ;

RETURN_00_381C:
RET                                                         ;

LoadScheduleScreenVisuals_00_381D:
CALL LoadFontGraphics_00_1E66                               ;

LD A, $1F                                                   ;
CALL SetProgramBank_00_037B                                 ;

LD HL, GFX_ScheduleSprites_1F_5A40                          ;
LD DE, $8000                                                ;
LD BC, $0800                                                ;2KB (despite the graphic file not being 2KB size)
CALL CopyData_00_0C73                                       ;

LD HL, GFX_ScheduleIcons_1F_5000                            ;
LD DE, $8C00                                                ;
LD BC, $0400                                                ;1KB
CALL CopyData_00_0C73                                       ;

LD HL, TimePassingWindowGraphicPointers_00_386D             ;
LD A, [CurrentSeason]                                       ;
CALL GetPointer_00_2F03                                     ;get appropriate month graphics
LD DE, $8800                                                ;
LD BC, $0400                                                ;all season graphics must be the same size or less (1KB)
CALL CopyData_00_0C73                                       ;

LD A, $1E                                                   ;
CALL SetProgramBank_00_037B                                 ;

LD HL, TilemapClearData_1E_4E10
CALL ClearTilemap_1E_79F0                                   ;

LD HL, ScheduleScreen_StatusBar_1E_5BB7                     ;
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, ScheduleScreen_StatWindow_1E_5BF7                    ;
CALL DrawFromTilemap_1E_79B0                                ;

CALL DrawScheduleScreen_ActionInfoBox_1E_668D               ;
CALL DrawScheduleScreenElements_1E_6F3A                     ;
RET                                                         ;

;season time passing window graphic pointers
TimePassingWindowGraphicPointers_00_386D:
dw GFX_TimePassingWindow_Spring_1F_4000
dw GFX_TimePassingWindow_Summer_1F_4400
dw GFX_TimePassingWindow_Autumn_1F_4800
dw GFX_TimePassingWindow_Winter_1F_4C00

;unknown data
db $30,$8C,$E7

;update displayed items in the inventory screen
DrawItemNamesInInventory_00_3878:
CALL WaitForVBlank_00_0382                                  ;

LD HL, TilemapClearData_InventoryContents_1E_476B           ;
CALL ClearTilemap_1E_79F0                                   ;

LD HL, CurrentItemDisplayArray                              ;
LD B, 6                                                     ;
LD A, $FF                                                   ;

LOOP_00_3888:
LD [HL+], A                                                 ;
DEC B                                                       ;
JR NZ, LOOP_00_3888                                         ;

LD HL, ItemAmountRangePerPage_00_3946                       ;
LD A, [CurrentSelectionPage]                                ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;

LD C, [HL]                                                  ;
LD DE, PlayerInventoryArray                                 ;
LD B, $00                                                   ;

XOR A                                                       ;
LD [$D233], A

LOOP_00_38A0:
XOR A                                                       ;
CP C                                                        ;
JR Z, CODE_00_38B7                                          ;check if reached page threshold

LD A, [DE]                                                  ;
INC DE                                                      ;
INC B                                                       ;
CP $01                                                      ;check if the item is in the player's inventory
JR NZ, CODE_00_38AC                                         ;

DEC C                                                       ;it is in player's inventory

CODE_00_38AC:
LD A, [$D233]
INC A                                                       ;
LD [$D233], A
CP 35                                                       ;max amount of items that need checking
JR C, LOOP_00_38A0                                          ;

CODE_00_38B7:
LD HL, $D2DA
LD C, $00                                                   ;

LOOP_00_38BC:
LD A, [DE]                                                  ;
CP $01                                                      ;check if item is not in player's inventory
JR NZ, CODE_00_38C7                                         ;skip

LD A, B                                                     ;
LD [HL+], A                                                 ;
CALL DrawItemName_00_3232                                   ;
INC C                                                       ;

CODE_00_38C7:
INC DE
INC B
LD A, [$D233]
INC A
LD [$D233], A
CP 35
JR NC, RETURN_00_38D9

LD A, $05
CP C
JR NZ, LOOP_00_38BC

RETURN_00_38D9:
RET                                                         ;

;I'm guessing this is for shop
DrawItemNamesInShop_00_38DA:
LD HL, CurrentItemDisplayArray                              ;
LD B, 5                                                     ;
LD A, $FF                                                   ;

LOOP_00_38E1:
LD [HL+], A                                                 ;
DEC B                                                       ;
JR NZ, LOOP_00_38E1

XOR A                                                       ;
LD [HL], A                                                  ;ignore last set of items (town info)

LD HL, ItemAmountRangePerPage_00_3946                       ;
LD A, [CurrentSelectionPage]                                ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;
LD C, [HL]                                                  ;

LD A, [UnobtainedItemCount]                                 ;
SUB C                                                       ;
CP $06                                                      ;
JR C, CODE_00_38FC                                          ;

LD A, 5                                                     ;display up to 5 items at once

CODE_00_38FC:
LD [$D235], A

LD DE, PlayerInventoryArray                                 ;
LD B, $00                                                   ;

LOOP_00_3904:
XOR A                                                       ;
CP C                                                        ;
JR Z, CODE_00_3912                                          ;

LOOP_00_3908:
LD A, [DE]                                                  ;
INC DE                                                      ;
INC B                                                       ;
CP $00                                                      ;
JR NZ, LOOP_00_3908                                         ;

DEC C                                                       ;
JR LOOP_00_3904                                             ;

CODE_00_3912:
LD HL, CurrentItemDisplayArray                              ;
LD C, $00                                                   ;

LOOP_00_3917:
LD A, [DE]                                                  ;
CP $00                                                      ;
JR NZ, CODE_00_3929                                         ;if this item is in player's inventory, skip

LD A, B                                                     ;
LD [HL+], A                                                 ;draw this item's name
CALL DrawItemNameInShop_00_3961                             ;

LD A, [$D235]
DEC A                                                       ;amount of items to comb through minus 1
LD [$D235], A
INC C                                                       ;amount of items on current page +1

CODE_00_3929:
INC DE
INC B
LD A, [$D235]
CP $00
JR NZ, LOOP_00_3917                                         ;check if drew all item names

LD A, $05
CP C                                                        ;check if current page displays all 5 items
RET Z                                                       ;

LD HL, TilemapClearData_InventoryItemStrings_00_394D        ;
LD A, C                                                     ;
SLA A                                                       ;
SLA A                                                       ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;
CALL ClearTilemap_1E_79F0                                   ;
RET                                                         ;

;what ranges of items are displayed on each page
ItemAmountRangePerPage_00_3946:
db 0,5,10,15,20,25,30

;clear areas that aren't filled with item names. the more items displayed, the less to clear
TilemapClearData_InventoryItemStrings_00_394D:
dw $9882
db ItemName_MaxLength
db 10

dw $98C2
db ItemName_MaxLength
db 8

dw $9902
db ItemName_MaxLength
db 6

dw $9942
db ItemName_MaxLength
db 4

dw $9982
db ItemName_MaxLength
db 2

;not to be confused with previous routine, which calls this one to print a singular item name.
;B - current item
;C - item position in the list (e.g. second item, fifth)
DrawItemNameInShop_00_3961:
PUSH HL                                                     ;
PUSH DE                                                     ;
PUSH BC                                                     ;
LD A, B                                                     ;
LD [$D231], A

LD A, C                                                     ;
LD [$D22F], A
LD HL, ItemNameStringPositionPointers_1E_58DC
CALL GetPointer_00_2F03
CALL StoreTilemapLocationToRAM_1E_7333

PUSH DE                                                     ;
LD A, [$D231]
LD HL, ItemNamePointers_1E_591C                             ;
CALL GetPointer_00_2F03                                     ;

POP DE                                                      ;
LD B, ItemName_MaxLength                                    ;
CALL CopyData8Bit_1E_6CD5                                   ;

LD HL, DynamicTilemapArray
CALL DrawFromTilemap_1E_79B0                                ;draw item name

LD A, [$D22F]
LD HL, ItemPriceStringPositionPointers_1E_58E6
CALL GetPointer_00_2F03
CALL StoreTilemapLocationToRAM_1E_7333

LD A, [$D231]
CALL GetItemPrice_00_310D

LD HL, ItemPrice                                            ;
CALL DisplayItemPrice_00_293F                               ;
POP BC                                                      ;
POP DE                                                      ;
POP HL                                                      ;
RET                                                         ;

DrawItemNamesInGiftScreen_00_39A7:
LD HL, TilemapClearData_InventoryContents_1E_476B           ;
CALL ClearTilemap_1E_79F0                                   ;

LD HL, CurrentItemDisplayArray                              ;
LD B, 5                                                     ;
LD A, $FF                                                   ;

LOOP_00_39B4:
LD [HL+], A                                                 ;
DEC B                                                       ;
JR NZ, LOOP_00_39B4                                         ;

XOR A                                                       ;
LD [HL], A                                                  ;

LD HL, ItemAmountRangePerPage_00_3946                       ;
LD A, [CurrentSelectionPage]                                ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;
LD C, [HL]                                                  ;range of items to check

LD DE, PlayerInventoryArray+4                               ;
LD B, 4                                                     ;

XOR A                                                       ;
LD [$D233], A

LOOP_00_39CE:
XOR A                                                       ;
CP C                                                        ;
JR Z, CODE_00_39E5                                          ;stop at the range for current page

LD A, [DE]                                                  ;
INC DE                                                      ;
INC B                                                       ;
CP $01                                                      ;check if obtained that item
JR NZ, CODE_00_39DA                                         ;

DEC C                                                       ;

CODE_00_39DA:
LD A, [$D233]
INC A                                                       ;current item within inventory
LD [$D233], A

CP 22                                                       ;only 22 items count as gifts
JR C, LOOP_00_39CE                                          ;

CODE_00_39E5:
LD HL, CurrentItemDisplayArray                              ;
LD C, $00                                                   ;

LOOP_00_39EA:
LD A, [DE]                                                  ;check if this item is obtained
CP $01                                                      ;
JR NZ, CODE_00_39F5                                         ;

LD A, B                                                     ;
LD [HL+], A                                                 ;
CALL DrawItemName_00_3232                                   ;draw the item's name
INC C                                                       ;item has been drawn count +1

CODE_00_39F5:
INC DE                                                      ;
INC B                                                       ;
LD A, [$D233]
INC A                                                       ;this item's index within inventory
LD [$D233], A
CP 22                                                       ;once again, stop at max gift items
JR NC, RETURN_00_3A07                                       ;

LD A, 5                                                     ;check if all 5 item names have been drawn
CP C                                                        ;
JR NZ, LOOP_00_39EA                                         ;

RETURN_00_3A07:
RET                                                         ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Club option code
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

InitClubOption_00_3A08:
LD HL, CurrentSave_SelectedJobOrClub                        ;
LD A, [HL]                                                  ;
CP ClubOrJob_None                                           ;check if haven't applied to anything
JR NZ, CODE_00_3A13                                         ;
JP CODE_00_3A23                                             ;

CODE_00_3A13:
CP ClubOrJob_PartTimeJob                                    ;check if you have a job
JR Z, CODE_00_3A1A                                          ;
JP CODE_00_3A91                                             ;

;you already have a job, can't have club activities
CODE_00_3A1A:
LD HL, CantHaveJobAndClubMessage_1E_44E2                    ;
CALL ScheduleScreen_ClearSelectionWindowAndDraw_00_3BB1     ;
JP GenericMessageHandling_00_3023                           ;

;Bring two options - apply or not
CODE_00_3A23:
LD HL, ConfirmClubApplicationMessage_1E_4404                ;
CALL ScheduleScreen_ClearSelectionWindowAndDraw_00_3BB1     ;
CALL ScheduleScreen_DrawAAndBButtonPrompts_1E_799E          ;

;Do you want to bring the club selection window or not?
HandleClubApplicationConfirmation_00_3A2C:
CALL HandleSpriteDisplayables_00_3F25                       ;

LD A, [JoypadInputPress]                                    ;
BitTest JoypadInput_A, A                                    ;
JR NZ, CODE_00_3A3F                                         ;

BitTest JoypadInput_B, A                                    ;
JR NZ, CODE_00_3A8B                                         ;

CALL WaitForVBlank_00_0382                                  ;
JR HandleClubApplicationConfirmation_00_3A2C                ;

;bring club application window
CODE_00_3A3F:
LD A, SFX_Confirm                                           ;
LD [SoundQueue], A                                          ;

LD HL, ClubApplicationWindowTilemap_1E_4416                 ;
CALL DrawFromTilemap_1E_79B0                                ;

XOR A                                                       ;
LD [GenericStateChangeIndicator], A                         ;
LD [SelectedOption], A                                      ;
LD [SelectedOption_Horizontal], A                           ;
LD [SelectedClub], A                                        ;
CALL ScheduleScreen_WindowScrollingUp_00_2FD4               ;bring up a window for picking a club

CALL DrawSidewayCursor_WindowLayer_1E_66AB                  ;

HandleClubApplicationWindow_00_3A5D:
CALL HandleClubApplicationWindowFunctionality_1E_713F       ;
CALL GenericScreenHandling_00_2FC3                          ;
JR NC, HandleClubApplicationWindow_00_3A5D                  ;
CP GenericStateChange_Cancel                                ;
JR Z, CODE_00_3A83                                          ;don't apply

LD A, SpriteDisplayable_None                                ;
LD [SpriteDisplayables_ID+1], A                             ;

LD HL, TilemapClear_WindowContents_1E_5469                  ;
CALL ClearTilemap_1E_79F0                                   ;

LD HL, AppliedToClubMessage_1E_452C                         ;applied to club message
CALL DrawFromTilemap_1E_79B0                                ;

LD HL, AppliedToClubMessage_1E_452C                         ;print specific club name
CALL DrawClubNameForMessage_1E_725A                         ;

CALL GenericMessageHandling_00_3023                         ;wait for player to dismiss this message

CODE_00_3A83:
LD A, SpriteDisplayable_None                                ;
LD [SpriteDisplayables_ID+1], A                             ;
JP ScheduleScreen_WindowScrollingDown_00_3001               ;pull the window down

CODE_00_3A8B:
LD A, SFX_Cancel                                            ;decided not to apply
LD [SoundQueue], A                                          ;
RET                                                         ;

;You're already in club
CODE_00_3A91:
LD A, [HolidayOrWeekendFlag]                                ;check if current time is a holiday/weekend
CP $01                                                      ;
JP Z, GenericActivityOption_00_3263                         ;acts like a regular activity. that means you cannot quit club on off days

CALL DrawClubOptionStrings_1E_7F4D                          ;

HandleClubActivityOptions_00_3A9C:
CALL HandleSpriteDisplayables_00_3F25                       ;
CALL HandleClubOrJobActivityOptionsFunctionality_1E_71CC

LD A, [GenericStateChangeIndicator]                         ;check if player didn't do anything drastic, like confirming a choice or cancelling outright
CP GenericStateChange_Nothing                               ;
JR NZ, CODE_00_3AAE                                         ;

CALL WaitForVBlank_00_0382                                  ;
JR HandleClubActivityOptions_00_3A9C                        ;

CODE_00_3AAE:
LD A, [GenericStateChangeIndicator]                         ;
CP GenericStateChange_Cancel                                ;return if decided not to do club
RET Z                                                       ;

LD A, [SelectedOption]                                      ;
CP $01                                                      ;check if decided to call it quitz
JR Z, CODE_00_3AD7                                          ;

CALL CheckClubOrJobSelectionTime_1E_720C                    ;
JR C, CODE_00_3AC6                                          ;if tried to do club activities when not the time, tell the player so

CALL RemoveSidewaysCursor_00_3B55                           ;
JP GenericActivityOption_00_3263                            ;otherwise JUST DO IT!

CODE_00_3AC6:
LD A, SpriteDisplayable_None                                ;
LD [SpriteDisplayables_ID+1], A                             ;
CALL WaitForVBlank_00_0382                                  ;

LD HL, JobAndClubOnCertainDaysMessage_1E_4D7E               ;sorry friend, by default you can only do club on wednesday, saturday and day off
CALL ScheduleScreen_ClearSelectionWindowAndDraw_00_3BB1     ;
JP GenericMessageHandling_00_3023                           ;

;you picked quit club option
CODE_00_3AD7:
LD A, SpriteDisplayable_None                                ;
LD [SpriteDisplayables_ID+1], A                             ;

CALL WaitForVBlank_00_0382                                  ;

LD HL, ConfirmLeavingClubMessage_1E_4518                    ;are you sure you want to leave the club?
CALL ScheduleScreen_ClearSelectionWindowAndDraw_00_3BB1     ;
CALL ScheduleScreen_DrawAAndBButtonPrompts_1E_799E          ;

LD HL, ConfirmLeavingClubMessage_1E_4518                    ;
CALL DrawClubNameForMessage_1E_725A                         ;draw the club name

HandleQuittingClubFunctionality_00_3AEE:
CALL HandleSpriteDisplayables_00_3F25                       ;

LD A, [JoypadInputPress]                                    ;
BitTest JoypadInput_A, A                                    ;
JR NZ, CODE_00_3B09                                         ;

BitTest JoypadInput_B, A                                    ;
JR Z, CODE_00_3B04                                          ;

LD A, SFX_Cancel                                            ;cancel out of quit club option
LD [SoundQueue], A                                          ;
JP CODE_00_3A91                                             ;you changed your mind, not calling it quits

CODE_00_3B04:
CALL WaitForVBlank_00_0382                                  ;
JR HandleQuittingClubFunctionality_00_3AEE                  ;

;you quit club for real
CODE_00_3B09:
LD A, SFX_Confirm                                           ;
LD [SoundQueue], A                                          ;

LD A, SpriteDisplayable_None                                ;
LD [SpriteDisplayables_ID+1], A                             ;

LD HL, QuitClubMessage_1E_4542                              ;
CALL ScheduleScreen_ClearSelectionWindowAndDraw_00_3BB1     ;

LD HL, QuitClubMessage_1E_4542                              ;
CALL DrawClubNameForMessage_1E_725A                         ;

CALL GenericMessageHandling_00_3023                         ;

LD HL, CurrentSave_SelectedJobOrClub                        ;
XOR A                                                       ;
LD [HL], A                                                  ;not applied to a club or job anymore

CALL DisableClubRelatedStatProgressEventBits_00_3B36        ;
CALL RemoveClubOrJobActivityFromSchedule_1E_722A            ;

LD A, $01                                                   ;
LD [QuitClubOrJobFlag], A                                   ;

CALL DrawScheduleScreenElements_1E_6F3A                     ;
RET                                                         ;

DisableClubRelatedStatProgressEventBits_00_3B36:
LD A, [CurrentSave_SelectedJobOrClub]                       ;
CP ClubOrJob_HandicraftsClub                                ;
JR Z, CODE_00_3B45                                          ;

LD A, [CurrentSave_StatProgressEventBits]                   ;
AND ~StatProgressBit_SkillHandicrafts                       ;
LD [CurrentSave_StatProgressEventBits], A                   ;can't keep track of skill when not in handicrafts, sorry

CODE_00_3B45:
LD A, [CurrentSave_SelectedJobOrClub]                       ;
CP ClubOrJob_GoClub                                         ;
JR Z, RETURN_00_3B54                                        ;

LD A, [CurrentSave_StatProgressEventBits]                   ;can't keep track of smarts* when not in Go club. actually you can, but less so now.
AND ~StatProgressBit_SmartGo                                ;
LD [CurrentSave_StatProgressEventBits], A                   ;*it actually checks for Fit outside of the event, and Smart in the event itself

RETURN_00_3B54:
RET                                                         ;

RemoveSidewaysCursor_00_3B55:
LD A, SpriteDisplayable_None                                ;
LD [SpriteDisplayables_ID+1], A                             ;
CALL HandleSpriteDisplayables_00_3F25                       ;
JP WaitForVBlank_00_0382                                    ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Job option code
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

InitJobOption_00_3B60:
LD HL, CurrentSave_SelectedJobOrClub                        ;
LD A, [HL]                                                  ;
CP ClubOrJob_PartTimeJob                                    ;
JR NZ, CODE_00_3B6B                                         ;check if you're not doing part-time job
JP CODE_00_3BBC                                             ;you do have a job

CODE_00_3B6B:
CP ClubOrJob_None                                           ;
JR NZ, CODE_00_3B72                                         ;check if you're not occupied by such concepts as "club" and "job"
JP CODE_00_3B7B                                             ;

;Can't have club and job at the same time
CODE_00_3B72:
LD HL, CantHaveJobAndClubMessage_1E_44E2                    ;
CALL ScheduleScreen_ClearSelectionWindowAndDraw_00_3BB1     ;
JP GenericMessageHandling_00_3023                           ;

;Maybe apply for the job (it's as easy as pressing A in this game, no need for interviews or other scary concepts)
CODE_00_3B7B:
LD HL, ConfirmJobApplicationMessage_1E_4556                 ;
CALL ScheduleScreen_ClearSelectionWindowAndDraw_00_3BB1     ;
CALL ScheduleScreen_DrawAAndBButtonPrompts_1E_799E          ;

HandleJobApplicationWindow_00_3B84:
CALL HandleSpriteDisplayables_00_3F25                       ;

LD A, [JoypadInputPress]                                    ;
BitTest JoypadInput_A, A                                    ;
JR NZ, CODE_00_3B97                                         ;do you say yes?

BitTest JoypadInput_B, A                                    ;
JR NZ, CODE_00_3BAB                                         ;do you say no?

CALL WaitForVBlank_00_0382                                  ;
JR HandleJobApplicationWindow_00_3B84                       ;wait for some kind of answer from the player

CODE_00_3B97:
LD A, SFX_Confirm                                           ;
LD [SoundQueue], A                                          ;

LD HL, CurrentSave_SelectedJobOrClub                        ;
LD A, ClubOrJob_PartTimeJob                                 ;
LD [HL], A                                                  ;you have applied to a part-time job. congrats, buddy!

LD HL, AppliedToPartTimeJobMessage_1E_4576                  ;
CALL ScheduleScreen_ClearSelectionWindowAndDraw_00_3BB1     ;
JP GenericMessageHandling_00_3023                           ;

CODE_00_3BAB:
LD A, SFX_Cancel                                            ;you reconsidered
LD [SoundQueue], A                                          ;
RET                                                         ;

;input HL - data to draw over the window
ScheduleScreen_ClearSelectionWindowAndDraw_00_3BB1:
PUSH HL                                                     ;
LD HL, TilemapClear_ScheduleScreen_ActionInfoBox_1E_5465;
CALL ClearTilemap_1E_79F0                                   ;
POP HL                                                      ;
JP DrawFromTilemap_1E_79B0                                  ;

;You have a job, what are you gonna do?
CODE_00_3BBC:
LD A, [HolidayOrWeekendFlag]                                ;
CP $01                                                      ;
JP Z, GenericActivityOption_00_3263                         ;on day off, it acts as a regular activity you partake in

CALL DrawJobOptionStrings_1E_7F15                           ;

HandleJobActivityOptions_00_3BC7:
CALL HandleClubOrJobActivityOptionsFunctionality_1E_71CC    ;
CALL GenericScreenHandling_00_2FC3                          ;
JR NC, HandleJobActivityOptions_00_3BC7                     ;

LD A, [GenericStateChangeIndicator]                         ;
CP GenericStateChange_Cancel                                ;
RET Z                                                       ;

LD A, [SelectedOption]                                      ;check if you selecte the quit the job option
CP $01                                                      ;
JR Z, CODE_00_3BF8                                          ;

CALL CheckClubOrJobSelectionTime_1E_720C                    ;notify the player if they can't do the job on that day
JR C, CODE_00_3BE7                                          ;

CALL RemoveSidewaysCursor_00_3B55                           ;
JP GenericActivityOption_00_3263                            ;you decided to do the job

CODE_00_3BE7:
LD A, SpriteDisplayable_None                                ;
LD [SpriteDisplayables_ID+1], A                             ;

CALL WaitForVBlank_00_0382                                  ;

LD HL, JobAndClubOnCertainDaysMessage_1E_4D7E               ;
CALL ScheduleScreen_ClearSelectionWindowAndDraw_00_3BB1     ;
JP GenericMessageHandling_00_3023                           ;

;Do you want to quit the job?
CODE_00_3BF8:
LD A, SpriteDisplayable_None                                ;
LD [SpriteDisplayables_ID+1], A                             ;
CALL WaitForVBlank_00_0382                                  ;

LD HL, ConfirmLeavingPartTimeJobMessage_1E_45AE             ;tell the player if they are sure about this
CALL ScheduleScreen_ClearSelectionWindowAndDraw_00_3BB1     ;
CALL ScheduleScreen_DrawAAndBButtonPrompts_1E_799E          ;

HandleQuittingJobFunctionality_00_3C09:
CALL HandleSpriteDisplayables_00_3F25                       ;

LD A, [JoypadInputPress]                                    ;
BitTest JoypadInput_A, A                                    ;
JR NZ, CODE_00_3C24                                         ;

BitTest JoypadInput_B, A                                    ;check if DIDN'T press B
JR Z, CODE_00_3C1F                                          ;

LD A, SFX_Cancel                                            ;not for now
LD [SoundQueue], A                                          ;
JP CODE_00_3BBC                                             ;

CODE_00_3C1F:
CALL WaitForVBlank_00_0382                                  ;
JR HandleQuittingJobFunctionality_00_3C09                   ;

;You quit the job.
CODE_00_3C24:
LD A, SFX_Confirm                                           ;
LD [SoundQueue], A                                          ;

LD A, SpriteDisplayable_None                                ;
LD [SpriteDisplayables_ID+1], A                             ;

LD HL, QuitPartTimeJobMessage_1E_4592                       ;you quit the job. have a nice day.
CALL ScheduleScreen_ClearSelectionWindowAndDraw_00_3BB1     ;
CALL GenericMessageHandling_00_3023                         ;

LD HL, CurrentSave_SelectedJobOrClub                        ;
XOR A                                                       ;
LD [HL], A                                                  ;FREEDOM!

CALL RemoveClubOrJobActivityFromSchedule_1E_722A            ;

LD A, $01                                                   ;
LD [QuitClubOrJobFlag], A                                   ;

CALL DrawScheduleScreenElements_1E_6F3A                     ;
RET                                                         ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;handle sprite displayables and pass a frame
HandleSpriteDisplayablesAndWaitForVBlank_00_3C48:
CALL HandleSpriteDisplayables_00_3F25                       ;
JP WaitForVBlank_00_0382                                    ;

CalculateIngameTime_00_3C4E:
LD HL, CurrentSave_DaysPassed                               ;
LD A, [HL]                                                  ;
LD B, Month_April                                           ;start from april
LD HL, MonthDuration_00_3CB4                                ;

LOOP_00_3C57:
LD C, [HL]                                                  ;
INC HL                                                      ;
SUB C                                                       ;determine what month it is by substracting month duration
JR C, CODE_00_3C5F                                          ;

INC B                                                       ;next month
JR LOOP_00_3C57                                             ;

CODE_00_3C5F:
ADD A, C                                                    ;compensate for previous calculation
LD [CurrentDayOfTheMonth], A                                ;current month's day

LD A, B                                                     ;
LD [CurrentMonth], A                                        ;store resulting month
CP Month_April
JR NZ, CODE_00_3C73

LD A, [CurrentDayOfTheMonth]                                ;
ADD A, 14-1                                                 ;april starts from 14th
LD [CurrentDayOfTheMonth], A                                ;

CODE_00_3C73:
LD HL, MonthStartingWeekday_00_3CBD                         ;
LD A, [CurrentMonth]                                        ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;get current month's starting weekday

LD A, [HL]                                                  ;
LD E, A                                                     ;
LD A, [CurrentDayOfTheMonth]                                ;
ADD A, E                                                    ;
LD B, $00                                                   ;

LOOP_00_3C85:
SUB 7                                                       ;each week is 7 days long
JR C, CODE_00_3C8C                                          ;

INC B                                                       ;count up weeks
JR LOOP_00_3C85                                             ;

CODE_00_3C8C:
ADD A, 7                                                    ;compensate previous calculation
LD [CurrentDayOfTheWeek], A                                 ;

LD A, B                                                     ;
LD [CurrentWeekOfTheMonth], A                               ;

LD HL, CurrentSave_DaysPassed                               ;
LD A, [HL]                                                  ;
CP 140                                                      ;checks if half a year had passed
JR NC, CODE_00_3CA0                                         ;

XOR A                                                       ;half a year not passed
JR CODE_00_3CA2                                             ;

CODE_00_3CA0:
LD A, $01                                                   ;half a year did pass

CODE_00_3CA2:
LD [CurrentYearHalf], A                                     ;

LD HL, SeasonPerMonth_00_3CC9                               ;now get what season the month is in
LD A, [CurrentMonth]                                        ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;

LD A, [HL]                                                  ;
LD [CurrentSeason], A                                       ;
RET                                                         ;

;amount of playable days per-month
MonthDuration_00_3CB4:
db 17
db 31
db 30
db 31
db 31
db 30
db 31
db 30
db 31

;day of the week each month starts at
MonthStartingWeekday_00_3CBD:
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

;used to determine what season the current month is in
SeasonPerMonth_00_3CC9:
db Season_Winter
db Season_Winter
db Season_Spring
db Season_Spring
db Season_Spring
db Season_Summer
db Season_Summer
db Season_Summer
db Season_Fall
db Season_Fall
db Season_Fall
db Season_Winter

;translates 16-bit hex value into an array of digits for display.
;input HL - address, the value of which to convert
;stores the digits in DecimalDigitArray
GetHexToDecDigits_00_3CD5:
LD E, [HL]                                                  ;
INC HL                                                      ;
LD D, [HL]                                                  ;

LD HL, DigitCheckValues_TensThousands_00_3D62               ;
LD B, 6                                                     ;16-bit can only get you up to 60000s
CALL GetDigit_00_3D43                                       ;

LD A, B                                                     ;
LD [DecimalDigitArray], A                                   ;

LD HL, DigitCheckValues_Thousands_00_3D6E                   ;
LD B, 9                                                     ;
CALL GetDigit_00_3D43                                       ;

LD A, B                                                     ;
LD [DecimalDigitArray+1], A                                 ;
LD HL, DigitCheckValues_Hundreds_00_3D80                    ;

LD B, 9                                                     ;
CALL GetDigit_00_3D43                                       ;

LD A, B                                                     ;
LD [DecimalDigitArray+2], A                                 ;

;get tens
LD HL, DigitCheckValues_Tens_00_3D92                        ;
LD B, 9                                                     ;

CODE_00_3D01:
LD A, [HL]                                                  ;
CP E                                                        ;
JR Z, CODE_00_3D11                                          ;if equals, go ahead
JR C, CODE_00_3D11                                          ;if value we're checking

INC HL                                                      ;
DEC B                                                       ;
JR NZ, CODE_00_3D01                                         ;

XOR A                                                       ;0
LD [DecimalDigitArray+3], A                                 ;
JR CODE_00_3D1A                                             ;

CODE_00_3D11:
LD A, B                                                     ;
LD [DecimalDigitArray+3], A                                 ;
LD A, [HL]                                                  ;
LD C, A                                                     ;

LD A, E                                                     ;
SUB C                                                       ;
LD E, A                                                     ;

CODE_00_3D1A:
LD A, E                                                     ;
LD [DecimalDigitArray+4], A                                 ;

;now we turn these digits into proper number tile values
LD B, $05                                                   ;5 digits
LD C, $01                                                   ;not leading zero flag
LD HL, DecimalDigitArray                                    ;

LOOP_00_3D25:
LD A, [HL]                                                  ;
CP $00                                                      ;
JR Z, CODE_00_3D31                                          ;
ADD A, CHARVAL("0")                                         ;offset from tile 0
LD [HL], A                                                  ;
LD C, $00                                                   ;
JR CODE_00_3D37                                             ;

CODE_00_3D31:
CP C                                                        ;check if it's a leading zero, skip over
JR NZ, CODE_00_3D37                                         ;

LD A, CHARVAL("0")                                          ;will display a zero.
LD [HL], A                                                  ;

CODE_00_3D37:
INC HL                                                      ;
LD A, B                                                     ;check what digit we're dealing with
CP $02                                                      ;
JR NZ, CODE_00_3D3F                                         ;

LD C, $00                                                   ;ones will always display even if 0.

CODE_00_3D3F:
DEC B                                                       ;
JR NZ, LOOP_00_3D25                                         ;
RET                                                         ;

;used to get tens thousands, thousands and hundreds digits.
;input:
;DE - value to extract a digit from
;B - amount of numbers to comb from
;HL - table to get numbers from, used to compare to DE to extract digits
;output:
;B - digit we got
;DE - resulting value, in case we substracted a "digit" value or an unchanged value in case B = 0
GetDigit_00_3D43:
LD A, [HL+]                                                 ;check if high byte is above a value from the table
CP D                                                        ;
JR Z, CODE_00_3D4E                                          ;check if not equal
JR C, FoundDigit_00_3D56                                    ;check if less

CODE_00_3D49:
INC HL                                                      ;
DEC B                                                       ;keep going to find a correct number...
JR NZ, GetDigit_00_3D43                                     ;
RET                                                         ;...or not.

CODE_00_3D4E:
LD A, [HL]                                                  ;
CP E                                                        ;compare low byte as well
JR C, FoundDigit_00_3D56                                    ;
JR Z, FoundDigit_00_3D56                                    ;
JR CODE_00_3D49                                             ;

;DE minus the valid value that determines the digit e.g. if tens thousands is 40000, will substract 40000 and continue with the rest of digits
FoundDigit_00_3D56:
LD A, [HL]                                                  ;
LD C, A                                                     ;

LD A, E                                                     ;
SUB C                                                       ;
LD E, A                                                     ;

DEC HL                                                      ;
LD A, [HL]                                                  ;
LD C, A                                                     ;

LD A, D                                                     ;
SBC A, C                                                    ;
LD D, A                                                     ;
RET                                                         ;

;used to check for tens of hundreds
DigitCheckValues_TensThousands_00_3D62:
dwb 60000
dwb 50000
dwb 40000
dwb 30000
dwb 20000
dwb 10000

;check for thousands
DigitCheckValues_Thousands_00_3D6E:
dwb 9000
dwb 8000
dwb 7000
dwb 6000
dwb 5000
dwb 4000
dwb 3000
dwb 2000
dwb 1000

DigitCheckValues_Hundreds_00_3D80:
dwb 900
dwb 800
dwb 700
dwb 600
dwb 500
dwb 400
dwb 300
dwb 200
dwb 100

;finally, tens
DigitCheckValues_Tens_00_3D92:
db 90
db 80
db 70
db 60
db 50
db 40
db 30
db 20
db 10

;I think this code checks for player's stats to check if a character shows up when invited
;input B - chosen item or none
;A - invited character
CheckDateInvitationSuccess_00_3D9B:
PUSH BC                                                     ;
LD HL, StatThresholdsForDating_1E_534F                      ;
LD C, A                                                     ;
SLA A                                                       ;
SLA A                                                       ;
ADD A, C                                                    ;
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;get stat thresholds to check

LD DE, CurrentSave_SmartStat                                ;start from smarts
LD B, $05                                                   ;check for 5 stats
LD C, $00                                                   ;

LOOP_00_3DB0:
PUSH BC                                                     ;
LD A, [HL+]                                                 ;
LD C, A                                                     ;
LD A, [DE]                                                  ;
INC DE                                                      ;
INC DE                                                      ;
CP C                                                        ;
JR C, CODE_00_3DBD                                          ;check if less
POP BC                                                      ;
INC C                                                       ;check passed
JR CODE_00_3DBE                                             ;

CODE_00_3DBD:
POP BC                                                      ;

CODE_00_3DBE:
DEC B                                                       ;keep going through stats
JR NZ, LOOP_00_3DB0                                         ;

;C - amount of checks passed
LD A, C                                                     ;
POP BC                                                      ;
LD C, A                                                     ;
PUSH BC                                                     ;
LD A, B                                                     ;
LD HL, CharacterDateInvitationSuccessRates_1E_5372          ;
SLA A                                                       ;
LD B, A                                                     ;
SLA A                                                       ;
ADD A, B                                                    ;times 6 (since there are 6 possible chance values)
LD C, A                                                     ;

LD B, $00                                                   ;
ADD HL, BC                                                  ;
POP BC                                                      ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;

LD A, [HL]                                                  ;
LD C, A                                                     ;
LD A, [FrameCounter8Bit]                                    ;compare to frame counter (semi-random)
AND $03                                                     ;
SUB C                                                       ;
RET                                                         ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Title screen code
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ExecuteTitleScreenCode_00_3DE0:
CALL LoadTitleScreen_00_3E51                                ;

LD A, LCDControlEnable|LCDSpriteSize                        ;
LDH [Reg_LCDControlAndRender], A                            ;

CALL HandleSpriteDisplayables_00_3F25                       ;
CALL WaitForVBlank_00_0382                                  ;

LD HL, Reg_LCDControlAndRender                              ;
SetBit LCDBackgroundRender, [HL]                            ;
SetBit LCDSpriteRender, [HL]                                ;

LD A, Music_MainTheme                                       ;
CALL ChangeMusic_00_0B12                                    ;

CALL FadeInLoop_00_0A4B                                     ;

HandleTitleScreenStartPrompt_00_3DFC:
CALL HandleSpriteDisplayables_00_3F25                       ;

LD A, [JoypadInputPress]                                    ;
BitTest JoypadInput_Start, A                                ;wait for the player to press start
JR NZ, TitleScreen_PressedStart_00_3E0B                     ;

CALL WaitForVBlank_00_0382                                  ;
JR HandleTitleScreenStartPrompt_00_3DFC                     ;

TitleScreen_PressedStart_00_3E0B:
CALL InitTitleScreenChoices_AfterPressStart_1D_7C3F         ;

HandleTitleScreenOptions_00_3E0E:
CALL HandleSpriteDisplayables_00_3F25                       ;
CALL HandleTitleScreenFunctionality_1D_7C89                 ;

LD A, [GenericStateChangeIndicator]                         ;check if we confirmed something
CP GenericStateChange_Nothing                               ;
JR NZ, CODE_00_3E20                                         ;

CALL WaitForVBlank_00_0382                                  ;
JR HandleTitleScreenOptions_00_3E0E                         ;

CODE_00_3E20:
LD A, [TitleScreen_SelectedOption]                          ;check if we selected......
CP $00                                                      ;new game
JR Z, CODE_00_3E43                                          ;

CALL Wait8VBlanks_1D_7F4B                                   ;
CALL LoadAndHandleTitleScreenSaveFileSelect_00_3E9A         ;handle save file select functionality
CP $00                                                      ;check if loaded a save file
JR Z, CODE_00_3E3F                                          ;

CALL ClearLoadedSaveFileRAM_1D_7F3D                         ;did not load save file
CALL InitTextProcessingVariablesCall_00_0BC0                ;
CALL InitTitleScreenChoices_CancelledFileLoading_1D_7C67    ;

CALL WaitForVBlank_00_0382                                  ;
JR HandleTitleScreenOptions_00_3E0E                         ;

CODE_00_3E3F:
LD A, $01                                                   ;
JR CODE_00_3E44                                             ;

CODE_00_3E43:
XOR A                                                       ;

CODE_00_3E44:
LD [$D226], A

CALL FadeOutAndInitSpriteDisplayables_1D_7E99               ;
CALL HandleSpriteDisplayables_00_3F25                       ;
CALL WaitForVBlank_00_0382                                  ;
RET                                                         ;

;load title screen things
LoadTitleScreen_00_3E51:
XOR A                                                       ;clear some variables
LD [$D226], A                                               ;
LD [$D227], A                                               ;this appears to be the only time this address is referenced (is it supposed to be 16-bit?)
LD [GenericStateChangeIndicator], A                         ;
LD [NewGameInfoInput_HorizontalOption], A                   ;
LD [GenericVerticalOption], A                               ;

LD A, $FF                                                   ;
LD [JoypadInputEnabler], A                                  ;

CALL LoadFontGraphics_00_1E66                               ;

LD A, $1F                                                   ;
CALL SetProgramBank_00_037B                                 ;

LD HL, GFX_ScheduleSprites_1F_5A40                          ;
LD DE, $8000                                                ;
LD BC, $0100                                                ;
CALL CopyData_00_0C73                                       ;

LD HL, GFX_TitleScreenSpriteTiles_1F_7360                   ;
LD DE, $8100                                                ;
LD BC, $0100                                                ;
CALL CopyData_00_0C73                                       ;

LD HL, GFX_TitleScreenBGTiles_1F_6DF0                       ;
LD DE, $8800                                                ;
LD BC, $0800                                                ;
CALL CopyData_00_0C73                                       ;

LD A, $1D                                                   ;
CALL SetProgramBank_00_037B                                 ;
JP InitTitleScreenVisuals_1D_7C1A                           ;

LoadAndHandleTitleScreenSaveFileSelect_00_3E9A:
LD A, SpriteDisplayable_None                                ;
LD [SpriteDisplayables_ID], A                               ;
CALL HandleSpriteDisplayables_00_3F25                       ;

CALL WaitForVBlank_00_0382                                  ;
CALL DisplaySaveFilesInfo_00_3ED5                           ;

HandleTitleScreenSaveFileSelect_00_3EA8:
CALL HandleSpriteDisplayables_00_3F25                       ;
CALL HandleSaveLoadingWindowControls_1D_7E21                ;controls

LD A, [GenericStateChangeIndicator]                         ;check if we backed out or not
CP GenericStateChange_Confirm                               ;
JR Z, CODE_00_3EBE                                          ;
CP GenericStateChange_Cancel                                ;
JR Z, CODE_00_3EC7                                          ;

CALL WaitForVBlank_00_0382                                  ;
JR HandleTitleScreenSaveFileSelect_00_3EA8                  ;didn't confirm nor deny, loop

;confirmed to load a save file
CODE_00_3EBE:
LD A, [LoadSaveWindow_SelectedSave]                         ;
LD [SelectedOption], A                                      ;
JP LoadSaveData_1D_7EA0                                     ;load save data from a save file we just picked

;backing out of save loading window
CODE_00_3EC7:
LD A, SpriteDisplayable_None                                ;remove cursor sprite
LD [SpriteDisplayables_ID], A                               ;
CALL HandleSpriteDisplayables_00_3F25                       ;

CALL ScrollSaveLoadingWindowDown_1D_7E07                    ;

LD A, $01                                                   ;cancelled out
RET                                                         ;

DisplaySaveFilesInfo_00_3ED5:
CALL InitSaveLoadingWindowAndCheckSaveFile1Status_1D_7CD6   ;
CP $01                                                      ;
JR Z, CODE_00_3EE0                                          ;check if save file not used

XOR A                                                       ;
CALL DrawSaveFileInformation_00_3EFB                        ;used, draw some of its info

CODE_00_3EE0:
CALL CheckSaveFile2Status_1D_7CF7                           ;
CP $01                                                      ;
JR Z, CODE_00_3EEC                                          ;

LD A, $40                                                   ;
CALL DrawSaveFileInformation_00_3EFB                        ;save file 2 used, print its info

CODE_00_3EEC:
CALL CheckSaveFile3Status_1D_7D0E                           ;
CP $01                                                      ;
JR Z, CODE_00_3EF8                                          ;

LD A, $80                                                   ;
CALL DrawSaveFileInformation_00_3EFB                        ;save file 3 used, print its info

CODE_00_3EF8:
JP HandleSaveLoadingWindowScrollingUp_1D_7D25               ;

;draw save file info at the title screen
DrawSaveFileInformation_00_3EFB:
CALL DrawPlayerNameFromSaveFileAndGetDate_1D_7D3F           ;
PUSH BC                                                     ;
LD A, [CurrentMonth]                                        ;
CALL Prepare8BitValuePlus1ForExtraction_1D_7D7A             ;extract month
CALL GetHexToDecDigits_00_3CD5                              ;
POP BC                                                      ;
PUSH BC                                                     ;
CALL DrawMonthForSaveFilesAtTitleScreen_1D_7D86             ;

LD A, [CurrentDayOfTheMonth]                                ;
CALL Prepare8BitValuePlus1ForExtraction_1D_7D7A             ;extract day
CALL GetHexToDecDigits_00_3CD5                              ;
POP BC                                                      ;
PUSH BC                                                     ;
CALL DrawDayForSaveFilesAtTitleScreen_1D_7D95               ;

LD HL, CurrentSave_Cash                                     ;
CALL GetHexToDecDigits_00_3CD5                              ;extract money
POP BC                                                      ;
JP DrawMoneyForSaveFilesAtTitleScreen_1D_7DA4               ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

HandleSpriteDisplayables_00_3F25:
LD A, [CurrentProgramBank]                                  ;
PUSH AF                                                     ;
LD A, $1D                                                   ;
CALL SetProgramBank_00_037B                                 ;sprite displayable data is in bank $1D

XOR A                                                       ;start from the top
LD [LatestOAMSlot], A                                       ;

LD HL, SpriteDisplayables_ID                                ;
LD B, $00                                                   ;

LOOP_00_3F37:
LD A, [HL+]                                                 ;
CP SpriteDisplayable_None                                   ;check if sprite displayable isn't occupying this slot
JR Z, CODE_00_3F3F                                          ;

CALL DrawSpriteDisplayable_00_3F6B                          ;

CODE_00_3F3F:
INC B                                                       ;
LD A, B                                                     ;
CP 10                                                       ;
JR NZ, LOOP_00_3F37                                         ;

CALL RemoveRemainingSpriteSlots_00_3F4C                     ;

POP AF                                                      ;
JP SetProgramBank_00_037B                                   ;

;a duplicate of an already used routine for some reason.
RemoveRemainingSpriteSlots_00_3F4C:
LD DE, OAM_Y                                                ;
LD A, [LatestOAMSlot]                                       ;
SLA A                                                       ;
SLA A                                                       ;
ADD A, E                                                    ;
LD E, A                                                     ;
LD A, D                                                     ;
ADC A, $00                                                  ;
LD D, A                                                     ;

LOOP_00_3F5C:
LD A, E                                                     ;
CP 40*4                                                     ;
JR NC, RETURN_00_3F6A                                       ;if cleared all remaining slots, quit

INC DE                                                      ;
LD A, $00                                                   ;
LD [DE], A                                                  ;sprite slot gone

INC DE                                                      ;
INC DE                                                      ;
INC DE                                                      ;
JR LOOP_00_3F5C                                             ;

RETURN_00_3F6A:
RET                                                         ;

;input B - sprite displayable slot
DrawSpriteDisplayable_00_3F6B:
PUSH HL                                                     ;
PUSH BC                                                     ;

LD HL, SpriteDisplayables_YPos                              ;
LD C, B                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;
LD E, [HL]                                                  ;get base y-pos

LD HL, SpriteDisplayables_XPos                              ;
ADD HL, BC                                                  ;
LD D, [HL]                                                  ;get base x-pos

PUSH DE                                                     ;
LD HL, SpriteDisplayables_ID                                ;
ADD HL, BC                                                  ;
LD A, [HL]                                                  ;
LD HL, SpriteDisplayableDataPointers_1D_6B0C                ;get pointer to display data
SLA A                                                       ;times 2
LD C, A                                                     ;
LD B, $00                                                   ;
ADD HL, BC                                                  ;
LD E, [HL]                                                  ;
INC HL                                                      ;
LD D, [HL]                                                  ;set data pointer into DE

LD HL, OAM_Y                                                ;
LD A, [LatestOAMSlot]                                       ;get last used slot
SLA A                                                       ;
SLA A                                                       ;times 4
LD C, A                                                     ;

LD B, $00                                                   ;
ADD HL, BC                                                  ;offset OAM
POP BC                                                      ;

;C - base Y-pos
;B - base X-pos
LOOP_00_3F9B:
LD A, [DE]                                                  ;
ADD A, C                                                    ;
LD [HL+], A                                                 ;y-pos

INC DE                                                      ;
LD A, [DE]                                                  ;
ADD A, B                                                    ;
LD [HL+], A                                                 ;x-pos

INC DE                                                      ;
LD A, [DE]                                                  ;sprite tile
LD [HL+], A                                                 ;

INC DE                                                      ;
LD A, [DE]                                                  ;property
RES 0, A                                                    ;bit 0 is special
LD [HL+], A

LD A, [DE]                                                  ;get that property again
INC DE                                                      ;

PUSH AF                                                     ;
LD A, [LatestOAMSlot]                                       ;
INC A                                                       ;next slot
LD [LatestOAMSlot], A                                       ;
POP AF                                                      ;

SRL A                                                       ;bit 0
JR NC, LOOP_00_3F9B                                         ;indicates the end of the sprite image

POP BC                                                      ;
POP HL                                                      ;
RET                                                         ;