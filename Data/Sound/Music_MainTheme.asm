;;;;;;;;;;;;;;;;;;;;;;;;;;;;;square 1

Music_MainTheme_Square1Data_01_40DC:
SetTempo 2
DefineVolume 0,  228
DefineVolume 1,  227
SetChannelDuty 1
SetChannelPan 3

SetNote $6F, 60, 0
SetNote $02, 20, 0

SoundLoop_01_40E8:
ExecuteDataBlock SoundDataBlock_01_413B
SetNote $09, 20, 0
SetNote $02, 40, 0
SetNote $04, 20, 0
SetNote $06, 60, 0
ExecuteDataBlock SoundDataBlock_01_413B
SetNote $0E, 20, 0
SetNote $0C, 100, 0
SetNote $0C, 20, 0
SetNote $0B, 100, 0
SetNote $06, 80, 0
SetNote $0B, 60, 0
SetNote $05, 100, 0
SetNote $05, 20, 0
SetNote $04, 100, 0
SetNote $04, 20, 0
SetNote $09, 100, 0
SetNote $0B, 20, 0
SetNote $0C, 100, 0
SetNote $09, 20, 0
SetNote $0B, 100, 0
SetNote $0B, 20, 0
SetNote $04, 60, 0
SetNote $02, 60, 0
ExecuteDataBlock SoundDataBlock_01_417A
SetNote $08, 100, 0
SetNote $04, 80, 0
SetNote $08, 60, 0
ExecuteDataBlock SoundDataBlock_01_417A
SetNote $09, 100, 0
SetNote $02, 80, 0
SetNote $09, 60, 0
SetNote $07, 100, 0
SetNote $02, 80, 0
SetNote $07, 60, 0
SetNote $09, 100, 0
SetNote $02, 80, 0
SetNote $09, 60, 0
SoundBranch SoundLoop_01_40E8

SoundDataBlock_01_413B:
SetNote $07, 100, 0
SetNote $02, 60, 0
SetNote $02, 20, 1
SetNote $07, 60, 0
SetNote $09, 100, 0
SetNote $04, 60, 0
SetNote $04, 20, 1
SetNote $09, 60, 0
SetNote $0B, 60, 1
SetNote $0B, 60, 1
SetNote $0A, 60, 1
SetNote $0A, 40, 1
SetNote $07, 20, 1
SetNote $09, 60, 1
SetNote $09, 40, 1
SetNote $04, 60, 0
SetNote $04, 20, 1
SetNote $02, 60, 0
SetNote $01, 100, 0
SetNote $01, 20, 0
SetNote $00, 100, 0
SetNote $0C, 20, 0
SetNote $0B, 100, 0
SetNote $0A, 80, 0
SetNote $05, 40, 0
SetNote $0A, 20, 0
SetNote $09, 100, 0
SetNote $09, 20, 0
SetNote $01, 100, 0
SetNote $01, 20, 0
SetNote $02, 100, 0
ReturnFromDataBlock

SoundDataBlock_01_417A:
SetNote $09, 100, 0
SetNote $09, 60, 0
SetNote $0B, 20, 0
SetNote $0C, 60, 0
SetNote $0E, 60, 1
SetNote $0E, 120, 1
SetNote $6F, 60, 0
SetNote $07, 100, 0
SetNote $02, 80, 0
SetNote $07, 60, 0
ReturnFromDataBlock

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;square 2

Music_MainTheme_Square2Data_01_418F:
DefineVolume 0,  147
DefineVolume 1,  149
DefineVolume 2,  144
DefineVolume 3,  87
SetChannelPan 3

