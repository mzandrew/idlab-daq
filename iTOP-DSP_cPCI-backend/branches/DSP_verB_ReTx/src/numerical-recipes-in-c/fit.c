#include <math.h>
#define NRANSI
#include "nrutil.h"
//#include "../../EBIUSystemServicesBF561/system.h" // fmin() problem

#include "../datatypes.h"

float *x_floating, *y_floating;

/*
void fixed_point_fit(float x[], float y[], index ndata,
	float sig[], unsigned long int mwt, float *a,
	float *b, float *siga, float *sigb, float *chi2, float *q)
{
//	float gammq(float a, float x);
	index i;
	//	float wt,sigdat;
	// float ,sx=0.0,sy=0.0,ss,st2=0.0,sxoss
	integer Sx = 0, Sy = 0, Stt = 0, B = 0, CHI2 = 0, S, t, A, Sx_S, sigma;
	integer sigma_a, sigma_b, Q;
// *//*
		wt = weight_i
		t = t_i
		sxoss = sx over ss = S_x/S
		sx = S_x
		sy = S_y
		st2 = S_tt
		ss = S
		sigdat = calculated sigma for every datapoint, based on chi^2
	the following analysis is for 16 bit registers:
	Sx is the sum of the x[i]'s, so if they are n bits each, then number_of_points can only be 2^(16-n).
	For 1% delta-t'ing (making x[i]=100*i), n=6.64 and there can be 1571.8 data points.
	Sy is the sum of the y[i]'s, so if they are 12 bits each, there can only be 16 datapoints
	S is the number of datapoints, which can be 2^16
	t is the difference between each x[i] and the average of the x[i]'s
	Stt is the sum of the squares of the t's
// *//*

	B = 0;
	if (mwt) {
//		ss=0.0;
//		for (i=0;i<ndata;i++) {
//			wt=1.0/SQR(sig[i]);
//			ss += wt;
//			sx += x[i]*wt;
//			sy += y[i]*wt;
//		}
	} else {
		for (i=0;i<ndata;i++) {
			Sx += x[i];
			Sy += y[i];
		}
		S=ndata;
	}
	Sx_S=Sx/S;
	if (mwt) {
//		for (i=0;i<ndata;i++) {
//			t=(x[i]-sxoss)/sig[i];
//			st2 += t*t;
//			*b += t*y[i]/sig[i];
//		}
	} else {
		for (i=0;i<ndata;i++) {
			t=x[i]-Sx_S;
			Stt += t*t;
			B += t*y[i];
		}
	}
	B /= Stt;
	A=(Sy-Sx*B)/S;
	*a    = (float) A;
	*b    = (float) B;
	return;
	sigma_a=sqrt((1+Sx*Sx/(S*Stt))/S);
	sigma_b=sqrt(1/Stt);
	CHI2 = 0;
	Q = 1;
	if (mwt == 0) {
		for (i=0;i<ndata;i++)
			CHI2 += SQR(y[i]-A-B*x[i]);
		sigma=sqrt(CHI2/(ndata-2));
		sigma_a *= sigma;
		sigma_b *= sigma;
	} else {
//		for (i=0;i<ndata;i++)
//			*chi2 += SQR((y[i]-(*a)-(*b)*x[i])/sig[i]);
//		if (ndata>2) *q=gammq(0.5*(ndata-2),0.5*(*chi2));
	}
	*siga = (float) sigma_a;
	*sigb = (float) sigma_b;
	*chi2 = (float) CHI2;
	*q    = (float) Q;
}
*/

