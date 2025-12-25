;A table containing chances of a random event to happen.
;note that the game checks if likelyhood is greater or equal than RNG value for the event to happen. For example, if RNG rolled 2, and likelyhood value is 1, the event won't happen. But if it rolled 1, it will happen.
;exception is when likelyhood is 0, the event is guaranteed to never happen.
EventOccuranceChances_03_4E9E:
db 0                                                        ;never happens (otherwise there would be a 1/256 chance of it happening, like that infamous Pokemon Gen 1 "1/256 miss glitch")
db 0                                                        ;never happens
db 1                                                        ;0,78125%
db 2                                                        ;~1.2%
db 4                                                        ;~1.9%
db 8                                                        ;~3.5%
db 16                                                       ;~6.6%
db 24                                                       ;~9.8%
db 32                                                       ;~12.9%
db 48                                                       ;~19.1%
db 64                                                       ;~25.3%
db 80                                                       ;~31.6%
db 96                                                       ;~37.9%
db 128                                                      ;~50.4%
db 160                                                      ;~62.8%
db 192                                                      ;~75.3%
db 255                                                      ;100%
.end