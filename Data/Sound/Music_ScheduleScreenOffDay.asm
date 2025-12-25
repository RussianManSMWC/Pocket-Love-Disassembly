Music_ScheduleScreenOffDay_Square1Data_01_53BE:
SetTempo 2
DefineVolume 0,  226
DefineVolume 1,  227
DefineVolume 2,  113
SetChannelDuty 1
SetChannelPan 3

SoundLoop_01_53C8:
SetNote $00, 60, 0
SetNote $02, 20, 0
SetNote $04, 60, 0
ExecuteDataBlock SoundDataBlock_01_542C
SetBaseFrequencyOffset -1
ExecuteDataBlock SoundDataBlock_01_542C
SetBaseFrequencyOffset -3
ExecuteDataBlock SoundDataBlock_01_542C
SetBaseFrequencyOffset 7
ExecuteDataBlock SoundDataBlock_01_542C
SetBaseFrequencyOffset 5
ExecuteDataBlock SoundDataBlock_01_542C
SetBaseFrequencyOffset -5
ExecuteDataBlock SoundDataBlock_01_542C
SetBaseFrequencyOffset 0
SetNote $09, 60, 0
SetNote $09, 60, 1
SetNote $08, 60, 0
SetNote $08, 60, 1
SetNote $07, 60, 0
SetNote $07, 60, 1
SetNote $00, 60, 0
SetNote $00, 40, 1
SetNote $07, 20, 1
ExecuteDataBlock SoundDataBlock_01_542C
ExecuteDataBlock SoundDataBlock_01_5437
SetBaseFrequencyOffset -3
ExecuteDataBlock SoundDataBlock_01_542C
SetBaseFrequencyOffset -4
ExecuteDataBlock SoundDataBlock_01_5437
SetBaseFrequencyOffset 5
ExecuteDataBlock SoundDataBlock_01_542C
SetBaseFrequencyOffset 0
SetNote $0C, 60, 0
SetNote $0C, 60, 1
SetNote $07, 60, 1
SetNote $09, 60, 1
ExecuteDataBlock SoundDataBlock_01_5442
SetNote $05, 60, 0
SetNote $07, 20, 0
SetNote $09, 60, 0
ExecuteDataBlock SoundDataBlock_01_5442
SoundBranch SoundLoop_01_53C8

SoundDataBlock_01_542C:
SetNote $05, 60, 0
SetNote $05, 60, 1
SetNote $05, 60, 0
SetNote $05, 40, 1
SetNote $0C, 20, 1
ReturnFromDataBlock

SoundDataBlock_01_5437:
SetNote $04, 60, 0
SetNote $04, 60, 1
SetNote $09, 60, 0
SetNote $09, 40, 1
SetNote $04, 20, 1
ReturnFromDataBlock

SoundDataBlock_01_5442:
SetNote $0A, 60, 0
SetNote $0A, 60, 1
SetNote $09, 60, 0
SetNote $09, 40, 1
SetNote $04, 20, 1
SetNote $07, 60, 0
SetNote $07, 40, 1
ReturnFromDataBlock

Music_ScheduleScreenOffDay_Square2Data_01_5451:
DefineVolume 0,  147
DefineVolume 1,  149
DefineVolume 2,  134
SetChannelPan 3
SetChannelDuty 2

