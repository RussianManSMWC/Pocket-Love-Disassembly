Music_0B_Square1Data_01_566A:
SetTempo 2
DefineVolume 0,  132
DefineVolume 1,  134
DefineVolume 2,  128
SetChannelPan 3
SetBaseFrequencyOffset 12
SetChannelDuty 2

SoundLoop_01_5676:
ExecuteDataBlock SoundDataBlock_01_479F                     ;reuses a little chunk from Music_03
SoundBranch SoundLoop_01_5676

Music_0B_Square2Data_01_567C:
DefineVolume 0,  70
SetChannelDuty 2
SetChannelPan 3

SoundLoop_01_5680:
SetNote $21, 44, 0
SetNote $1E, 44, 0
SetNote $26, 44, 0
SetNote $1E, 44, 0
SetNote $21, 44, 0
SetNote $1E, 44, 0
SetNote $1A, 44, 0
SetNote $1C, 44, 0
SetNote $1E, 44, 0
SetNote $19, 44, 0
SetNote $21, 44, 0
SetNote $19, 44, 0
SetNote $1F, 44, 0
SetNote $1C, 44, 0
SetNote $23, 44, 0
SetNote $25, 44, 0
ExecuteDataBlock SoundDataBlock_01_56E9
SetNote $24, 44, 0
SetNote $1C, 44, 0
SetNote $1F, 44, 0
SetNote $1C, 44, 0
SetNote $27, 44, 0
SetNote $23, 44, 0
SetNote $2A, 44, 0
SetNote $23, 44, 0
ExecuteDataBlock SoundDataBlock_01_56E9
SetNote $25, 44, 0
SetNote $1E, 44, 0
SetNote $22, 44, 0
SetNote $1E, 44, 0
SetNote $26, 44, 0
SetNote $21, 44, 0
SetNote $25, 44, 0
SetNote $1F, 44, 0
SetNote $26, 44, 0
SetNote $1F, 44, 0
SetNote $23, 44, 0
SetNote $1F, 44, 0
SetNote $26, 44, 0
SetNote $20, 44, 0
SetNote $23, 44, 0
SetNote $20, 44, 0
SetNote $25, 44, 0
SetNote $1C, 44, 0
SetNote $1F, 44, 0
SetNote $1C, 44, 0
SetNote $21, 44, 0
SetNote $23, 44, 0
SetNote $25, 44, 0
SetNote $21, 44, 0
SoundBranch SoundLoop_01_5680

SoundDataBlock_01_56E9:
SetNote $26, 44, 0
SetNote $23, 44, 0
SetNote $2B, 44, 0
SetNote $23, 44, 0
SetNote $25, 44, 0
SetNote $1C, 44, 0
SetNote $1F, 44, 0
SetNote $1C, 44, 0
ReturnFromDataBlock

Music_0B_WaveData_01_56FA:
DefineVolume 0,  32
DefineVolume 1,  208
SetChannelPan 3

SoundLoop_01_56FF:
SetChannelPan 3
SetNote $1A, 128, 0
SetNote $1A, 128, 0
SetNote $1A, 96, 0
SetNote $1B, 88, 0
SetNote $1B, 88, 0
SetNote $1C, 68, 0
SetNote $1C, 20, 1
SetNote $1C, 44, 0
SetNote $1E, 44, 0
SetNote $1F, 88, 0
SetNote $1F, 88, 0
SetNote $21, 88, 0
SetNote $21, 88, 0
SetNote $18, 88, 0
SetNote $18, 88, 0
SetNote $17, 88, 0
SetNote $17, 88, 0
SetNote $1F, 88, 0
SetNote $1F, 88, 0
SetNote $21, 88, 0
SetNote $21, 88, 0
SetNote $22, 88, 0
SetNote $22, 88, 0
SetNote $23, 88, 0
SetNote $21, 88, 0
SetNote $1C, 88, 0
SetNote $1C, 88, 0
SetNote $20, 88, 0
SetNote $20, 88, 0
SetNote $21, 88, 0
SetNote $21, 88, 0
SetNote $21, 68, 0
SetNote $21, 20, 1
SetNote $17, 44, 0
SetNote $19, 44, 0
SoundBranch SoundLoop_01_56FF

Music_0B_NoiseData_01_5749:
EndChannelProcessing