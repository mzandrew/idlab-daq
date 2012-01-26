


#include <cdefBF561.h>
#include <ccblkfn.h>
#include <filter.h>
#include <complex.h>
#include <math.h>
#include <math_const.h>
#include <cycle_count.h>
#include "generic.h"
#include "dsp-fin-options.h"
#include "dsp-fin-process-waveform.h"
#include "../EBIUSystemServicesBF561/CoreA/SL10.h"
#include "../EBIUSystemServicesBF561/CoreA/testWaveforms.h"
#include "debug.h"
#include <stdio.h>
#include "numerical-recipes-in-c/nr.h"
#include "dma.h"


	       
unsigned short int delay = delay_min;

// one of 512 for this BLAB3 channel:
unsigned short int ASIC_0113_pedestal[N] = {
	4, 5, 6, 7, 8, 4, 5, 6, 7, 8, 4, 5, 6, 7, 8, 4,
	5, 6, 7, 8, 4, 5, 6, 7, 8, 4, 5, 6, 7, 8, 4, 5,
	6, 7, 8, 4, 5, 6, 7, 8, 4, 5, 6, 7, 8, 4, 5, 6,
	7, 8, 4, 5, 6, 7, 8, 4, 5, 6, 7, 8, 4, 5, 6, 7
};

// in picoseconds
signed short int ASIC_0113_delta_t[N] = {
	-30, +4, +10, -15, +20, -11, +7, -30, +4, +10, -15, +20, -11, +7, -30, +4,
	+10, -15, +20, -11, +7, -30, +4, +10, -15, +20, -11, +7, -30, +4, +10, -15,
	+20, -11, +7, -30, +4, +10, -15, +20, -11, +7, -30, +4, +10, -15, +20, -11,
	+7, -30, +4, +10, -15, +20, -11, +7, -30, +4, +10, -15, +20, -11, +7, +5
};

signed short int filter[N] = {
	16, 16, 16, 16, 16,	16, 15, 14, 13, 12, 11, 10,  9,  8,  7,  6,
	 5,  4,  3,  2,  1,  0,  0, -1, -2, -2, -1,  0,  0,  1,  2,  3,
	 4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15, 16, 16, 16, 16,
	16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16
//	16, 15, 14, 13, 12, 11, 10,  9,  9, 10, 11, 12, 13, 14, 15, 16,
};

/*
	maybe define this as filter_original or filter_float and then generate integer
	filter on startup
float filter[2*N] = {
	1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
	0.9, 0.8, 0.7, 0.6, 0.5, 0.4, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9,
	1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
	1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
	1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
	1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,

	1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
	1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
	1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
	1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
	0.9, 0.8, 0.7, 0.6, 0.5, 0.4, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9,
	1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0
};
*/


/* fract16 sig[60][N]= {
#include "waveforms.dat"
};
*/

_Pragma("interrupt") void transmitted_waveform_to_FPGA_through_DMA_PPI1_ISR (void) 
{
 #ifdef  DEBUG_INFO	
		printf("\n----jump into DMA1_1 interrrupt!----\n");
 #endif  /*DEBUG_INFO */
		disable_timer10();
		disable_ppi_transfers_via_ppi1_to_fpga();
 		//disable_timer10();
 		chan1_transmitData.DMA1_1_pause = true;
		acknowledge_interrupt_for_completion_of_waveform_transfer_from_ppi1_to_fpga();
 		*pIMASK &= ~(1<<9);
 		//disable_dma_transfers_from_ppi1_to_fpga();
 		
 	
	if (chan1_transmitData.valid_tx_buf_num >= chan1_transmitData.cur_tx_buf_num || 
 	    (chan1_transmitData.buffer_wrapAround_times >= 1  &&
 	    chan1_transmitData.valid_tx_buf_num < chan1_transmitData.cur_tx_buf_num  ))
 	 { 		
 		chan1_transmitData.cur_tx_buf_num ++;
 		if (chan1_transmitData.cur_tx_buf_num == number_of_blocks)
 			{
 				//reset buffer to 0
 				chan1_transmitData.cur_tx_buf_num = 0;
 				chan1_transmitData.buffer_wrapAround_times--;
 			}
 	
 	 }
 	 	*pDMA1_1_START_ADDR = buffer1[chan1_transmitData.cur_tx_buf_num];
 	 //	chan1_transmitData.DMA1_1_pause = true;

 	 //	enable_dma_transfers_from_ppi1_to_fpga();  /* enable DMA again */
 	 
 	 
 	 
 	 //	enable_ppi_transfers_via_ppi1_to_fpga();
 	 	
 /* 	
 	 else 
 	    {
 	    	// no data is to transfer.  set flag back and wait data to come. 
 			//chan1_transmitData.DMA1_1_onUse = false;
 			acknowledge_interrupt_for_completion_of_waveform_transfer_from_ppi1_to_fpga();
 			*pIMASK &= ~(1<<9);
 			disable_dma_transfers_from_ppi1_to_fpga();
			chan1_transmitData.cur_tx_buf_num++; //current buffer is transmitting 
			
			//setup_dma_transfers_from_ppi1_to_fpga(chan1_transmitData.cur_tx_buf_num);
			*pDMA1_1_START_ADDR = buffer1[chan1_transmitData.cur_tx_buf_num];
			//enable_dma_transfers_from_ppi1_to_fpga();
				    	
		}
*/
		
}

/*******************************************************************************
*   Function  void ad_fft_init()
*	 input
*	 output
*	 Date:
*********************************************************************************/

void ad_fft_init(void) {
	
	unsigned int i;
	twidfftrad2_fr16(twiddle, N);
}







/*******************************************************************************
*   Function  void ad_fft()
*	 input: Pointer to the waveform buffer
*	 output: 
*	 Date:   03/15/2011
*    Author: Lili Zhang
*    Description: Process FFT and iFFT algorithm.
*********************************************************************************/
//void ad_fft(unsigned short int *waveformToFFT) { // 7.73us for 64 samples

inline void ad_fft(unsigned short int *waveformToFFT) {
 
	int i;
	unsigned short rfft_multiply_num; 
	
#ifdef	DEBUG_INFO
	//Measure the cycle counts for precessing data
	cycle_t start_count=0x0;
	cycle_t final_count=0x0;
#endif
		//There is an issue with input signal. The input value is too small.
		//solution for this board: multiple some numbers to make signal big and not overflow	
		rfft_multiply_num = MAX_USHORT_VAL/MAX_WAVEFORM_AMPLITUDE;		
		for(i=0; i<N; i++){
			in[i] = rfft_multiply_num * waveformToFFT[i];
		
		}


#ifdef DEBUG_INFO
	START_CYCLE_COUNT(start_count);
#endif	
	rfft_fr16( in, out_r, twiddle, 1, N, &block_exponent_rfft, 2); // 3.2us for 64 samples
#ifdef DEBUG_INFO
	STOP_CYCLE_COUNT(final_count, start_count);
	PRINT_CYCLES("Number of cycles for rfft: ", final_count);
#endif

#ifdef   DEBUG_INFO 
		//calculate the magnitude 
		fft_magnitude_fr16 (out_r, pwr_out, N, block_exponent_rfft, 1 /*1=rfft used, 0=cfft used*/);
#endif

#ifdef DEBUG_INFO
	START_CYCLE_COUNT(start_count);
#endif	
	ifft_fr16(out_r, out_i, twiddle, 1, N, &block_exponent_ifft, 2); // 3.52us for 64 samples
#ifdef DEBUG_INFO
	STOP_CYCLE_COUNT(final_count, start_count);
	PRINT_CYCLES("Number of cycles for ifft: ", final_count);
#endif
		
	//Display waveform after ifft
		
	for(i=0; i<N; i++) {
		#ifdef  DEBUG_INFO
			ifft_out[i] = out_i[i].re << (block_exponent_rfft + block_exponent_ifft - 6);
			//compare in big scaler
			residuals_inScale[i] = in[i] - ifft_out[i];
			ifft_out[i] /= rfft_multiply_num;
			//compare in regular 
			residuals_FFT[i] = waveformToFFT[i] - ifft_out[i]  ; 
		#endif
			waveformToFFT[i] = out_i[i].re << (block_exponent_rfft + block_exponent_ifft - 6); 
			//divided rfft_multiply_num 
			waveformToFFT[i] /= rfft_multiply_num; 
			
			}
	
			
}


