///////////////////////////////////////////////////////////////////  
//						USB tester
//						¯¯¯¯¯¯¯¯¯¯
//TESTING ONE, TWO, THREE.
///////////////////////////////////////////////////////////////////  

#include "base.h"
#include "fstream.h"
#include "iostream.h"
#include "defs.h"
#include "stdio.h"
#include "math.h"

unsigned short buffer[BUFFERSIZE];//readout buffer


IMPLEMENT_APP(TestApp)
///////////////////////////////////////////////////////////////////  
//ID's or identifiers for events where 'about' is set to be the #1 for compatibility reasons.
enum{
ID_About=1,
ID_Quit,
ID_Commandline
};
///////////////////////////////////////////////////////////////////  
//Another magic macro for our convenience.
//This table links system events to specific methods. AFAIK, that is.
BEGIN_EVENT_TABLE(MainWND,wxFrame)
	EVT_MENU(ID_Quit,MainWND::OnQuit)
	EVT_MENU(ID_About,MainWND::OnAbout)
	EVT_TEXT_ENTER(ID_Commandline, MainWND::OnEnter)
END_EVENT_TABLE()
///////////////////////////////////////////////////////////////////  
//This function is called when the program is started
bool TestApp::OnInit()
{
	MainWND *frame = new MainWND("USB tester", wxPoint(300,160), wxSize(600,400));

	frame->Show(true);
	SetTopWindow(frame);
	
	return true;
}
///////////////////////////////////////////////////////////////////  
//Main window constructor. Sets the apearance of main window (frame) and
//creates everything that is needed to make the window appear as if it was a competent
//windows application.
MainWND::MainWND(const wxString title, const wxPoint& pos, const wxSize& size):
wxFrame((wxFrame*)NULL,-1,title,pos,size,wxDEFAULT_FRAME_STYLE)
{					
	TextFrame = new wxTextCtrl(this,-1,"",		//This your standard read-only textfield.
	wxDefaultPosition,wxDefaultSize,wxTE_MULTILINE|wxTE_READONLY);
    Commandline = new wxTextCtrl(this,ID_Commandline,"",wxDefaultPosition,wxDefaultSize,wxTE_PROCESS_ENTER);
    BaseSizer = new wxBoxSizer(wxVERTICAL);
    BaseSizer->Add(TextFrame,1,wxEXPAND,0);
    BaseSizer->Add(Commandline,0,wxEXPAND,0);
    this->SetSizer(BaseSizer);
    Commandline->SetFocus();
	// This section of the code generates the menus and the menubar of the app window.
	wxMenuBar *menubar = new wxMenuBar;		//Menubar is connected to handle smaller menus
											//that are to be declared on the following lines.
	wxMenu *file = new wxMenu;				//This is the 'File' menu.
	wxMenu *about = new wxMenu;				//...'About' menu
	//Following 5 lines add some content to those menus and link them to events.
	//Notice the use of ID's. If they are matched right there should be no problems.
	about->Append(ID_About,"&About","About this program");
	file->Append(ID_Quit,"&Quit","Quit this application");
	//Add the smaller menus to the menubar.
	menubar->Append(file,"&File");
	menubar->Append(about,"&About");
	SetMenuBar(menubar);	//Finally show the result.
	// This is where the menu section pretty much ends.
	CreateStatusBar();									//Create...yes.
    GoodData = false;
    lastGoodData = new unsigned short[BUFFERSIZE];
    GEN_RAM_DATA();
	set_register_bank_address(0);
	set_ram_read_mode(2);
	set_ram_write_mode(2);
}
///////////////////////////////////////////////////////////////////  
void MainWND::OnQuit(wxCommandEvent& WXUNUSED(event))
{
	Close(true);				//Close the program...goes to the destructor of MainWND where
								//there are some surprises for curious people.
}
///////////////////////////////////////////////////////////////////  
void MainWND::OnAbout(wxCommandEvent& WXUNUSED(event))
{
	wxMessageBox("USB tester application.\n - The year was 2009 - ","USB tester");
}
///////////////////////////////////////////////////////////////////  
void MainWND::OnEnter(wxCommandEvent &event)
{
//    bool loop_check;
    if(Commandline->GetValue()== wxT("read")) {
			Clear_terminal(); SOFT_TRIG(); wxYield(); Read(true); wxYield();
    } else if(Commandline->GetValue() == wxT("write0")) {
        Clear_terminal(); LOAD_RAM_DATA(0); LOAD_PATTERN(); SOFT_TRIG(); wxYield();
    } else if(Commandline->GetValue() == wxT("write1")) {
        Clear_terminal(); LOAD_RAM_DATA(1); LOAD_PATTERN(); SOFT_TRIG(); wxYield();
    } else if(Commandline->GetValue() == wxT("write2")) {
        Clear_terminal(); LOAD_RAM_DATA(2); LOAD_PATTERN(); SOFT_TRIG(); wxYield();
    } else if(Commandline->GetValue() == wxT("write3")) {
        Clear_terminal(); LOAD_RAM_DATA(3); LOAD_PATTERN(); SOFT_TRIG(); wxYield();
    } else if(Commandline->GetValue() == wxT("write4")) {
        Clear_terminal(); LOAD_RAM_DATA(4); LOAD_PATTERN(); SOFT_TRIG(); wxYield();
    } else if(Commandline->GetValue() == wxT("write5")) {
        Clear_terminal(); LOAD_RAM_DATA(5); LOAD_PATTERN(); SOFT_TRIG(); wxYield();
    } else if(Commandline->GetValue() == wxT("write6")) {
        Clear_terminal(); LOAD_RAM_DATA(6); LOAD_PATTERN(); SOFT_TRIG(); wxYield();
    } else if(Commandline->GetValue() == wxT("write7")) {
        Clear_terminal(); LOAD_RAM_DATA(7); LOAD_PATTERN(); SOFT_TRIG(); wxYield();
    } else if(Commandline->GetValue() == wxT("write8")) {
        Clear_terminal(); LOAD_RAM_DATA(8); LOAD_PATTERN(); SOFT_TRIG(); wxYield();
    } else if(Commandline->GetValue() == wxT("write9")) {
        Clear_terminal(); LOAD_RAM_DATA(9); LOAD_PATTERN(); SOFT_TRIG(); wxYield();
    } else if(Commandline->GetValue() == wxT("trig")) {
		SOFT_TRIG(); TextFrame->AppendText(wxString::Format(wxT("sending software trigger...\n"))); wxYield();
    } else if(Commandline->GetValue() == wxT("bank0")) {
		set_register_bank_address(0); TextFrame->AppendText(wxString::Format(wxT("setting register bank address to 0...\n"))); wxYield();
    } else if(Commandline->GetValue() == wxT("bank1")) {
		set_register_bank_address(1); TextFrame->AppendText(wxString::Format(wxT("setting register bank address to 1...\n"))); wxYield();
    } else if(Commandline->GetValue() == wxT("bank2")) {
		set_register_bank_address(2); TextFrame->AppendText(wxString::Format(wxT("setting register bank address to 2...\n"))); wxYield();
    } else if(Commandline->GetValue() == wxT("bank3")) {
		set_register_bank_address(3); TextFrame->AppendText(wxString::Format(wxT("setting register bank address to 3...\n"))); wxYield();
    } else if(Commandline->GetValue() == wxT("writemode0")) {
		set_ram_write_mode(0); TextFrame->AppendText(wxString::Format(wxT("setting ram write mode to 0...\n"))); wxYield();
    } else if(Commandline->GetValue() == wxT("writemode1")) {
		set_ram_write_mode(1); TextFrame->AppendText(wxString::Format(wxT("setting ram write mode to 1...\n"))); wxYield();
    } else if(Commandline->GetValue() == wxT("writemode2")) {
		set_ram_write_mode(2); TextFrame->AppendText(wxString::Format(wxT("setting ram write mode to 2...\n"))); wxYield();
    } else if(Commandline->GetValue() == wxT("writemode3")) {
		set_ram_write_mode(3); TextFrame->AppendText(wxString::Format(wxT("setting ram write mode to 3...\n"))); wxYield();
    } else if(Commandline->GetValue() == wxT("readmode0")) {
		set_ram_read_mode(0); TextFrame->AppendText(wxString::Format(wxT("setting ram read mode to 0...\n"))); wxYield();
    } else if(Commandline->GetValue() == wxT("readmode1")) {
		set_ram_read_mode(1); TextFrame->AppendText(wxString::Format(wxT("setting ram read mode to 1...\n"))); wxYield();
    } else if(Commandline->GetValue() == wxT("readmode2")) {
		set_ram_read_mode(2); TextFrame->AppendText(wxString::Format(wxT("setting ram read mode to 2...\n"))); wxYield();
    } else if(Commandline->GetValue() == wxT("readmode3")) {
		set_ram_read_mode(3); TextFrame->AppendText(wxString::Format(wxT("setting ram read mode to 3...\n"))); wxYield();
    } else if(Commandline->GetValue() == wxT("trigger0")) {
		trigger_fiber_transfer(1); TextFrame->AppendText(wxString::Format(wxT("triggering fiber channel 0...\n"))); wxYield();
    } else if(Commandline->GetValue() == wxT("trigger1")) {
		trigger_fiber_transfer(2); TextFrame->AppendText(wxString::Format(wxT("triggering fiber channel 1...\n"))); wxYield();
    } else if(Commandline->GetValue() == wxT("trigger2")) {
		trigger_fiber_transfer(4); TextFrame->AppendText(wxString::Format(wxT("triggering fiber channel 2...\n"))); wxYield();
    } else if(Commandline->GetValue() == wxT("trigger3")) {
		trigger_fiber_transfer(8); TextFrame->AppendText(wxString::Format(wxT("triggering fiber channel 3...\n"))); wxYield();
    } else if(Commandline->GetValue() == wxT("run")) {
		TextFrame->AppendText(wxString::Format(wxT("running...\n"))); wxYield();
		set_ram_read_mode(2);
		set_ram_write_mode(2);
		wxYield();
		LOAD_RAM_DATA(6); LOAD_PATTERN(); SOFT_TRIG();
		trigger_chipscope();
		wxYield();
		set_ram_read_mode(1);
		set_ram_write_mode(0);
		wxYield();
//		trigger_fiber_transfer(8);
//		trigger_fiber_transfer(1);
		trigger_fiber_transfer(4);
//		trigger_fiber_transfer(0); // turn it back off
		wxYield();
		set_ram_read_mode(2);
		set_ram_write_mode(2);
		wxYield();
		SOFT_TRIG(); wxYield(); Read(true);
		wxYield();
		TextFrame->AppendText(wxString::Format(wxT("done\n"))); wxYield();
    } else {
        Send();
	}
}
///////////////////////////////////////////////////////////////////
void MainWND::LOAD_PATTERN(void)
{
    unsigned int W_ADDR=0,ADC0,ADC1;
    unsigned int i;
//    unsigned short int trailing_value = 399;

    TextFrame->AppendText(wxString::Format(wxT("Loading...   ")));
    W_EN(true);
    wxYield();
    TextFrame->AppendText(wxString::Format(wxT("Sending...   ")));
    /*
      for(i=0; i<6; i++) {
        WADDR(W_ADDR);
        WRITE_RAM(trailing_value, trailing_value);
        W_STRB();
        W_ADDR++;
      }
      */
//    for(j=0; j<8; j++) {
//        for(i=0; i<512; i++) {
        for(i=0; i<samples_per_waveform; i+=4) {
//     for(i=0;i<128; i++){
//      for(j=0;j<64; j+=2){  
//        W_ADDR = 128*i + j;
//        if (i==0) {
//            ADC0 = trailing_value;
//        } else {
            ADC0 = RAM_DATA[i+0];
//        }
        ADC1 = RAM_DATA[i+1];
//        ADC1 = 0xfff;
//        ADC1 = 0xfff;
//        ADC0 = RAM_DATA[i][j];
//        ADC1 = RAM_DATA[i][j + 1];
        //TextFrame->AppendText(wxString::Format(wxT("LOADING: %d of 128 and %d of 32\n"),i,j));
//        TextFrame->AppendText(wxString::Format(wxT("[%03d, %03d, %04d] ADC0 = %04d, ADC1 = %04d\n"),i,j,W_ADDR,ADC0,ADC1));
        WADDR(W_ADDR);
        WRITE_RAM(ADC0,ADC1);
//        WRITE_RAM(ADC1,ADC0);
        W_STRB();
        W_ADDR++;
        // - - - - - - - - - - - - -
        ADC0 = RAM_DATA[i+2];
        ADC1 = RAM_DATA[i+3];
//        ADC0 = 0xfff;
//        ADC1 = 0xfff;
//        TextFrame->AppendText(wxString::Format(wxT("[%03d, %03d, %04d] ADC0 = %04d, ADC1 = %04d\n"),i,j,W_ADDR,ADC0,ADC1));
        WADDR(W_ADDR);
        WRITE_RAM(ADC0,ADC1);
//        WRITE_RAM(ADC1,ADC0);
        W_STRB();
        W_ADDR++;
        // - - - - - - - - - - - - -
      }
//      TextFrame->AppendText(wxString::Format(wxT("%d\n"), i));
/*
      for(i=0; i<samples_per_waveform; i+=4) {
        WADDR(W_ADDR);
        WRITE_RAM(trailing_value, trailing_value);
        W_STRB();
        W_ADDR++;
        // - - - - - - - - - - - - -
        WADDR(W_ADDR);
        WRITE_RAM(trailing_value, trailing_value);
        W_STRB();
        W_ADDR++;
      }
//      TextFrame->AppendText(wxString::Format(wxT("%d\n"), i));
//      TextFrame->AppendText(wxString::Format(wxT("%03d\n"),j));
//    }
*/
    wxYield();
    TextFrame->AppendText(wxString::Format(wxT("Done!!!\n")));
    W_EN(false);
    //TX_LENGTH(4099);
//    TX_LENGTH(8192);
}
///////////////////////////////////////////////////////////////////
void MainWND::LOAD_RAM_DATA(unsigned short int waveform_number)
{
    unsigned int i,smpl;
    ifstream LOAD_DATA;
    char filename[512];
    sprintf(filename, "waveform%d", waveform_number);
//    sprintf(filename, "../../../waveform/waveform-generator/generated/waveform%d", waveform_number);
//    LOAD_DATA.open ("RAM_DATA.txt");
    LOAD_DATA.open(filename);
    if (LOAD_DATA.is_open()) {
    //        short int a = 6;
    //        for (a=2; a<6; a++) {
    //      for(i=0; i<512; i++) {
          for(i=0; i<samples_per_waveform; i++) {
    /*
            if (i==0) { b = 10;
                for (; i<b; i++) {
                    RAM_DATA[i] = 0xfff;
                }
            }
    */
    //    for(i=0;i<128; i++){
    //      for(j=0;j<64; j++){
            LOAD_DATA >> smpl;
    //        RAM_DATA[i][j] = smpl;
            RAM_DATA[i] = smpl;
            /*
                if ((i-b)%a==0 ) { RAM_DATA[i] = 0x635; }
                if ((i-b)%a==1 ) { RAM_DATA[i] = 0x555; }
                if ((i-b)%a==2 ) { RAM_DATA[i] = 1; }
                if ((i-b)%a==3 ) { RAM_DATA[i] = 129; }
                if ((i-b)%a==4 ) { RAM_DATA[i] = 257; }
                if ((i-b)%a==5 ) { RAM_DATA[i] = 0xfff; }
                if ((i-b)%a==6 ) { RAM_DATA[i] = 0xfff; }
                if ((i-b)%a==7 ) { RAM_DATA[i] = 0x635; }
                if ((i-b)%a==8 ) { RAM_DATA[i] = 0x555; }
                if ((i-b)%a==9 ) { RAM_DATA[i] = 1; }
                if ((i-b)%a==10) { RAM_DATA[i] = 129; }
                if ((i-b)%a==11) { RAM_DATA[i] = 257; }
                if ((i-b)%a==12) { RAM_DATA[i] = 0xfff; }
                if ((i-b)%a==13) { RAM_DATA[i] = 0xfff; }
                if ((i-b)>=5*a) { RAM_DATA[i] = 0xfff; }
    //        RAM_DATA[i] = i%4==0?0x635:0x555;
            */
            //TextFrame->AppendText(wxString::Format(wxT("RAM_DATA[i][j] %d\n"),smpl));
    //      }
        }
    //    for (j=0; j<512; j++) {
    //        RAM_DATA[j] = 1650;
    //    }
        /*
        unsigned short int temp;
        for (i=0; i<512/2; i++) {
            temp = RAM_DATA[i];
            RAM_DATA[i] = RAM_DATA[i+1];
            RAM_DATA[i+1] = temp;
        }
        */
    //        }
        TextFrame->AppendText(wxString::Format(wxT("read %d values from file \"%s\"\n"),i, filename));
        LOAD_DATA.close();
    } else {
        TextFrame->AppendText(wxString::Format(wxT("\n\nERROR:  could not read file \"%s\"!!!\n\n\n"), filename));
    }
}
///////////////////////////////////////////////////////////////////
void MainWND::GEN_RAM_DATA(void)
{
    unsigned int i;
    ofstream LOAD_DATA;
    LOAD_DATA.open ("RAM_DATA.txt");
    
      for(i=0; i<samples_per_waveform; i++) {
//    for(i=0;i<128; i++){
//      for(j=0;j<64; j++){
//        LOAD_DATA << (64*i + j) << "\n";
//        LOAD_DATA << (j) << "\n";
//        k=128*i+j;
//        l=k%256+128;
//        l=k%512;
        LOAD_DATA 
        << (0x635) << " "
        << (0x635) << " "
        << (0x555) << " "
        << (0x555) << " "
        << (1) << " " 
        << (129) << " "
        << (129) << " "
        << (257) << " "
        << (257) << " "
        << (257) << " " 
        << (129) << " "
        << (129) << " "
        << (1) << " " 
        << (0x555) << " "
        << (0x555) << " "
        << (0x635) << " "  
        << "\n";
//        LOAD_DATA << (1) << "\n";
//        LOAD_DATA << (129) << "\n";
//        LOAD_DATA << (257) << "\n";

//        LOAD_DATA << (l) << "\n";
//        LOAD_DATA << (l) << "\n";

//        LOAD_DATA << (0x001) << "\n";
//        LOAD_DATA << (0x000) << "\n";
//        LOAD_DATA << (0x002) << "\n";
//      }
    }
    LOAD_DATA.close();
}
///////////////////////////////////////////////////////////////////  
void MainWND::Send(void)
{
    wxString temp;
	char *temp2;
	int i;
	unsigned long tempdata;
    unsigned int ManualData = 0;
    bool Send = false;
	temp = Commandline->GetValue().Lower();
	temp2 = (char*)temp.c_str();
	//Go through the character array to snoop about for characters other than digits and letters
	//from 'A' to 'F' (upper and lower case). We want to use hexadecimal values.
    for(i=0;i<(int)temp.Len();i++)
	{   
		if( ( (temp2[i] < '0') || (temp2[i] > '9') ) &&
		    ( (temp2[i] < 'a') || (temp2[i] > 'f') )
           )
		{
			wxMessageBox(wxT("Invalid input"),wxT("¡Erreur!"));
			Commandline->Clear();
			return;	
		}
	}
	//Empty textfield will yield a message stating that there's nothing to read.
	if(temp == wxT(""))
	{
		wxMessageBox(wxT("The field is empty."),wxT("Note"));
	}
	else	//Display the data that's to be sent.
	{
		temp.ToULong(&tempdata,16);		//Read the hex value from "temp" string buffer.
		ManualData = (unsigned int) tempdata;
        TextFrame->AppendText(wxString::Format(wxT("Sending 0x%x...\n"),ManualData));
        //Commandline->Clear();
        Send = true;
	}
    //Attempt to send raw data to the board.
    stdUSB out;
	if(Send == true)
	{
        if(out.createHandles() == stdUSB::SUCCEED)
        {
        	try
        	{
                out.sendData( ManualData );
                out.freeHandles();        
            }
            catch(...)
            {
                wxMessageBox(wxT("Could not send data."),wxT("USB Error"));    
                out.freeHandles();   
            }
        }
        else
            TextFrame->AppendText(wxT("Please connect the board.\n"));
    }
}
///////////////////////////////////////////////////////////////////  
void MainWND::Read(bool ENABLE_TXT)
{
    ofstream myfile2;
    stdUSB in;
    int i;
	unsigned short buffer[BUFFERSIZE];
	memset(buffer,0x0,BUFFERSIZE*sizeof(unsigned short));
	int samples;
	DWORD dw;
	GoodData = true;
	if(in.createHandles() == stdUSB::SUCCEED){
		try {
            in.readData(buffer, BUFFERSIZE, &samples);
				tempStr = wxString::Format(wxT("\n"));
				if(samples > samples_per_waveform){
//					tempStr = wxString::Format(wxT("Samples read = %d\n"), samples);
					samples = samples_per_waveform;
//				} else {
				}
//            if(samples >= BUFFERSIZE){
                for(i=0;i<samples;i++){
                    lastGoodData[i] = buffer[i];
                }
//            }
//            else
//                GoodData = false;
            myfile2.open ("temp.txt",ios::trunc);
				for(i=0;i<samples;i++){
					myfile2<<buffer[i]<<" \n";
					if ((i>1) && (i%16==0)) { tempStr += tempStr.Format(wxT("\n")); }
					tempStr += tempStr.Format(wxT("%03X, "), buffer[i]);
				}
            myfile2.close();
           	tempStr += "\n";
           	if(ENABLE_TXT != false)
            {
                TextFrame->AppendText(tempStr);
            }
            in.freeHandles();
		}
		catch (DWORD dw){
			TextFrame->AppendText(wxString::Format(wxT("Errorcode %d\n"), (int) dw));
		}
		catch(...){
			TextFrame->AppendText(wxT("Exception...probably a connection related issue.\n"));
		}
    }
    else
         TextFrame->AppendText(wxT("Please connect the board.\n"));
}
///////////////////////////////////////////////////////////////////
void MainWND::Clear(void) {
    TextFrame->Clear();//clears terminal
    Commandline->Clear();//clears Commandline
}
///////////////////////////////////////////////////////////////////
void MainWND::Clear_terminal(void) {
//    TextFrame->Clear();//clears terminal
}
///////////////////////////////////////////////////////////////////
void MainWND::send_command(unsigned short int command) {
	command &= 0xff;
	stdUSB in; in.createHandles();
	in.sendData((unsigned int) (command));
	in.freeHandles();
}
///////////////////////////////////////////////////////////////////
void MainWND::send_command_with_16_bit_data(unsigned short int command, unsigned short int data) {
	command &= 0xff;
	data &= 0xffff;
	stdUSB in; in.createHandles();
	in.sendData((unsigned int) ((data<<16) | command));
	in.freeHandles();
}
///////////////////////////////////////////////////////////////////
void MainWND::send_command_with_24_bit_data(unsigned short int command, unsigned long int data) {
	command &= 0xff;
	data &= 0xffffff;
	stdUSB in; in.createHandles();
	in.sendData((unsigned int) ((data<<8) | command));
	in.freeHandles();
}
///////////////////////////////////////////////////////////////////
/*
void MainWND::USB_SYNC(bool ENABLE) {
    stdUSB in; in.createHandles();
    if(ENABLE != false) { in.sendData((unsigned int)0x00010001);   // enable USB_SYNC
    } else {              in.sendData((unsigned int)0x00000001); } // disable USB_SYNC
    in.freeHandles();
}
*/
///////////////////////////////////////////////////////////////////
void MainWND::SOFT_TRIG(void) {
	send_command(0x02); //software trigger
}
///////////////////////////////////////////////////////////////////
void MainWND::W_EN(bool ENABLE) {
	if(ENABLE) {
//		send_command_with_16_bit_data(0x03, 0x01);
//		send_command_with_16_bit_data(0x03, 0x02);
		send_command_with_16_bit_data(0x03, 0x04);
//		send_command_with_16_bit_data(0x03, 0x08);
	} else {
		send_command_with_16_bit_data(0x03, 0x00); // disable W_EN
	}
}
///////////////////////////////////////////////////////////////////
void MainWND::WADDR(unsigned int W_ADDR) {
	send_command_with_16_bit_data(0x04, W_ADDR);
}
///////////////////////////////////////////////////////////////////
void MainWND::WRITE_RAM(unsigned int ADC0, unsigned int ADC1) {
	send_command_with_24_bit_data(0x05, (ADC0 << 12) | (ADC1));
}
///////////////////////////////////////////////////////////////////
void MainWND::W_STRB(void) {
//	send_command_with_16_bit_data(0x06, 0x0001);
//	send_command_with_16_bit_data(0x06, 0x0002);
	send_command_with_16_bit_data(0x06, 0x0004);
//	send_command_with_16_bit_data(0x06, 0x0008);
}
///////////////////////////////////////////////////////////////////
void MainWND::TX_LENGTH(unsigned int LENGTH) {
	send_command_with_16_bit_data(0x07, LENGTH);
}
///////////////////////////////////////////////////////////////////
void MainWND::set_register_bank_address(unsigned short int bank) {
	send_command_with_16_bit_data(0x08, bank);
}
///////////////////////////////////////////////////////////////////
void MainWND::set_ram_read_mode(unsigned short int mode) {
	send_command_with_16_bit_data(0x09, mode);
}
///////////////////////////////////////////////////////////////////
void MainWND::set_ram_write_mode(unsigned short int mode) {
	send_command_with_16_bit_data(0x0a, mode);
}
///////////////////////////////////////////////////////////////////
void MainWND::trigger_fiber_transfer(unsigned short int channels) {
	send_command_with_16_bit_data(0x0b, channels);
}
///////////////////////////////////////////////////////////////////
void MainWND::trigger_chipscope(void) {
	send_command(0x0c);
}
///////////////////////////////////////////////////////////////////
