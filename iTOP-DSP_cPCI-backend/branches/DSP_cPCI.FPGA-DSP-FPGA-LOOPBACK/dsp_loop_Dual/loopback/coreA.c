/*****************************************************************************
 * Core A
 * coreA.c
 *****************************************************************************/

#include <ccblkfn.h>

int main( void )
{
	/* The default startup code does not include any functionality to allow core
	   A to enable core B. A convenient way to enable core B is to use the 
	   'adi_core_b_enable()' function. */
	adi_core_b_enable();

	/* Begin adding your custom code here */
	return 0;
}
