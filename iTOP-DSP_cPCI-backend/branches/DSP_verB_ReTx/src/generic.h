void software_reset(void);
void enable_core_b(void);
//void delay_ms(unsigned long int value);
void delay_ms(float value);

//#define number_of_for_loop_cycles_per_millisecond (8886) // at 600MHz
#define number_of_for_loop_cycles_per_millisecond (48434)
#define number_of_nops_per_microsecond (258)
//const unsigned long int m = 16777216/8;

//typedef unsigned short int u16;
//typedef unsigned long int u32;
