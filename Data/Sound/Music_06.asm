Music_06_Square1Data_01_4E2D:
SetTempo 3
DefineVolume 0,  226
DefineVolume 1,  229
DefineVolume 2,  115
SetChannelDuty 1
SetChannelPan 3

SoundLoop_01_4E37:
SetNote $07, 72, 0
SetNote $07, 24, 0
SetNote $02, 48, 0
SetNote $04, 48, 0
SetNote $07, 72, 0
SetNote $07, 24, 0
SetNote $09, 48, 0
SetNote $07, 48, 0
ExecuteDataBlock SoundDataBlock_01_4E99
SetNote $06, 48, 0
ExecuteDataBlock SoundDataBlock_01_4E99
SetNote $06, 48, 0
SetNote $07, 72, 0
SetNote $07, 24, 0
SetNote $02, 48, 0
SetNote $07, 48, 0
SetNote $05, 72, 0
SetNote $05, 24, 0
SetNote $02, 48, 0
SetNote $05, 48, 0
SetNote $00, 72, 0
SetNote $00, 24, 0
SetNote $07, 48, 0
SetNote $09, 48, 0
SetNote $0C, 72, 0
SetNote $0C, 24, 0
SetNote $07, 48, 0
SetNote $04, 48, 0
SetNote $0B, 72, 0
SetNote $0B, 24, 0
SetNote $0C, 48, 0
SetNote $0E, 48, 0
SetNote $10, 72, 0
SetNote $10, 24, 0
SetNote $0B, 48, 0
SetNote $04, 48, 0
SetNote $09, 72, 0
SetNote $09, 24, 0
SetNote $04, 48, 0
SetNote $07, 48, 0
SetNote $09, 72, 0
SetNote $09, 24, 0
SetNote $07, 48, 0
SetNote $06, 48, 0
ExecuteDataBlock SoundDataBlock_01_4E99
SetNote $06, 48, 0
SoundBranch SoundLoop_01_4E37

SoundDataBlock_01_4E99:
SetNote $02, 72, 0
SetNote $02, 24, 0
SetNote $09, 48, 0
SetNote $0C, 48, 0
SetNote $0E, 72, 0
SetNote $0E, 24, 0
SetNote $09, 48, 0
ReturnFromDataBlock

Music_06_Square2Data_01_4EA8:
DefineVolume 0,  145
DefineVolume 1,  149
SetChannelPan 3

SoundLoop_01_4EAD:
SetChannelDuty 0
SetNote $6F, 48, 0
SetNote $2B, 24, 0
SetNote $26, 48, 0
SetNote $2F, 48, 0
SetNote $26, 24, 0
SetNote $2D, 24, 0
SetNote $2F, 24, 0
SetNote $2D, 24, 0
SetNote $2B, 48, 0
SetNote $2D, 24, 0
SetNote $2B, 48, 0
SetNote $2A, 72, 0
SetNote $2A, 24, 0
SetNote $2B, 48, 0
SetNote $2C, 48, 0
SetNote $2D, 96, 0
SetNote $6F, 96, 0
SetNote $6F, 48, 0
SetNote $2D, 24, 0
SetNote $26, 48, 0
SetNote $30, 48, 0
SetNote $2F, 24, 0
SetNote $2F, 24, 0
SetNote $30, 24, 0
SetNote $2F, 24, 0
SetNote $2D, 48, 0
SetNote $2F, 24, 0
SetNote $2D, 48, 0
SetNote $2B, 72, 0
SetNote $2B, 24, 0
SetNote $2D, 48, 0
SetNote $2E, 48, 0
SetNote $2F, 72, 0
SetChannelDuty 3
SetNote $2B, 72, 1
SetNote $2B, 48, 1
SetNote $34, 120, 1
SetNote $6F, 24, 0
SetNote $30, 48, 1
SetNote $2B, 72, 1
SetNote $2D, 72, 1
SetNote $34, 48, 1
SetNote $32, 120, 1
SetNote $6F, 24, 0
SetNote $2F, 48, 1
SetNote $36, 72, 1
SetNote $37, 72, 1
SetNote $37, 48, 1
SetNote $37, 96, 1
SetNote $30, 48, 1
SetNote $32, 48, 1
SetNote $34, 72, 1
SetNote $37, 72, 1
SetNote $37, 48, 1
SetNote $36, 72, 1
SetNote $37, 72, 1
SetNote $39, 48, 1
SetNote $34, 72, 1
SetNote $32, 72, 1
SetNote $26, 24, 1
SetNote $2A, 24, 1
SoundBranch SoundLoop_01_4EAD

Music_06_WaveData_01_4F2A:
DefineVolume 0,  32
DefineVolume 1,  208
EnableChannelPanning 1

SoundLoop_01_4F2F:
ExecuteDataBlock SoundDataBlock_01_4F6F
SetBaseFrequencyOffset -5
ExecuteDataBlock SoundDataBlock_01_4F6F
ExecuteDataBlock SoundDataBlock_01_4F6F
SetBaseFrequencyOffset 0
ExecuteDataBlock SoundDataBlock_01_4F6F
ExecuteDataBlock SoundDataBlock_01_4F8B
SetNote $36, 24, 0
SetNote $2D, 24, 0
SetNote $32, 24, 0
SetNote $2D, 24, 0
SetNote $32, 24, 0
SetNote $2A, 24, 0
SetNote $2D, 24, 0
SetNote $2A, 24, 0
SetNote $37, 24, 0
SetNote $2F, 24, 0
SetNote $32, 24, 0
SetNote $2F, 24, 0
SetNote $32, 24, 0
SetNote $2B, 24, 0
SetNote $2F, 24, 0
SetNote $2B, 24, 0
ExecuteDataBlock SoundDataBlock_01_4F8B
SetBaseFrequencyOffset 2
ExecuteDataBlock SoundDataBlock_01_4F8B
SetBaseFrequencyOffset 0
SoundBranch SoundLoop_01_4F2F

SoundDataBlock_01_4F6F:
ExecuteDataBlock SoundDataBlock_01_4F72

SoundDataBlock_01_4F72:
SetNote $2B, 8, 1
SetNote $6F, 16, 0
SetNote $1F, 24, 1
SetNote $37, 4, 0
SetNote $6F, 20, 0
SetNote $26, 24, 1
SetNote $2F, 8, 1
SetNote $6F, 16, 0
SetNote $23, 24, 1
SetNote $37, 4, 0
SetNote $6F, 20, 0
SetNote $26, 24, 1
ReturnFromDataBlock

SoundDataBlock_01_4F8B:
ExecuteDataBlock SoundDataBlock_01_4F8E

SoundDataBlock_01_4F8E:
SetNote $37, 24, 0
SetNote $30, 24, 0
SetNote $34, 24, 0
SetNote $30, 24, 0
SetNote $34, 24, 0
SetNote $2B, 24, 0
SetNote $30, 24, 0
SetNote $2B, 24, 0
ReturnFromDataBlock

Music_06_NoiseData_01_4F9F:
DefineVolume 0,  129
DefineVolume 1,  65
DefineVolume 2,  67
SetNoiseClockDivisor 1
SetChannelPan 3

SoundLoop_01_4FA7:
SetNote $0F, 24, 0
SetNote $03, 24, 1
SetNote $05, 24, 1
SetNote $0F, 24, 0
SetNote $0B, 24, 0
SetNote $03, 24, 1
SetNote $0F, 24, 0
SetNote $05, 24, 1
SoundBranch SoundLoop_01_4FA7