SoundLoop_01_5459:
SetNote $24, 60, 2
SetNote $26, 20, 2
SetNote $28, 60, 2
DefineVolume 2,  102
SetChannelDuty 3
SetNote $6F, 60, 0
SetNote $2D, 60, 1
SetNote $2E, 40, 1
SetNote $30, 60, 0
SetNote $2B, 80, 1
SetNote $30, 60, 1
SetNote $32, 40, 1
SetNote $34, 60, 0
SetNote $35, 80, 1
SetNote $34, 60, 1
SetNote $32, 40, 1
SetNote $2D, 60, 0
SetNote $28, 128, 1
SetNote $6F, 12, 0
SetNote $32, 60, 1
SetNote $30, 120, 1
SetNote $32, 60, 1
SetNote $34, 40, 1
SetNote $35, 60, 1
SetNote $37, 60, 0
SetNote $37, 20, 1
SetNote $35, 60, 1
SetNote $34, 60, 1
SetNote $32, 60, 1
SetNote $30, 120, 1
SetNote $6F, 40, 0
SetNote $2D, 20, 0
SetNote $2F, 40, 1
SetNote $30, 60, 1
SetNote $2E, 20, 1
SetNote $2D, 40, 1
SetNote $29, 60, 1
SetNote $29, 20, 0
SetNote $2B, 60, 1
SetNote $6F, 60, 0
SetNote $2D, 60, 1
SetNote $2E, 40, 1
SetNote $30, 60, 0
SetNote $32, 80, 1
SetNote $31, 40, 1
SetNote $32, 60, 0
SetNote $32, 20, 1
SetNote $34, 60, 1
SetNote $6F, 60, 0
SetNote $35, 60, 1
SetNote $35, 40, 1
SetNote $34, 60, 0
SetNote $33, 80, 1
SetNote $37, 40, 0
SetNote $35, 60, 1
SetNote $37, 20, 1
SetNote $39, 40, 1
SetNote $3A, 60, 0
SetNote $39, 60, 1
SetNote $37, 60, 1
SetNote $37, 20, 0
SetNote $35, 40, 1
SetNote $34, 120, 1
SetNote $30, 20, 1
SetNote $34, 40, 1
SetNote $37, 60, 0
SetNote $35, 128, 1
SetNote $6F, 12, 0
SetChannelDuty 2
SetNote $24, 60, 2
SetNote $24, 60, 2
SetNote $22, 60, 2
SetNote $22, 40, 2
SetNote $21, 60, 2
SetNote $22, 20, 2
SetNote $24, 60, 2
SetNote $26, 60, 2
SetNote $26, 60, 2
SetNote $24, 60, 2
SetNote $24, 60, 2
SetNote $22, 60, 2
SetNote $22, 40, 2
SoundBranch SoundLoop_01_5459

Music_ScheduleScreenOffDay_WaveData_01_54FE:
DefineVolume 0,  38
DefineVolume 1,  208
EnableChannelPanning 1

SoundLoop_01_5503:
SetNote $34, 40, 0
SetNote $2B, 20, 1
SetNote $35, 20, 0
SetNote $37, 20, 0
SetNote $37, 20, 1
SetNote $2E, 20, 1
ExecuteDataBlock SoundDataBlock_01_55B2
ExecuteDataBlock SoundDataBlock_01_55B2
ExecuteDataBlock SoundDataBlock_01_55C7
ExecuteDataBlock SoundDataBlock_01_55C7
ExecuteDataBlock SoundDataBlock_01_55B2
ExecuteDataBlock SoundDataBlock_01_55B2
ExecuteDataBlock SoundDataBlock_01_55E5
ExecuteDataBlock SoundDataBlock_01_55E5
ExecuteDataBlock SoundDataBlock_01_55DC
ExecuteDataBlock SoundDataBlock_01_55C7
SetNote $36, 12, 0
SetNote $36, 8, 1
SetNote $33, 20, 1
SetNote $30, 12, 0
SetNote $30, 8, 1
SetNote $2A, 12, 0
SetNote $2A, 8, 1
SetNote $30, 20, 1
SetNote $33, 12, 0
SetNote $33, 8, 1
SetBaseFrequencyOffset -2
ExecuteDataBlock SoundDataBlock_01_55C7
SetBaseFrequencyOffset 0
ExecuteDataBlock SoundDataBlock_01_55E5
ExecuteDataBlock SoundDataBlock_01_55B2
ExecuteDataBlock SoundDataBlock_01_55B2
SetNote $3B, 12, 0
SetNote $3B, 8, 1
SetNote $37, 20, 1
SetNote $32, 12, 0
SetNote $32, 8, 1
SetNote $2F, 12, 0
SetNote $2F, 8, 1
SetNote $32, 20, 1
SetNote $37, 12, 0
SetNote $37, 8, 1
SetNote $3D, 12, 0
SetNote $3D, 8, 1
SetNote $37, 20, 1
SetNote $34, 12, 0
SetNote $34, 8, 1
SetNote $31, 12, 0
SetNote $31, 8, 1
SetNote $34, 20, 1
SetNote $37, 12, 0
SetNote $37, 8, 1
SetBaseFrequencyOffset 2
ExecuteDataBlock SoundDataBlock_01_560F
ExecuteDataBlock SoundDataBlock_01_560F
SetBaseFrequencyOffset 0
ExecuteDataBlock SoundDataBlock_01_560F
SetNote $39, 12, 0
SetNote $39, 8, 1
SetNote $33, 20, 1
SetNote $30, 12, 0
SetNote $30, 8, 1
SetNote $2D, 12, 0
SetNote $2D, 8, 1
SetNote $30, 20, 1
SetNote $33, 12, 0
SetNote $33, 8, 1
ExecuteDataBlock SoundDataBlock_01_55DC
ExecuteDataBlock SoundDataBlock_01_5624
SetNote $30, 40, 0
SetNote $29, 20, 1
SetNote $32, 20, 0
SetNote $34, 20, 0
SetNote $34, 20, 1
SetNote $2B, 20, 0
ExecuteDataBlock SoundDataBlock_01_5624
SoundBranch SoundLoop_01_5503