/*************************************************************************************
*   Function  subtract_pedestral()
*	 input
*	 output
*	 Date:
**************************************************************************************/
//void subtract_pedestral(unsigned short int *waveform)
inline void subtract_pedestral(unsigned short int *waveform)

{
	unsigned short int i;
	unsigned short int *pedestal = ASIC_0113_pedestal; // 32768
	for(i=0; i<N; i++)
	{
		waveform[i] -= pedestal[i];    /* first waveform */
		waveform[i+N] -= pedestal[i];  /* second waveform */
	#ifdef DEBUG_INFO
		waveform_raw[i] = waveform[i]; /* for debuging*/ 
	#endif  

	}
	
	return;
}	


/*************************************************************************************
*   Function  fpp_begin()
*	 input
*	 output
*	 Date:
*	description:  starting derivative of waveform
**************************************************************************************/
//float fpp_begin(unsigned short int *waveform){
inline float fpp_begin(unsigned short int *waveform){
	
	float k;
	k = (float)(waveform[1]-waveform[0]) / sampling_period_in_picoseconds;
	return  k;
}


/*************************************************************************************
*   Function  fpp_end()
*	 input
*	 output
*	 Date:
*	description:  ending derivative of waveform
**************************************************************************************/
//float fpp_end(unsigned short int *waveform){
inline float fpp_end(unsigned short int *waveform){
	float k;
	k = (float)(waveform[N-1] - waveform[N-2])/sampling_period_in_picoseconds;
	return  k;
}



/*************************************************************************************
*   Function  cal_timeBase()
*	 input
*	 output
*	 Date:
*
**************************************************************************************/
//void  cal_timeBase(unsigned short int* waveform)
inline void  cal_timeBase(unsigned short int* waveform)

{
	//add function here	
	unsigned short i;
	float x, y, yp1, ypn;
	float xa[N];
	float ya[N];
	float y2a[N];
	int n = N;
	
	//set value
	for (i=0; i<N; i++){
		//xap[i] calculated real time to sample the data
		xa[i] = sampling_period_in_picoseconds * i +ASIC_0113_delta_t[i];
	 #ifdef DEBUG_INFO
		x_t[i] = (unsigned short int)xa[i]; 
	 #endif
		ya[i] = waveform[i];
	}
	
	//set deriviation for first point and last point
	yp1 = fpp_begin(waveform);
	ypn = fpp_end(waveform);
		
	// call spline to get second derivatives
	 /*
     * Since the Numerical Recipes function assumes
     * that arrays are 1-based, adjust the pointer
     * values accordingly
     * see 3.3 cubic spline interplation page 115
     */
     
	 spline(xa-1, ya-1, n, yp1, ypn, y2a);
	  
	 for(i=0; i<N; i++){
	 	x = sampling_period_in_picoseconds * i ;
	 #ifdef DEBUG_INFO
	 	x_T[i] = (unsigned short int) x;
	 #endif
	 	splint(xa-1, ya-1, y2a, n, x, &y);
	 #ifdef DEBUG_INFO
	 	residuals_splint[i] = (unsigned short) y - waveform[i];
	 #endif
	 	waveform[i] = (unsigned short) y;
	#ifdef DEBUG_INFO
	 	waveform_split[i] = (unsigned short) y;
	#endif
	 } 
		
	
	return;
}


/*************************************************************************************
*   Function  implement_fft()
*	 input
*	 output
*	 Date:
*	 description;  this function is only to test the feature
**************************************************************************************/
void implement_fft(void)
{

	int  j, k, i;


   // Iterate through the different wave forms
   for (j = 0; j < 60; j++)
   {
        printf("=== Sample (%02d) ===\n", j);

#if defined(SCALE_IN)
       // Option to scale the input values
       for (k = 0; k < N_FFT; k++) { in_1[k] = testWaveform[j][k] * 320; }  
#else
       for (k = 0; k < N_FFT; k++) { in_1[k] = testWaveform[j][k]; }
#endif

       rfft_fr16 (in_1, out_r, twiddle, 1, N_FFT, &be_r, 2); 

       fft_magnitude_fr16 (out_r, mag, N_FFT, be_r, 1);
 
       ifft_fr16 (out_r, out_i, twiddle, 1, N_FFT, &be_i, 2);
       
 #if defined(SCALE_IN)
       // data in buffer in_2 should match data in buffer real (out_i)
       for (k = 0; k < N_FFT; k++) { in_2[k] = in_1[k] >> (be_r + be_i - 6); }

       //less accurate, data in out_w should match those in buffer in:  
       for (k = 0; k < N_FFT; k++) { out_w[k] = out_i[k].re << (be_r + be_i - 6); }
#else
       // data in buffer out_w should match data in buffer in)
       for (k = 0; k < N_FFT; k++) { out_w[k] = out_i[k].re >> (6 - be_r - be_i); }

       //less accurate, data in in_2 should match those in buffer real (out_i):
       //for (k = 0; k < N_FFT; k++) { in_2[k] = in_1[k] << (6 - be_r - be_i); }
#endif

       printf("block exponent (rfft) = %d, block exponent (ifft) = %d\n", 
                be_r, be_i); 
       
       for(i=0; i<N_FFT; i++){
          ifft_out[i] = out_i[i].re;
       }
       printf("=== Sample (%02d) ===\n", j);

   }
	return;
}

/*************************************************************************************
*   Function  init_processWvfData()
*	 input
*	 output  find a point with a max magnitude in a given waveform
*			 find a max partial sum and max partial num. 
*	 Date:
**************************************************************************************/
//void init_processWvfData(void){
inline void init_processWvfData(void){
	int i;
	procWvfDataPtr = &wvfData;
	procWvfDataPtr->a = 0;  // "a" point on a waveform
	procWvfDataPtr->b = 0;  // "b" point on a waveform is on the right side of "a"
	procWvfDataPtr->c = 0;  // Point with max magnitude on waveform
	procWvfDataPtr->d = 0;  // point on the right side of c
	procWvfDataPtr->e = 0;  // point is on the right side of "d"   
	procWvfDataPtr->cj = 0; // a section that has max sum
	procWvfDataPtr->halfMagnitudeIndex = 0;
	procWvfDataPtr->extreme_value = 0;
	procWvfDataPtr->extreme_value_partial_sum = 0;
	procWvfDataPtr->sum = 0;
	procWvfDataPtr->averageValBeforeA = 0;
	procWvfDataPtr->trigPoint_X2 = 0;
	procWvfDataPtr->waveformTrigTime_X2 = 0;
	procWvfDataPtr->integral = 0;
	procWvfDataPtr-> trigPoint = 0;
	procWvfDataPtr->waveformTrigTime = 0;
	procWvfDataPtr->status = 0;
	
	for (i=0; i<number_of_partial_sums; i++){
		procWvfDataPtr->partial_sum[i] = 0;
	}
}

/*************************************************************************************
*   Function  find_extremeValue()
*	 input
*	 output  find a point with a max magnitude in a given waveform
*			 find a max partial sum and max partial num. 
*	 Date:
**************************************************************************************/
//void find_extremeValue(unsigned short int* waveform, struct processWvfData *ptr)
inline void find_extremeValue(unsigned short int* waveform, struct processWvfData *ptr)

