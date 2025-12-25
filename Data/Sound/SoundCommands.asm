;arguments: ChannelPropByte, Length, Volume
macro SetNote
  db \1
  
  assert \2 >= 4, "Note length cannot be less than 4."
  assert \2 <= 128, "Note length can only be between 4 and 128."
  assert \3 <= 7, "Volume array index must be between 0 and 7."

  if \2 % 4
    warn "Note: Length should be divisible by 4 but it's in range, rounding down."
  endc

  db ((\3 & 7) << 5) | ((\2 / 4)-1)

endm

macro SetLoopCounter
  assert \1 <= 3, "You can only set up a loop counter with an index from 0 to 3."
  db $D0+\1
  db \2
endm

macro CheckLoopCounter
  assert \1 <= 3, "You can only check for loop counter with an index from 0 to 3."
  db $D4+\1
  dw \2
endm

macro DisableChannelPanning
  db $D8
endm

macro SetChannelPan
  assert \1 <= 3, "Channel pan value cannot exceed 3."
  assert \1 != 0, "Channel pan value cannot be 0."
  db $D9+\1-1
endm

macro EnableChannelPanning
  db $DC+\1
endm

macro SetNoiseClockDivisor
  assert \1 <= 7, "Noise clock divisor value can only be between 0 and 7."
  db $E0+\1
endm

macro DefineVolume
  assert \1 <= 7, "Volume array index must be between 0 and 7."
  db $E8+\1
  db \2
endm

macro SetChannelDuty
  assert \1 <= 3, "Channel duty can only be between 0 and 3."
  db $F0+\1
endm

macro DisableSquare1Sweep
  db $F6
endm

macro SetSquare1Sweep
  db $F7
  db \1
endm

macro SetBaseFrequencyOffset
  db $F8
  db \1
endm

macro SetTempo
  db $F9
  db \1
endm

macro SoundCommandFA ;placeholder until we figure out what this command does (something volume related)
  db $FA
  db \1
endm

macro SoundCommandFB
  db $FB
  db \1
endm

macro ExecuteDataBlock
  db $FC
  dw \1
endm

macro SoundBranch
  db $FD
  dw \1
endm

macro ReturnFromDataBlock
  db $FE
endm

macro EndChannelProcessing
  db $FF
endm