// modified for [0...ndata-1]
void original_fit(float x[], float y[], int ndata, float sig[], int mwt, float *a,
	float *b, float *siga, float *sigb, float *chi2, float *q)
{
	float gammq(float a, float x);
	int i;
	float wt,t,sxoss,sx=0.0,sy=0.0,st2=0.0,ss,sigdat;

	*b=0.0;
	if (mwt) {
		ss=0.0;
		for (i=0;i<ndata;i++) {
			wt=1.0/SQR(sig[i]);
			ss += wt;
			sx += x[i]*wt;
			sy += y[i]*wt;
		}
	} else {
		for (i=0;i<ndata;i++) {
			sx += x[i];
			sy += y[i];
		}
		ss=ndata;
	}
	sxoss=sx/ss;
	if (mwt) {
		for (i=0;i<ndata;i++) {
			t=(x[i]-sxoss)/sig[i];
			st2 += t*t;
			*b += t*y[i]/sig[i];
		}
	} else {
		for (i=0;i<ndata;i++) {
			t=x[i]-sxoss;
			st2 += t*t;
			*b += t*y[i];
		}
	}
	*b /= st2;
	*a=(sy-sx*(*b))/ss;
	*siga=sqrt((1.0+sx*sx/(ss*st2))/ss);
	*sigb=sqrt(1.0/st2);
	*chi2=0.0;
	*q=1.0;
	if (mwt == 0) {
		for (i=0;i<ndata;i++)
			*chi2 += SQR(y[i]-(*a)-(*b)*x[i]);
		sigdat=sqrt((*chi2)/(ndata-2));
		*siga *= sigdat;
		*sigb *= sigdat;
	} else {
		for (i=0;i<ndata;i++)
			*chi2 += SQR((y[i]-(*a)-(*b)*x[i])/sig[i]);
		if (ndata>2) *q=gammq(0.5*(ndata-2),0.5*(*chi2));
	}
}

void fit_without_statistics(float x[], float y[], int ndata, float sig[], int mwt, float *a,
	float *b)
{
	float gammq(float a, float x);
	int i;
	float wt,t,sxoss,sx=0.0,sy=0.0,st2=0.0,ss,sigdat;

	*b=0.0;
	if (mwt) {
		ss=0.0;
		for (i=0;i<ndata;i++) {
			wt=1.0/SQR(sig[i]);
			ss += wt;
			sx += x[i]*wt;
			sy += y[i]*wt;
		}
	} else {
		for (i=0;i<ndata;i++) {
			sx += x[i];
			sy += y[i];
		}
		ss=ndata;
	}
	sxoss=sx/ss;
	if (mwt) {
		for (i=0;i<ndata;i++) {
			t=(x[i]-sxoss)/sig[i];
			st2 += t*t;
			*b += t*y[i]/sig[i];
		}
	} else {
		for (i=0;i<ndata;i++) {
			t=x[i]-sxoss;
			st2 += t*t;
			*b += t*y[i];
		}
	}
	*b /= st2;
	*a=(sy-sx*(*b))/ss;
	return;
}

/*
void possibly_broken_fit(float x[], float y[], int ndata, float sig, int mwt, float *a,
	float *b, float *siga, float *sigb, float *chi2, float *q)
{
	float gammq(float a, float x);
	int i;
	float wt,t,sxoss,sx=0.0,sy=0.0,st2=0.0,ss,sigdat, sqrsig = SQR(sig);

	*b=0.0;
	if (mwt) {
		wt=1.0/sqrsig;
//		ss=0.0;
		for (i=0;i<ndata;i++) {
			sx += x[i];
			sy += y[i];
		}
		ss = wt * ndata;
		sx *= wt;
		sy *= wt;
	} else {
		for (i=0;i<ndata;i++) {
			sx += x[i];
			sy += y[i];
		}
		ss=ndata;
	}
	sxoss=sx/ss;
	if (mwt) {
		for (i=0;i<ndata;i++) {
			t=(x[i]-sxoss)/sig;
			st2 += t*t;
			*b += t*y[i]/sig;
		}
	} else {
		for (i=0;i<ndata;i++) {
			t=x[i]-sxoss;
			st2 += t*t;
			*b += t*y[i];
		}
	}
	*b /= st2;
	*a=(sy-sx*(*b))/ss;
	*siga=sqrt((1.0+sx*sx/(ss*st2))/ss);
	*sigb=sqrt(1.0/st2);
	*chi2=0.0;
	*q=1.0;
	if (mwt == 0) {
		for (i=0;i<ndata;i++)
			*chi2 += SQR(y[i]-(*a)-(*b)*x[i]);
		sigdat=sqrt((*chi2)/(ndata-2));
		*siga *= sigdat;
		*sigb *= sigdat;
	} else {
		for (i=0;i<ndata;i++)
			*chi2 += SQR((y[i]-(*a)-(*b)*x[i])/sig);
		if (ndata>2) *q=gammq(0.5*(ndata-2),0.5*(*chi2));
	}
}

*/

#undef NRANSI
