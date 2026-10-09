;MBC1 stuffs

def MBC1Bank = $2100                                        ;used to switch ROM banks (changes ROM $4000-$7FFF)
def MBC1RAMAccessToggle = $0099                             ;store $0A to enable extra RAM bank writes/reads, store $00 to disable access.
def MBC1RAMBank = $4100                                     ;used to switch between RAM banks on the cartridge (SRAM). also used to set bank high bits (only for 1MB or larger ROMs)
def MBC1BankingMode = $6099                                 ;if set, allows to bank switch RAM (and ROM $0000-$3FFF for some reason)