SoundLoop_01_4198:
SetChannelDuty 3
ExecuteDataBlock SoundDataBlock_01_4220
SetNote $30, 60, 0
SetNote $2F, 40, 1
SetNote $2B, 60, 0
SetNote $2A, 60, 1
SetNote $2B, 20, 1
SetNote $2D, 40, 1
SetNote $26, 60, 1
ExecuteDataBlock SoundDataBlock_01_4220
SetNote $30, 40, 1
SetNote $32, 20, 1
SetNote $34, 40, 1
SetNote $37, 60, 0
SetNote $36, 60, 1
SetNote $37, 20, 1
SetNote $39, 40, 1
SetNote $32, 60, 1
SetChannelDuty 2
SetNote $2F, 20, 1
SetNote $30, 40, 1
SetNote $32, 52, 2
SetNote $32, 128, 1
SetNote $2F, 20, 1
SetNote $30, 40, 1
SetNote $32, 60, 1
SetNote $34, 20, 1
SetNote $35, 40, 1
SetNote $34, 120, 1
SetNote $32, 20, 1
SetNote $30, 60, 1
SetNote $32, 40, 1
SetNote $33, 60, 0
SetNote $30, 60, 0
SetNote $32, 60, 1
SetNote $37, 60, 0
SetNote $36, 60, 0
SetNote $37, 60, 1
ExecuteDataBlock SoundDataBlock_01_425B
SetNote $32, 60, 2
SetNote $32, 120, 1
SetChannelDuty 0
SetNote $23, 20, 3
SetNote $24, 40, 3
SetNote $26, 60, 3
SetNote $28, 20, 3
SetNote $29, 40, 3
SetNote $28, 60, 3
SetNote $26, 60, 3
SetChannelDuty 2
ExecuteDataBlock SoundDataBlock_01_425B
SetNote $2A, 120, 2
SetNote $2A, 120, 1
SetNote $6F, 20, 0
SetChannelDuty 0
SetNote $26, 60, 3
SetNote $26, 40, 3
SetNote $24, 60, 3
SetNote $26, 20, 3
SetNote $28, 60, 3
SetNote $26, 60, 3
SetNote $26, 60, 3
SetNote $26, 60, 3
SetNote $26, 60, 3
SetNote $26, 60, 3
SetNote $26, 40, 3
SetNote $24, 60, 3
SoundBranch SoundLoop_01_4198

SoundDataBlock_01_4220:
SetNote $2A, 20, 1
SetNote $2B, 40, 1
SetNote $32, 52, 2
SetNote $32, 128, 1
SetNote $32, 20, 1
SetNote $2F, 20, 1
SetNote $2B, 20, 1
SetNote $2A, 80, 1
SetNote $2B, 40, 1
SetNote $28, 60, 1
SetNote $2A, 20, 1
SetNote $2B, 40, 1
SetNote $2D, 80, 0
SetNote $2B, 60, 0
SetNote $2A, 40, 1
SetNote $28, 60, 0
SetNote $2B, 120, 1
SetNote $28, 20, 0
SetNote $2A, 60, 0
SetNote $2B, 60, 0
SetNote $2D, 100, 1
SetNote $2D, 20, 1
SetNote $2F, 40, 1
SetNote $30, 60, 1
SetNote $32, 60, 1
SetNote $34, 20, 1
SetNote $36, 40, 0
SetNote $37, 120, 1
SetNote $34, 80, 1
ReturnFromDataBlock

SoundDataBlock_01_425B:
SetNote $3B, 80, 1
SetNote $37, 40, 1
SetNote $36, 60, 1
SetNote $34, 40, 0
SetNote $30, 20, 0
SetNote $2B, 20, 0
SetNote $28, 100, 1
SetNote $28, 20, 0
SetNote $2A, 60, 1
SetNote $2B, 40, 0
ReturnFromDataBlock

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;wave

Music_MainTheme_WaveData_01_4270:
DefineVolume 0,  38
DefineVolume 1,  208
DefineVolume 2,  108
EnableChannelPanning 1

SetNote $6F, 80, 0

SoundLoop_01_4279:
ExecuteDataBlock SoundDataBlock_01_42E6
ExecuteDataBlock SoundDataBlock_01_435C
ExecuteDataBlock SoundDataBlock_01_435C
ExecuteDataBlock SoundDataBlock_01_42E6
ExecuteDataBlock SoundDataBlock_01_435C
SetNote $34, 20, 0
SetNote $34, 20, 1
SetNote $30, 20, 0
SetNote $34, 20, 0
SetNote $34, 20, 1
SetNote $30, 20, 0
ExecuteDataBlock SoundDataBlock_01_4349
SetNote $39, 20, 0
SetNote $39, 20, 1
SetNote $35, 20, 0
SetNote $39, 20, 0
SetNote $39, 20, 1
SetNote $35, 20, 0
SetNote $38, 20, 0
SetNote $38, 20, 1
SetNote $34, 20, 0
SetNote $38, 20, 0
SetNote $38, 20, 1
SetNote $34, 20, 0
ExecuteDataBlock SoundDataBlock_01_432B
SetNote $3A, 20, 0
SetNote $3A, 20, 1
SetNote $37, 20, 0
SetNote $3A, 20, 0
SetNote $3A, 20, 1
SetNote $37, 20, 0
SetNote $39, 20, 0
SetNote $39, 20, 1
SetNote $36, 20, 0
SetNote $39, 20, 0
SetNote $39, 20, 1
SetNote $36, 20, 0
ExecuteDataBlock SoundDataBlock_01_4369
ExecuteDataBlock SoundDataBlock_01_4338
SetBaseFrequencyOffset 2
ExecuteDataBlock SoundDataBlock_01_4349
SetBaseFrequencyOffset 0
ExecuteDataBlock SoundDataBlock_01_4338
ExecuteDataBlock SoundDataBlock_01_4359
ExecuteDataBlock SoundDataBlock_01_4349
ExecuteDataBlock SoundDataBlock_01_4359
SoundBranch SoundLoop_01_4279

