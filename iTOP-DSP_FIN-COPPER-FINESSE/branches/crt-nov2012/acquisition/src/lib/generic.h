using namespace std;

#include <string>

void graceful_exit(void);

#define MINIMUM_DISK_SPACE_FREE_BEFORE_SHOWING_A_WARNING (1000000000)
#define MINIMUM_DISK_SPACE_FREE_BEFORE_SHOWING_AN_ERROR   (100000000)
#define MINIMUM_DISK_SPACE_FREE_BEFORE_QUITTING            (10000000)

#define NUMBER_OF_SPACES_TO_RESERVE_FOR_EVENT_NUMBER_CONSOLE_OUTPUT (4)
#define NUMBER_OF_SPACES_TO_RESERVE_FOR_EXPERIMENT_NUMBER           (2)
#define NUMBER_OF_SPACES_TO_RESERVE_FOR_RUN_NUMBER                  (4)
#define NUMBER_OF_SPACES_TO_RESERVE_FOR_SPILL_NUMBER                (4)

void set_current_date_string(void);
bool file_exists (string filename);
void create_directory_if_necessary(string dirname);
unsigned long long int disk_space_free(string path);
string insert_interstitial_commas (unsigned long long int number);
void generate_new_base_filename(void);

string &myltrim(string &s);
string &myrtrim(string &s);
string &mytrim(string &s);

void caught_ctrl_c(int sig);
void setup_to_catch_ctrl_c(void (*callback)(void) = graceful_exit);
