#include <cdefBF561.h>
#include <ccblkfn.h>
#include "../EBIUSystemServicesBF561/system.h"
#include "generic.h"
#include "dsp-fin-options.h"
#include "dsp-fin-waveform-processing.h"
#include "dsp-fin-process-waveform.h"
#include "../EBIUSystemServicesBF561/CoreA/SL10.h"
#include "debug.h"
#include <filter.h>
#include <complex.h>
#include <math.h>
#include <math_const.h>

void output_augmented_original_waveform(unsigned short int *waveform, index i_smallest, unsigned_single_value average, index i_crossing, index i_threshold, index i_first_in_window, index i_last_in_window);

extern unsigned short int waveform0[N];
extern unsigned short int noise;

#define delay_min (3)
#define delay_max (9)
unsigned short int delay = delay_min;

#define integral__log_base_2_factor (4)
#define x2__log_base_2_factor (9)
//#define lower_bound_on_a (min+1)
//#define lower_bound_on_b (lower_bound_on_a+1)
//#define lower_bound_on_c (lower_bound_on_b+1)
//#define lower_bound_on_e (lower_bound_on_c+2)
#define lower_bound_on_a (1)
#define lower_bound_on_b (2)
#define lower_bound_on_c (3)
#define lower_bound_on_e (5)
#define padding_fudge (1)

// log_base_2_of_number_of_terms_in_each_partial_sum is defined in dsp_fin_options.h
#define number_of_terms_in_each_partial_sum (1<<log_base_2_of_number_of_terms_in_each_partial_sum)
#define number_of_partial_sums (N>>log_base_2_of_number_of_terms_in_each_partial_sum)

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

#define MAXIMUM_VALUE (4096)

complex_fract16 twiddle[N];
fract16 in[N];
complex_fract16 out[N];

void ad_fft_init(void) {
	unsigned int i;
	twidfftrad2_fr16(twiddle, N);
	for (i=0; i<N; i++) {
		in[i] = (fract16) (sin(2.0*PI*i/2.5)*32768.0);
	}
}

#define log_base_2_of_filter_divisor (4)
#define half_of_log_base_2_of_filter_divisor (log_base_2_of_filter_divisor>>1)

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
void ad_fft(void) { // 7.73us for 64 samples
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
	ifft_fr16(out, out, twiddle, 1, N, &block_exponent, 0); // 3.52us for 64 samples
	END_SECTION__filter_input__ifft;
	// this last part takes 250ns for 64 samples
//	for (i=0; i<N; i++) {
//		in[i] = out[i].re << (log_base_2_of_number_of_points_in_waveform - half_of_log_base_2_of_filter_divisor);
//		in[i] = out[i].re << - half_of_log_base_2_of_filter_divisor);
//	}
}

void process_waveform(unsigned short int *waveform) {
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
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
		extreme_value = 0; extreme_value--;
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
	average <<= fixed_point_shift_by;
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
		y0 = waveform[x0] << fixed_point_shift_by;
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
	return;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
}

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
