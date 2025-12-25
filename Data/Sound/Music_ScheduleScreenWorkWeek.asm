Music_ScheduleScreenWorkWeek_Square1Data_01_438D:
SetTempo 4
DefineVolume 0,  226
DefineVolume 1,  225
DefineVolume 2,  229
SetChannelDuty 1
SetChannelPan 3
SetBaseFrequencyOffset -1

SoundLoop_01_4399:
ExecuteDataBlock SoundDataBlock_01_43FE
SetNote $08, 56, 0
SetNote $0A, 56, 1
SetNote $0C, 112, 2
ExecuteDataBlock SoundDataBlock_01_43FE
SetNote $08, 56, 0
SetNote $03, 56, 1
SetNote $07, 112, 2
ExecuteDataBlock SoundDataBlock_01_442F
SetNote $05, 84, 0
SetNote $05, 28, 1
SetNote $0C, 56, 2
SetNote $09, 56, 0
SetNote $0A, 84, 0
SetNote $0A, 28, 1
SetNote $05, 56, 2
ExecuteDataBlock SoundDataBlock_01_4440
SetNote $08, 84, 0
SetNote $08, 28, 0
SetNote $03, 56, 0
SetNote $08, 56, 0
SetNote $0D, 84, 2
SetNote $0D, 28, 0
SetNote $0B, 56, 2
SetNote $0B, 56, 0
SetNote $0A, 84, 0
SetNote $07, 84, 2
SetNote $07, 56, 0
ExecuteDataBlock SoundDataBlock_01_442F
SetNote $05, 84, 0
SetNote $05, 28, 1
SetNote $0C, 56, 2
SetNote $05, 56, 0
SetNote $04, 84, 0
SetNote $04, 28, 1
SetNote $0B, 56, 2
ExecuteDataBlock SoundDataBlock_01_4440
SetNote $07, 84, 0
SetNote $07, 28, 0
SetNote $03, 56, 0
SetNote $07, 56, 0
SetNote $08, 112, 2
SetNote $0A, 112, 2
SetNote $0B, 84, 0
SetNote $0C, 84, 2
SetNote $08, 56, 0
SoundBranch SoundLoop_01_4399

SoundDataBlock_01_43FE:
SetNote $01, 84, 0
SetNote $01, 56, 1
SetNote $01, 28, 0
SetNote $03, 56, 1
SetNote $05, 112, 0
SetNote $6F, 112, 0
SetNote $06, 84, 0
SetNote $06, 56, 1
SetNote $06, 28, 0
SetNote $09, 56, 1
SetNote $0A, 112, 0
SetNote $06, 112, 2
SetNote $05, 84, 0
SetNote $05, 28, 1
SetNote $0C, 56, 2
SetNote $05, 56, 0
SetNote $04, 84, 0
SetNote $04, 28, 1
SetNote $0B, 56, 2
SetNote $04, 56, 0
SetNote $03, 84, 0
SetNote $03, 28, 1
SetNote $0A, 56, 2
SetNote $03, 56, 0
ReturnFromDataBlock

SoundDataBlock_01_442F:
SetNote $06, 84, 0
SetNote $06, 28, 1
SetNote $01, 56, 2
SetNote $05, 56, 0
SetNote $06, 84, 0
SetNote $06, 28, 1
SetNote $01, 56, 2
SetNote $06, 56, 0
ReturnFromDataBlock

SoundDataBlock_01_4440:
SetNote $04, 56, 0
SetNote $03, 84, 0
SetNote $03, 28, 1
SetNote $0A, 56, 2
SetNote $03, 56, 0
ReturnFromDataBlock

Music_ScheduleScreenWorkWeek_Square2Data_01_444B:
DefineVolume 0,  147
DefineVolume 1,  149
DefineVolume 2,  144
DefineVolume 3,  116
SetChannelDuty 3
SetChannelPan 3
SetBaseFrequencyOffset -1

