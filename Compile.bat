rgbasm -o PocketLoveDisassembly.o PocketLoveDisassembled.asm
rgblink -o PocketLoveDisassembly.gb PocketLoveDisassembly.o -p 0 -w
pause