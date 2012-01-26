#ifndef DSP_FIN_PROCESS_WAVEFORM_H
#define DSP_FIN_PROCESS_WAVEFORM_H
#include <complex.h>
#include "../EBIUSystemServicesBF561/system.h"

#define NRANSI				
#define delay_min (3)
#define delay_max (9)
#define integral__log_base_2_factor (4)
#define x2__log_base_2_factor (9)

#define lower_bound_on_a (1)
#define lower_bound_on_b (2)
#define lower_bound_on_c (3)
#define lower_bound_on_e (5)
#define padding_fudge (1)

#define waveformNormal		1
#define	waveformUnNormal	2

#define transmitBuf_overflow	2

/*
	if use_partial_sums is defined, this is the log (base 2) of the number of
	samples that are accumulated in each partial sum
	number_of_terms_in_each_partial_sum
	= 2^log_base_2_of_number_of_terms_in_each_partial_sum
*/
#define log_base_2_of_number_of_terms_in_each_partial_sum (4)
#define number_of_terms_in_each_partial_sum (1<<log_base_2_of_number_of_terms_in_each_partial_sum)
#define number_of_partial_sums (N>>log_base_2_of_number_of_terms_in_each_partial_sum)

#define MAXIMUM_VALUE (4096)
#define MAX_WAVEFORM_AMPLITUDE	500    //the value is different for each board.
#define MAX_USHORT_VAL	32000   //16bits unsigned short is from -32768 to 32768, choose 32000 for not cause overflow

/* TEST SECTION DATA */
#define SCALE_IN
#define N_FFT      64
#define N_ITER     60

#define log_base_2_of_filter_divisor (4)
#define half_of_log_base_2_of_filter_divisor (log_base_2_of_filter_divisor>>1)

/*
	we have to make sure that pedestal subtraction always leaves the result in
	the range of a positive integer between 0 and 2^(# of bits of adc) or bad
	things might happen to the values using the builtin fft_fract16 functions,
	among other things
*/

#define log_base_2_of_the_ratio_of_a_maximum_fract16_value_to_a_maximum_adc_value (15-12)
/*
	a fract16 is just a 15 bit integer plus sign bit, interpreted as a fraction
	(so 0x7fff is slightly less than one and 0x8001 is slightly more negative
	than zero)
	there's a factor of 2^15 hanging around, so if you use a built-in function
	to multiply two, it will have that factor between it and one you would
	calculate yourself naively assuming they're just plain integers
	(fract16xfract16 returns a number that fits in a fract16, whereas u16xu16
	only fits in a u32)
	as long as the input array is positive 12 bit AtoD values, the fract16
	versions of the rfft and ifft functions should work without modification of
	the input array before processing
	HOWEVER - multiplying by log_2(15-12) might lead to less truncation
	THEN AGAIN - the fft dynamic/fixed scaling might overflow if each is maximized
	beforehand
	but that's >>3 and block_exponent correction might be as high as <<6
	so still might truncate
*/

//#define number_of_terms_in_each_partial_sum (1<<log_base_2_of_number_of_terms_in_each_partial_sum)
//#define number_of_partial_sums (N>>log_base_2_of_number_of_terms_in_each_partial_sum)
extern unsigned short int waveform0[N];
extern unsigned short int noise;

//inline void ad_fft_init(void)  __attribute__((always_inline));

struct processWvfData {
	unsigned short int a;
	unsigned short int b;
	unsigned short int c; // waveform's maximum point 
	unsigned short int d;
	unsigned short int e;
	unsigned short int cj;  //partial section with extreme partial sum. number 1, 2, 3, or 4 
	unsigned short int halfMagnitudeIndex;  //The position of this index point is rignt below the half of the max magnitude  
	unsigned short int averageValBeforeA;   // average waveform[] value from "min" point to "a" point 
	signed long int extreme_value;			// for positive or negative value
	unsigned long int extreme_value_partial_sum;  //max partial sum 
	unsigned long int partial_sum[number_of_partial_sums];
	unsigned long int sum;
	unsigned short int trigPoint_X2;
	unsigned long int waveformTrigTime_X2;   // Another way to find trig time 
	signed_accumulated_value integral;
	unsigned short int trigPoint;
	signed short waveformTrigTime;
	unsigned short int status;				//0= normal,  1= error in averageManitudeBefore_a
	};
	
struct processWvfData wvfData, *procWvfDataPtr;

struct DMA1_1_transmitData {
	unsigned short cur_tx_buf_num;
	unsigned short valid_tx_buf_num;
	unsigned short buffer_wrapAround_times;  /* all buffers are filled and record time */
	bool DMA1_1_onUse;
	bool DMA1_1_pause;
};

struct DMA1_1_transmitData chan1_transmitData;

enum STATE 
	 {
	 	subtractPedestral=1,
	 	timeBase,
	 	realFFT,
	 	filterProc,			  /* filter process  */
	 	inverseFFT,
	 	calIntermediaData,
	 	integration,
//      extremeValueAndSum,
//      extremeValue,
//      indexOfThreshholdCrossing,
//      limitsFitWindow,
//      calculateAverage,
        pulseLeadingEdge,
        transmitToFPGA,
        processDone=0xFF
        
	 }procState;     /* process state */ 
	 
 enum indexCross
	{
		OutLowBound =1,
		OutHighBound,
		WithinBound
	}indexCrossThreshHold;	
 

complex_fract16 out_r[N], out_i[N], twiddle[N/2];
fract16 in[N], pwr_out[N], ifft_out[N];
int block_exponent_rfft, block_exponent_ifft;

complex_fract16    out_r[N_FFT], out_i[N_FFT], twiddle[N_FFT/2], out[N];
fract16 in_1[N_FFT], in_2[N_FFT], out_w[N_FFT];
fract16 mag[N_FFT];
int be_r, be_i;

#ifdef DEBUG_INFO
signed short int residuals_FFT[N]; 
fract16 residuals_inScale[N];
//unsigned short int draw_abcd[N];
signed short int residuals_splint[N];

unsigned short int waveform_raw[N];

#endif /*DEBUG_INFO */

unsigned long int number_of_untransmitted_waveforms;


void output_augmented_original_waveform(unsigned short int *waveform, index i_smallest, unsigned_single_value average, index i_crossing, index i_threshold, index i_first_in_window, index i_last_in_window);

void process_waveform(unsigned short int *waveform);
void fixed_point_fit_data_to_straight_line(index number_of_points);
//inline void fixed_point_fit_data_to_straight_line(index number_of_points);
//void subtract_pedestals(unsigned short int *waveform, unsigned short int *pedestals);

#endif

