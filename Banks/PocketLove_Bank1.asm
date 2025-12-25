;PRG ROM $4000-$7FFF

SECTION "bank 1", ROMX, BANK[1]

;sound effect and music data.
;each song and sfx reserves 4 bytes for each respective channel:
;Square 1, Square 2, Noise, Wave
;If value is $80, that channel is not used
;Otherwise, it's a value for sound data pointer
MusicAndSFXChannelConfigurations_01_4000:

;songs
db $00,$00,$00,$00                                          ;no music
db $01,$02,$03,$04                                          ;Music_MainTheme
db $0D,$0E,$0F,$10                                          ;Music_NewGame
db $09,$0A,$0B,$0C                                          ;Music_03
db $1D,$1E,$1F,$20                                          ;Music_04
db $11,$12,$13,$14                                          ;Music_05
db $15,$16,$17,$18                                          ;Music_06
db $19,$1A,$1B,$1C                                          ;Music_07
db $05,$06,$07,$08                                          ;Music_ScheduleScreenWorkWeek
db $21,$22,$23,$24                                          ;Music_ScheduleScreenOffDay
db $25,$26,$27,$28                                          ;Music_0A (duplicate of Music_05)
db $29,$2A,$2B,$2C                                          ;Music_0B
db $2D,$2E,$2F,$30                                          ;Music_0C
db $31,$32,$33,$34                                          ;Music_0D
db $00,$00,$00,$00                                          ;placeholders
db $00,$00,$00,$00                                          ;

;SFX
db $80,$80,$35,$80                                          ;SFX_ChangeOption
db $80,$36,$80,$80                                          ;SFX_Confirm
db $37,$38,$80,$80                                          ;SFX_PhoneRing
db $80,$39,$80,$80                                          ;SFX_Cancel
db $00,$00,$00,$00                                          ;no SFX
db $80,$80,$80,$80                                          ;placeholders
db $80,$80,$80,$80                                          ;
db $80,$80,$80,$80                                          ;
db $80,$80,$80,$80                                          ;
db $80,$80,$80,$80                                          ;

