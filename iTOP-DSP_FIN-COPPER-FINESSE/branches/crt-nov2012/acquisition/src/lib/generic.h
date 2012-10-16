using namespace std;

#include <string>

void graceful_exit(void);

#define MINIMUM_DISK_SPACE_FREE_BEFORE_SHOWING_A_WARNING (1000000000)
#define MINIMUM_DISK_SPACE_FREE_BEFORE_SHOWING_AN_ERROR   (100000000)
#define MINIMUM_DISK_SPACE_FREE_BEFORE_QUITTING            (10000000)

extern string current_date_string;

void set_current_date_string(void);
bool file_exists (string filename);
void create_directory_if_necessary(string dirname);
unsigned long long int disk_space_free(string path);
string insert_interstitial_commas (unsigned long long int number);

