db "POCKET LOVE",$00,$00,$00,$00                            ;title
db $00                                                      ;Game Boy game (not game boy color only or game boy color enhanced)
db $41,$4B                                                  ;new license
db $03                                                      ;Super Game Boy enhanced
db $03                                                      ;Cart type = MBC1 ROM + RAM + BATTERY. everything fancy
db $04                                                      ;ROM size = 512KB
db $02                                                      ;extra RAM = 2K (SRAM)
db $00                                                      ;region = japan
db $33                                                      ;old licensee = see new license
db $00                                                      ;version 1.0 so to speak
db $00                                                      ;header checksum
db $22,$71                                                  ;global checksum