SoundDataBlock_01_42E6:
ExecuteDataBlock SoundDataBlock_01_4349
ExecuteDataBlock SoundDataBlock_01_4328
ExecuteDataBlock SoundDataBlock_01_434C
SetNote $36, 20, 0
SetNote $36, 20, 1
SetNote $31, 20, 0
SetNote $36, 20, 0
SetNote $36, 20, 1
SetNote $31, 20, 0
SetNote $37, 20, 0
SetNote $37, 20, 1
SetNote $30, 20, 0
SetNote $37, 20, 0
SetNote $37, 20, 1
SetNote $30, 20, 0
SetNote $37, 20, 0
SetNote $37, 20, 1
SetNote $32, 20, 0
SetNote $37, 20, 0
SetNote $37, 20, 1
SetNote $34, 20, 0
SetNote $39, 20, 0
SetNote $39, 20, 1
SetNote $34, 20, 0
SetNote $39, 20, 0
SetNote $39, 20, 1
SetNote $34, 20, 0
ExecuteDataBlock SoundDataBlock_01_432B
ExecuteDataBlock SoundDataBlock_01_434C
ExecuteDataBlock SoundDataBlock_01_4369

SoundDataBlock_01_4328:
ExecuteDataBlock SoundDataBlock_01_432B

SoundDataBlock_01_432B:
SetNote $37, 20, 0
SetNote $37, 20, 1
SetNote $34, 20, 0
SetNote $37, 20, 0
SetNote $37, 20, 1
SetNote $34, 20, 0
ReturnFromDataBlock

SoundDataBlock_01_4338:
ExecuteDataBlock SoundDataBlock_01_4328
SetNote $30, 20, 0
SetNote $30, 20, 1
SetNote $30, 20, 2
SetNote $30, 40, 0
SetNote $30, 40, 1
SetNote $30, 40, 2
SetNote $6F, 60, 0

SoundDataBlock_01_4349:
ExecuteDataBlock SoundDataBlock_01_434C

SoundDataBlock_01_434C:
SetNote $36, 20, 0
SetNote $36, 20, 1
SetNote $32, 20, 0
SetNote $36, 20, 0
SetNote $36, 20, 1
SetNote $32, 20, 0
ReturnFromDataBlock

SoundDataBlock_01_4359:
ExecuteDataBlock SoundDataBlock_01_432B

SoundDataBlock_01_435C:
SetNote $36, 20, 0
SetNote $36, 20, 1
SetNote $30, 20, 0
SetNote $36, 20, 0
SetNote $36, 20, 1
SetNote $30, 20, 0
ReturnFromDataBlock

SoundDataBlock_01_4369:
SetNote $37, 20, 0
SetNote $37, 20, 1
SetNote $32, 20, 0
SetNote $37, 20, 0
SetNote $37, 20, 1
SetNote $32, 20, 0
ReturnFromDataBlock

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;noise

Music_MainTheme_NoiseData_01_4376:
DefineVolume 0,  129
DefineVolume 1,  65
DefineVolume 2,  68
SetNoiseClockDivisor 1
SetChannelPan 3

SetNote $6F, 60, 0

SoundLoop_01_4380:
SetNote $0F, 20, 0
SetNote $0F, 20, 0
SetNote $02, 20, 1
SetNote $04, 20, 1
SetNote $04, 40, 2
SoundBranch SoundLoop_01_4380