{
	// mim, a, b, c, e are the point on the waveform from left to rignt 
	// 64 cell waveform  can be divided to four section. Partial sum is coresponding to sum for each section 
    // c is the point of max, cj is a critical partial section 
	unsigned short int i, j, k;  
	unsigned long int temporary_partial_sum;
	/* init */	
	ptr->c = 0;
	ptr->cj = 0;
	ptr->sum = 0;

	#ifdef positive_pulse
		ptr->extreme_value = 0;
	#else
		ptr->extreme_value = 0; 
		ptr->extreme_value--;   /* set to 0xFFFF */
	#endif
	#ifndef actually_search_for_extreme_value
		#ifdef positive_pulse
			ptr->extreme_value_partial_sum = 0;
		#else
			ptr->extreme_value_partial_sum = 0; 
			ptr->extreme_value_partial_sum--;
		#endif  /* positive_pulse */
		
	#endif   /*actually_search_for_extreme_value */ 
	
	i = min;  /* start from min point, the left one, assume is 0 */ 
	for (j=0; j<number_of_partial_sums; j++) {
		temporary_partial_sum = 0;
		for (k=0; k<number_of_terms_in_each_partial_sum; k++) {
		
			#ifdef actually_search_for_extreme_value
				#ifdef positive_pulse
					if (waveform[i]>ptr->extreme_value) {
						 ptr->extreme_value = waveform[i]; 
						 ptr->c = i; 
						 }
				#else
					if (waveform[i]<ptr->extreme_value) { 
						ptr->extreme_value = waveform[i]; 
						ptr->c = i; 
						}
				#endif
			#endif
			temporary_partial_sum += waveform[i];;
			i++;
		}   /* end k loop */
		ptr->sum += temporary_partial_sum;
		ptr->partial_sum[j] = temporary_partial_sum;
		#ifndef actually_search_for_extreme_value
			#ifdef positive_pulse
				if (temporary_partial_sum>extreme_value_partial_sum) { 
					ptr->extreme_value_partial_sum = temporary_partial_sum; 
					ptr->cj = j; 
					}
			#else
				if (temporary_partial_sum<extreme_value_partial_sum) { 
					ptr->extreme_value_partial_sum = temporary_partial_sum; 
					ptr->cj = j; 
					}
				//	old version	if (temporary_partial_sum<partial_sum[cj]) { cj = j; }
			#endif
		#endif
	}  /* end of j loop */
	/********************** this section is not clear to me, need to figure it out *************************/
	#ifndef actually_search_for_extreme_value
			
		j = ptr->cj;
		if (ptr->cj>0) { j--; }
		k = ptr->cj;
		if (ptr->cj<number_of_partial_sums-1) { k++; }
		if (ptr->cj<number_of_partial_sums-1) { k++; }
		j *= number_of_terms_in_each_partial_sum;
		k *= number_of_terms_in_each_partial_sum;
		j += min;
		k += min;
		for (i=j; i<k; i++) {
			
			if (waveform[i]<ptr->extreme_value) { ptr->extreme_value = waveform[i]; ptr->c = i; }
		}
			
   	#endif
   	
   	return;  	
	
}

/*************************************************************************************
*   Function  find_indexCrossThreshHold()
*	 input
*	 output
*	 Date:
*	Description:  
**************************************************************************************/
//void find_indexCrossThreshHold(unsigned short int *waveform, struct processWvfData* ptr)
inline void find_indexCrossThreshHold(unsigned short int *waveform, struct processWvfData* ptr)

{
 
		unsigned short int maxBound;
		unsigned short int position, first,difference, target, i;
		
		position=0;
		difference = 0;
		
		if((ptr->c)<lower_bound_on_c)
			position = OutLowBound;
		else if(ptr->c>= max)
		    position = OutHighBound;
		else
		    position = WithinBound;
		
		switch(position){
			
			case  OutLowBound:
				  printf(" Max magnitude is smaller than low boundary!\n");
				  break;
				  
			case  OutHighBound:
				  printf(" Max magnitude is smaller than low boundary!\n");
				  break;
				
			case  WithinBound:
					first = waveform[min];		/* think again here ?????? */
					// the following distinction is not necessary if the calculations are actually done with signed numbers:
					#ifdef positive_pulse
					difference = ptr->extreme_value - first;
					target = ptr->extreme_value - (difference>>1);  /* difference divided 2  */
					#else
					difference = first - ptr->extreme_value;
					target = ptr->extreme_value + (difference>>1);
					#endif
					// bug/future:  the c-2 thing is a big problem if there really are only two points in the fit window
					for (i=(ptr->c-1); i!=min; i--) { // doesn't matter if it's at i==min, because that's unphysical
					#ifdef positive_pulse
						if (waveform[i]<target) { 
							break; 
							}
					#else
						if (waveform[i]>target) { 
							break; 
							}
					#endif
					}
					ptr->halfMagnitudeIndex = i;
					break;
				  
			default:  
				    printf("Out of Boundary! check out the waveform!");
					break;				  
		  }
		  
		  return;	
}

/*************************************************************************************
*   Function  find_waveformTrigTime()
*	 input
*	 output
*	 Date:
*	Description:  
**************************************************************************************/
//void find_waveformTrigTime(unsigned short int *waveform, struct processWvfData* ptr)
inline void find_waveformTrigTime(unsigned short int *waveform, struct processWvfData* ptr)
{
 
		unsigned short int maxBound;
		unsigned short int position, target,first, i;
		unsigned short int difference; 
		unsigned long int y0, y1, y2;
		float  t0,t1, t2;
		unsigned short int temp1, temp2, temp3, temp4;
		
		
		position=0;
		difference = 0;
		
		if((ptr->c)<lower_bound_on_c)
			position = OutLowBound;
		else if(ptr->c>= max)
		    position = OutHighBound;
		else
		    position = WithinBound;
		
		switch(position){
			
			case  OutLowBound:
				  ptr->waveformTrigTime = 0xFFFF;    // indicate the time is not able to get
				  printf(" Max magnitude is smaller than low boundary! Can't find trig time.\n");
				  break;
				  
			case  OutHighBound:
				  ptr->waveformTrigTime = 0xFFFF;    // indicate the time is not able to get
				  printf(" Max magnitude is smaller than low boundary! Can't find trig time.\n");
				  break;
				
			case  WithinBound:
					first = waveform[min];		/* think again here ?????? */
					// the following distinction is not necessary if the calculations are actually done with signed numbers:
					#ifdef positive_pulse
					difference = ptr->extreme_value - first;  // 100%
					temp1 = difference >> 1;   //50% of difference
					temp2 = temp1 >> 1;       //25% of difference
					temp3 = temp2 >> 2;		  // 6.25% 
					difference = temp3 >>2;    //1.6%
					//target is at 100%-50%-25%-6.25% + 1.6% = 20.35%
					target = ptr->extreme_value - temp1 - temp2 - temp3 - difference;
				
					#else
					difference = first - ptr->extreme_value;
					temp1 = difference >> 1;   //50% of difference
					temp2 = temp1 >> 1;       //25% of difference
					temp3 = temp2 >> 2;		  // 6.25% 
					difference = temp3 >>2;    //1.6%
					//target is at 100%-50%-25%-6.25% + 1.6% = 20.35%
					target = ptr->extreme_value + temp1 + temp2 + temp3 + difference;
					#endif
					
					// bug/future:  the c-2 thing is a big problem if there really are only two points in the fit window
					for (i=ptr->c;  i!= min ; i--) { // doesn't matter if it's at i==min, because that's unphysical
					#ifdef positive_pulse
						if (waveform[i]<target) { 
							break; 
							}
					#else
						if (waveform[i]>target) { 
							break; 
							}
					#endif
					}
					 // find trigger time, here use liner algorithem
					 t0 = i* sampling_period_in_picoseconds; 
					 t1 = (i+1) * sampling_period_in_picoseconds;
					 y0 = waveform[i];
					 y1 = waveform [i+1];
					 y2 = target;
					 t2 = ((float)(y2-y0)/(float)(y1-y0)) * (t1-t0) + t0;
					 ptr->waveformTrigTime = t2;
					 ptr->trigPoint = i;
		  		
		  			//ptr->waveformTrigTime = i * sampling_period_in_picoseconds + sampling_period_in_picoseconds>>1;
					break;
				  
			default:  
				    printf("Out of Boundary! check out the waveform!");
					break;				  
		  }
		 
		  
		  return;	
}




