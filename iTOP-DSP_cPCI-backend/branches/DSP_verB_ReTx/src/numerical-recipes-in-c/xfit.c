/* Driver for routine fit */

//#include <math.h>
//#include <stdio.h>
#define NRANSI
#include "nr.h"
#include "nrutil.h"
#include "../../EBIUSystemServicesBF561/system.h"
#include "../dsp-fin-waveform-processing.h"
#include "../dsp-fin-process-waveform.h"

//#pragma section ("L1_data")
//#define NPT 512

#define SPREAD 0.5
float a_floating, b_floating, siga, sigb, chi2, qq;

//#pragma section ("L2_code")
//#pragma section ("L1_code")
//#pragma section ("l2_shared")

void init_fit(unsigned short int number_of_points) {
	unsigned short int i;
	y_fixed = lvector(0,number_of_points-1);
	x_fixed = lvector(0,number_of_points-1);
	y_floating = vector(0,number_of_points-1);
	x_floating = vector(0,number_of_points-1);
	for (i=0; i<number_of_points; i++) {
		x_fixed[i] = 250*i;
		x_floating[i] = 250.0*i;
	}
	// this is a memory leak...
}

void fit_me(unsigned short int number_of_points, unsigned short int version)
{
//	long idum=(-117);
	unsigned short int i, mwt = 0;
	float *sig;

	sig=vector(0,number_of_points-1);
	for (i=0;i<number_of_points;i++) {
//		x[i]=0.1*i;
//		y[i] = -2.0*x[i]+1.0+SPREAD*gasdev(&idum);
//		y[i] = -2.0*x[i]+1.0+SPREAD*rand(0.25);
//		y[i] = -2.0*x[i]+1.0+SPREAD;
		sig[i]=SPREAD;
	}
//	for (mwt=0;mwt<=1;mwt++) {
//		if (do_error_analysis) {
			// that's not what mwt means...
//			mwt = 1;
//		}
	if (version==0) {
		original_fit(x_floating,y_floating,number_of_points,sig,mwt,&a_floating,&b_floating,&siga,&sigb,&chi2,&qq);
	} else if (version==1) {
		fit_without_statistics(x_floating,y_floating,number_of_points,sig,mwt,&a_floating,&b_floating);
	} else {
		fixed_point_fit_data_to_straight_line(number_of_points);
	}
/*		if (0) {
			if (mwt == 0)
				printf("\nIgnoring standard deviations\n");
			else
				printf("\nIncluding standard deviations\n");
			printf("%12s %9.6f %18s %9.6f \n",
				"a  =  ",a,"uncertainty:",siga);
			printf("%12s %9.6f %18s %9.6f \n",
				"b  =  ",b,"uncertainty:",sigb);
			printf("%19s %14.6f \n","chi-squared: ",chi2);
			printf("%23s %10.6f \n","goodness-of-fit: ",q);
		}
*/
//	}
	free_vector(sig,0,number_of_points-1);
//	free_vector(y,0,number_of_points-1);
//	free_vector(x,0,number_of_points-1);
}
#undef NRANSI