SoundLoop_01_4457:
ExecuteDataBlock SoundDataBlock_01_44C6
SetNote $24, 56, 3
SetNote $25, 56, 3
SetNote $27, 112, 3
ExecuteDataBlock SoundDataBlock_01_44C6
SetNote $6F, 56, 0
SetChannelDuty 2
SetNote $2C, 56, 0
SetNote $2D, 112, 1
SetNote $2E, 112, 1
SetNote $31, 112, 1
SetNote $30, 84, 1
SetNote $31, 84, 1
SetNote $2E, 56, 1
SetNote $2C, 112, 2
SetNote $2C, 112, 1
SetNote $6F, 56, 0
SetNote $2C, 56, 1
SetNote $2A, 56, 1
SetNote $29, 56, 1
SetNote $2A, 112, 1
SetNote $25, 112, 1
SetNote $24, 84, 1
SetNote $25, 84, 1
SetNote $27, 56, 1
SetNote $29, 112, 1
SetNote $2A, 112, 1
SetNote $2C, 84, 1
SetNote $31, 84, 1
SetNote $30, 56, 1
SetNote $2E, 112, 1
SetNote $31, 112, 1
SetNote $30, 84, 1
SetNote $31, 84, 1
SetNote $33, 56, 1
SetNote $38, 112, 2
SetNote $38, 112, 1
SetNote $6F, 56, 0
SetNote $31, 56, 1
SetNote $30, 56, 1
SetNote $31, 56, 1
SetNote $35, 56, 1
SetNote $36, 56, 1
SetNote $35, 56, 1
SetNote $33, 112, 1
SetNote $31, 56, 1
SetNote $30, 56, 1
SetNote $2E, 56, 1
SetNote $30, 112, 1
SetNote $31, 112, 1
SetNote $32, 84, 1
SetNote $33, 84, 1
SetChannelDuty 3
SetNote $2A, 56, 1
SoundBranch SoundLoop_01_4457

SoundDataBlock_01_44C6:
SetNote $29, 84, 1
SetNote $29, 56, 0
SetNote $29, 28, 1
SetNote $2A, 56, 0
SetNote $2C, 112, 0
SetNote $6F, 56, 0
SetNote $25, 56, 1
SetNote $2E, 84, 1
SetNote $2E, 56, 0
SetNote $2E, 28, 1
SetNote $30, 56, 0
SetNote $31, 112, 0
SetNote $30, 56, 1
SetNote $2E, 56, 1
SetNote $2C, 112, 1
SetNote $31, 112, 1
SetNote $2F, 84, 1
SetNote $31, 84, 1
SetNote $2C, 128, 2
SetNote $2C, 128, 1
SetNote $6F, 24, 0
ReturnFromDataBlock

Music_ScheduleScreenWorkWeek_WaveData_01_44F1:
DefineVolume 0,  38
DefineVolume 1,  208
DefineVolume 2,  108
EnableChannelPanning 1
SetBaseFrequencyOffset -1

SoundLoop_01_44FA:
ExecuteDataBlock SoundDataBlock_01_457E
SetNote $33, 56, 0
SetNote $35, 28, 0
SetNote $35, 28, 1
SetNote $36, 84, 0
SetNote $36, 28, 1
ExecuteDataBlock SoundDataBlock_01_457E
SetNote $36, 28, 0
SetNote $36, 28, 1
SetNote $30, 28, 0
SetNote $30, 28, 1
SetNote $34, 84, 0
SetNote $34, 28, 1
ExecuteDataBlock SoundDataBlock_01_45E9
ExecuteDataBlock SoundDataBlock_01_45C7
ExecuteDataBlock SoundDataBlock_01_45B6
ExecuteDataBlock SoundDataBlock_01_45D8
SetNote $2C, 56, 0
SetNote $2C, 56, 1
SetNote $2D, 56, 0
SetNote $2D, 56, 1
SetNote $31, 56, 0
SetNote $31, 28, 1
SetNote $34, 112, 0
SetNote $34, 28, 1
ExecuteDataBlock SoundDataBlock_01_45E9
SetNote $32, 28, 0
SetNote $32, 28, 1
SetNote $2C, 28, 0
SetNote $2C, 28, 1
SetNote $32, 28, 0
SetNote $32, 28, 1
SetNote $2C, 28, 0
SetNote $2C, 28, 1
SetNote $31, 28, 0
SetNote $31, 28, 1
SetNote $2A, 28, 0
SetNote $2A, 28, 1
SetNote $31, 28, 0
SetNote $31, 28, 1
SetNote $2A, 28, 0
SetNote $2A, 28, 1
SetNote $31, 28, 0
SetNote $31, 28, 1
SetNote $2B, 28, 0
SetNote $2B, 28, 1
SetNote $31, 28, 0
SetNote $31, 28, 1
SetNote $2B, 28, 0
SetNote $2B, 28, 1
SetNote $27, 56, 0
SetNote $27, 28, 1
SetNote $27, 28, 2
SetNote $28, 56, 0
SetNote $28, 28, 1
SetNote $28, 28, 2
SetNote $29, 56, 0
SetNote $29, 28, 1
SetNote $2A, 84, 0
SetNote $2A, 28, 0
SetNote $2A, 28, 1
SoundBranch SoundLoop_01_44FA

