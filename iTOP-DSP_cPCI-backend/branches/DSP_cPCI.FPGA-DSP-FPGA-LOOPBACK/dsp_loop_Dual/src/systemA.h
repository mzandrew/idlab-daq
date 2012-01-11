/************
** system.h
*************/
#include <stdlib.h>
#include <stdio.h>
#include <sys/exception.h>
#include <cdefBF561.h>
#include <ccblkfn.h>
#include "interruptA.h"
//#include "interruptB.h"

#define pixel (16)
#define lines (2)
#define frame (pixel*lines)
#define length (4)

//--TX
#define DMA1_CONF (0x7598)
#define PPI1_CONF (0x390E)

struct sDMA_descriptor {
	unsigned short int NDPL;
	unsigned short int NDPH;
	unsigned short int SAL;
	unsigned short int SAH;
	unsigned short int DMACFG;
};
typedef struct sDMA_descriptor tDMA_descriptor;

//------------TX
extern tDMA_descriptor DMA_PPI1[4];


void InitPPI1(tDMA_descriptor* First_Header);
void DisablePPI1(void);
void EnablePPI1(void);
/*
#pragma section("l2_shared")
extern volatile short buffer0[];
#pragma section("l2_shared")
extern volatile short buffer1[];
#pragma section("l2_shared")
extern volatile short buffer2[];
#pragma section("l2_shared")
extern volatile short buffer3[];
*/