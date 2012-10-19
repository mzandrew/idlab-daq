
#include "stdUSB.h"

stdUSB::stdUSB(void)
: stdHandle(INVALID_HANDLE_VALUE)
{
}

stdUSB::~stdUSB(void)
{
	//if(stdHandle != INVALID_HANDLE_VALUE)
	//	CloseHandle(stdHandle);
}

bool stdUSB::createHandles(void)
{
	//try {
	//	return createHandle(&stdHandle, "ezusb-0");
	//}
	//catch(DWORD dw) {
	//	throw(dw);
	//}
	char tmp[64];
	
	// device is not allways ezusb-0, it can be ezusb-1 ,2,3,4 etc
	for(int i = 0; i < 32; i++) { // try to scan trough all possible devices.. 
		sprintf(tmp, "ezusb-%d", i);
		if(createHandle(&stdHandle, tmp))
			return SUCCEED; // OK!
	}

	//if(createHandle(&stdHandle, "ezusb-0"))
	//	return true;
	//else if(createHandle(&stdHandle, "ezusb-1"))
	//	return true;
	//else
	//throw(GetLastError());

	return FAILED; // FAIL!
}

bool stdUSB::createHandle(HANDLE *pHandle, char *pDeviceName)// throw(...) // ezusb-0, ezusb-1 etc..
{
	char buff[64] = ""; // empty string with end-null

	strcat(buff, "\\\\.\\"); // strcat fails if buff does not have end-null..
	strcat(buff, pDeviceName);
	
	*pHandle = CreateFile(buff,
		GENERIC_WRITE,
		FILE_SHARE_WRITE,
		NULL,
		OPEN_EXISTING,
		0,
		NULL);

	if(*pHandle == INVALID_HANDLE_VALUE)
		return FAILED; // FAIL
		

	return SUCCEED; // OK
}

bool stdUSB::freeHandles(void) //throw(...)
{
	if(stdHandle != INVALID_HANDLE_VALUE) {
		if(CloseHandle(stdHandle) == 0)  {
				stdHandle = INVALID_HANDLE_VALUE;
				//throw GetLastError();
		}
	}
	else
		return FAILED;

	return SUCCEED;
}

bool stdUSB::sendData(unsigned short data) //throw(...)
{
	UCHAR buff[2];
	BOOL result;
	unsigned long n;

	buff[0] = (UCHAR) data;
	buff[1] = (UCHAR)(data >> 8);

	BULK_TRANSFER_CONTROL BulkTransferControl;
	
	BulkTransferControl.pipeNum = 0; // PIPE 0 = EP 2 OUT

	result = DeviceIoControl(stdHandle, 
							 IOCTL_EZUSB_BULK_WRITE,
							 &BulkTransferControl,
							 sizeof(BULK_TRANSFER_CONTROL),
							 &buff[0],
							 sizeof(buff),
							 &n,
							 NULL);

//if(result == 0) // fail
//	throw(GetLastError());
	
	return SUCCEED; // succeed..
}

bool stdUSB::sendData(unsigned int data)// throw(...)
{
	UCHAR buff[4];
	BOOL result;
	unsigned long n;

	buff[0] = (UCHAR) data;
	buff[1] = (UCHAR)(data >> 8);
	buff[2] = (UCHAR)(data >> 16);
	buff[3] = (UCHAR)(data >> 24);

	BULK_TRANSFER_CONTROL BulkTransferControl;
	
	BulkTransferControl.pipeNum = 0; // PIPE 0 = EP 2 OUT

	result = DeviceIoControl(stdHandle, 
							 IOCTL_EZUSB_BULK_WRITE,
							 &BulkTransferControl,
							 sizeof(BULK_TRANSFER_CONTROL),
							 &buff[0],
							 sizeof(buff),
							 &n,
							 NULL);

//	if(result == 0) // fail
//	   	throw(GetLastError());
	
	return SUCCEED; // succeed..
}

bool stdUSB::readData(unsigned short * pData, int l, int* lread)// throw(...)
{
	//unsigned int trycount = 0;

	BOOL result;
	DWORD n;

	if(l < 1 || pData == NULL) 
		return false; // we don't have buffer to save incoming data..BAD BAD BAD!

	BULK_TRANSFER_CONTROL BulkTransferControl;

	BulkTransferControl.pipeNum = 2; // PIPE 2 = EP 6 IN
	
	//for(trycount = 0; trycount < 10; trycount++) {
		DWORD size = (DWORD)l * sizeof(unsigned short);
		
		result = DeviceIoControl(stdHandle, 
								 IOCTL_EZUSB_BULK_READ,
								 &BulkTransferControl,
								 sizeof(BULK_TRANSFER_CONTROL),
								 pData,
								 size, 
								 &n,
								 NULL);

		//if(n == size)
		//	break;
	//}

	if(lread != NULL) {
		*lread = (int)(n / (DWORD)sizeof(unsigned short));
	}
	
//	if(result == 0) 
//		throw(GetLastError());

	return SUCCEED;  // done! *<:-) celebrate etc..
}

bool stdUSB::resetPipe()
{
    BULK_TRANSFER_CONTROL BulkTransferControl;
    BulkTransferControl.pipeNum = 2;
    BOOL result;
    unsigned long n;
    
    result = DeviceIoControl(stdHandle, 
							 IOCTL_Ezusb_RESET,
							 &BulkTransferControl,
							 sizeof(BULK_TRANSFER_CONTROL),
							 NULL,
							 NULL, 
							 &n,
							 NULL);

    return result;
}

