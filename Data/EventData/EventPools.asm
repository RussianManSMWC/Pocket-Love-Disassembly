;Pointers to pools of script entries that can/will happen on some days (depending on event value, which is set depending on current in-game day).
;$FFFF - end of the table
ScriptPoolsPerEvent_03_6A0D:
dw .DATA_03_6A51-ScriptPoolsPerEvent_03_6A0D ;Event_Christmas
dw .DATA_03_6A55-ScriptPoolsPerEvent_03_6A0D ;Event_OffDay
dw .DATA_03_6D55-ScriptPoolsPerEvent_03_6A0D ;Event_WorkDay
dw .DATA_03_6D8F-ScriptPoolsPerEvent_03_6A0D ;Event_TestDay
dw .DATA_03_6D99-ScriptPoolsPerEvent_03_6A0D ;Event_SchoolTrip
dw .DATA_03_6DA3-ScriptPoolsPerEvent_03_6A0D ;Event_SportsEvent
dw .DATA_03_6DA7-ScriptPoolsPerEvent_03_6A0D ;Event_RurunaSpecial
dw .DATA_03_6DAD-ScriptPoolsPerEvent_03_6A0D ;Event_SportsClub
dw .DATA_03_6DCD-ScriptPoolsPerEvent_03_6A0D ;Event_RandomCharStatCheck
dw .DATA_03_6DE9-ScriptPoolsPerEvent_03_6A0D ;Event_RandomEvent1
dw .DATA_03_6E4D-ScriptPoolsPerEvent_03_6A0D ;Event_RandomEvent2
dw .DATA_03_6E9F-ScriptPoolsPerEvent_03_6A0D ;Event_BeachEpisode
dw .DATA_03_6EA3-ScriptPoolsPerEvent_03_6A0D ;Event_RurunaSchoolEvent
dw .DATA_03_6EAF-ScriptPoolsPerEvent_03_6A0D ;Event_MizukiSchoolEvent
dw .DATA_03_6EBB-ScriptPoolsPerEvent_03_6A0D ;Event_YumiSchoolEvent
dw .DATA_03_6EC7-ScriptPoolsPerEvent_03_6A0D ;Event_MiriSchoolEvent
dw .DATA_03_6ED5-ScriptPoolsPerEvent_03_6A0D ;Event_MariSchoolEvent
dw .DATA_03_6EE1-ScriptPoolsPerEvent_03_6A0D ;Event_SuzuneSchoolEvent
dw .DATA_03_6EEF-ScriptPoolsPerEvent_03_6A0D ;Event_MomoyoSchoolEvent
dw .DATA_03_6EFB-ScriptPoolsPerEvent_03_6A0D ;Event_13
dw .DATA_03_6F17-ScriptPoolsPerEvent_03_6A0D ;Event_14
dw .DATA_03_6F41-ScriptPoolsPerEvent_03_6A0D ;Event_15
dw .DATA_03_6F6B-ScriptPoolsPerEvent_03_6A0D ;Event_16
dw .DATA_03_6F97-ScriptPoolsPerEvent_03_6A0D ;Event_17
dw .DATA_03_6FC1-ScriptPoolsPerEvent_03_6A0D ;Event_18
dw .DATA_03_6FED-ScriptPoolsPerEvent_03_6A0D ;Event_19
dw .DATA_03_7017-ScriptPoolsPerEvent_03_6A0D ;Event_1A
dw .DATA_03_7041-ScriptPoolsPerEvent_03_6A0D ;Event_1B
dw .DATA_03_7069-ScriptPoolsPerEvent_03_6A0D ;Event_1C
dw .DATA_03_7093-ScriptPoolsPerEvent_03_6A0D ;Event_1D
dw .DATA_03_70BF-ScriptPoolsPerEvent_03_6A0D ;Event_1E
dw .DATA_03_70E9-ScriptPoolsPerEvent_03_6A0D ;Event_1F
dw .DATA_03_7115-ScriptPoolsPerEvent_03_6A0D ;Event_20
dw .DATA_03_713F-ScriptPoolsPerEvent_03_6A0D ;Event_21

;christmas event, load the ending script
.DATA_03_6A51:
dw $0256
dw $FFFF

