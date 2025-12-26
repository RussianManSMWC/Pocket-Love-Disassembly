;Stats and character disposition the player starts with when starting a new game, based on star sign and blood type

;first 7 bytes are stats, then character disposition
;28 bytes each
InitialStatDistributions_1D_62F0:
.Aries
.BloodTypeA
db 32                                                       ;smart
db 16                                                       ;fit
db 16                                                       ;style
db 40                                                       ;skill
db 48                                                       ;sense
db 160                                                      ;energy
db 88                                                       ;attitude

db 80,129,0                                                 ;relationship with Ruruna
db 80,129,0                                                 ;relationship with Mizuki
db 80,129,0                                                 ;relationship with Yumi
db 32,32,0                                                  ;relationship with Miri
db 32,32,0                                                  ;relationship with Mari
db 80,129,0                                                 ;relationship with Suzune
db 0,32,0                                                   ;relationship with Momoyo

.BloodTypeB
db 0
db 56
db 24
db 24
db 24
db 184
db 88

db 80,129,0
db 65,65,0
db 120,129,0
db 32,32,0
db 32,32,0
db 80,129,0
db 0,32,0

.BloodTypeAB
db 16
db 64
db 16
db 16
db 16
db 208
db 64

db 80,129,0
db 80,129,0
db 80,129,0
db 32,32,0
db 32,32,0
db 120,129,0
db 0,32,0

.BloodTypeO
db 0
db 64
db 16
db 0
db 24
db 208
db 88

db 80,129,0
db 120,129,0
db 80,129,0
db 65,65,0
db 65,65,0
db 80,129,0
db 0,0,0

.Taurus
;Blood type A
db 24
db 48
db 16
db 16
db 16
db 192
db 88

db 120,129,0
db 32,32,0
db 0,0,0
db 80,129,0
db 80,129,0
db 32,32,0
db 80,129,0

;Blood type B
db 8
db 8
db 8
db 56
db 72
db 160
db 88

db 80,129,0
db 32,32,0
db 0,32,0
db 80,129,0
db 80,129,0
db 32,32,0
db 65,65,0

;Blood type AB
db 16
db 16
db 0
db 16
db 16
db 160
db 176

db 80,129,0
db 32,32,0
db 0,0,0
db 120,129,0
db 120,129,0
db 32,32,0
db 80,129,0

;Blood type O
db 0
db 0
db 16
db 16
db 48
db 144
db 176

db 80,129,0
db 32,32,0
db 0,32,0
db 80,129,0
db 80,129,0
db 32,32,0
db 65,65,0

.Gemini
;Blood type A
db 0
db 16
db 48
db 32
db 80
db 160
db 64

db 80,129,0
db 120,129,0
db 80,129,0
db 0,32,0
db 0,32,0
db 80,129,0
db 80,129,0

;Blood type B
db 48
db 0
db 48
db 48
db 48
db 144
db 64

db 80,129,0
db 80,129,0
db 65,65,0
db 0,32,0
db 0,32,0
db 65,65,0
db 65,65,0

;Blood type AB
db 32
db 32
db 32
db 32
db 32
db 176
db 64

db 80,129,0
db 80,129,0
db 80,129,0
db 0,32,0
db 0,32,0
db 80,129,0
db 80,129,0

;Blood type O
db 16
db 16
db 40
db 40
db 40
db 160
db 88

db 80,129,0
db 80,129,0
db 65,65,0
db 0,32,0
db 0,32,0
db 80,129,0
db 65,65,0

.Cancer
;Blood type A
db 40
db 8
db 0
db 0
db 16
db 160
db 176

db 80,129,0
db 0,32,0
db 32,32,0
db 80,129,0
db 80,129,0
db 32,32,0
db 80,129,0

;Blood type B
db 16
db 16
db 0
db 16
db 16
db 160
db 176

db 80,129,0
db 0,32,0
db 32,32,0
db 80,129,0
db 80,129,0
db 32,32,0
db 80,129,0

