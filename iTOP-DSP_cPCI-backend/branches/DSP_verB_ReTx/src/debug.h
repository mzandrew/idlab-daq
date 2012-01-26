#ifndef DEBUG_H
#define DEBUG_H
//#define DEBUG_ALL
#define DEBUG_SOME

#ifdef DEBUG_ALL
	#define START_SECTION__analysis (*pFIO0_FLAG_S = 1<<1)
	#define   END_SECTION__analysis (*pFIO0_FLAG_C = 1<<1)
	#define START_SECTION__fake_waveforms (*pFIO0_FLAG_S = 1<<2)
	#define   END_SECTION__fake_waveforms (*pFIO0_FLAG_C = 1<<2)
	#define START_SECTION__find_extreme_value_and_accumulate_sums (*pFIO0_FLAG_S = 1<<3)
	#define   END_SECTION__find_extreme_value_and_accumulate_sums (*pFIO0_FLAG_C = 1<<3)
	#define START_SECTION__find_index_of_threshold_crossing (*pFIO0_FLAG_S = 1<<4)
	#define   END_SECTION__find_index_of_threshold_crossing (*pFIO0_FLAG_C = 1<<4)
	#define START_SECTION__determine_limits_of_integration_and_fit_window (*pFIO0_FLAG_S = 1<<2)
	#define   END_SECTION__determine_limits_of_integration_and_fit_window (*pFIO0_FLAG_C = 1<<2)
	#define START_SECTION__calculate_average_of_quiescent_part_of_waveform (*pFIO0_FLAG_S = 1<<3)
	#define   END_SECTION__calculate_average_of_quiescent_part_of_waveform (*pFIO0_FLAG_C = 1<<3)
	#define START_SECTION__determine_time_of_pulse_leading_edge (*pFIO0_FLAG_S = 1<<4)
	#define   END_SECTION__determine_time_of_pulse_leading_edge (*pFIO0_FLAG_C = 1<<4)
	#define START_SECTION__fit_data_to_straight_line (*pFIO0_FLAG_S = 1<<2)
	#define   END_SECTION__fit_data_to_straight_line (*pFIO0_FLAG_C = 1<<2)
	#define START_SECTION__calculate_integral (*pFIO0_FLAG_S = 1<<3)
	#define   END_SECTION__calculate_integral (*pFIO0_FLAG_C = 1<<3)
	#define START_SECTION__filter_input (*pFIO0_FLAG_S = 1<<4)
	#define   END_SECTION__filter_input (*pFIO0_FLAG_C = 1<<4)
	#define START_SECTION__filter_input__rfft (*pFIO0_FLAG_S = 1<<2)
	#define   END_SECTION__filter_input__rfft (*pFIO0_FLAG_C = 1<<2)
	#define START_SECTION__filter_input__multiply (*pFIO0_FLAG_S = 1<<3)
	#define   END_SECTION__filter_input__multiply (*pFIO0_FLAG_C = 1<<3)
	#define START_SECTION__filter_input__ifft (*pFIO0_FLAG_S = 1<<2)
	#define   END_SECTION__filter_input__ifft (*pFIO0_FLAG_C = 1<<2)
	#define START_SECTION__dma_transfers (*pFIO0_FLAG_S = 1<<5)
	#define   END_SECTION__dma_transfers (*pFIO0_FLAG_C = 1<<5)
#elif defined(DEBUG_SOME)
	#define START_SECTION__analysis (*pFIO0_FLAG_S = 1<<1)
	#define   END_SECTION__analysis (*pFIO0_FLAG_C = 1<<1)
	#define START_SECTION__fake_waveforms
	#define   END_SECTION__fake_waveforms
	#define START_SECTION__find_extreme_value_and_accumulate_sums
	#define   END_SECTION__find_extreme_value_and_accumulate_sums
	#define START_SECTION__find_index_of_threshold_crossing
	#define   END_SECTION__find_index_of_threshold_crossing
	#define START_SECTION__determine_limits_of_integration_and_fit_window
	#define   END_SECTION__determine_limits_of_integration_and_fit_window
	#define START_SECTION__calculate_average_of_quiescent_part_of_waveform
	#define   END_SECTION__calculate_average_of_quiescent_part_of_waveform
	#define START_SECTION__determine_time_of_pulse_leading_edge
	#define   END_SECTION__determine_time_of_pulse_leading_edge
	#define START_SECTION__fit_data_to_straight_line
	#define   END_SECTION__fit_data_to_straight_line
	#define START_SECTION__calculate_integral (*pFIO0_FLAG_S = 1<<2)
	#define   END_SECTION__calculate_integral (*pFIO0_FLAG_C = 1<<2)
	#define START_SECTION__filter_input (*pFIO0_FLAG_S = 1<<4)
	#define   END_SECTION__filter_input (*pFIO0_FLAG_C = 1<<4)
	#define START_SECTION__filter_input__rfft (*pFIO0_FLAG_S = 1<<2)
	#define   END_SECTION__filter_input__rfft (*pFIO0_FLAG_C = 1<<2)
	#define START_SECTION__filter_input__multiply (*pFIO0_FLAG_S = 1<<3)
	#define   END_SECTION__filter_input__multiply (*pFIO0_FLAG_C = 1<<3)
	#define START_SECTION__filter_input__ifft (*pFIO0_FLAG_S = 1<<2)
	#define   END_SECTION__filter_input__ifft (*pFIO0_FLAG_C = 1<<2)
	#define START_SECTION__dma_transfers
	#define   END_SECTION__dma_transfers
#else
	#define START_SECTION__analysis
	#define   END_SECTION__analysis
	#define START_SECTION__fake_waveforms
	#define   END_SECTION__fake_waveforms
	#define START_SECTION__find_extreme_value_and_accumulate_sums
	#define   END_SECTION__find_extreme_value_and_accumulate_sums
	#define START_SECTION__find_index_of_threshold_crossing
	#define   END_SECTION__find_index_of_threshold_crossing
	#define START_SECTION__determine_limits_of_integration_and_fit_window
	#define   END_SECTION__determine_limits_of_integration_and_fit_window
	#define START_SECTION__calculate_average_of_quiescent_part_of_waveform
	#define   END_SECTION__calculate_average_of_quiescent_part_of_waveform
	#define START_SECTION__determine_time_of_pulse_leading_edge
	#define   END_SECTION__determine_time_of_pulse_leading_edge
	#define START_SECTION__fit_data_to_straight_line
	#define   END_SECTION__fit_data_to_straight_line
	#define START_SECTION__calculate_integral
	#define   END_SECTION__calculate_integral
	#define START_SECTION__filter_input
	#define   END_SECTION__filter_input
	#define START_SECTION__filter_input__rfft
	#define   END_SECTION__filter_input__rfft
	#define START_SECTION__filter_input__multiply
	#define   END_SECTION__filter_input__multiply
	#define START_SECTION__filter_input__ifft
	#define   END_SECTION__filter_input__ifft
	#define START_SECTION__dma_transfers
	#define   END_SECTION__dma_transfers
#endif

#endif