;OffDay scripts
.DATA_03_6A55:
dw $017D
dw $017E
dw $017F
dw $0180
dw $0181
dw $0182
dw $0183
dw $00EF
dw $00F0
dw $00F1
dw $00F2
dw $00F3
dw $00F4
dw $00F5
dw $0104
dw $0105
dw $0106
dw $0107
dw $0108
dw $0109
dw $010A
dw $0117
dw $0118
dw $0119
dw $011A
dw $011B
dw $011C
dw $011D
dw $012B
dw $012C
dw $012D
dw $012E
dw $012F
dw $0130
dw $0131
dw $0140
dw $0141
dw $0142
dw $0143
dw $0144
dw $0145
dw $0146
dw $0152
dw $0153
dw $0154
dw $0155
dw $0156
dw $0157
dw $0158
dw $00C7
dw $00D1
dw $00E2
dw $00E3
dw $00E4
dw $00E5
dw $00F6
dw $0120
dw $0121
dw $0132
dw $0133
dw $0134
dw $0135
dw $0147
dw $0161
dw $0162
dw $0165
dw $0166
dw $0167
dw $0169
dw $016A
dw $0176
dw $0178
dw $0179
dw $017A
dw $017B
dw $0184
dw $0185
dw $01BE
dw $01BF
dw $01C0
dw $01C1
dw $01D2
dw $01D3
dw $01D4
dw $01FD
dw $0208
dw $0209
dw $020A
dw $020B
dw $020C
dw $020D
dw $0216
dw $0217
dw $0218
dw $0219
dw $021A
dw $021B
dw $0224
dw $018F
dw $0190
dw $0191
dw $0192
dw $0193
dw $0194
dw $0195
dw $01A3
dw $01A4
dw $01A5
dw $01A6
dw $01A7
dw $01A8
dw $01A9
dw $01B7
dw $01B8
dw $01B9
dw $01BA
dw $01BB
dw $01BC
dw $01BD
dw $01CB
dw $01CC
dw $01CD
dw $01CE
dw $01CF
dw $01D0
dw $01D1
dw $01DF
dw $01E0
dw $01E1
dw $01E2
dw $01E3
dw $01E4
dw $01E5
dw $00EE
dw $0102
dw $0103
dw $0116
dw $012A
dw $013E
dw $013F
dw $015E
dw $015F
dw $0163
dw $0164
dw $0168
dw $016D
dw $016E
dw $0172
dw $0177
dw $017C
dw $018E
dw $01A2
dw $01B6
dw $01CA
dw $01DE
dw $0206
dw $0207
dw $023A
dw $023B
dw $023C
dw $023D
dw $023E
dw $023F
dw $0240
dw $0244
dw $0245
dw $0246
dw $0247
dw $0248
dw $0249
dw $024A
dw $0262
dw $0263
dw $0264
dw $0265
dw $0266
dw $0267
dw $0268
dw $0258
dw $0259
dw $025A
dw $025B
dw $025C
dw $025D
dw $025E
dw $00E7
dw $00E8
dw $00E9
dw $00EA
dw $00EB
dw $00EC
dw $00ED
dw $00E6
dw $00FB
dw $00FC
dw $00FD
dw $00FE
dw $00FF
dw $0100
dw $0101
dw $00FA
dw $010F
dw $0110
dw $0111
dw $0112
dw $0113
dw $0114
dw $0115
dw $010E
dw $0123
dw $0124
dw $0125
dw $0126
dw $0127
dw $0128
dw $0129
dw $0122
dw $0137
dw $0138
dw $0139
dw $013A
dw $013B
dw $013C
dw $013D
dw $0136
dw $014B
dw $014C
dw $014D
dw $014E
dw $014F
dw $0150
dw $0151
dw $014A
dw $009C
dw $009D
dw $009E
dw $009F
dw $00C4
dw $00C5
dw $00C6
dw $0028
dw $00F8
dw $00F9
dw $010B
dw $010C
dw $010D
dw $011E
dw $011F
dw $00F7
dw $0149
dw $0159
dw $015A
dw $015B
dw $015C
dw $015D
dw $0160
dw $0148
dw $016C
dw $016F
dw $0170
dw $0171
dw $0173
dw $0174
dw $0175
dw $016B
dw $0197
dw $0198
dw $0199
dw $01AA
dw $01AB
dw $01AC
dw $01AD
dw $0196
dw $01E6
dw $01E7
dw $01E8
dw $01E9
dw $01F2
dw $01F3
dw $01FC
dw $01D5
dw $020F
dw $0210
dw $0211
dw $0212
dw $0213
dw $0214
dw $0215
dw $020E
dw $0187
dw $0188
dw $0189
dw $018A
dw $018B
dw $018C
dw $018D
dw $0186
dw $019B
dw $019C
dw $019D
dw $019E
dw $019F
dw $01A0
dw $01A1
dw $019A
dw $01AF
dw $01B0
dw $01B1
dw $01B2
dw $01B3
dw $01B4
dw $01B5
dw $01AE
dw $01C3
dw $01C4
dw $01C5
dw $01C6
dw $01C7
dw $01C8
dw $01C9
dw $01C2
dw $01D7
dw $01D8
dw $01D9
dw $01DA
dw $01DB
dw $01DC
dw $01DD
dw $01D6
dw $01EB
dw $01EC
dw $01ED
dw $01EE
dw $01EF
dw $01F0
dw $01F1
dw $01EA
dw $01F5
dw $01F6
dw $01F7
dw $01F8
dw $01F9
dw $01FA
dw $01FB
dw $01F4
dw $01FF
dw $0200
dw $0201
dw $0202
dw $0203
dw $0204
dw $0205
dw $01FE
dw $021D
dw $021E
dw $021F
dw $0220
dw $0221
dw $0222
dw $0223
dw $021C
dw $0227
dw $0228
dw $0229
dw $022A
dw $022B
dw $022C
dw $022D
dw $0226
dw $0230
dw $0231
dw $0232
dw $0233
dw $0234
dw $0235
dw $0236
dw $024E
dw $024F
dw $0250
dw $0251
dw $0252
dw $0253
dw $0254
dw $FFFF