;Blood type AB
db 8
db 8
db 48
db 8
db 56
db 184
db 88

db 80,129,0
db 0,32,0
db 32,32,0
db 80,129,0
db 80,129,0
db 32,32,0
db 80,129,0

;Blood type O
db 8
db 8
db 8
db 32
db 16
db 152
db 176

db 80,129,0
db 0,32,0
db 32,32,0
db 80,129,0
db 80,129,0
db 32,32,0
db 80,129,0

.Leo
;Blood type A
db 0
db 64
db 24
db 0
db 40
db 208
db 64

db 65,65,0
db 120,129,0
db 80,129,0
db 32,32,0
db 32,32,0
db 80,129,0
db 0,32,0

;Blood type B
db 0
db 56
db 56
db 0
db 16
db 208
db 64

db 80,129,0
db 65,65,0
db 80,129,0
db 32,32,0
db 32,32,0
db 80,129,0
db 0,32,0

;Blood type AB
db 16
db 64
db 64
db 0
db 16
db 176
db 64

db 80,129,0
db 80,129,0
db 80,129,0
db 32,32,0
db 32,32,0
db 120,129,0
db 0,32,0

;Blood type O
db 8
db 8
db 72
db 16
db 72
db 160
db 64

db 80,129,0
db 65,65,0
db 80,129,0
db 32,32,0
db 32,32,0
db 80,129,0
db 0,32,0

.Virgo
;Blood type A
db 80
db 0
db 8
db 40
db 40
db 144
db 88

db 80,129,0
db 80,129,0
db 32,32,0
db 120,129,0
db 80,129,0
db 0,0,0
db 80,129,0

;Blood type B
db 72
db 32
db 32
db 8
db 16
db 176
db 64

db 65,65,0
db 65,65,0
db 32,32,0
db 80,129,0
db 80,129,0
db 0,32,0
db 65,65,0

;Blood type AB
db 56
db 32
db 0
db 32
db 8
db 208
db 64

db 80,129,0
db 80,129,0
db 32,32,0
db 80,129,0
db 80,129,0
db 0,32,0
db 80,129,0

;Blood type O
db 56
db 8
db 48
db 24
db 24
db 152
db 88

db 80,129,0
db 65,65,0
db 32,32,0
db 80,129,0
db 80,129,0
db 0,32,0
db 65,65,0

.Libra
;Blood type A
db 16
db 16
db 16
db 64
db 64
db 160
db 64

db 80,129,0
db 80,129,0
db 80,129,0
db 80,129,0
db 80,129,0
db 80,129,0
db 32,32,0

;Blood type B
db 40
db 24
db 32
db 40
db 32
db 168
db 64

db 80,129,0
db 80,129,0
db 120,129,0
db 80,129,0
db 80,129,0
db 65,65,0
db 32,32,0

;Blood type AB
db 40
db 24
db 24
db 24
db 56
db 168
db 64

db 80,129,0
db 80,129,0
db 80,129,0
db 80,129,0
db 80,129,0
db 80,129,0
db 0,0,0

;Blood type O
db 16
db 8
db 32
db 48
db 56
db 152
db 88

db 120,129,0
db 80,129,0
db 65,65,0
db 80,129,0
db 80,129,0
db 65,65,0
db 32,32,0

.Scorpio
;Blood type A
db 40
db 40
db 0
db 16
db 56
db 184
db 64

db 65,65,0
db 0,0,0
db 0,32,0
db 80,129,0
db 80,129,0
db 0,0,0
db 80,129,0

;Blood type B
db 88
db 32
db 8
db 16
db 16
db 176
db 64

db 32,32,0
db 32,32,0
db 0,32,0
db 80,129,0
db 80,129,0
db 32,32,0
db 120,129,0

;Blood type AB
db 40
db 48
db 24
db 16
db 24
db 184
db 64

db 32,32,0
db 32,32,0
db 0,32,0
db 80,129,0
db 80,129,0
db 32,32,0
db 120,129,0

