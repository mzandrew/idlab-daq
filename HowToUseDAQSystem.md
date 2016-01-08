# introduction #

A thorough description of the electronics and system for 2011 cosmic / beam test is available here:  [Belle II bPID electronics documentation](http://code.google.com/p/idlab-scrod/wiki/BelleIIbPIDElectronicsDocumentation)

## hardware ##

### front-end ###

Background information on what the front-end electronics do can be found here:  [how to use front-end electronics](http://code.google.com/p/idlab-scrod/wiki/HowToUseFrontEndElectronics).

### DSP\_cPCI ###

The DSP\_cPCI revB board has 4 multigigabit/s fiber optic transceivers, 3 FPGAs, 4 dual-core digital signal processors (DSPs) and 256MiB of SDRAM per DSP.

## writing software ##

### kernel driver ###

The kernel driver (altix.ko) is loaded at boot time if a DSP\_cPCI board is present.

### shared library ###

Some parts of the software to deal with data from the DSP\_cPCI board are organized into a library (libaltix.so).

### userland programs ###

Programs written to interface with the DSP\_cPCI board must
```
#include altix_userland.h
#include libaltix.h
```
and get linked with libaltix.so via:
```
-laltix
```
as long as libaltix.so is in the library path.

# How to use DAQ system #

## getting a copy of the software ##

The first thing to do is to checkout a copy of the software repository:
```
svn checkout http://idlab-daq.googlecode.com/svn/iTOP-DSP_cPCI-backend/branches/beam-test-or-bust.software
```

As long as `build-essential` and `libusb-dev` are installed packages, it should be possible to simply give a `make` command to build the entire project from the "beam-test-or-bust.software" subdirectory just created.

## using the software ##

After the "beam-test-or-bust.software" project is built, there are several modes of operation to get data from front-end module(s).

### testing/debugging ###

The first mode is debugging/testing features mode, which is beyond the scope of this document.  Programs that are part of this include the following:
```
./bin/camac_only
./bin/dual_readout
./bin/readout_all_pending_data
./bin/readout_temperature_of_all_connected_modules
./bin/reset_trigger_flip_flop
./bin/set_look_back
./bin/threshold_tester
./bin/trigger_a_quarter_event_from_all_connected_modules
./bin/turn_all_DACs_to_nominal
./bin/turn_feedback_off
./bin/turn_feedback_on
./bin/turn_off_all_DACs
./bin/window_profiler
```

Each of these programs generally needs to be run along with a command-line parameter/argument that is the ID # of the intended DSP\_cPCI card (printed on a sticker on the DSP\_cPCI board's bracket).  For instance,
```
./bin/readout_all_pending_data 2
```
will readout and discard all the data that's waiting in the FIFOs that came through the fiber optic link of DSP\_cPCI card #2.

### cosmic ###

```
bin/cosmic
```
is the executable for taking cosmic ray muon data.  It is normally called by running this:
```
./scripts/script
```
This script will parse the `.config` file
The behavior of

It will, by default, create files in a subdirectory called "logdir".

(unfinished)

### beamtest ###

There is a short summary of the instructions given to the DAQ operators at beam test T-1019 at Fermilab and they are posted here:

http://www.phys.hawaii.edu:8080/T-1019+Beam+Test/17