#include "DST34.h"
#include <iostream>

using namespace std;

int main(int argc, char *argv[]){

  if (argc != 4 && argc != 5) {
    cout << "Syntax: ConvertDST3ToDST4 [input DST3 removing .dst3] [output DST4 removing .dst4] [threshold] [debug flag (default = 0)]" << endl;
    return 1;
  }

  // name of input
  string strdst3 = argv[1];
  string strdst4 = argv[2];

  // threshld
  float threshold = 0;
  sscanf(argv[3], "%f", &threshold);

  // debug flag
  int debug_flag = 0;
  if (argc == 5) sscanf(argv[4], "%i", &debug_flag);

  // make class objects
  DST34 dst34;

  // set and open files
  if (!dst34.SetFiles(strdst3, strdst4)) return 1;

  // set threshold of discriminator of photon search
  dst34.SetThreshold(threshold);

  // set threshold of discriminator of photon search
  dst34.SetDebug(debug_flag);

  // define and set trees
  dst34.SetTrees();

  // fill config tree
  dst34.FillRunTree(strdst3);

  // transform event tree
  int evt = 0;
  do {
    dst34.FillPhotonTree(evt);
    evt ++;
    if (evt % 500 == 0) {
      cout << "Processed event " << evt << endl;
    }
  } while (evt < dst34.nevents);
  cout << endl << "Read " << evt << " events." << endl << endl;

  // fill counter tree
  dst34.FillCounterTree();

  // write to dst4
  dst34.WriteDST4(strdst4);

  // close out
  cout << "End of transformation from DST3 to DST4." << endl;

  return 0;
}
