Music_0D_Square1Data_01_5A54:
SetTempo 2
DefineVolume 0,  151
DefineVolume 1,  103
DefineVolume 2,  96
SetChannelDuty 1
SetChannelPan 3
SetBaseFrequencyOffset -2

SoundLoop_01_5A60:
ExecuteDataBlock SoundDataBlock_01_5ACD
SetNote $09, 36, 0
SetNote $10, 36, 1
SetNote $19, 36, 1
SetNote $15, 36, 1
SetNote $12, 36, 1
SetNote $15, 36, 1
ExecuteDataBlock SoundDataBlock_01_5ACD
SetNote $06, 36, 0
SetNote $0D, 36, 1
SetNote $16, 36, 1
SetNote $10, 36, 1
SetNote $0D, 36, 1
SetNote $10, 36, 1
ExecuteDataBlock SoundDataBlock_01_5B06
ExecuteDataBlock SoundDataBlock_01_5AE0
ExecuteDataBlock SoundDataBlock_01_5AED
ExecuteDataBlock SoundDataBlock_01_5AE0
SetNote $0C, 36, 0
SetNote $12, 36, 1
SetNote $1B, 36, 1
SetNote $18, 36, 1
SetNote $0D, 36, 0
SetNote $1C, 36, 1
ExecuteDataBlock SoundDataBlock_01_5AED
SetBaseFrequencyOffset 1
ExecuteDataBlock SoundDataBlock_01_5AED
SetBaseFrequencyOffset -2
SetNote $0B, 36, 0
SetNote $12, 36, 1
SetNote $1B, 36, 1
SetNote $17, 36, 1
SetNote $12, 36, 1
SetNote $17, 36, 1
SetNote $0B, 108, 2
SetNote $0B, 108, 1
SoundBranch SoundLoop_01_5A60

SoundDataBlock_01_5AB3:
SetNote $0B, 36, 0
SetNote $12, 36, 1
SetNote $1A, 36, 1
SetNote $17, 36, 1
SetNote $12, 36, 1
SetNote $17, 36, 1
ReturnFromDataBlock

SoundDataBlock_01_5AC0:
SetNote $09, 36, 0
SetNote $10, 36, 1
SetNote $19, 36, 1
SetNote $15, 36, 1
SetNote $10, 36, 1
SetNote $15, 36, 1
ReturnFromDataBlock

SoundDataBlock_01_5ACD:
ExecuteDataBlock SoundDataBlock_01_5AB3
ExecuteDataBlock SoundDataBlock_01_5AC0
SetNote $04, 36, 0
SetNote $0B, 36, 1
SetNote $14, 36, 1
SetNote $10, 36, 1
SetNote $0B, 36, 1
SetNote $10, 36, 1
ReturnFromDataBlock

SoundDataBlock_01_5AE0:
SetNote $0F, 36, 0
SetNote $16, 36, 1
SetNote $1E, 36, 1
SetNote $19, 36, 1
SetNote $16, 36, 1
SetNote $19, 36, 1
ReturnFromDataBlock

SoundDataBlock_01_5AED:
SetNote $10, 36, 0
SetNote $17, 36, 1
SetNote $20, 36, 1
SetNote $1B, 36, 1
SetNote $17, 36, 1
SetNote $1B, 36, 1
SetNote $12, 36, 0
SetNote $19, 36, 1
SetNote $22, 36, 1
SetNote $1C, 36, 1
SetNote $19, 36, 1
SetNote $1C, 36, 1
ReturnFromDataBlock

SoundDataBlock_01_5B06:
SetNote $0B, 36, 0
SetNote $12, 36, 1
SetNote $1B, 36, 1
SetNote $17, 36, 1
SetNote $12, 36, 1
SetNote $17, 36, 1
ReturnFromDataBlock

Music_0D_Square2Data_01_5B13:
DefineVolume 0,  150
DefineVolume 1,  144
SetChannelDuty 3
SetChannelPan 3
SetBaseFrequencyOffset -2