/*************************************************************************************
*   Function  find_abdePoints()
*	 input
*	 output
*	 Date:
*	 Decscription: find other points (a, b, e ) on the waveform from point c
**************************************************************************************/
//void find_abdePoints(unsigned short int *waveform, struct processWvfData *ptr)
inline void find_abdePoints(unsigned short int *waveform, struct processWvfData *ptr)
{
		unsigned short int difference;
		//START_SECTION__determine_limits_of_integration_and_fit_window;
		// bug/future:  
		//if the slope is such that the [c-1]'th element is already above target, then this analysis will generate a t that is off by 2/(max-min) * the timing resolution of the sampling
		
		// find b
		ptr->b = ptr->halfMagnitudeIndex + 1; // this is wrong if there's only 2 points in the actual fit window (see bug/future just above)
		//if the slop is too steep, c might equal b. This can cause a=0. To fix it, do following.
		if(ptr->b == ptr->c){
			printf("b==c  check out  \n");
			ptr->b = ptr->halfMagnitudeIndex;
		}
			if ((ptr->b)<lower_bound_on_b || (ptr->b)>=max) {
			ptr->status = waveformUnNormal; 
			show_reason_for_aborting_analysis(3);
			printf(" The point b is out of boundary! Check out!\n ");
			 return; 
		} // analyse this one manually, please!
			
		difference = (ptr->c) - (ptr->b);
		if (difference<1) { 
			ptr->status = waveformUnNormal;
			show_reason_for_aborting_analysis(8);
			printf(" The point b is too close to c! Check out!\n "); 
			return; 
		} // analyse this one manually, please!
		
		// find a
		difference = 2*difference + padding_fudge;
		ptr->a = ptr->c - difference;
		if (ptr->a<lower_bound_on_a || ptr->a>=max) {
			ptr->status = waveformUnNormal;
			printf(" The point a is out of boundary! Check out!\n "); 
			show_reason_for_aborting_analysis(4); 
			return; 
		} // analyse this one manually, please!
		
		//find e
		ptr->e = ptr->c + 2 * difference;
		if (ptr->e<lower_bound_on_e || ptr->e>=max) {
			ptr->status = waveformUnNormal;
			printf(" The point e is out of boundary! Check out!\n "); 
			show_reason_for_aborting_analysis(5); 
			return; 
		} // analyse this one manually, please!
		
		if (ptr->a >= (ptr->b) || (ptr->a) >= ptr->c 
		|| (ptr->a) >= (ptr->e) || (ptr->b) >= (ptr->c) 
		|| (ptr->b) >= (ptr->e) || (ptr->c) >= (ptr->e)) {
			ptr->status = waveformUnNormal; 
			printf(" All points are not in the order position! Check out!\n "); 
			show_reason_for_aborting_analysis(6); 
			return; 
			} // analyse this one manually, please!
			
	ptr->status = waveformNormal;
	printf(" ----waveform is normal.---- \n ");
	//END_SECTION__determine_limits_of_integration_and_fit_window;
	return ;
}


/*************************************************************************************
*   Function  implement_filter()
*	 input
*	 output
*	 Date:
**************************************************************************************/
//void implement_filter(unsigned short int* waveform)
inline void implement_filter(unsigned short int* waveform)

{
	//add function here
	return;
}




/*************************************************************************************
*   Function  calAverageMagnitudeBefore_a()
*	 input
*	 output
*	 Date:
**************************************************************************************/
//void calAverageMagnitudeBefore_a(unsigned short int* waveform, struct processWvfData *ptr)
inline void calAverageMagnitudeBefore_a(unsigned short int* waveform, struct processWvfData *ptr)
{
	//add function here
		unsigned short int average_counter, average;
		unsigned short int i, k, j;
		START_SECTION__calculate_average_of_quiescent_part_of_waveform;
	#ifdef use_partial_sums
		average_counter = ((ptr->a) - min);// + (max - e - 1);
		//avoid exception 
		if (average_counter == 0){
			ptr->status = 1;   //indicate error
			printf("Error, average_counter is 0. Check out!");
			return;
		}
		average = 0;
		k = (average_counter>>log_base_2_of_number_of_terms_in_each_partial_sum) - 1;
		for (j=0; j<k; j++) {
			average += ptr->partial_sum[j];
		}
		for (i=min+k*number_of_terms_in_each_partial_sum; i<average_counter; i++) {
			average += waveform[i];
		}
	#else
		average_counter = (ptr->a - min);// + (max - e - 1);
		average = 0;
		for (i=a-1; i!=min; i--) {
			 average += waveform[i]; 
			} 
			average += waveform[min];
		//for (i=min; i<a;   i++) { average += waveform[i]; }
		//for (i=e+1; i<max; i++) { average += waveform[i]; }
	#endif
	average /= average_counter;
	ptr-> averageValBeforeA = average; 
	END_SECTION__calculate_average_of_quiescent_part_of_waveform;
	return;
}


	

/*************************************************************************************
*   Function  find_trigTimeInSimpleWay()
*	 input
*	 output
*	 Date:
*    Description: Another way to find trig time.
**************************************************************************************/
//void find_trigTimeInSimpleWay(unsigned short int* waveform, struct processWvfData *ptr)
inline void find_trigTimeInSimpleWay(unsigned short int* waveform, struct processWvfData *ptr)
{
	
	START_SECTION__determine_time_of_pulse_leading_edge;
	#ifdef point_slope
		index x0, x1, x2;
		signed_accumulated_value trigTime; // is (sampling_period_in_picoseconds) * (a fractional index) in point x2
		signed_single_value y0, y1, y2;  // Y2 is average magnitude before point a
		signed long int additional_time_offset_in_picoseconds = 0;	
		x1 = ptr->b;
		x0 = ptr->c;
		y0 = waveform[x0];
		y1 = waveform[x1];
		y2 = ptr->averageValBeforeA;
		/*  Lili did test, the result is same with shifting 8 bits to the left
		y0 = waveform[x0] << fixed_point_shift_by;  //by 8 - check if the shift is needed ???
		y1 = waveform[x1] << fixed_point_shift_by;
		y2 = (ptr->averageValBeforeA) << fixed_point_shift_by;
		*/
		if (y1==y0) {
			 y1 = y0 + (1<<fixed_point_shift_by); 
			 printf("point b and c have same value.\n ");
			} // just to prevent the divide by zero
		x2 = x0 - (x0-x1)* (unsigned short int)((y2-y0)/(y1-y0));
		trigTime = sampling_period_in_picoseconds*x2;
	#endif
	ptr->trigPoint_X2 = x2;	
	ptr->waveformTrigTime_X2 = trigTime;
	END_SECTION__determine_time_of_pulse_leading_edge;
	return;
}

/*************************************************************************************
*   Function  waveform_integration()
*	 input
*	 output
*	 Date:
**************************************************************************************/
//void waveform_integration(unsigned short int* waveform, struct processWvfData *ptr)
inline void waveform_integration(unsigned short int* waveform, struct processWvfData *ptr)

