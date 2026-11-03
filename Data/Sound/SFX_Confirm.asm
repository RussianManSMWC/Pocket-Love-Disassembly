SFX_Confirm_Square2Data_01_5C21:
SetTempo 2
SetChannelDuty 2
DefineVolume 0, 14, -3
DefineVolume 1, 4, -4
DefineVolume 2, 2, -2
SetChannelPan 3

ExecuteDataBlock SoundDataBlock_01_5C38
ExecuteDataBlock SoundDataBlock_01_5C38
SetNote $37, 4, 1
SetNote $30, 4, 2
SetNote $40, 12, 2
EndChannelProcessing

SoundDataBlock_01_5C38:
SetNote $37, 4, 0
SetNote $30, 4, 0
SetNote $40, 4, 0
SetNote $24, 4, 1
ReturnFromDataBlock