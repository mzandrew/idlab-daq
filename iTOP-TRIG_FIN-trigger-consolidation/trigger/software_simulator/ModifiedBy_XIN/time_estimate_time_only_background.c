#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#define IS_VERBOSE 0

int comp_int(const void* d1, const void* d2)
{
 int *dd1, *dd2;
 dd1=(int*)d1;
 dd2=(int*)d2;

 if(*dd1>*dd2)
  return 1;
 else
  return -1;
}

int comp_double(const void* d1, const void* d2)
{
 double* dd1,*dd2;
 dd1=(double*)d1;
 dd2=(double*)d2;

 if(*dd1>*dd2)
  return 1;
 else
  return -1;
}

main(int *argc, char **argv)
{
long i, j, k, l, num_pixels, opt_j[10];
long num_pixels2;
double val_time[10][400];
int val_time_int[10][400];

double val_time_sort[4000];
long received[200];
double tot_time[10];
long y, z;
double in_num, tot_prob, cum_prob, curr_prob;
FILE *fi_names;
FILE *fi;
FILE *fi_time;
FILE *fi_space;
FILE* val_time_file;
char found;
long pos_max, min_received, bins_num;
long pos_max_space, pos_max_time; 
double tot_max, temp_tot;
double tot_max_time, tot_max_space;
char fname[100];
long abs_pos_minimum;


double val_space[10][8][60];
double tot_space[10];
long linenu;
char verbose;

double min_val,max_val;
int LUT_LENGTH;

int tot_max_int,temp_tot_int;
int opt_j_int[10];
int tot_time_int[10];
int tot_max_time_int;
int pos_max_time_int;

int max_number=0;
int max_td=0;
int max_time=0;

int pixel_tmp[100];
FILE* v_be;
FILE* ROM;
char s1[128];
char s2[128];
char s[128];

verbose=IS_VERBOSE;

argv[1]="name_time_files.txt";
argv[2]="sorted_K_C_2.5.0_WB.txt";
argv[3]="2";
argv[4]="200";

LUT_LENGTH=atoi(argv[4]);

val_time_file=fopen("val_file","w+");
v_be=fopen("v_be","w+");

for(i=0;i<10; i++)
for(j=0;j<400; j++)
	val_time[i][j]=-13.8;//corresponding to 1/millionth in probability

fi_names=fopen(argv[1],"r"); //argv[1] contains the list of names of files for time!
for(i=1;i<11; i++)
{
if(fscanf(fi_names, "%s", fname)!=1) {printf("Error in filenames for time!\n"); exit(1);}
fi=fopen(fname,"r");
while(fscanf(fi,"%ld", &y)==1)
{
fscanf(fi,"%lf", &in_num);
//if(in_num==0.0) val_time[i-1][y]=-13.8;//corresponding to 1/millionth in probability
if(in_num==0.0) val_time[i-1][y]=-15.0;//corresponding to ~1/10millionth in probability
else val_time[i-1][y]=log(in_num);
//printf("Done val_time %ld, %le \n", y,log(in_num));
}
fclose(fi);
//printf("Done reading file \%d \n", i);
}
fclose(fi_names);
if(verbose) printf("Done reading files - time\n");

//convert to integer
for(i=0;i<10;i++)
{
 for(j=0;j<400;j++)
   {
    if(val_time[i][j]>0.0 || val_time[i][j]<-15.0)
	{
	 fprintf(stderr,"val_time not valid!\n");
	 exit(1);
        }
    val_time_int[i][j]=(int)((val_time[i][j]+15.0)*(float)pow(2,20)/15.0);
   }
}


/*
for(i=0;i<10;i++)
{
 itoa(i,s1,10);
 for(j=0;j<20;j++)
   {
    if(j%2==0) //even number
	{
         strcpy(s,"B");
	 strcat(s,s1);
	 strcat(s,"_R");
	 itoa(j/2,s2,10);
	 strcat(s,s2);
	 strcat(s,".coe");
         ROM=fopen(s,"w+");
        }
    for(k=0;k<64;k++) 
	{
	 fprintf(ROM,"%d\n",val_time_int[i][2*j+2*k]);
         
         //for(l=19;l>=0;l--)
	    //fprintf(ROM,"%d",(val_time_int[i][2*j+2*k]>>l)&1);
	 //fprintf(ROM,"\n");
	 
        }
    if(j%2==1)
      fclose(ROM);
   }
}
*/

fi_time=fopen(argv[2],"r"); //argv[2] contains the timing information of the received vector
bins_num=atoi(argv[3]);
if(verbose) printf("Binning to %ld ns\n", bins_num);
/* Space and time loop: */
linenu=0;
while(fscanf(fi_time,"%ld", &num_pixels)==1)
{
 linenu++;
 if(num_pixels>max_number)
	max_number=num_pixels;


fscanf(fi_time,"%ld", &y);
min_received=received[0]=(y/bins_num)*bins_num;
abs_pos_minimum=y;
max_time=y;

for(i=1;i<num_pixels; i++)
{
fscanf(fi_time,"%ld", &y);
if(y<abs_pos_minimum) abs_pos_minimum=y;
if(y>max_time) max_time=y;
received[i]=(y/bins_num)*bins_num;
if(min_received>y) min_received=y;
}

if((max_time-abs_pos_minimum)>max_td)
   max_td=max_time-abs_pos_minimum;

//normalize to 0
for(i=0;i<num_pixels; i++) {
				received[i]-=(min_received/bins_num)*bins_num;
				pixel_tmp[i]=received[i]/bins_num;
			   }
//sort pixel_tmp
qsort(pixel_tmp,num_pixels,sizeof(int),comp_int);
fprintf(v_be,"%d ",num_pixels);
for(i=0;i<num_pixels;i++) fprintf(v_be,"%d ",abs_pos_minimum+pixel_tmp[i]);
fprintf(v_be,"\n");


//for(i=0;i<num_pixels; i++) printf("Received and rescaled: %ld %ld\n", i, received[i]);

//for all possible positions
for(i=0;i<10; i++) 
{
//Convolution cycle
opt_j[i]=0;
opt_j_int[i]=0;
for(j=0, tot_max_time=-10000.0,tot_max_time_int=-10000;j<LUT_LENGTH; j++)//10000 should be sufficiently small...
{
for(k=0, temp_tot=0.0,temp_tot_int=0;k<num_pixels; k++)
	{
		if(linenu==1 && i==6 && j==12) {
			printf("with %ld, add %ld, sum %ld\n", received[k],val_time_int[i][j+received[k]],temp_tot_int);
		}
		temp_tot+=val_time[i][j+received[k]];
		temp_tot_int+=val_time_int[i][j+received[k]];
//printf("temp_tot: %lf\n", temp_tot);
	}
if(temp_tot>tot_max_time) {opt_j[i]=j; tot_max_time=temp_tot;}
if(temp_tot_int>tot_max_time_int){opt_j_int[i]=j;tot_max_time_int=temp_tot_int;}
//printf("temp_tot: %lf\n", temp_tot);
}
tot_time[i]=tot_max_time;
tot_time_int[i]=tot_max_time_int;
}


tot_max_time=tot_time[0];
tot_max=tot_space[0]+tot_time[0];
pos_max_time=0;
pos_max=0;

tot_max_time_int=tot_time_int[0];
pos_max_time_int=0;

//printf("%lf ", tot[0]);
for(i=1;i<10; i++)
{
if((tot_time[i]>tot_max_time)) {tot_max_time=tot_time[i]; pos_max_time=i;}
//printf("%ld - %lf: max (%lf)  in %ld ", i, tot[i], tot_max, pos_max_time);
}

for(i=1;i<10; i++)
{
if((tot_time_int[i]>tot_max_time_int)) {tot_max_time_int=tot_time_int[i]; pos_max_time_int=i;}
}


//printf("%ld %ld %ld %lf\n", pos_max_time, opt_j[pos_max_time], abs_pos_minimum-opt_j[pos_max_time],tot_max_time);//note: uses the best timing
//printf("%ld\n",abs_pos_minimum-opt_j[pos_max_time]);
//printf("%ld\n",abs_pos_minimum-opt_j_int[pos_max_time_int]);
							   // estimate from the estimated position

printf("%ld %ld %ld %ld\n", pos_max_time_int, opt_j_int[pos_max_time_int], abs_pos_minimum-opt_j_int[pos_max_time_int],tot_max_time_int);

//printf("%ld %ld\n", pos_max_time, pos_max);
					
}

//printf("Tot converted: %ld\n", tot_converted);

for(i=0;i<10;i++)
{
 for(j=0;j<400;j++)
    val_time_sort[i*400+j]=val_time[i][j];    
}

qsort(val_time_sort,4000,sizeof(double),comp_double);

for(i=0;i<4000; i++)
	fprintf(val_time_file,"%lf\n",val_time_sort[i]);
fclose(val_time_file);
fclose(v_be);

//fprintf(stderr,"max_td %d max_number %d\n",max_td,max_number); 

return 0; 
}