{
		//START_SECTION__calculate_integral;
		unsigned short int i;
		signed_accumulated_value integral1, integral2 = 0;
		signed short int *delta_t = ASIC_0113_delta_t;

		integral1 = ((ptr->e) - (ptr->a) + 1) * ptr->averageValBeforeA;
		integral1 *= sampling_period_in_picoseconds;
		
		// bug/future: check for overflow
		//integral1 >>= fixed_point_shift_by;
		#ifdef USE_TIMEBASED_INTEGRAL  
			for (i=(ptr->a); i<= (ptr->e); i++) {
				integral2 += waveform[i] * sampling_period_in_picoseconds;
			}
		

		#elif USE_DELTA_Ts_IN_INTEGRAL  
			for (i=(ptr->a); i<=(ptr->e); i++) {
		// bug/future:  check that this is close to an actual Riemann sum (not a left-centered version of that) 
				integral2 += waveform[i] * (delta_t[i] + sampling_period_in_picoseconds);  //why "-", change to "+" 
			}
		
		#else
		
			index m, n, o, p;
			m = ((ptr->a-min)>>log_base_2_of_number_of_terms_in_each_partial_sum) + 1;
			n = ((ptr->e-min)>>log_base_2_of_number_of_terms_in_each_partial_sum);
			o = min + number_of_terms_in_each_partial_sum*m;
			p = min + number_of_terms_in_each_partial_sum*n;
			for (i=ptr->a; i<o; i++) {
				integral2 -= waveform[i];
			}
			for (j=m; j<n; j++) {
				integral2 -= partial_sum[j];
			}
			for (i=p; i<=ptr->e; i++) {
				integral2 -= waveform[i];
			}
		#endif
		//check with mat or curtis about witch part is covered and desided  "+" or "-"
		ptr->integral = integral2 - integral1;  //check for positive or negative value and overflow
		//END_SECTION__calculate_integral;

  		return;	
}





/*************************************************************************************
*   Function  process_waveform()
*	 input
*	 output
*	 Date:
**************************************************************************************/

void process_waveform(unsigned short int *waveform) {
	
	unsigned short int i;
	unsigned short int *descriptorPtr = 0;
	unsigned short int waveformProcessState=0;
	static unsigned short int testWaveform_index=0;
	
	
	
	#ifdef FPGA_OFF  /* waveform comes from testWaveform array if data FPGA is not available */
		/* each time takes two waveforms into waveform_test[] and to match waveform_a[] or waveform_b[] */		
	 		
			for(i=0; i<N; i++){				
		   		waveform_buf[i] = testWaveform[testWaveform_index][i]; /* the first waveform */   
				//since we only use first 64 cell, the second 64 cell will be empty for now 
		   		//waveform_buf[i+N] = testWaveform[testWaveform_index + 1][i]; /* the second waveform */
		   			}
		   	
			    //testWaveform_index += 2; 
			    testWaveform_index ++;
			    printf("\n test waveform    %d    \n", testWaveform_index);
			    printf("*******************************\n");				
			if(testWaveform_index >= MAX_TESTWAVEFORM)
				testWaveform_index=0;	 			
	#endif
		   
	/*******************   Process starts here     ************************************/
	/**********************************************************************************/


	waveformProcessState=subtractPedestral;   /* first step in processing waveform */
	do{
		switch(waveformProcessState){
			case subtractPedestral:
				//call function to subtrackt pedestal
				#ifdef FPGA_OFF
					subtract_pedestral(waveform_buf);  /* from test waveforms */
				#else
					subtract_pedestral(waveform);      /* from FPGA waveform */
			#endif
				waveformProcessState++;
				break;
			case timeBase:
				//add function here
				#ifdef FPGA_OFF 
					cal_timeBase(waveform_buf);
				#else
					cal_timeBase(waveform);
				#endif //FPGA_OFF
				waveformProcessState++;
				break;
			
			case  realFFT:
				//ad_fft() includes rfft and ifft, it might need to seperate the process in future 
				#ifdef FPGA_OFF
					ad_fft(waveform_buf);
				#else
					ad_fft(waveform);
				#endif
				waveformProcessState++;
				break;
			
			case  filterProc:
				//function here 
				waveformProcessState++;
				break;
			
			case  inverseFFT:
				//function here. NOTE: It is included in "case realFFT" now.
				waveformProcessState++;
				break;
			
			case calIntermediaData:
				//function here.
				 init_processWvfData();
				 #ifdef FPGA_OFF
				 	find_extremeValue(waveform_buf, procWvfDataPtr);
				 	find_indexCrossThreshHold(waveform_buf,procWvfDataPtr);
				 	find_abdePoints(waveform_buf, procWvfDataPtr);
				 	waveformProcessState++;
				 		
				 #else
				 	find_extremeValue(wavefrom, procWvfDataPtr);
				 	find_indexCrossThreshHold(waveform, procWvfDataPtr);
				 	find_abdePoints(waveform, procWvfDataPtr);
				 	waveformProcessState++;

				 #endif
				 break;
				 	
			case  integration:
				//function here
				#ifdef FPGA_OFF
					calAverageMagnitudeBefore_a(waveform_buf, procWvfDataPtr);
					waveform_integration(waveform_buf, procWvfDataPtr);
				#else
					calAverageMagnitudeBefore_a(waveform, procWvfDataPtr);
					waveform_integration(waveform, procWvfDataPtr);
				#endif 
				waveformProcessState++;
				break;
				
			case  pulseLeadingEdge:
				//function here 
				//waveformProcessState++;
				#ifdef FPGA_OFF
					find_waveformTrigTime(waveform_buf, procWvfDataPtr);
					//From the testing, the following method does not work very acurately.
					//find_trigTimeInSimpleWay(waveform_buf, procWvfDataPtr);

				#else
					find_trigTimeInSimpleWay(waveform, procWvfDataptr);
					find_waveformTrigTime(waveform, procWvfDataPtr);
				#endif
				//waveformProcessState = processDone;
				waveformProcessState++;
				break;
				
			case transmitToFPGA:
			
				/***************************************************************************
				Prepare data into buffer1 (in SDRAM bank1) and tranfer to FPGA
				note:Use bank0 for now, since SDRAM address > 0x4000000 does not work properly
				****************************************************************************/
				#ifdef FPGA_OFF
					for (i=0; i<N; i++)
					{
						// pass waveform 
						buffer1[chan1_transmitData.valid_tx_buf_num][i] = waveform_buf[i];					
					}					
				#else
					for (i=0; i<N; i++)
					{
						//pass waveform  to buffer1 and ready to transfer
						buffer1[chan1_transmitData.valid_tx_buf_num][i] = waveform[i];				
					}
				#endif
				//copy trig time to the buffer for transfering
				buffer1[chan1_transmitData.valid_tx_buf_num][N] = procWvfDataPtr->waveformTrigTime;
			    
				/************************************************************
			      Calculate valid transmit buffer number
			     ************************************************************/	
				if (chan1_transmitData.valid_tx_buf_num == number_of_blocks - 1) {
					chan1_transmitData.buffer_wrapAround_times++;
					chan1_transmitData.valid_tx_buf_num = 0;
					if (chan1_transmitData.buffer_wrapAround_times >= transmitBuf_overflow)
						printf("Transmit buffer is overflow. DMA1 channel is transfering too slow! ");
				}
		
				else 
				   chan1_transmitData.valid_tx_buf_num ++;
						
				/********************************************************
				Enable Interrupt for dma transfering data from PPI1 to fpga 
				*********************************************************/
				if (chan1_transmitData.DMA1_1_onUse == false ) 
				{
					// very first time to enable DMA1_1
					chan1_transmitData.DMA1_1_onUse = true;
					enable_interrupts_for_dma_transfers_from_ppi1_to_fpga();
					
				}
				
				
				/*************************************************************************
				If DMA1_1 is in pause state, enable DMA1_1 and PPI1 again to tranmit data
				**************************************************************************/	
				if(chan1_transmitData.DMA1_1_pause == true){
					//note:  The sequence is very important. 
					enable_dma_transfers_from_ppi1_to_fpga();
					chan1_transmitData.DMA1_1_pause = false;
					enable_ppi_transfers_via_ppi1_to_fpga();
					enable_timer10();
							
					}
				waveformProcessState = processDone;
				break;
				
			
			
		   default:
			    printf("Precess loop error! \n");
			    //get out of the loop
			    waveformProcessState = processDone;
			    break;
		}	
					
	}while(waveformProcessState!=processDone);
		
	 show_a_waveform(waveform);
	
	return;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
}


/*************************************************************************************
*   Function  ad_fft_originalVersion()
*	 input
*	 output
*	 Date:
*    description:  this is the original version 
**************************************************************************************/

