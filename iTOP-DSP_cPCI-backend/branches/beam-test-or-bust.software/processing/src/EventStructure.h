#ifndef EVENTSTRUCTURE__H
#define EVENTSTRUCTURE__H

#define WORDS_IN_PACKET 140

#define PACKET_HEADER             (0x00be11e2)
#define PACKET_SIZE               (0x0000008C)
#define PACKET_TYPE_HEADER        (0x0000eada)
#define PACKET_TYPE_WAVEFORM      (0x00c0ffee)
#define PACKET_TYPE_TRIGGER       (0xce11b10c)
#define PACKET_TYPE_HOUSEKEEPING  (0x000ab0de)
#define PACKET_TYPE_FOOTER        (0x000f00da)
#define PACKET_FOOTER             (0x62504944)
//#define PROTOCOL_FREEZE_DATE      (0x20111016)
#define PROTOCOL_FREEZE_DATE      (0x20111213)
#define RESEVED_WORD              (0x99999999)
#define SCROD_ID_FIXED            (0x000A0001)

#define MASK_ASIC_ROW             (0x30000000)
#define MASK_ASIC_COLUMN          (0x03000000)
#define MASK_PACKET_NUMBER        (0x00FF0000)
#define MASK_ASIC_CHANNEL         (0x00007000)
#define MASK_ORIGIN_WINDOW        (0x000001FF)
#define MASK_EVEN_ADC             (0x00000FFF)
#define MASK_ODD_ADC              (0x0FFF0000)
#define MASK_TEMPERATURE          (0x00000FFF)
#define MASK_DAC                  (0x00000FFF)

typedef unsigned int dword;
enum packet_read_status {SUCCESS, MISPLACED_PACKET, END_OF_FILE};
#define GOOD_PACKET  (0x00)
#define	BAD_HEADER   (0x01)
#define	BAD_SIZE     (0x02)
#define BAD_DATE     (0x04)
#define	BAD_TYPE     (0x08)
#define	BAD_SCROD_ID (0x10)
#define	BAD_CHECKSUM (0x20)
#define	BAD_FOOTER   (0x40)
#define N_EVENT_ERROR_TYPES (10)

#include "TFile.h"
#include "TTree.h"
#include "TCanvas.h"
#include <fstream>
#include <string.h>

class PacketData {
private:
	unsigned int software_checksum;
public:
	dword packet_header;
	dword packet_size;
	dword protocol_date;
	dword packet_type;
	dword event_number;
	dword packet_number_and_origin_window;
	dword packet_data[131];
	dword scrod_id;
	dword checksum;
	dword footer;

	packet_read_status ReadPacketFromFile(ifstream &fin);
	unsigned int CheckPacket();
	unsigned short int GetASICRow(int window = 0);
	unsigned short int GetASICColumn(int window = 0);
	unsigned short int GetASICChannel(int window = 0);
	unsigned short int GetPacketNumber(int window = 0);
	unsigned short int GetOriginWindow(int window = 0);
	unsigned short int GetWaveformPoint(int window, int sample);
	void GetTriggerStream(int col, int row, int ch, bool *stream);
	unsigned short int GetTriggerScaler(int col, int row, int ch);
	unsigned short int GetTemperature();
	unsigned short int GetTRGbias(int col, int row);
	unsigned short int GetTRGthresh(int col, int row, int ch);
	unsigned short int GetWbias(int col, int row);
	unsigned short int GetVadjP(int col, int row);
	unsigned short int GetVadjN(int col, int row);
	unsigned short int GetVbias(int col, int row);
	unsigned short int GetSBbias(int col, int row);
	unsigned short int GetIsel(int col, int row);
	unsigned short int GetVdly(int col, int row);
	unsigned short int GetCMPbias(int col, int row);
	unsigned short int GetPUbias(int col, int row);
	unsigned short int GetTRGthreshref(int col, int row);
	unsigned short int GetWilkCounter(int col, int row);
	short int GetSampRateCounter(int col, int row);
};

class EventData {
public:
	EventData();
	~EventData();
	TFile* OpenROOTFile(char *filename);
	void AutoSave();
	void CloseROOTFile();
	int ReadEvent(ifstream &fin);
	void Draw();

//I changed this to public because I hate having to write accessors.
//Also, I don't expect anyone else to try to integrate this into a larger project, so eff it. -KN
public:
	TFile *file_handle;
	TTree *ConfigTree;
	TTree *EventTree;
	TCanvas *C;

	//Variables for the simple static tree
	std::string RawFileName;
	unsigned short int RawFilename;
	unsigned short int FiberChannel;
	unsigned short int FiberCard;
	std::string SCROD_Revision;
	unsigned short int SCROD_ID;
	unsigned short int ASIC_ID[4][4];
	unsigned int RunNumber;
	//Variables for the event tree
	unsigned int EventNumber;                        //
	unsigned short int Temperature;                  //
	unsigned short int ASIC_TRGbias[4][4];           //
	unsigned short int ASIC_TRGthresh[4][4][8];      //
	unsigned short int ASIC_Wbias[4][4];             //
	unsigned short int ASIC_VadjP[4][4];             //
	unsigned short int ASIC_VadjN[4][4];             //
	unsigned short int ASIC_Vbias[4][4];             //
	unsigned short int ASIC_SBbias[4][4];	         //
	unsigned short int ASIC_Isel[4][4];              //
	unsigned short int ASIC_CMPbias[4][4];           //
	unsigned short int ASIC_PUbias[4][4];            //
	unsigned short int ASIC_Vdly[4][4];              //
	unsigned short int ASIC_TRGthreshref[4][4];      //
	unsigned short int ASIC_WilkCounter[4][4];             
	short int ASIC_SampRateCounter[4][4];	 
	unsigned int ASIC_TrigWidthCounter[4][4];        
	unsigned short int ASIC_ADC[4][4][8][4][64];     //
	unsigned short int ASIC_OriginWindow[4][4][8][4];//
	bool ASIC_TriggerStream[4][4][8][16];            //
	unsigned short int ASIC_Scaler[4][4][8];         //
	//Variables to track numbers of errors during event reading
	//Index        error type
	//-----        ----------
	//    0	       header
	//    1        size
	//    2        date        
	//    3        type
	//    4        scrod_id
	//    5        checksum
	//    6        footer
	//    7        misplaced packet
	//    8        end-of-file
	//    9        other
	int N_errors[N_EVENT_ERROR_TYPES];  
	//Function to increment error counts here
	void IncrementErrorCounts(packet_read_status flags);
};
#else
#endif
