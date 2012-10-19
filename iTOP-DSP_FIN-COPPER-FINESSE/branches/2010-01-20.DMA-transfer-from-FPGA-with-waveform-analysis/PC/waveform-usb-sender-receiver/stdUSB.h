/*
USB stuff

*/
#include <stdio.h>
#include <windows.h>
#include <winioctl.h>
#include "ezusbsys.h"

class stdUSB
{
public:
	stdUSB(void);
	~stdUSB(void);

	bool createHandles(void);
	bool freeHandles(void);
	bool sendData(unsigned short data);
	bool sendData(unsigned int data);
	bool readData(unsigned short * pData, int l, int* lread);
    bool resetPipe();

	static const bool SUCCEED = true;
	static const bool FAILED  = false;
private:
	bool createHandle(HANDLE *pHandle, char * pDeviceName);

	HANDLE stdHandle;
};
