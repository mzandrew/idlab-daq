/************
** system.h
*************/
#include <stdlib.h>
#include <stdio.h>
#include <sys/exception.h>
#include <cdefBF561.h>
#include <ccblkfn.h>
//#include "interruptA.h"
#include "interruptB.h"

#define pixel (16)
#define lines (2)
#define frame (pixel*lines)
#define length (4)

//--RX
#define DMA0_CONF (0x759A)
#define PPI0_CONF (0x393C)

struct sDMA_descriptor {
	unsigned short int NDPL;
	unsigned short int NDPH;
	unsigned short int SAL;
	unsigned short int SAH;
	unsigned short int DMACFG;
};
typedef struct sDMA_descriptor tDMA_descriptor;

//------------RX
extern tDMA_descriptor DMA_PPI0[4];

#pragma section("l2_shared")
extern volatile short buffer0[];
#pragma section("l2_shared")
extern volatile short buffer1[];
#pragma section("l2_shared")
extern volatile short buffer2[];
#pragma section("l2_shared")
extern volatile short buffer3[];

void InitPPI0(tDMA_descriptor* First_Header);
void DisablePPI0(void);
void EnablePPI0(void);