;WorkDay scripts (club/job)
.DATA_03_6D55:
dw $00C9
dw $00CD
dw $00A0
dw $00A1
dw $00A2
dw $00A3
dw $00A4
dw $00A5
dw $00A6
dw $00A7
dw $00A8
dw $00A9
dw $00AA
dw $00AB
dw $00AC
dw $00AD
dw $00AE
dw $00AF
dw $00B0
dw $00B1
dw $00B2
dw $00B3
dw $00B4
dw $0024
dw $009B
dw $0086
dw $00E0
dw $00E1
dw $FFFF

;TestDay scripts
.DATA_03_6D8F:
dw $0021
dw $0026
dw $004F
dw $0225
dw $FFFF

;School trips
.DATA_03_6D99:
dw $0023
dw $0066
dw $0067
dw $0068
dw $FFFF

;Sports Tournament, you meet Suzune at the Nurse Office
.DATA_03_6DA3:
dw $004E
dw $FFFF

;Unique Ruruna Events?
.DATA_03_6DA7:
dw $006B                                                    ;Ruruna playing Romeo and Juliet
dw $006C                                                    ;Ruruna made lunch for you.
dw $FFFF

;Sports club events
.DATA_03_6DAD:
dw $00B5
dw $00B6
dw $00B7
dw $00B8
dw $00B9
dw $00BA
dw $00BB
dw $00BC
dw $00BD
dw $00BE
dw $00BF
dw $00C0
dw $00C1
dw $00C2
dw $00C3
dw $FFFF

;Randomly meeting characters
.DATA_03_6DCD:
dw $00D4
dw $00D8
dw $00DF
dw $00DB
dw $00DE
dw $00D3
dw $00D5
dw $00D7
dw $00D9
dw $00DA
dw $00DC
dw $00DD
dw $00D6
dw $FFFF

