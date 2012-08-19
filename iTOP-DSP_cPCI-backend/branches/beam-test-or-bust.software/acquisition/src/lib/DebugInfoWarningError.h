#include <stdio.h>

extern unsigned short int verbosity;

void setup_DebugInfoWarningError(void);
unsigned short int change_verbosity(unsigned short int new_verbosity);

extern FILE *debug;
extern FILE *debug2;
extern FILE *info;
extern FILE *warning;
extern FILE *error;

