#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#define IS_VERBOSE 0

main(int argc, char **argv)
{
long i, j, k, l, num_pixels, opt_j[10];
long num_pixels2;
double val_time[10][400];
long received[200];
double tot_time[10];
long y, z;
double in_num, tot_prob, cum_prob, curr_prob;
FILE *fi_names;
FILE *fi;
FILE *fi_time;
FILE *fi_space;
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

verbose=IS_VERBOSE;



for(i=0;i<10; i++)
for(j=0;j<400; j++)
	val_time[i][j]=-13.8;//corresponding to 1/millionth in probability

fi_names=fopen(argv[1],"r"); //argv[1] contains the list of names of files for time!
if(fi_names==NULL) {
fprintf(stderr,"Error open argv[1] file\n");
exit(1);
}
for(i=1;i<11; i++)
{
if(fscanf(fi_names, "%s", fname)!=1) {printf("Error in filenames for time!\n"); exit(1);}
fi=fopen(fname,"r");
if(fi==NULL){
fprintf(stderr,"Error open %s file\n",fname);
exit(1);
}
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


fi_time=fopen(argv[2],"r"); //argv[2] contains the timing information of the received vector
if(fi_time==NULL){
fprintf(stderr,"Error open argv[2] file\n");
exit(1);
}
bins_num=atoi(argv[3]);
if(verbose) printf("Binning to %ld ns\n", bins_num);
/* Space and time loop: */
linenu=0;
while(fscanf(fi_time,"%ld", &num_pixels)==1)
{
fscanf(fi_time,"%ld", &y);
min_received=y;
received[0]=(y/bins_num)*bins_num;
abs_pos_minimum=y;
for(i=1;i<num_pixels; i++)
{
fscanf(fi_time,"%ld", &y);
if(y<abs_pos_minimum) abs_pos_minimum=y;
received[i]=(y/bins_num)*bins_num;
if(min_received>y) min_received=y;
}
//abs_pos_minimum=(abs_pos_minimum/bins_num)*bins_num;
//normalize to 0
for(i=0;i<num_pixels; i++) received[i]-=(min_received/bins_num)*bins_num;

//for(i=0;i<num_pixels; i++) printf("Received and rescaled: %ld %ld\n", i, received[i]);

//for all possible positions
for(i=0;i<10; i++) 
{
//Convolution cycle
opt_j[i]=0;
for(j=0, tot_max_time=-10000.0;j<200; j++)//10000 should be sufficiently small...
{
for(k=0, temp_tot=0.0;k<num_pixels; k++)
	{
		temp_tot+=val_time[i][j+received[k]];
//printf("temp_tot: %lf\n", temp_tot);
	}
if(temp_tot>tot_max_time) {opt_j[i]=j; tot_max_time=temp_tot;}
//printf("temp_tot: %lf\n", temp_tot);
}
tot_time[i]=tot_max_time;
}

tot_max_time=tot_time[0];
tot_max=tot_space[0]+tot_time[0];
pos_max_time=0;
pos_max=0;
//printf("%lf ", tot[0]);
for(i=1;i<10; i++)
{
if((tot_time[i]>tot_max_time)) {tot_max_time=tot_time[i]; pos_max_time=i;}
//printf("%ld - %lf: max (%lf)  in %ld ", i, tot[i], tot_max, pos_max_time);
}
printf("%ld %ld %ld\n", pos_max_time, pos_max_time, abs_pos_minimum-opt_j[pos_max_time]);//note: uses the best timing
							   // estimate from the estimated position
//printf("%ld %ld\n", pos_max_time, pos_max);
					
}



//printf("Tot converted: %ld\n", tot_converted);

}