.DATA_03_6DE9:
dw $0005
dw $0006
dw $0007
dw $0008
dw $0009
dw $000A
dw $000B
dw $0014
dw $0015
dw $0016
dw $0017
dw $0090
dw $0091
dw $0092
dw $0093
dw $0049
dw $004A
dw $004B
dw $00C8
dw $00CA
dw $00CB
dw $00CC
dw $00CE
dw $00CF
dw $00D0
dw $006E
dw $006F
dw $0070
dw $0071
dw $0072
dw $0073
dw $0074
dw $0075
dw $0076
dw $007C
dw $0079
dw $007A
dw $007B
dw $007D
dw $007E
dw $007F
dw $0080
dw $0081
dw $0082
dw $0083
dw $0089
dw $008A
dw $008C
dw $00D2
dw $FFFF

.DATA_03_6E4D:
dw $0005
dw $0006
dw $0007
dw $0008
dw $0009
dw $000A
dw $000B
dw $001A
dw $001C
dw $001D
dw $00C8
dw $00CA
dw $00CB
dw $00CC
dw $00CE
dw $00CF
dw $00D0
dw $0019
dw $001B
dw $0079
dw $007A
dw $007B
dw $007D
dw $007E
dw $007F
dw $0080
dw $0081
dw $0082
dw $0083
dw $0085
dw $006A
dw $0077
dw $0078
dw $008B
dw $0065
dw $0018
dw $001E
dw $004D
dw $0069
dw $006D
dw $FFFF

.DATA_03_6E9F:
dw $004C
dw $FFFF

;A small pool of Ruruna-centric school events
.DATA_03_6EA3:
dw $00C8
dw $0050
dw $006E
dw $0029
dw $003E
dw $FFFF

;A small pool of Mizuki-centric school events (except for the first event related to Ruruna for some reason)
.DATA_03_6EAF:
dw $00C8
dw $0051
dw $006F
dw $002A
dw $003F
dw $FFFF

;A small pool of Yumi-centric school events
.DATA_03_6EBB:
dw $0001
dw $0052
dw $0070
dw $002B
dw $0040
dw $FFFF

;A small pool of Miri-centric school events (except for a couple of Ruruna events trying to steal the spotlight)
.DATA_03_6EC7:
dw $0084
dw $0053
dw $00C8
dw $0071
dw $002C
dw $0041
dw $FFFF

;A small pool of Mari-centric school events
.DATA_03_6ED5:
dw $0002
dw $0054
dw $0072
dw $002D
dw $0042
dw $FFFF

;A small pool of Suzune-centric school events (except for Momoyo one for some reason)
.DATA_03_6EE1:
dw $0003
dw $0055
dw $0073
dw $0087
dw $002E
dw $0043
dw $FFFF

;A small pool of Momoyo-centric school events
.DATA_03_6EEF:
dw $0004
dw $0056
dw $0074
dw $002F
dw $0044
dw $FFFF

.DATA_03_6EFB:
dw $000C
dw $0006
dw $0008
dw $000A
dw $00CB
dw $00CE
dw $00D0
dw $0057
dw $0029
dw $0032
dw $0035
dw $0036
dw $003E
dw $FFFF

.DATA_03_6F17:
dw $000D
dw $0005
dw $0009
dw $000B
dw $00CB
dw $00CC
dw $00CF
dw $006E
dw $006F
dw $0070
dw $0071
dw $0072
dw $0073
dw $0074
dw $0058
dw $002A
dw $0030
dw $0033
dw $0034
dw $003F
dw $FFFF

.DATA_03_6F41:
dw $000E
dw $0006
dw $000A
dw $000B
dw $00C8
dw $00CC
dw $00CE
dw $006E
dw $006F
dw $0070
dw $0071
dw $0072
dw $0073
dw $0074
dw $0059
dw $002B
dw $0031
dw $0034
dw $0035
dw $0040
dw $FFFF

.DATA_03_6F6B:
dw $0005
dw $0006
dw $0008
dw $000A
dw $00CB
dw $00CC
dw $00CE
dw $00D0
dw $006E
dw $006F
dw $0070
dw $0071
dw $0072
dw $0073
dw $0074
dw $005A
dw $002C
dw $0031
dw $0032
dw $0036
dw $0041
dw $FFFF

