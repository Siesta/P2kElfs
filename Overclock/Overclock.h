#ifndef OVERCLOCK_H
#define OVERCLOCK_H

#include <typedefs.h>

typedef enum {
	CLOCKS_13MHZ_26MHZ,
	CLOCKS_26MHZ_26MHZ,
	CLOCKS_39MHZ_26MHZ,
	CLOCKS_52MHZ_26MHZ,
	CLOCKS_65MHZ_26MHZ,
	CLOCKS_65MHZ_32MHZ,
	CLOCKS_65MHZ_43MHZ,
	CLOCKS_69MHZ_26MHZ,
	CLOCKS_78MHZ_26MHZ,
	CLOCKS_86MHZ_26MHZ,
	CLOCKS_104MHZ_26MHZ,
	CLOCKS_130MHZ_26MHZ
} NEPTUNE_CLOCKS_T;

extern UINT32 SetNeptuneClocks(NEPTUNE_CLOCKS_T neptune_clock);

extern const WCHAR *DetermineNeptuneMcuClock(void);

#endif // OVERCLOCK_H
