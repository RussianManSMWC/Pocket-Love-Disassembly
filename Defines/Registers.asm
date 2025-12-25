;registers
def MBC1Bank = $2100                                        ;used to switch ROM banks (changes ROM $4000-$7FFF)
def MBC1RAMAccessToggle = $0099                             ;store $0A to enable or disable extra RAM bank writes/reads.
def MBC1RAMBank = $4100                                     ;used to switch between RAM banks on the cartridge (SRAM). also used to set bank high bits (only for 1MB or larger ROMs)
def MBC1BankingMode = $6099                                 ;if set, allows to bank switch RAM (and ROM $0000-$3FFF for some reason)

def Reg_JoyPad = $FF00                                      ;player inputs

def Reg_InterruptRequest = $FF0F                            ;used to request specific interrupts?

;square == pulse. just so you know ya tech nerd
def APU_Square1Sweep = $FF10                                ;makes the sound "sweep" up or down its frequency. bitwise: -PPP NSSS, PPP - the divider's period, N - negate flag, if clear, will sweep toward lower frequency, set - sweep toward higher frequency, SSS = shift count
def APU_Square1DutyAndLength = $FF11                        ;bitwise: DDLL LLLL, DD - Duty, Duty cycle (pulse width, the available values are 12.5%, 25%, 50% and 75), the rest are note length bits.
def APU_Square1Volume = $FF12                               ;bitwise: VVVV APPP. V - starting volume, A - "Envelope add mode", if clear, volume fades like normal, if set, volume is increased instead, PPP - period
def APU_Square1FrequencyLow = $FF13                         ;all bits are dedicated to frequency
def APU_Square1FrequencyHighAndTrigger = $FF14              ;bitwise: TL-- -FFF. T - trigger, enables this channel, L - length enable, use length bits to hold the note, FFF - frequency.

;$FF15 - unused square 2 register. square 2 does not have sweep
def APU_Square2DutyAndLength = $FF16                        ;same for the second square channel
def APU_Square2Volume = $FF17
def APU_Square2FrequencyLow = $FF18
def APU_Square2FrequencyHighAndTrigger = $FF19

def APU_WaveDACPower = $FF1A                                ;directly used to enable wave channel (besides trigger bit). bit 7 is the DAC power bit.
def APU_WaveLength = $FF1B                                  ;all bits are used for length load
def APU_WaveVolume = $FF1C                                  ;only bits 5 and 6 are used for this register, sets the volume of this channel. $00 - 0%, $20 - 100%, $40 - 50%, $60 - 25%
def APU_WaveFrequency = $FF1D
def APU_WaveFrequencyHighAndTrigger = $FF1E                 ;bitwise: TL-- -FFF. T - trigger, enables this channel, L - length enable, use length bits to hold the note, FFF - frequency.

;$FF1F - unused noise register.
def APU_NoiseLength = $FF20                                 ;bits 0 through 5 are length load, the last two bits are unused.
def APU_NoiseVolume = $FF21                                 ;bitwise: VVVV APPP. V - starting volume, A - "Envelope add mode", if clear, volume fades like normal, if set, volume is increased instead, PPP - period
def APU_NoiseClock = $FF22                                  ;bitwise: SSSS WDDD. S - Clock shift, W - width mode of LFSR(whatever that is), D - divisor
def APU_NoiseTrigger = $FF23                                ;bitwise: TL-- ----.  T - trigger, enables this channel, L - length enable, use length bits to hold the note

def APU_SpeakerVolume = $FF24                               ;bitwise: ALLL BRRR. A - Vin enable left, LLL - left speaker volume, B - Vin enable right. RRR - right speaker volume. Vin was supposed to be for an external audio hardware for 5th sound channel that went unused.
def APU_SpeakerPan = $FF25                                  ;which speaker the channel goes into. bits 0-3 are for channels 1 through 4 on the right speaker (square 1 to noise, respectively), bits 4-7 are for channels 1 through 4 on the left speaker.
def APU_AudioStatus = $FF26                                 ;bitwise: A--- NWsS. A - audio on/off. if set, all channels are disabled. the rest are read only (cannot be used to disable repsective channels). N - noise disabled, W - wave disabled, s - square 2 disabled, S - square 1 disabled.

def APU_WavePattern = $FF30                                 ;16 bytes, each byte is consists of 2 4-bit samples

;more generalized audio register defines
def APU_RegistersStart = APU_Square1Sweep
def APU_ChannelVolume = APU_Square1Volume-APU_Square1Sweep

;i could've put this in Enums.asm, but I think it makes sense to put it here since it's hardware-related instead of being game-specific
RSRESET
def APU_Channel_Square1 rb 1
def APU_Channel_Square2 rb 1
def APU_Channel_Wave rb 1
def APU_Channel_Noise rb 1

;;
def Reg_LCDControlAndRender = $FF40

def LCDControlEnable = %10000000                            ;turns off PPU and LCD if set to 0, allowing access to VRAM, OAM etc.. turning it off must be done in VBlank.
def LCDWindowTilemapSelect = %01000000                      ;enabled - $9C00, disabled - $9800
def LCDWindowDisplay = %00100000                            ;enable or disable window
def LCDTileDataSelect = %00010000                           ;enabled - $8000, disabled - $8800
def LCDBackgroundTilemapSelect = %00001000                  ;enabled - $9C00, disabled - $9800
def LCDSpriteSize = %00000100                               ;enabled - sprite size is 8x16, disabled - 8x8
def LCDSpriteRender = %00000010
def LCDBackgroundRender = %00000001
;;

def Reg_LCDStatus = $FF41
def Reg_CameraYPosition = $FF42
def Reg_CameraXPosition = $FF43
def Register_LCDYPos = $FF44
def Register_LCDYCompare = $FF45                            ;no idea tbh
def Reg_OAMDMA = $FF46                                      ;input A - location from which where to transfer data to OAM, from $XX00 to $XX9F, where XX is A.
def Reg_BackgroundPalette = $FF47
def Reg_SpritePalette0 = $FF48
def Reg_SpritePalette1 = $FF49

def Reg_WindowYPosition = $FF4A
def Reg_WindowXPosition = $FF4B

;;
def Reg_InterruptsEnabler = $FFFF                           ;used to enable various interrupts

;specific interrupt values
def Interrupt_VBlank = %00000001
def Interrupt_HBlank = %00000010
def Interrupt_TimerOverflow = %00000100
def Interrupt_Serial = %00001000
def Interrupt_Joypad = %00010000
;;