:: This make_ep1.bat script was created by EXL, 02-Jun-2023.
:: Default platform is Motorola P2K, ElfPack v1.x, ADS1.2 [Build 848] on Windows.
:: Warning: `-nodebug` flag option for `armlink` is buggy.

:: Uncomment it for disable verbose output.
:: @echo off

if /I "%1"=="clean" (
	if exist *.o    del *.o
	if exist *.obj  del *.obj
	if exist *.elfp del *.elfp
	if exist *.elf  del *.elf
	exit /b 0
)

:: Compiler path.
set ARM_PATH=C:\ARM

:: SDK path.
set SDK_PATH=%ARM_PATH%\SDK

:: Libraries path.
set LIB_PATH=%ARM_PATH%\lib

:: Main link library.
set LIB_MAIN=Lib.o

:: Defines.
set DEFINES=-D__P2K__ -DEP1
:: set DEFINES=-D__P2K__ -DEP1 -DSHOW_ELF_ICONS
:: set DEFINES=-D__P2K__ -DEP1 -DFTR_V600
:: set DEFINES=-D__P2K__ -DEP1 -DFTR_V600 -DFTR_C650 -DASYNC
:: set DEFINES=-D__P2K__ -DEP1 -DFTR_V600 -DFTR_C650 -DASYNC -DDEBUG

:: Project/ELF name.
set ELF_NAME=ElfBox

:: Compiling step.
%ARM_PATH%\tcc -I%SDK_PATH% %DEFINES% -bigend -apcs /interwork -O2 -c %ELF_NAME%.c -o %ELF_NAME%.o

:: Linking step.
%ARM_PATH%\armlink -nolocals -reloc -first %LIB_MAIN%(Lib) %ELF_NAME%.o %LIB_PATH%\%LIB_MAIN% -o %ELF_NAME%.elf