void ad_fft_originalVersion(void) { // 7.73us for 64 samples
	int block_exponent, i;
//	for (i=0; i<N; i++) {
//		in[i] <<= log_base_2_of_the_ratio_of_a_maximum_fract16_value_to_a_maximum_adc_value;
//	}
	START_SECTION__filter_input__rfft;
	rfft_fr16( in, out, twiddle, 1, N, &block_exponent, 0); // 2.24us for 64 samples
	END_SECTION__filter_input__rfft;
	index n = N>>1;
	START_SECTION__filter_input__multiply; // 1.72us for 64 samples
	for (i=0; i<n; i++) {
//		out[i].re = (fract16) (filter[  i] * out[i].re);
//		out[i].im = (fract16) (filter[2*i] * out[i].im);
// bug/future: this might still truncate or round off
//		if (block_exponent) {
//			out[i].re <<= block_exponent;
//			out[i].im <<= block_exponent;
//		}
		index j = N - 1 - i;
		signed short int f = filter[j];
		if (f) {
			out[i].im >>= half_of_log_base_2_of_filter_divisor;
			out[i].im *= f;
			out[i].im >>= half_of_log_base_2_of_filter_divisor;
			out[j].re >>= half_of_log_base_2_of_filter_divisor;
			out[j].re *= f;
			out[j].re >>= half_of_log_base_2_of_filter_divisor;
		}
		f = filter[i];
		if (f) {
			out[j].im >>= half_of_log_base_2_of_filter_divisor;
			out[j].im *= f;
			out[j].im >>= half_of_log_base_2_of_filter_divisor;
			out[i].re >>= half_of_log_base_2_of_filter_divisor;
			out[i].re *= f;
			out[i].re >>= half_of_log_base_2_of_filter_divisor;
		}
	}
	END_SECTION__filter_input__multiply;
	START_SECTION__filter_input__ifft;
	ifft_fr16(out_r, out, twiddle, 1, N, &block_exponent, 0); // 3.52us for 64 samples
	END_SECTION__filter_input__ifft;
	// this last part takes 250ns for 64 samples
//	for (i=0; i<N; i++) {
//		in[i] = out[i].re << (log_base_2_of_number_of_points_in_waveform - half_of_log_base_2_of_filter_divisor);
//		in[i] = out[i].re << - half_of_log_base_2_of_filter_divisor);
//	}
}