SoundDataBlock_01_457E:
SetNote $2C, 56, 0
SetNote $2C, 28, 1
SetNote $2C, 28, 0
SetNote $2C, 28, 1
SetNote $2C, 28, 0
SetNote $30, 28, 0
SetNote $30, 28, 1
SetNote $31, 32, 0
SetNote $31, 32, 1
SetNote $31, 48, 2
SetNote $6F, 112, 0
SetNote $31, 56, 0
SetNote $31, 28, 1
SetNote $31, 28, 0
SetNote $31, 28, 1
SetNote $31, 28, 0
SetNote $34, 28, 0
SetNote $34, 28, 1
SetNote $35, 32, 0
SetNote $35, 32, 1
SetNote $35, 48, 2
SetNote $31, 112, 0
SetBaseFrequencyOffset 1
ExecuteDataBlock SoundDataBlock_01_45B6
SetBaseFrequencyOffset 0
ExecuteDataBlock SoundDataBlock_01_45B6
SetBaseFrequencyOffset -1

SoundDataBlock_01_45B6:
SetNote $31, 28, 0
SetNote $31, 28, 1
SetNote $2E, 28, 0
SetNote $2E, 28, 1
SetNote $31, 28, 0
SetNote $31, 28, 1
SetNote $2E, 28, 0
SetNote $2E, 28, 1
ReturnFromDataBlock

SoundDataBlock_01_45C7:
SetNote $35, 28, 0
SetNote $35, 28, 1
SetNote $31, 28, 0
SetNote $31, 28, 1
SetNote $35, 28, 0
SetNote $35, 28, 1
SetNote $31, 28, 0
SetNote $31, 28, 1
ReturnFromDataBlock

SoundDataBlock_01_45D8:
SetNote $36, 28, 0
SetNote $36, 28, 1
SetNote $33, 28, 0
SetNote $33, 28, 1
SetNote $36, 28, 0
SetNote $36, 28, 1
SetNote $33, 28, 0
SetNote $33, 28, 1
ReturnFromDataBlock

SoundDataBlock_01_45E9:
ExecuteDataBlock SoundDataBlock_01_45C7
ExecuteDataBlock SoundDataBlock_01_45B6
SetBaseFrequencyOffset 1
ExecuteDataBlock SoundDataBlock_01_45B6
SetBaseFrequencyOffset -1
ReturnFromDataBlock

Music_ScheduleScreenWorkWeek_NoiseData_01_45F7:
ExecuteDataBlock SoundDataBlock_01_5C04

SoundLoop_01_45FA:
SetNote $0F, 28, 0
SetNote $02, 28, 1
SetNote $04, 28, 1
SetNote $0F, 28, 0
SetNote $0B, 28, 0
SetNote $04, 28, 1
SetNote $0F, 28, 0
SetNote $04, 28, 1
SoundBranch SoundLoop_01_45FA