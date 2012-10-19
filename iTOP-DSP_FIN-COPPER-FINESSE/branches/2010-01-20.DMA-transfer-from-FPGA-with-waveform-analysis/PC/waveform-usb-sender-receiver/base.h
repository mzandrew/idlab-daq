//Declarations of this program. It seems to be some kind of a convention to declare classes in 
//a header file.
#include <wx/wx.h>
#include <time.h>
#include <string.h>
//#include <pthread.h>
#include "defs.h"
#include "stdUSB.h"

class TestApp : public wxApp{
public:
	virtual bool OnInit();  //This will have to be overloaded somewhere to allow the application to
							//start...and do its tricks upon.
};

//Application's main window is derived from wxFrame class...
class MainWND : public wxFrame{
public:
	MainWND(const wxString title, const wxPoint& pos, const wxSize& size);
	~MainWND()
	{
        delete[] lastGoodData;
	}

	void OnQuit(wxCommandEvent &event);
	void OnAbout(wxCommandEvent& event);
	void ToggleTimer();
	void OnEnter(wxCommandEvent &event);
	
	void LOG_DATA(void);
    void LOAD_RAM_DATA(unsigned short int waveform_number);
    void GEN_RAM_DATA(void);
    void Send(void);
    void Read(bool ENABLE_TXT);
    void Clear(void);
    void Clear_terminal(void);
    void LOAD_PATTERN(void);
//    void USB_SYNC(bool ENABLE);
    void SOFT_TRIG();
    void W_EN(bool ENABLE);
    void WADDR(unsigned int W_ADDR);
    void WRITE_RAM(unsigned int ADC0, unsigned int ADC1);
    void W_STRB(void);
    void TX_LENGTH(unsigned int LENGTH);
	void set_register_bank_address(unsigned short int bank);
	void set_ram_read_mode(unsigned short int mode);
	void set_ram_write_mode(unsigned short int mode);
	void trigger_fiber_transfer(unsigned short int channels);
	void send_command(unsigned short int command);
	void send_command_with_16_bit_data(unsigned short int command, unsigned short int data);
	void send_command_with_24_bit_data(unsigned short int command, unsigned long int data);
	void trigger_chipscope(void);

private:
    wxTextCtrl *Commandline;
	wxTextCtrl *TextFrame;
	wxBoxSizer *BaseSizer;
	char state;
	wxString tempStr;
    bool GoodData;
    unsigned short *lastGoodData;
//    unsigned int RAM_DATA[128][64];
    unsigned short int RAM_DATA[BUFFERSIZE];
protected:
	DECLARE_EVENT_TABLE()
};