/*************************************************************************************
*   Function  process_waveform_originalVersion()
*	 input
*	 output
*	 Date:
*    description:  this is the original version 
**************************************************************************************/
void process_waveform_originalVersion(unsigned short int *waveform) {
		
#ifdef Mat_DEBUG_SECTION
	
	// single 12-bit values:
//	signed_single_value offset;
	unsigned_single_value first, extreme_value, target; // code relies on extreme_value being unsigned
	signed_single_value difference;
	unsigned_single_value value; // temporary
	// accumulation of multiple 12-bit values:
	signed_accumulated_value average; // is a sum first, then gets divided
	signed_accumulated_value x2; // is (sampling_period_in_picoseconds) * (a fractional index)
	unsigned_accumulated_value sum; // 512 * [(2^12)-1] ~2M, which is larger than 16 bits
	unsigned_accumulated_value partial_sum[number_of_partial_sums]; // depending on number of elements in each, might be possible to go to shorts for this
	unsigned_accumulated_value temporary_partial_sum;
	#ifndef actually_search_for_extreme_value
		unsigned_accumulated_value extreme_value_partial_sum; // code relies on extreme_value_partial_sum being unsigned
	#endif
	// indices or counters:
	index number_of_points;
	index average_counter;
	index a, b, c, e;
	index i, j, k;
	#ifndef actually_search_for_extreme_value
		index cj;
	#endif
	// results:
	signed_accumulated_value integral; // sum * sampling_period ~ 500M
	signed_accumulated_value t;
	/*
		presumably, there's some way to tell from which BLAB3 this waveform came
		from, given the data in the buffer outside the range [min,max)
		and/or whether it needs to worry about the pedestals not aligning with
		the waveform as given (if the fpga took two 64 sample windows and cut the
		ends off of them and merged them)
		and/or (also also wik wik) whether a 32768 sample pedestal array needs to
		be taken into account per BLAB3 channel, and what the offset is into that
		...
		this will be wasteful unless the waveform_a/waveform_b host function sets
		up and waits for another dma transfer of the relevant part of the blab3
		channel's pedestals to L1 memory
	*/
	signed long int additional_time_offset_in_picoseconds = 0;
	unsigned short int *pedestal = ASIC_0113_pedestal; // 32768
	signed short int *delta_t = ASIC_0113_delta_t; // 64


	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
		// this entire section is a fudge
		static unsigned short int sl10_index = 0;
		START_SECTION__fake_waveforms;

		show_a_waveform(waveform);

//		if (which==0) {
//			for (i=min; i<max; i++) {
//				waveform[i] = waveform0[i-min];
//			}
//		} else {
//			for (i=min; i<max; i++) {
//				waveform[i] = SL10[sl10_index][i-min];
//			}
//		}


		


		sl10_index++;
		if (sl10_index>=SL10_INDEX_MAX) {
			sl10_index = 0;
		}
		#ifdef FILTER_INPUT_IN_FREQUENCY_DOMAIN
			START_SECTION__filter_input;
				//original_realfft_test_function();
				ad_fft();
			END_SECTION__filter_input;
		#endif


		#ifdef ENABLE_SPLINING_FOR_CHI2_FITTING
			if (delta_t[0]<0) {
				/*
					ideally, this wouldn't need to be done or could be done somewhere
					else beforehand once per channel instead of once per waveform from
					that channel
				*/
				additional_time_offset_in_picoseconds = - delta_t[0];
				for (i=0; i<N; i++) {
					delta_t[i] += additional_time_offset_in_picoseconds;
				}
			}
		#endif
		END_SECTION__fake_waveforms;



	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	START_SECTION__analysis;
	
	
		
	
	START_SECTION__find_extreme_value_and_accumulate_sums;
	c = min;
	sum = 0;
	#ifdef positive_pulse
		extreme_value = 0;
	#else
		extreme_value = 0; 
		extreme_value--;   /* set to 0xFFFF */
	#endif
	#ifndef actually_search_for_extreme_value
		#ifdef positive_pulse
			extreme_value_partial_sum = 0;
		#else
			extreme_value_partial_sum = 0; extreme_value_partial_sum--;
		#endif
		cj = 0;
	#endif
	//goto done;
	i = min;
	for (j=0; j<number_of_partial_sums; j++) {
		temporary_partial_sum = 0;
		for (k=0; k<number_of_terms_in_each_partial_sum; k++) {
			#ifdef SUBTRACT_PEDESTALS
				waveform[i] -= pedestal[i-min];
			#endif
			value = waveform[i];
			#ifdef actually_search_for_extreme_value
				#ifdef positive_pulse
					if (value>extreme_value) { extreme_value = value; c = i; }
				#else
					if (value<extreme_value) { extreme_value = value; c = i; }
				#endif
			#endif
			temporary_partial_sum += value;
			i++;
		}
		sum += temporary_partial_sum;
		partial_sum[j] = temporary_partial_sum;
		#ifndef actually_search_for_extreme_value
			#ifdef positive_pulse
				if (temporary_partial_sum>extreme_value_partial_sum) { extreme_value_partial_sum = temporary_partial_sum; cj = j; }
			#else
				if (temporary_partial_sum<extreme_value_partial_sum) { extreme_value_partial_sum = temporary_partial_sum; cj = j; }
//	old version	if (temporary_partial_sum<partial_sum[cj]) { cj = j; }
			#endif
		#endif
	}
	END_SECTION__find_extreme_value_and_accumulate_sums;
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	#ifndef actually_search_for_extreme_value
			*pFIO0_FLAG_S = 1<<4;
		j = cj;
		if (cj>0) { j--; }
		k = cj;
		if (cj<number_of_partial_sums-1) { k++; }
		if (cj<number_of_partial_sums-1) { k++; }
		j *= number_of_terms_in_each_partial_sum;
		k *= number_of_terms_in_each_partial_sum;
		j += min;
		k += min;
		for (i=j; i<k; i++) {
			value = waveform[i];
			if (value<extreme_value) { extreme_value = value; c = i; }
		}
			*pFIO0_FLAG_C = 1<<4;
	#endif
	/*
		at this point, c is the index of the most extreme value in the waveform
	*/
//	unsigned short int mask;
//	unsigned short int q = min;
//	for (i=min; i<max; i++) {
//		mask = 0;
//		if (waveform[i]<waveform[c]) { mask |= 1<<6; c = i; }
//		if (waveform[i]<(waveform0[i]-noise-1)) { mask |= 1<<5; }
//		if (waveform[i]>(waveform0[i]+noise+1)) { mask |= 1<<5; }
//		if (waveform[i]>waveform[q]) { mask |= 1<<4; q = i; }
//		pulse_multiple(mask);
//		sum += waveform[i];
//	}
//	if (sum != waveform[checksum_32bit__offset]) { show_reason_for_aborting_analysis(1); goto done; }
//	return;
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
		/*
			this finds index in waveform where value is above threshold
		*/
	START_SECTION__find_index_of_threshold_crossing;
		if (c<lower_bound_on_c || c>=max) { show_reason_for_aborting_analysis(2); goto done; } // analyse this one manually, please!
		first = waveform[min];
		// the following distinction is not necessary if the calculations are actually done with signed numbers:
		#ifdef positive_pulse
			difference = extreme_value - first;
			target = extreme_value - (difference>>1);
		#else
			difference = first - extreme_value;
			target = extreme_value + (difference>>1);
		#endif
// bug/future:  the c-2 thing is a big problem if there really are only two points in the fit window
		for (i=c-2; i!=min; i--) { // doesn't matter if it's at i==min, because that's unphysical
			#ifdef positive_pulse
				if (waveform[i]<target) { break; }
			#else
				if (waveform[i]>target) { break; }
			#endif
		}
	END_SECTION__find_index_of_threshold_crossing;
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
		/*
			determine a, b and e from c and the index we just found above
		*/
	START_SECTION__determine_limits_of_integration_and_fit_window;
// bug/future:  if the slope is such that the [c-1]'th element is already above target, then this analysis will generate a t that is off by 2/(max-min) * the timing resolution of the sampling
		b = i + 1; // this is wrong if there's only 2 points in the actual fit window (see bug/future just above)
		if (b<lower_bound_on_b || b>=max) { show_reason_for_aborting_analysis(3); goto done; } // analyse this one manually, please!
		difference = c - b;
		if (difference<1) { show_reason_for_aborting_analysis(8); goto done; } // analyse this one manually, please!
		difference = 2*difference + padding_fudge;
		a = c - difference;
		if (a<lower_bound_on_a || a>=max) { show_reason_for_aborting_analysis(4); goto done; } // analyse this one manually, please!
		e = c + 2 * difference;
		if (e<lower_bound_on_e || e>=max) { show_reason_for_aborting_analysis(5); goto done; } // analyse this one manually, please!
		if (a>=b || a>=c || a>=e || b>=c || b>=e || c>=e) { show_reason_for_aborting_analysis(6); goto done; } // analyse this one manually, please!
	END_SECTION__determine_limits_of_integration_and_fit_window;
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	START_SECTION__calculate_average_of_quiescent_part_of_waveform;
	#ifdef use_partial_sums
		average_counter = (a - min);// + (max - e - 1);
		average = 0;
		k = (average_counter>>log_base_2_of_number_of_terms_in_each_partial_sum) - 1;
		for (j=0; j<k; j++) {
			average += partial_sum[j];
		}
		for (i=min+k*number_of_terms_in_each_partial_sum; i<average_counter; i++) {
			average += waveform[i];
		}
	#else
		average_counter = (a - min);// + (max - e - 1);
		average = 0;
		for (i=a-1; i!=min; i--) { average += waveform[i]; } average += waveform[min];
//		for (i=min; i<a;   i++) { average += waveform[i]; }
//		for (i=e+1; i<max; i++) { average += waveform[i]; }
	#endif
	average <<= fixed_point_shift_by;  // shift 8
	average /= average_counter;
	END_SECTION__calculate_average_of_quiescent_part_of_waveform;
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	{
//		offset = average >> fixed_point_shift_by;
	START_SECTION__determine_time_of_pulse_leading_edge;
	#ifdef point_slope
		index x0, x1;
		signed_single_value y0, y1, y2;
		x1 = b;
		x0 = c;
		y0 = waveform[x0] << fixed_point_shift_by;  //by 8
		y1 = waveform[x1] << fixed_point_shift_by;
		y2 = average; // >> fixed_point_shift_by;
		if (y1==y0) { y1 = y0 + (1<<fixed_point_shift_by); } // just to prevent the divide by zero
		x2 = sampling_period_in_picoseconds*x0 - (sampling_period_in_picoseconds*(x0-x1)*(y2-y0))/(y1-y0);
	#endif
	#ifdef chi_squared_least_squares_maximum_likelihood
		number_of_points = c - a + 1;
// bug/future:  the number here is kind of an artificial limit here (chosen because we want a, b and c to be distinct):
		if (number_of_points<2) { show_reason_for_aborting_analysis(7); goto done; }
		j = a;
		for (i=0; i<number_of_points; i++) {
//			pulse(4);
			y_fixed[i] = waveform[j];
			#ifdef ENABLE_SPLINING_FOR_CHI2_FITTING
				// can save this extra add if we assure the first element of the delta_t array is always zero
				x_fixed[i] = 250*i + delta_t[j];
			#endif
			j++;
//			y_floating[i] = (float) waveform[j++];
			// save time copying arrays by giving the function the first element of the array
			// that's part of the line - this currently takes 1.16us
		}
		// the following profile times are for 8 or 9 points
//		*pFIO0_FLAG_S = 1<<1;
//		fit_me(number_of_points, 0); // 55.0us optimized
//		*pFIO0_FLAG_C = 1<<1;
//		*pFIO0_FLAG_S = 1<<2;
//		fit_me(number_of_points, 1); // 32.3us optimized
//		*pFIO0_FLAG_C = 1<<2;
//		*pFIO0_FLAG_S = 1<<3;
		fit_me(number_of_points, 2); //  3.4us optimized
//		*pFIO0_FLAG_C = 1<<3;
//		#ifdef positive_pulse
//			x2 =   sampling_period_in_picoseconds * a_fixed;
//		#else
//		#endif
		x2 = - sampling_period_in_picoseconds * a_fixed;
		x2 /= b_fixed;
	#endif
	#ifdef ENABLE_SPLINING_FOR_CHI2_FITTING
		x2 -= additional_time_offset_in_picoseconds;
	#endif
	// x2 is in picoseconds
	}
	END_SECTION__determine_time_of_pulse_leading_edge;
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	{
	if (0) {
		*pFIO0_FLAG_S = 1<<4;
		integral = 0;
		for (i=a; i<=e; i++) {
			integral += (average>>fixed_point_shift_by) - waveform[i];
		}
		*pFIO0_FLAG_C = 1<<4;
	} else if (0) {
		*pFIO0_FLAG_S = 1<<5;
//		integral = (max-min) * offset;
//		integral -= sum;
		*pFIO0_FLAG_C = 1<<5;
	} else if (1) {
		START_SECTION__calculate_integral;
		signed_accumulated_value integral1, integral2 = 0;
		integral1 = e - a + 1;
		integral1 *= average;
		integral1 *= sampling_period_in_picoseconds;
// bug/future: check for overflow
		integral1 >>= fixed_point_shift_by;
		#ifdef USE_DELTA_Ts_IN_INTEGRAL
			for (i=a; i<=e; i++) {
// bug/future:  check that this is close to an actual Riemann sum (not a left-centered version of that) 
				integral2 -= waveform[i] * (delta_t[i] + sampling_period_in_picoseconds);
			}
		#else
			index m, n, o, p;
			m = ((a-min)>>log_base_2_of_number_of_terms_in_each_partial_sum) + 1;
			n = ((e-min)>>log_base_2_of_number_of_terms_in_each_partial_sum);
			o = min + number_of_terms_in_each_partial_sum*m;
			p = min + number_of_terms_in_each_partial_sum*n;
			for (i=a; i<o; i++) {
				integral2 -= waveform[i];
			}
			for (j=m; j<n; j++) {
				integral2 -= partial_sum[j];
			}
			for (i=p; i<=e; i++) {
				integral2 -= waveform[i];
			}
		#endif
		integral = integral1 + integral2;
		END_SECTION__calculate_integral;
	} else if (1) {
		*pFIO0_FLAG_S = 1<<3;
		signed_accumulated_value temp = 0;
		temp = average>>fixed_point_shift_by;
		temp *= (max-min);
		temp -= sum;
		integral = temp;
		*pFIO0_FLAG_C = 1<<3;
	}
	}
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
/*
		if (p>0) {
			output_pulses_proportional_to(3, p);
		} else if (n>0) {
			output_pulses_proportional_to(4, n);
		}
*/
		/*
	*/
//	integral = sum;
/*
	integral = 0;
	signed long int temp = 0;
//	*pFIO0_FLAG_S = 1<<6;
	for (i=min; i<max; i++) {
//		integral += average/25;
//		integral += average - waveform[i%379];
//		integral += waveform[i]/25;
		temp = average - waveform[i];
		if ((temp>>integral__log_base_2_factor)>0) {
			output_pulses_proportional_to(3, temp>>integral__log_base_2_factor);
		} else if (((-temp)>>integral__log_base_2_factor)>0) {
			output_pulses_proportional_to(4, (-temp)>>integral__log_base_2_factor);
		}
		integral += temp;
//		integral += average - waveform[i];
	}
*/
//	*pFIO0_FLAG_C = 1<<6;
/*
		{
		unsigned long int p = (  integral >>integral__log_base_2_factor);
		unsigned long int n = ((-integral)>>integral__log_base_2_factor);
		*pFIO0_FLAG_S = 1<<6;
		if (p>0) {
			output_pulses_proportional_to(3, p);
		} else if (n>0) {
			output_pulses_proportional_to(4, n);
		}
		*pFIO0_FLAG_C = 1<<6;
		}
*/
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//	for (i=0; i<N; i++) {
//		waveform[i] = 0;
//	}
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	END_SECTION__analysis;
	t = x2; // t is in picoseconds
	#ifdef show_results_on_oscilloscope_screen
//		output_pulse_duty_cycle_proportional_to(5, number_of_nops_per_microsecond, (integral/sampling_period_in_picoseconds)>>integral__log_base_2_factor);
//	#endif
//	#ifdef show_results_on_oscilloscope_screen
//		output_pulse_duty_cycle_proportional_to(6, number_of_nops_per_microsecond, x2>>x2__log_base_2_factor);
		{
			index i_crossing = (index) x2/sampling_period_in_picoseconds, i_threshold = b;
			output_augmented_original_waveform(waveform, c, (unsigned_single_value) (average>>fixed_point_shift_by), i_crossing, i_threshold, a, e);
		}
	#endif
//	integral *= sampling_period_in_picoseconds; // integral is now in lsb*picoseconds
	return;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
done:
//	delay+=2; if (delay>delay_max) { delay = delay_min; } *pPPI0_DELAY = delay; ssync();
	END_SECTION__analysis;
	
#endif   /* end Mat_DEBUG_SECTION*/
	return;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
}