SequenceDataPointers_01_4068:
dw NoSoundData_01_5BED                                      ;$00
dw Music_MainTheme_Square1Data_01_40DC                      ;$01
dw Music_MainTheme_Square2Data_01_418F                      ;$02
dw Music_MainTheme_WaveData_01_4270                         ;$03
dw Music_MainTheme_NoiseData_01_4376                        ;$04
dw Music_ScheduleScreenWorkWeek_Square1Data_01_438D         ;$05
dw Music_ScheduleScreenWorkWeek_Square2Data_01_444B         ;$06
dw Music_ScheduleScreenWorkWeek_WaveData_01_44F1            ;$07
dw Music_ScheduleScreenWorkWeek_NoiseData_01_45F7           ;$08
dw Music_03_Square1Data_01_460D                             ;$09
dw Music_03_Square2Data_01_471C                             ;$0A
dw Music_03_WaveData_01_480C                                ;$0B
dw Music_03_NoiseData_01_49B0                               ;$0C
dw Music_NewGame_Square1Data_01_49CB                        ;$0D
dw Music_NewGame_Square2Data_01_4ACF                        ;$0E
dw Music_NewGame_WaveData_01_4BD6                           ;$0F
dw Music_NewGame_NoiseData_01_4CF6                          ;$10
dw Music_05_Square1Data_01_4D18                             ;$11
dw Music_05_Square2Data_01_4DA7                             ;$12
dw Music_05_WaveData_01_4DDE                                ;$13
dw Music_05_NoiseData_01_4E12                               ;$14
dw Music_06_Square1Data_01_4E2D                             ;$15
dw Music_06_Square2Data_01_4EA8                             ;$16
dw Music_06_WaveData_01_4F2A                                ;$17
dw Music_06_NoiseData_01_4F9F                               ;$18
dw Music_07_Square1Data_01_4FBA                             ;$19
dw Music_07_Square2Data_01_506C                             ;$1A
dw Music_07_WaveData_01_50EC                                ;$1B
dw Music_07_NoiseData_01_5131                               ;$1C
dw Music_04_Square1Data_01_5132                             ;$1D
dw Music_04_Square2Data_01_51E0                             ;$1E
dw Music_04_WaveData_01_5274                                ;$1F
dw Music_04_NoiseData_01_5399                               ;$20
dw Music_ScheduleScreenOffDay_Square1Data_01_53BE           ;$21
dw Music_ScheduleScreenOffDay_Square2Data_01_5451           ;$22
dw Music_ScheduleScreenOffDay_WaveData_01_54FE              ;$23
dw Music_ScheduleScreenOffDay_NoiseData_01_5647             ;$24
dw Music_05_Square1Data_01_4D18                             ;$25
dw Music_05_Square2Data_01_4DA7                             ;$26
dw Music_05_WaveData_01_4DDE                                ;$27
dw Music_05_NoiseData_01_4E12                               ;$28
dw Music_0B_Square1Data_01_566A                             ;$29
dw Music_0B_Square2Data_01_567C                             ;$2A
dw Music_0B_WaveData_01_56FA                                ;$2B
dw Music_0B_NoiseData_01_5749                               ;$2C
dw Music_0C_Square1Data_01_574A                             ;$2D
dw Music_0C_Square2Data_01_5828                             ;$2E
dw Music_0C_WaveData_01_590E                                ;$2F
dw Music_0C_NoiseData_01_5A53                               ;$30
dw Music_0D_Square1Data_01_5A54                             ;$31
dw Music_0D_Square2Data_01_5B13                             ;$32
dw Music_0D_WaveData_01_5B95                                ;$33
dw Music_0D_NoiseData_01_5BEC                               ;$34
dw SFX_ChangeOption_WaveData_01_5C0D                        ;$35 
dw SFX_Confirm_Square2Data_01_5C21                          ;$36
dw SFX_PhoneRing_Square1Data_01_5C41                        ;$37
dw SFX_PhoneRing_Square2Data_01_5C6E                        ;$38
dw SFX_Cancel_Square2Data_01_5C7D                           ;$39

include "Data/Sound/Music_MainTheme.asm"
include "Data/Sound/Music_ScheduleScreenWorkWeek.asm"
include "Data/Sound/Music_03.asm"
include "Data/Sound/Music_NewGame.asm"
include "Data/Sound/Music_05.asm"
include "Data/Sound/Music_06.asm"
include "Data/Sound/Music_07.asm"
include "Data/Sound/Music_04.asm"
include "Data/Sound/Music_ScheduleScreenOffDay.asm"
include "Data/Sound/Music_0B.asm"
include "Data/Sound/Music_0C.asm"
include "Data/Sound/Music_0D.asm"

;dummy, don't play sound
NoSoundData_01_5BED:
EndChannelProcessing

;I think these would've been common sound "headers" if there were more songs using them

;unused sound data
DefineVolume 0,  210
DefineVolume 1,  209
DefineVolume 2,  113
DefineVolume 3,  213
SetChannelDuty 1
SetChannelPan 3
ReturnFromDataBlock

;also unused sound data
DefineVolume 0,  147
DefineVolume 1,  149
DefineVolume 2,  144
DefineVolume 3,  116
SetChannelDuty 3
SetChannelPan 3
ReturnFromDataBlock

;used by Music_ScheduleScreenWorkWeek
SoundDataBlock_01_5C04:
DefineVolume 0,  129
DefineVolume 1,  65
DefineVolume 2,  67
SetNoiseClockDivisor 1
SetChannelPan 3
ReturnFromDataBlock

include "Data/Sound/SFX_ChangeOption.asm"
include "Data/Sound/SFX_Confirm.asm"
include "Data/Sound/SFX_PhoneRing.asm"
include "Data/Sound/SFX_Cancel.asm"