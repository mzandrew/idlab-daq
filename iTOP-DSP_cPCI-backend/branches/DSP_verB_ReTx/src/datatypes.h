#ifndef datatypes_h
#define datatypes_h

//#define sixteen_bit_indices
#define sixteen_bit_values

#ifdef sixteen_bit_indices
	typedef unsigned short int index;
#else
	typedef unsigned long  int index;
#endif

#ifdef sixteen_bit_values
	typedef   signed short int signed_single_value;
	typedef unsigned short int unsigned_single_value;
#else
	typedef   signed long  int signed_single_value;
	typedef unsigned long  int unsigned_single_value;
#endif

typedef   signed long  int signed_accumulated_value;
typedef unsigned long  int unsigned_accumulated_value;

typedef unsigned short int u16;
typedef unsigned long  int u32;
typedef unsigned long  int unsigned_integer;
typedef   signed long  int signed_integer;

#endif
