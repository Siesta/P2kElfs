# This Makefile was created by EXL, 20-Apr-2023.
# Default platform is Motorola P2K, ElfPack v1.x, ADS1.2 [Build 848] on Linux.
# Warning: `-nodebug` flag option for `armlink` is buggy.

# Compiler path.
ARM_PATH = /opt/arm

# SDK path.
SDK_PATH = $(ARM_PATH)/SDK

# Libraries path.
LIB_PATH = $(ARM_PATH)/lib

# Main link library.
LIB_MAIN = Lib.o

# Defines.
DEFINES = -D__P2K__ -DEP1 -DROT_90 -DFPS_30 -DVIEWPORT_WIDTH=82 -DVIEWPORT_HEIGHT=122
#DEFINES = -D__P2K__ -DEP1 -DROT_90 -DFPS_30 -DVIEWPORT_WIDTH=48 -DVIEWPORT_HEIGHT=72
#DEFINES = -D__P2K__ -DEP1 -DROT_0 -DFPS_30 -DVIEWPORT_WIDTH=176 -DVIEWPORT_HEIGHT=220 -DCELLS_ALLOCA
#DEFINES = -D__P2K__ -DEP1 -DROT_90 -DFPS_30 -DVIEWPORT_WIDTH=82 -DVIEWPORT_HEIGHT=122 -DFTR_V635 -DUIS_HEAP

# Project/ELF name.
ELF_NAME = Yeti3D

all:
	$(ARM_PATH)/bin/tcc -I$(SDK_PATH) $(DEFINES) -bigend -apcs /interwork -O2 -c data.c -o data.o
	$(ARM_PATH)/bin/tcc -I$(SDK_PATH) $(DEFINES) -bigend -apcs /interwork -O2 -c draw.c -o draw.o
	$(ARM_PATH)/bin/tcc -I$(SDK_PATH) $(DEFINES) -bigend -apcs /interwork -O2 -c yeti.c -o yeti.o
	$(ARM_PATH)/bin/tcc -I$(SDK_PATH) $(DEFINES) -bigend -apcs /interwork -O2 -c $(ELF_NAME).c -o $(ELF_NAME).o
	$(ARM_PATH)/bin/armlink -nolocals -reloc -first $(LIB_MAIN)\(Lib\) data.o draw.o yeti.o $(ELF_NAME).o \
		$(LIB_PATH)/$(LIB_MAIN) -o $(ELF_NAME).elf

clean:
	-rm -f *.o
	-rm -f *.obj
	-rm -f *.elfp
	-rm -f *.elf
