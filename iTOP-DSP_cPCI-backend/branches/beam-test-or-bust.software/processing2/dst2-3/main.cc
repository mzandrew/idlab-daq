#include "DST23.h"
#include <iostream>

using namespace std;

int main(int argc, char *argv[]) {

  if (argc != 5) {
    cout << "Syntax: ConvertDST2ToDST3 [input DST2 removing m*.dst2] [input for calibration removing m*.calib] [input CAMAC removing .camac] [output DST3 removing .dst3]" << endl;
    return 1;
  }

  // name of inputs and output
  string strdst2 = argv[1];
  string strcalib = argv[2];
  string strcamac = argv[3];
  string strdst3 = argv[4];

  // make class objects
  DST23 dst23;

  // set and open input files
  if (!dst23.SetInputFiles(strdst2, strcalib, strcamac)) return 1;

  // define and set input trees
  dst23.SetInputTrees();

  // divide if nevents > max_events (memory reason)
  int max_events = 2000;
  int ndivision = 1;
  if (dst23.nevents > max_events) {
    ndivision = (int) dst23.nevents/max_events + 1;
    cout << "Divide output to " << ndivision
	 << " to avoid memory problem." << endl
	 << "One output file contains <= "
	 << max_events << " events." << endl;
    if (ndivision > 100) {
      cout << "[ERROR] Current software is not applicable for > "
	   << 100*max_events << " events."
	   << endl;
      return 1;
    }
  }

  int evt = 0;
  int eventlimit;
  int stop_flag = 0;

  for(int i = 0; i < ndivision; i++){
  //for(int i = 0; i < 1; i++){ // for test

    // set number of events
    if(ndivision == 1) eventlimit = dst23.nevents;
    else if(i < ndivision - 1) eventlimit = max_events;
    else eventlimit = dst23.nevents%max_events;

    // set output files
    if (!dst23.SetOutputFiles(strdst3, i, ndivision)) return 1;

    // define and set output trees
    dst23.SetOutputTrees();

    // fill config tree
    dst23.FillCFGTree(i);

    // transform event tree
    int counter = 0;
    do {
      if(!dst23.TransformEVTTree(evt)) { evt = (i+1) * max_events; stop_flag = 1; break; }
      evt ++; counter++;
      if (evt % 500 == 0) {
	cout << "Processed event " << evt << endl;
      }
    } while (counter < eventlimit);
    //cout << endl << "Read " << evt << " events." << endl << endl;
    
    // write to dst3
    dst23.WriteDST3(strdst3, i, ndivision);

    if (stop_flag) return 0;

  }

  // close out
  cout << "End of transformation from DST2 to DST3." << endl;

  return 0;
}