SoundDataBlock_01_55B2:
SetNote $39, 12, 0
SetNote $39, 8, 1
SetNote $35, 20, 1
SetNote $30, 12, 0
SetNote $30, 8, 1
SetNote $2D, 12, 0
SetNote $2D, 8, 1
SetNote $30, 20, 1
SetNote $35, 12, 0
SetNote $35, 8, 1
ReturnFromDataBlock

SoundDataBlock_01_55C7:
SetNote $37, 12, 0
SetNote $37, 8, 1
SetNote $34, 20, 1
SetNote $30, 12, 0
SetNote $30, 8, 1
SetNote $2B, 12, 0
SetNote $2B, 8, 1
SetNote $30, 20, 1
SetNote $34, 12, 0
SetNote $34, 8, 1
ReturnFromDataBlock

SoundDataBlock_01_55DC:
ExecuteDataBlock SoundDataBlock_01_55FA
ExecuteDataBlock SoundDataBlock_01_55FA
ExecuteDataBlock SoundDataBlock_01_55E5

SoundDataBlock_01_55E5:
SetNote $3A, 12, 0
SetNote $3A, 8, 1
SetNote $37, 20, 1
SetNote $34, 12, 0
SetNote $34, 8, 1
SetNote $2E, 12, 0
SetNote $2E, 8, 1
SetNote $34, 20, 1
SetNote $37, 12, 0
SetNote $37, 8, 1
ReturnFromDataBlock

SoundDataBlock_01_55FA:
SetNote $3A, 12, 0
SetNote $3A, 8, 1
SetNote $35, 20, 1
SetNote $32, 12, 0
SetNote $32, 8, 1
SetNote $2E, 12, 0
SetNote $2E, 8, 1
SetNote $32, 20, 1
SetNote $35, 12, 0
SetNote $35, 8, 1
ReturnFromDataBlock

SoundDataBlock_01_560F:
SetNote $3A, 12, 0
SetNote $3A, 8, 1
SetNote $37, 20, 1
SetNote $33, 12, 0
SetNote $33, 8, 1
SetNote $2E, 12, 0
SetNote $2E, 8, 1
SetNote $33, 20, 1
SetNote $37, 12, 0
SetNote $37, 8, 1
ReturnFromDataBlock

SoundDataBlock_01_5624:
SetNote $35, 20, 0
SetNote $2D, 20, 1
SetNote $32, 20, 0
SetNote $35, 20, 0
SetNote $2D, 20, 1
SetNote $32, 20, 0
SetNote $34, 20, 0
SetNote $2B, 20, 1
SetNote $30, 20, 0
SetNote $34, 20, 0
SetNote $2B, 20, 1
SetNote $30, 20, 0
SetNote $32, 20, 0
SetNote $29, 20, 1
SetNote $2E, 20, 0
SetNote $32, 20, 0
SetNote $29, 20, 1
ReturnFromDataBlock

Music_ScheduleScreenOffDay_NoiseData_01_5647:
DefineVolume 0,  129
DefineVolume 1,  65
DefineVolume 2,  67
SetNoiseClockDivisor 1
SetChannelPan 3

SoundLoop_01_564F:
SetNote $08, 20, 1
SetNote $0F, 20, 0
SetNote $04, 20, 1
SetNote $08, 20, 1
SetNote $0D, 20, 0
SetNote $04, 20, 1
SetNote $0F, 20, 0
SetNote $0F, 20, 0
SetNote $04, 20, 1
SetNote $08, 20, 1
SetNote $0D, 20, 0
SetNote $04, 20, 1
SoundBranch SoundLoop_01_564F