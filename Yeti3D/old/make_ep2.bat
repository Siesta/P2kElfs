:: This make.bat script was edited by EXL, 20-Apr-2023.
:: Default platform is Motorola P2K, ElfPack v2.x, devkitARM release 26 (GCC 4.4.0) on Windows.

:: Uncomment it for disable verbose output.
:: @echo off

:: Compiler path.
set ARM_PATH=C:\devkitARM

:: SDK path.
set SDK_PATH=%ARM_PATH%\SDK

:: Libraries path.
set LIB_PATH=%ARM_PATH%\lib

:: Main link library.
set LIB_MAIN=std.sa

:: Libc link library.
set LIB_LIBC=libc.a

:: Defines.
set DEFINES=-D__P2K__ -DEP2 -DROT_0 -DFPS_30

:: Includes.
set INCLUDES=-I..\src\

:: Optimization.
set OPTIM=-O2

:: Output names.
set ELF_NAME=Yeti3D

:: Compiling step.
%ARM_PATH%\bin\arm-eabi-gcc -c -Wall -mbig-endian -mthumb -mthumb-interwork -nostdlib ^
	-fshort-wchar -fshort-enums -fpack-struct=4 -fno-builtin -fvisibility=hidden ^
	-I%SDK_PATH% %INCLUDES% %DEFINES% %OPTIM% data.c -o data.o
%ARM_PATH%\bin\arm-eabi-gcc -c -Wall -mbig-endian -mthumb -mthumb-interwork -nostdlib ^
	-fshort-wchar -fshort-enums -fpack-struct=4 -fno-builtin -fvisibility=hidden ^
	-I%SDK_PATH% %INCLUDES% %DEFINES% %OPTIM% draw.c -o draw.o
%ARM_PATH%\bin\arm-eabi-gcc -c -Wall -mbig-endian -mthumb -mthumb-interwork -nostdlib ^
	-fshort-wchar -fshort-enums -fpack-struct=4 -fno-builtin -fvisibility=hidden ^
	-I%SDK_PATH% %INCLUDES% %DEFINES% %OPTIM% yeti.c -o yeti.o
%ARM_PATH%\bin\arm-eabi-gcc -c -Wall -mbig-endian -mthumb -mthumb-interwork -nostdlib ^
	-fshort-wchar -fshort-enums -fpack-struct=4 -fno-builtin -fvisibility=hidden ^
	-I%SDK_PATH% %INCLUDES% %DEFINES% %OPTIM% %ELF_NAME%.c -o %ELF_NAME%.o

:: Linking step.
%ARM_PATH%\bin\arm-eabi-ld -pie -EB %OPTIM% -nostdlib data.o draw.o yeti.o %ELF_NAME%.o ^
	%LIB_PATH%\%LIB_MAIN% %LIB_PATH%\%LIB_LIBC% -o %ELF_NAME%_p.elf

:: Post linking step.
%ARM_PATH%\libgen\postlink.exe %ELF_NAME%_p.elf -o %ELF_NAME%.elf

:: Renaming step.
del *.o
del *_p.elf
move /y %ELF_NAME%.elf %ELF_NAME%_EP2.elf

:: Clean step.
if /I "%1"=="clean" (
	del *.o
	del *.elf
)