.DATA_03_6F97:
dw $000F
dw $0006
dw $0007
dw $000A
dw $00C8
dw $00CC
dw $00D0
dw $006E
dw $006F
dw $0070
dw $0071
dw $0072
dw $0073
dw $0074
dw $005B
dw $002D
dw $0030
dw $0032
dw $0033
dw $0042
dw $FFFF

.DATA_03_6FC1:
dw $0005
dw $0006
dw $000A
dw $000B
dw $00CB
dw $00CC
dw $00CE
dw $00CF
dw $006E
dw $006F
dw $0070
dw $0071
dw $0072
dw $0073
dw $0074
dw $005C
dw $002E
dw $0030
dw $0033
dw $0036
dw $0043
dw $FFFF

.DATA_03_6FED:
dw $0010
dw $0006
dw $0007
dw $0009
dw $00C8
dw $00CC
dw $00CF
dw $006E
dw $006F
dw $0070
dw $0071
dw $0072
dw $0073
dw $0074
dw $005D
dw $002F
dw $0031
dw $0034
dw $0035
dw $0044
dw $FFFF

.DATA_03_7017:
dw $000C
dw $0006
dw $0009
dw $000B
dw $00CB
dw $00CC
dw $00CF
dw $006E
dw $006F
dw $0070
dw $0071
dw $0072
dw $0073
dw $0074
dw $005E
dw $0037
dw $0032
dw $0034
dw $0035
dw $003E
dw $FFFF

.DATA_03_7041:
dw $000D
dw $0005
dw $0009
dw $000A
dw $00CB
dw $00CC
dw $00D0
dw $006E
dw $006F
dw $0070
dw $0071
dw $0072
dw $0073
dw $0074
dw $0038
dw $0030
dw $0033
dw $0036
dw $003F
dw $FFFF

.DATA_03_7069:
dw $000E
dw $0008
dw $0009
dw $000A
dw $00C8
dw $00CA
dw $00D0
dw $006E
dw $006F
dw $0070
dw $0071
dw $0072
dw $0073
dw $0074
dw $005F
dw $0039
dw $0031
dw $0033
dw $0036
dw $0040
dw $FFFF

.DATA_03_7093:
dw $0005
dw $0006
dw $0008
dw $000A
dw $00CB
dw $00CC
dw $00CE
dw $00D0
dw $006E
dw $006F
dw $0070
dw $0071
dw $0072
dw $0073
dw $0074
dw $0060
dw $003A
dw $0031
dw $0032
dw $0035
dw $0041
dw $FFFF

.DATA_03_70BF:
dw $000F
dw $0006
dw $0008
dw $000A
dw $00C8
dw $00CB
dw $00D0
dw $006E
dw $006F
dw $0070
dw $0071
dw $0072
dw $0073
dw $0074
dw $0061
dw $003B
dw $0030
dw $0031
dw $0036
dw $0042
dw $FFFF

.DATA_03_70E9:
dw $0006
dw $0007
dw $000A
dw $000B
dw $00C8
dw $00CC
dw $00CE
dw $00CF
dw $006E
dw $006F
dw $0070
dw $0071
dw $0072
dw $0073
dw $0074
dw $0062
dw $003C
dw $0030
dw $0034
dw $0036
dw $0043
dw $FFFF

.DATA_03_7115:
dw $0010
dw $0006
dw $0007
dw $000A
dw $00C8
dw $00CC
dw $00CE
dw $006E
dw $006F
dw $0070
dw $0071
dw $0072
dw $0073
dw $0074
dw $0063
dw $003D
dw $0032
dw $0034
dw $0035
dw $0044
dw $FFFF

.DATA_03_713F:
dw $0001
dw $0002
dw $0003
dw $0004
dw $0011
dw $0012
dw $0013
dw $008D
dw $008E
dw $008F
dw $001F
dw $0025
dw $0094
dw $0095
dw $0096
dw $0097
dw $0098
dw $0099
dw $009A
dw $00C8
dw $0088
dw $0064
dw $0046
dw $0047
dw $0048
dw $007C
dw $0079
dw $007A
dw $007B
dw $006E
dw $006F
dw $0070
dw $0071
dw $0072
dw $0073
dw $0074
dw $0020
dw $0022
dw $0027
dw $0045
dw $FFFF
.end