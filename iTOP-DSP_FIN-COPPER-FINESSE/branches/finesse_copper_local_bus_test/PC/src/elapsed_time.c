
/*
Subtract the `struct timeval' values X and Y,
storing the result in RESULT.
Return 1 if the difference is negative, otherwise 0.
*/
// copied & modified from info page for libc / elapsed time
int timeval_subtract (struct timeval *result, struct timeval *end, struct timeval *start) {
       /* Perform the carry for the later subtraction by updating Y. */
       if (end->tv_usec < start->tv_usec) {
         int nsec = (start->tv_usec - end->tv_usec) / 1000000 + 1;
         start->tv_usec -= 1000000 * nsec;
         start->tv_sec += nsec;
       }
       if (end->tv_usec - start->tv_usec > 1000000) {
         int nsec = (end->tv_usec - start->tv_usec) / 1000000;
         start->tv_usec += 1000000 * nsec;
         start->tv_sec -= nsec;
       }
       /* Compute the time remaining to wait.
          `tv_usec' is certainly positive. */
       result->tv_sec = end->tv_sec - start->tv_sec;
       result->tv_usec = end->tv_usec - start->tv_usec;
       /* Return 1 if result is negative. */
       return end->tv_sec < start->tv_sec;
}

/*
	struct timeval start1, end1, result1;
	gettimeofday(&start1, NULL);	
	...
	gettimeofday(&end1, NULL);
	timeval_subtract(&result1, &end1, &start1);
	float seconds = result1.tv_sec + result1.tv_usec / 1000000.0;
*/