/**********************************************************************************
***********************************************************************************
*   Function  output_augmented_original_waveform()
*	 input
*	 output
*	 Date:
************************************************************************************
************************************************************************************/

#define average_plus_or_minus_threshold (0.4)
void output_augmented_original_waveform(unsigned short int *waveform, index i_smallest, unsigned_single_value average, index i_crossing, index i_threshold, index i_first_in_window, index i_last_in_window) {
	index i;
	unsigned_single_value value, average_high = (unsigned_single_value) ((1.0 + average_plus_or_minus_threshold) * average), average_low = (unsigned_single_value) ((1.0 - average_plus_or_minus_threshold) * average);
	unsigned short int output = 0, mask = 0xfffd;
	*pFIO0_FLAG_C = mask;
	unsigned short int greater_than_average_low, less_than_average_high, exceptional_value;
	for (i=min; i<max; i++) {
//		output = 0;
		greater_than_average_low = 0;
		less_than_average_high = 0;
		value = waveform[i];
		output &= ~(1<<2);
		if (value>average_low ) { greater_than_average_low = 1; } else { exceptional_value = 1; }
		if (value<average_high) { less_than_average_high = 1;   } else { exceptional_value = 1; }
		if (greater_than_average_low & less_than_average_high)
		                           { output |= (1<<4);          output &= ~(1<<5); }
		                      else { output |= (1<<5);          output &= ~(1<<4); }
		if (i==i_first_in_window ) { output |= (1<<2); } else { output |= (1<<12); }
		if (i==i_crossing        ) { output |= (1<<3); } else { output &= ~(1<<3); }
		if (i==i_threshold       ) { output |= (1<<2); } else { output |= (1<<12); }
		if (i==i_smallest        ) { output |= (1<<6); } else { output &= ~(1<<6); }
		if (i==i_last_in_window  ) { output |= (1<<2); } else { output |= (1<<12); }
		*pFIO0_FLAG_C = mask;
		*pFIO0_FLAG_S = (output & mask);
	}
	*pFIO0_FLAG_C = mask;
}



/**********************************************************************************
************************************************************************************
*   Function  fixed_point_fit_data_to_straight_line()
*	 input
*	 output
*	 Date:
***********************************************************************************
************************************************************************************/

//inline void fixed_point_fit_data_to_straight_line(index number_of_points) {
void fixed_point_fit_data_to_straight_line(index number_of_points) {
	// fits data to a straight line y(x) = a + b*x
	START_SECTION__fit_data_to_straight_line;
	index i;
	unsigned_integer Sx = 0, Sy = 0, Stt = 0, S, Sx_S;
	signed_integer t, A, B = 0;
	/*	the following analysis is for 16 bit registers:
		Sx is the sum of the x[i]'s, so if they are n bits each, then number_of_points can only be 2^(16-n).
		For 1% delta-t'ing (making x[i]=100*i), n=6.64 and there can be 1571.8 data points.
		Sy is the sum of the y[i]'s, so if they are 12 bits each, there can only be 16 datapoints
		S is the number of datapoints, which can be 2^16
		t is the difference between each x[i] and the average of the x[i]'s
		Stt is the sum of the squares of the t's
	*/
	/*	an obvious optimization is to calculate the Sx term for each of the 512
		fixed waveform windows (64 samples each) for each BLAB3 channel, but
		this assumes a pulse will never come in on a window boundary, so might
		not be useful
	*/
	B = 0;
	for (i=0;i<number_of_points;i++) {
		Sx += x_fixed[i];
		Sy += y_fixed[i];
	}
	S=number_of_points;
	Sx_S=Sx/S;
	for (i=0;i<number_of_points;i++) {
		t=x_fixed[i]-Sx_S;
		Stt += t*t;
		B += t*y_fixed[i];
	}
	B /= Stt;
	A=(Sy-Sx*B)/S;
	a_fixed = A;
	b_fixed = B;
//	free_lvector(y,0,number_of_points-1);
//	free_lvector(x,0,number_of_points-1);
	END_SECTION__fit_data_to_straight_line;
}

/*
void subtract_pedestals(unsigned short int *waveform, unsigned short int *pedestals) {
	u32 i;
	//signed_single_value value;
	for (i=min; i<max; i++) {
		waveform[i] -= pedestals[i-min];
		//value = waveform[i] - pedestals[i];
		//waveform[i] = value;
	}
}
*/
