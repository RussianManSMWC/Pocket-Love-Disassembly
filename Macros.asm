;arguments: word, address (works with A register)
MACRO StoreWord
  LD A, LOW(\1)
  LD [\2], A

  LD A, HIGH(\1)
  LD [\2+1], A 
ENDM

macro CheckPPUModes
  RST $30
ENDM

macro BitTest
  BIT LOG(\1<<16,2.0)>>16, \2
endm

macro ResetBit
  RES LOG(\1<<16,2.0)>>16, \2
endm

macro SetBit
  SET LOG(\1<<16,2.0)>>16, \2
endm

;word but in big endian
macro dwb
  db HIGH(\1),LOW(\1)
endm

;define a 16-bit pointer with data size.
;input data table. must end with .end label for size calculation
macro PointerWithSize
  dw \1-$4000, \1.end-\1
endm

macro LoadDataSizeConstant
  LD \1, \2.end-\2
endm

;table here also must end with .end
macro DataSizeTableEntry
  db \1.end-\1
endm

;input:
;argument 1 - script ID
;argument 2 - bank to get this particular script from
macro ScriptEntry
  db LOW(\1),\2<<3+HIGH(\1)
endm

;note: assumes that Text_VN charset has been loaded beforehand
macro DictionaryEntry
  db \1,$00
  CHARMAP \1, TextCommand_GetDictionaryEntry, CurrentDictionaryEntry
  def CurrentDictionaryEntry = CurrentDictionaryEntry+1
endm

;input:
;argument 1 - binary or hexadecimal compare. if "%", it'll be a bitwise check
;argument 2 - variable RAM
;argument 3 - way to compare
;argument 4 - value to compare
;argument 5 - chance of event happening index
;Note: each entry is 6 bytes long, despite having only 5 arguments.
macro EventCondition
  assert \2 >= ScriptTEMP_D31B && \2 <= ScriptTEMP_D31B+($FF*2), "Event conditional's variable is out of bounds!" ;need to be more specific?

  def BitwiseFlag = 0
  if STRCMP(\1,"%")
    db $00
  else

    db $01
    redef BitwiseFlag = 1
  endc

  db LOW((\2-ScriptTEMP_D31B)/2)

  if BitwiseFlag
    db LOG(\4<<16,2.0)>>16
  else
    db $00
  endc

  db \3
  if BitwiseFlag
    db $01 ;always checks for if bit is on
  else
    db \4
endc

  db \5
endm

macro ScheduleScreenOptionNameEntry
  def size = STRLEN(\1)
  def sizeDif = size-ScheduleScreenOptionName_MaxLength
  def padding = ScheduleScreenOptionName_MaxLength-size
  assert size <= ScheduleScreenOptionName_MaxLength, "\1 is longer than {d:ScheduleScreenOptionName_MaxLength} characters! Longer by {d:sizeDif}"
  db \1
  ds padding, CHARVAL(" ")
endm

macro ItemNameEntry
  def size = STRLEN(\1)
  def sizeDif = size-ItemName_MaxLength
  def padding = ItemName_MaxLength-size
  assert size <= ItemName_MaxLength, "\1 is longer than {d:ItemName_MaxLength} characters! Longer by {d:sizeDif}"
  db \1
  ds padding, CHARVAL(" ")
endm

;turns out it's identical to item name entry as well
macro LocationNameEntry
  def size = STRLEN(\1)
  def sizeDif = size-PlaceName_MaxLength
  def padding = PlaceName_MaxLength-size
  assert size <= PlaceName_MaxLength, "\1 is longer than {d:PlaceName_MaxLength} characters! Longer by {d:sizeDif}"
  db \1
  ds padding, CHARVAL(" ")
endm