SoundLoop_01_5B1B:
ExecuteDataBlock SoundDataBlock_01_5B84
SetNote $2A, 36, 0
SetNote $28, 72, 0
SetNote $2A, 36, 1
SetNote $2A, 108, 0
SetNote $26, 36, 0
SetNote $28, 36, 0
ExecuteDataBlock SoundDataBlock_01_5B84
SetNote $28, 36, 0
SetNote $2A, 36, 0
SetNote $2C, 36, 0
SetNote $2E, 36, 1
SetNote $2E, 108, 0
SetNote $2A, 72, 0
SetNote $2F, 108, 0
SetNote $31, 36, 0
SetNote $33, 36, 0
SetNote $2F, 36, 0
SetNote $2E, 72, 0
SetNote $2C, 108, 0
SetNote $2C, 36, 0
SetNote $31, 108, 0
SetNote $33, 36, 0
SetNote $34, 36, 0
SetNote $31, 36, 0
SetNote $2F, 72, 0
SetNote $2E, 72, 0
SetNote $33, 36, 0
SetNote $34, 36, 0
SetNote $36, 108, 0
SetNote $33, 36, 0
SetNote $34, 36, 0
SetNote $36, 36, 0
SetNote $39, 36, 1
SetNote $39, 108, 0
SetNote $38, 72, 0
SetNote $3B, 108, 0
SetNote $38, 36, 0
SetNote $34, 36, 0
SetNote $2F, 36, 0
SetNote $2E, 108, 0
SetNote $2F, 36, 0
SetNote $31, 72, 0
SetNote $2F, 128, 1
SetNote $2F, 128, 1
SetNote $2F, 128, 1
SetNote $2F, 128, 1
SetNote $2F, 128, 1
SetNote $2F, 116, 1
SetNote $2F, 108, 0
SoundBranch SoundLoop_01_5B1B

SoundDataBlock_01_5B84:
SetNote $2A, 36, 1
SetNote $2A, 108, 0
SetNote $26, 36, 0
SetNote $28, 36, 0
SetNote $2A, 108, 1
SetNote $2A, 72, 0
SetNote $2D, 36, 0
SetNote $2C, 108, 0
ReturnFromDataBlock

Music_0D_WaveData_01_5B95:
DefineVolume 0,  32
DefineVolume 1,  208
DefineVolume 2,  108
SetChannelPan 3
SetBaseFrequencyOffset -2

SoundLoop_01_5B9E:
ExecuteDataBlock SoundDataBlock_01_5BDB
ExecuteDataBlock SoundDataBlock_01_5BDB
SetNote $27, 108, 0
SetNote $27, 108, 0
SetNote $2A, 108, 0
SetNote $2A, 108, 0
SetNote $2C, 108, 0
SetNote $2C, 108, 0
SetNote $28, 108, 0
SetNote $28, 108, 0
SetNote $2A, 108, 0
SetNote $2A, 108, 0
SetNote $27, 36, 0
SetNote $27, 108, 0
SetNote $28, 72, 0
SetNote $27, 108, 0
SetNote $27, 108, 0
SetNote $28, 108, 0
SetNote $28, 108, 0
SetNote $2A, 108, 0
SetNote $2A, 108, 0
SetNote $2B, 108, 0
SetNote $2B, 108, 0
SetNote $2A, 108, 0
SetNote $2A, 108, 0
SetNote $2A, 108, 0
SetNote $2A, 72, 1
SetNote $2A, 36, 2
SoundBranch SoundLoop_01_5B9E

SoundDataBlock_01_5BDB:
SetNote $26, 108, 0
SetNote $26, 108, 0
SetNote $25, 108, 0
SetNote $25, 108, 0
SetNote $23, 108, 0
SetNote $23, 108, 0
SetNote $25, 108, 0
SetNote $25, 108, 0
ReturnFromDataBlock

Music_0D_NoiseData_01_5BEC:
EndChannelProcessing                                        ;DONT MAKE A NOISE!!!!