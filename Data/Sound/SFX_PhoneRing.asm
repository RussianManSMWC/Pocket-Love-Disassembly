SFX_PhoneRing_Square1Data_01_5C41:
SetTempo 3
DefineVolume 0,  186
DefineVolume 1,  130

ExecuteDataBlock SoundDataBlock_01_5C5F
ExecuteDataBlock SoundDataBlock_01_5C5F
EndChannelProcessing

SoundDataBlock_01_5C4E:
SetNote $2D, 12, 0
SetNote $6F, 8, 0
SetNote $2D, 12, 0
SetNote $6F, 8, 0
SetNote $2D, 12, 0
SetNote $6F, 8, 0
SetNote $2D, 12, 0
SetNote $6F, 8, 0
ReturnFromDataBlock

SoundDataBlock_01_5C5F:
SetChannelDuty 2
SetChannelPan 3
ExecuteDataBlock SoundDataBlock_01_5C4E
ExecuteDataBlock SoundDataBlock_01_5C4E
SetNote $2D, 8, 0
SetNote $2D, 128, 1
SetNote $6F, 128, 0
ReturnFromDataBlock

SFX_PhoneRing_Square2Data_01_5C6E:
DefineVolume 0,  154
DefineVolume 1,  114
SetBaseFrequencyOffset -5

SetNote $6F, 8, 0
ExecuteDataBlock SoundDataBlock_01_5C5F
ExecuteDataBlock SoundDataBlock_01_5C5F
EndChannelProcessing