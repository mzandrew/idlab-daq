#include <stdio.h>
#include <stdlib.h>

int main()
{

 int i,j;
 char s1[128];
 char s2[128];
 char s[128];
 char command[128];

 
 for(i=0;i<10;i++)
    {
     itoa(i,s1,10);
     for(j=0;j<10;j++)
       {
	strcpy(s,"B");
	strcat(s,s1);
        strcat(s,"_R");
	itoa(j,s2,10);
        strcat(s,s2);
	strcat(s,".coe");
	strcpy(command, "cp ../../../DAQ_trigger_syn/NULL.mif ");
        strcat(command,s);
	system(command);
       }
    }

 return 0;
}

