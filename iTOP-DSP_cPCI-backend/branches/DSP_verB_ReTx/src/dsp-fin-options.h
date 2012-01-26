#ifndef DSP_FIN_OPTIONS_H
#define DSP_FIN_OPTIONS_H
/*
	this option is whether to do a sample-by-sample search for the lowest point
	in the waveform instead of doing a time-saving optimization (that is less
	robust) where it looks for the lowest partial sum and then searchest that
	part of the original waveform and one before and one after (if they are still
	inside the original array) for the lowest value
	for 512 sample waveforms, this is quicker but less robust
	for 64 sample waveforms, this is both slow and not robust
*/
#define actually_search_for_extreme_value

/*
	this option is whether to do analysis taking advantage of partial sums,
	meaning that it will keep an array of the partial sums of the input waveform
	as it runs across the array initially so that sums and integrals can take
	advantage of having already determined the partial terms
*/
#define use_partial_sums

/*
	if use_partial_sums is defined, this is the log (base 2) of the number of
	samples that are accumulated in each partial sum
	number_of_terms_in_each_partial_sum
	= 2^log_base_2_of_number_of_terms_in_each_partial_sum
*/
#define log_base_2_of_number_of_terms_in_each_partial_sum (4)

/*
	this is whether to use two points and find t based on the corresponding line
*/
#define point_slope

/*
	this is whether to use chi^2 least squares maximum likelihood fitting
	as defined in numerical recipes in c, chapter 15 section 2 (fit.c, xfit.c)
*/
//#define chi_squared_least_squares_maximum_likelihood

/*
	this is whether the input signal is a pulse that is higher voltage than the
	signal without a pulse present
	also, this is whether it should search for the maximum of the pulse
	(as opposed to finding the minimum)
*/
#define positive_pulse

/*
	this enables the output of pulses whose widths are proportional to the
	calculated results (t, integral)
*/
#define show_results_on_oscilloscope_screen

/*
	SUBTRACT_PEDESTALS is whether to subtract AtoD converter zeroes from the
	input waveform
*/
#define SUBTRACT_PEDESTALS

/*
	ENABLE_SPLINING_FOR_CHI2_FITTING modifies the x[i]'s in addition to the y[i]'s
	before running the fitting function
*/
#define ENABLE_SPLINING_FOR_CHI2_FITTING

/*
	USE_DELTA_Ts_IN_INTEGRAL is whether to be more accurate but slower when
	calculating the integral
	no longer need it, becasue all values are corrected to (T, 2T....N-1)T, NT position.
*/
//#define USE_DELTA_Ts_IN_INTEGRAL

/* 
   USE_TIMEBASED_INTEGRAL  when sampling times are corrected, use this option
*/
#define USE_TIMEBASED_INTEGRAL

/*
	SQUEEZE_BUFFERS_INTO_L2 is whether to fit everything into local memory
*/
//#define SQUEEZE_BUFFERS_INTO_L2

/*
	FILTER_INPUT_IN_FREQUENCY_DOMAIN is whether to do filtering in the fourier
	domain
*/
/* turn it for test - lili */
#define FILTER_INPUT_IN_FREQUENCY_DOMAIN

//This is used when fpga is not ready to send waveform over and use hard code to pass waveform
#define FPGA_OFF
#define DEBUG_INFO
//#define Mat_DEBUG_SECTION

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

#if defined(point_slope) || defined(chi_squared_least_squares_maximum_likelihood)
#else
	#error "you must enable at least one of point_slope or chi_squared_least_squares_maximum_likelihood"
#endif

#if defined(point_slope) && defined(chi_squared_least_squares_maximum_likelihood)
	#error "you must not enable both point_slope and chi_squared_least_squares_maximum_likelihood"
#endif

#endif
