# This Makefile was created by EXL, 26-Mar-2023.
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
DEFINES = -D__P2K__ -DEP1 -DROT_90 -DFPS_30
#DEFINES = -D__P2K__ -DEP1 -DROT_90 -DFPS_30 -DJAVA_HEAP -DFPS_METER
#DEFINES = -D__P2K__ -DEP1 -DROT_90 -DFPS_30 -DJAVA_HEAP -DFTR_V600
#DEFINES = -D__P2K__ -DEP1 -DROT_90 -DFPS_30 -DUIS_HEAP -DFTR_V635
#DEFINES = -D__P2K__ -DEP1 -DROT_0 -DFPS_30 -DFTR_V600 -DFTR_C650 -DUIS_HEAP

# Project/ELF name.
ELF_NAME = Spout

all:
	$(ARM_PATH)/bin/tcc -I$(SDK_PATH) $(DEFINES) -bigend -apcs /interwork -O2 -c Piece.c -o Piece.o
	$(ARM_PATH)/bin/tcc -I$(SDK_PATH) $(DEFINES) -bigend -apcs /interwork -O2 -c $(ELF_NAME).c -o $(ELF_NAME).o
	$(ARM_PATH)/bin/armlink -nolocals -reloc -first $(LIB_MAIN)\(Lib\) Piece.o $(ELF_NAME).o \
		$(LIB_PATH)/$(LIB_MAIN) -o $(ELF_NAME).elf

clean:
	-rm -f *.o
	-rm -f *.obj
	-rm -f *.elfp
	-rm -f *.elf