;Blood type O
db 48
db 48
db 32
db 0
db 0
db 184
db 88

db 65,65,0
db 32,32,0
db 0,32,0
db 0,0,0
db 0,0,0
db 32,32,0
db 80,129,0

.Sagittarius
;Blood type A
db 8
db 16
db 8
db 0
db 32
db 160
db 176

db 80,129,0
db 80,129,0
db 80,129,0
db 0,32,0
db 0,32,0
db 80,129,0
db 32,32,0

;Blood type B
db 0
db 40
db 64
db 0
db 56
db 176
db 64

db 80,129,0
db 65,65,0
db 80,129,0
db 0,0,0
db 0,0,0
db 80,129,0
db 32,32,0

;Blood type AB
db 24
db 72
db 16
db 8
db 16
db 200
db 64

db 80,129,0
db 80,129,0
db 80,129,0
db 0,32,0
db 0,32,0
db 80,129,0
db 32,32,0

;Blood type O
db 8
db 64
db 0
db 0
db 32
db 208
db 88

db 80,129,0
db 65,65,0
db 120,129,0
db 0,32,0
db 0,32,0
db 80,129,0
db 32,32,0

.Capricorn
;Blood type A
db 16
db 32
db 0
db 0
db 0
db 176
db 176

db 65,65,0
db 0,0,0
db 0,0,0
db 80,129,0
db 80,129,0
db 80,129,0
db 80,129,0

;Blood type B
db 48
db 48
db 8
db 8
db 8
db 192
db 88

db 32,32,0
db 0,32,0
db 65,65,0
db 80,129,0
db 80,129,0
db 65,65,0
db 65,65,0

;Blood type AB
db 32
db 24
db 0
db 0
db 0
db 168
db 176

db 32,32,0
db 0,32,0
db 80,129,0
db 80,129,0
db 80,129,0
db 80,129,0
db 120,129,0

;Blood type O
db 32
db 16
db 16
db 0
db 0
db 160
db 176

db 32,32,0
db 0,32,0
db 65,65,0
db 80,129,0
db 80,129,0
db 65,65,0
db 65,65,0

.Aquarius
;Blood type A
db 32
db 16
db 0
db 64
db 64
db 160
db 64

db 32,32,0
db 80,129,0
db 0,0,0
db 32,32,0
db 32,32,0
db 80,129,0
db 32,32,0

;Blood type B
db 72
db 0
db 16
db 24
db 80
db 144
db 64

db 80,129,0
db 80,129,0
db 65,65,0
db 32,32,0
db 32,32,0
db 120,129,0
db 32,32,0

;Blood type AB
db 56
db 16
db 16
db 0
db 64
db 160
db 88

db 80,129,0
db 80,129,0
db 80,129,0
db 32,32,0
db 32,32,0
db 80,129,0
db 32,32,0

;Blood type O
db 16
db 16
db 8
db 48
db 80
db 144
db 88

db 80,129,0
db 80,129,0
db 65,65,0
db 32,32,0
db 32,32,0
db 65,65,0
db 32,32,0

.Pisces
;Blood type A
db 16
db 0
db 0
db 24
db 40
db 144
db 176

db 0,0,0
db 32,32,0
db 32,32,0
db 80,129,0
db 80,129,0
db 0,32,0
db 80,129,0

;Blood type B
db 0
db 0
db 0
db 0
db 80
db 144
db 176

db 0,32,0
db 32,32,0
db 32,32,0
db 80,129,0
db 80,129,0
db 0,32,0
db 80,129,0

;Blood type AB
db 16
db 16
db 16
db 16
db 16
db 144
db 176

db 0,32,0
db 32,32,0
db 32,32,0
db 120,129,0
db 80,129,0
db 0,32,0
db 80,129,0

;Blood type O
db 16
db 8
db 8
db 16
db 32
db 144
db 176

db 0,32,0
db 32,32,0
db 32,32,0
db 120,129,0
db 80,129,0
db 0,32,0
db 120,129,0