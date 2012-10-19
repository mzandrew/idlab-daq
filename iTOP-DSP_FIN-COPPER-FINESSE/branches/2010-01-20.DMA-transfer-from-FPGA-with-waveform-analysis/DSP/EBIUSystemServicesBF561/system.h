#ifndef system_h
#define system_h 1

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

#define iTOP
#define BLAB3

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

#ifdef iTOP
//	#define NUMBER_OF_CHANNELS_PER_FIBER (96)
	#define NUMBER_OF_CHANNELS_PER_FIBER (16)
	#define NUMBER_OF_CHANNELS_PER_CORE (NUMBER_OF_CHANNELS_PER_FIBER)
#endif

#ifdef BLAB3
	// for deep analog storage:
//	#define NUMBER_OF_SAMPLES_PER_ASIC_CHANNEL (32768)
	#define NUMBER_OF_SAMPLES_PER_ASIC_CHANNEL (512)
	// number read out at once (all wilkinsoned at once):
	#define LOG_BASE_2_OF_NUMBER_OF_SAMPLES_PER_WAVEFORM (6)
	#define NUMBER_OF_SAMPLES_PER_WAVEFORM (1<<LOG_BASE_2_OF_NUMBER_OF_SAMPLES_PER_WAVEFORM)
	// 250 ps for 4GHz:
	#define sampling_period_in_picoseconds (250)
#endif

// NN = the number of words to transfer to/from the FPGA
#define NN (128)
#define N (NUMBER_OF_SAMPLES_PER_WAVEFORM)
// (for i=min; i<max; i++) { ... }
#define min (0)
#define max (N-min)

#include "../src/dsp-fin-options.h"

//#define size_of_block (1<<log_base_2_of_number_of_points_in_waveform)

#include "../src/datatypes.h"

//#include <services/services.h> // u32 u16

//#define log_base_2_of_size_of_block (10)
//#define number_of_blocks (50000) // don't overflow 16 bits here
#define number_of_blocks (4) // don't overflow 16 bits here
#define UNPROCESSED_WAVEFORM_THRESHOLD ((3*number_of_blocks)/4) // don't make this the full size of the buffer, since a transfer may be happening when the dsp notices that the threshold has been crossed and the last transfer still has to finish at that point (testing shows that it goes up to threshold+2)

extern unsigned short int ASIC_pedestal[NUMBER_OF_CHANNELS_PER_CORE][NUMBER_OF_SAMPLES_PER_ASIC_CHANNEL];
extern signed short int ASIC_delta_t[NUMBER_OF_CHANNELS_PER_CORE][N];

extern unsigned short int pedestal_a[N];
extern unsigned short int pedestal_b[N];
extern unsigned short int delta_t_a[N];
extern unsigned short int delta_t_b[N];

extern unsigned short int waveform_a[NN];
extern unsigned short int waveform_b[NN];
//extern unsigned short int waveform_c[size_of_block];

//#define log_base_2_of_
#define fixed_point_shift_by (8)

extern unsigned long int number_of_unprocessed_waveforms;
extern unsigned short int waveform_transfers_from_fpga_are_allowed;
extern unsigned short int waveform_transfers_from_fpga_are_desired;
extern unsigned long int index_of_next_waveform_to_process;

void finished_another_waveform_transfer_from_fpga(void);
//EX_INTERRUPT_HANDLER(finished_getting_waveform_from_fpga_interrupt_service_routine);
_Pragma("interrupt") void finished_getting_waveform_from_fpga_interrupt_service_routine(void);

struct from_fpga_block_struct {
	u16 status; // status of THIS waveform
	u16 channel_number; // 16
	u32 event_number; // BELLE global event number or some sort of time
	u16 row; // target 8
	u16 column; // target 512 or 8*512
	u16 temperature; // 12bit
	u16 rovdd; // 12bit
	u16 ic_serial_number; // 4000
	// target:  1 hitbit per chip; 16 channel waveforms are sent and one must search through them to see which if any actually hit
	u16 scaler; // ?? number of hits on ic per some time interval
	u16 feedback; // ??
	u16 threshold; // 12bit
	u16 approximate_time_of_threshold_crossing; // taken from trigger subsystem
	u16 sample[64]; // TARGET
};

struct dma_descriptor_struct {
	unsigned short int lower_half_of_address_of_next_descriptor;
	unsigned short int upper_half_of_address_of_next_descriptor;
	unsigned short int lower_half_of_address_of_destination;
	unsigned short int upper_half_of_address_of_destination;
//	unsigned short int configuration_register;
};
//#define size_of_dma_descriptor_type (sizeof(dma_descriptor_type));
//typedef struct dma_descriptor_struct dma_descriptor_type;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

extern struct dma_descriptor_struct dma_descriptor[number_of_blocks];
extern unsigned short int buffer0[number_of_blocks][NN];

extern unsigned_integer *x_fixed, *y_fixed;
extern signed_integer a_fixed, b_fixed;

extern float *x_floating, *y_floating;
extern float a_floating, b_floating, siga, sigb, chi2, qq;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

#define NRANSI
#include "../src/numerical-recipes-in-c/nr.h"
#include "../src/numerical-recipes-in-c/nrutil.h"

/*void fixed_point_fit(float x[], float y[], index ndata, float sig[],
	unsigned long int mwt, float *a,
	float *b, float *siga, float *sigb, float *chi2, float *q);
*/
void original_fit(float x[], float y[], int ndata, float sig[], int mwt, float *a,
	float *b, float *siga, float *sigb, float *chi2, float *q);
void fit_without_statistics(float x[], float y[], int ndata, float sig[], int mwt, float *a,
	float *b);

void init_fit(unsigned short int number_of_points);
void fit_me(unsigned short int number_of_points, unsigned short int version);
//#define SPREAD 5

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

//#define checksum_16bit__offset (512)

void setup_real_fft(void);
void original_realfft_test_function(void);

void ad_fft_init(void);

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

#endif
