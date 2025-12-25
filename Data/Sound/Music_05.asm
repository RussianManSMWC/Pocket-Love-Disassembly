Music_05_Square1Data_01_4D18:
SetTempo 2
DefineVolume 0,  87
DefineVolume 1,  45
DefineVolume 2,  103
SetChannelDuty 2
SetChannelPan 3

SoundLoop_01_4D22:
SetNote $6F, 56, 0
ExecuteDataBlock SoundDataBlock_01_4DB5
SetNote $37, 108, 0
ExecuteDataBlock SoundDataBlock_01_4DB5
SetNote $37, 52, 0
SetNote $26, 36, 1
SetNote $25, 36, 1
SetNote $26, 36, 1
SetNote $2D, 36, 1
SetNote $2D, 36, 2
SetNote $2B, 36, 1
SetNote $2B, 36, 2
SetNote $29, 36, 1
SetNote $28, 36, 1
SetNote $29, 36, 1
SetNote $2B, 36, 1
SetNote $24, 36, 1
SetNote $24, 36, 2
SetNote $24, 36, 1
SetNote $26, 36, 1
SetNote $28, 36, 1
SetNote $28, 36, 2
SetNote $28, 36, 1
SetNote $29, 36, 1
SetNote $30, 36, 1
SetNote $30, 36, 2
SetNote $2E, 36, 1
SetNote $2E, 36, 2
SetNote $2D, 36, 1
SetNote $2D, 72, 2
SetNote $2D, 36, 1
SetNote $2E, 36, 1
SetNote $2E, 36, 2
SetNote $2E, 36, 1
SetNote $30, 36, 1
SetNote $30, 72, 2
SetNote $32, 36, 1
SetNote $35, 36, 1
SetNote $2B, 36, 1
SetNote $2B, 36, 2
SetNote $2D, 36, 1
SetNote $2E, 36, 1
SetNote $30, 36, 1
SetNote $30, 36, 2
SetNote $32, 36, 1
SetNote $34, 36, 1
SetNote $30, 36, 1
SetNote $30, 36, 2
SetNote $2E, 36, 1
SetNote $2D, 36, 1
SetNote $2D, 36, 2
SetNote $2E, 36, 1
SetNote $30, 36, 1
SetNote $32, 36, 1
SetNote $29, 36, 1
SetNote $29, 36, 2
SetNote $2B, 36, 1
SetNote $2E, 36, 1
SetNote $2D, 36, 1
SetNote $2D, 36, 2
SetNote $2B, 36, 1
SetNote $29, 36, 1
SetNote $28, 52, 1
SetNote $28, 128, 2
SoundBranch SoundLoop_01_4D22

Music_05_Square2Data_01_4DA7:
DefineVolume 0,  116
SetChannelDuty 3
SetChannelPan 3

SetNote $6F, 36, 0

SoundLoop_01_4DAD:
ExecuteDataBlock SoundDataBlock_01_4DB5
SetNote $37, 108, 0
SoundBranch SoundLoop_01_4DAD

SoundDataBlock_01_4DB5:
SetNote $39, 36, 0
SetNote $35, 36, 0
SetNote $32, 72, 0
SetNote $34, 36, 0
SetNote $35, 108, 0
SetNote $37, 36, 0
SetNote $34, 36, 0
SetNote $30, 72, 0
SetNote $32, 36, 0
SetNote $34, 108, 0
SetNote $35, 36, 0
SetNote $2D, 36, 0
SetNote $2E, 72, 0
SetNote $30, 36, 0
SetNote $32, 36, 0
SetNote $35, 36, 0
SetNote $34, 72, 0
SetNote $34, 36, 0
SetNote $35, 72, 0
SetNote $35, 36, 0
ReturnFromDataBlock

Music_05_WaveData_01_4DDE:
DefineVolume 0,  38
DefineVolume 1,  208
DefineVolume 2,  108

SoundLoop_01_4DE4:
SetChannelPan 3
SetNote $22, 120, 0
SetNote $22, 120, 0
SetNote $22, 12, 1
SetNote $22, 24, 0
SetNote $22, 12, 1
SetNote $21, 120, 0
SetNote $21, 120, 0
SetNote $21, 12, 1
SetNote $21, 24, 0
SetNote $21, 12, 1
SetNote $1F, 120, 0
SetNote $1F, 120, 0
SetNote $1F, 12, 1
SetNote $1F, 24, 0
SetNote $1F, 12, 1
SetNote $1D, 96, 0
SetNote $1D, 12, 1
SetNote $1F, 96, 0
SetNote $1F, 12, 1
SetNote $21, 60, 0
SetNote $21, 12, 1
SoundBranch SoundLoop_01_4DE4

Music_05_NoiseData_01_4E12:
DefineVolume 0,  97
DefineVolume 1,  65
DefineVolume 2,  67
SetNoiseClockDivisor 1
SetChannelPan 3

SoundLoop_01_4E1A:
SetNote $0F, 36, 0
SetNote $04, 36, 1
SetNote $02, 36, 2
SetNote $0F, 36, 0
SetNote $02, 36, 1
SetNote $04, 36, 1
SetNote $02, 36, 2
SetNote $0F, 36, 0
SoundBranch SoundLoop_01_4E1A