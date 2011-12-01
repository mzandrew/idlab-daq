`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 		IDLab
// Engineer: 		Lili Zhang
// Create Date:    09:32:15 10/19/2011    
// Module Name:    dsp_reset 
// Project Name:   DSP_cPCI_revB DSP booting 
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////

module dsp_reset	
(
   // input  wire dsp_clockin,  //input from an external clock
	 input DSP_CLKIN,    //input clock from dcm clock2
	 input LOCKED_IN,
 
    output reg DSP0_RESET,
    output reg DSP1_RESET,
    output reg xDSP_RESET,  //for testing
	 input DSP_PLL_BYPASS,
	 output reg dsp_reset_button
	
    );
 
	 parameter RESET_BUTTON_IDLE = 15;        //15 clocks -- DSP_CLKIN
	 parameter RESET_BUTTON_PUSHED = 45;      //push button for 30 cycle
	 parameter RESET_CLOCK_CYCLE = 11;		   //see data book
	 parameter PLL_RESET_CLOCK_CYCLE = 2000;	//see data book
	 parameter INIT_STATE = 8'hFF;
	
	
	reg[7:0]  i;
	reg[7:0]  j= INIT_STATE;
	reg reset_pushed_flag = 2'hFF;
	reg[11:0]  count= RESET_CLOCK_CYCLE;
	
	
	always @(posedge DSP_CLKIN)
	  begin
				if(!LOCKED_IN)
					begin
						if(j== INIT_STATE)
							begin
								DSP0_RESET <= 1'b1;  //RESET = 1
								DSP1_RESET <= 1'b1;  //RESET = 1
								xDSP_RESET <= 1'b1;  //not used now, set to 1
								j = 0;
								//init count
								if(DSP_PLL_BYPASS & ~dsp_reset_button)  //make sure only reset signal is off,then acount sets again.
										count = RESET_CLOCK_CYCLE;
								else
									count = RESET_CLOCK_CYCLE + PLL_RESET_CLOCK_CYCLE;						
							end
						else if(j<RESET_BUTTON_IDLE)
							begin
								dsp_reset_button <= 1'b0;   //set low for 15 clock cycles
								j<=j+1;
							end
						else if (j>=RESET_BUTTON_IDLE & j<RESET_BUTTON_PUSHED)
							begin
								dsp_reset_button <= 1'b1;		//reset button is pressed
								j<=RESET_BUTTON_PUSHED;
								//reset_pushed_flag <= 1'b1;						
							end
						
					
						//after reset button is pressed, reset signal is asserted
						else if(dsp_reset_button && count > 0)
							begin
								DSP0_RESET <= 1'b0;  //RESET = 0
								DSP1_RESET <= 1'b0;  //RESET = 0
								xDSP_RESET <= 1'b0;
								//counting down the clock cycle
								count <= count - 1;
							 end
					
						else if(count == 0)		
							begin
								dsp_reset_button <=1'b0;   //release reset button
								DSP0_RESET <= 1'b1;  //RESET = 1  reset is done
								DSP1_RESET <= 1'b1;  //RESET = 1
								xDSP_RESET <= 1'b1;  //not used now, set to 1
							end
						else
							j= INIT_STATE;   //if jump to here, must be an error, reset again
										
					 
				end
				
		end	
endmodule
