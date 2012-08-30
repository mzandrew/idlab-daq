#######################################################################
CC=g++
ROOT_INCDIR = $(shell root-config --incdir)
ROOTLIBS    = $(shell root-config --glibs)
ROOTCFLAGS  = $(shell root-config --cflags) -g
INC=-I${ROOT_INCDIR} -Isrc -I../acquisition/contrib -I../acquisition/src/lib
#######################################################################
LINK_OPTIONS = -L../acquisition/contrib -laltix -lxx_usb -lusb -Wl,-rpath,$(shell pwd)/../acquisition/contrib
LIB_OBJS     =  work/CamacStructure.o work/EventStructure.o work/Utility.o ../acquisition/work/DebugInfoWarningError.o ../acquisition/work/acquisition.o ../acquisition/work/CAMAC.o ../acquisition/work/generic.o ../acquisition/work/config_file.o ../acquisition/work/status_file.o ../acquisition/work/command_packet_builder.o ../acquisition/work/fiber.o ../acquisition/work/pci.o
#######################################################################
default :
	if [ ! -e work    ]; then mkdir    work; fi
	if [ ! -e bin     ]; then mkdir     bin; fi
	$(MAKE) all

all: bin/ConvertRawToDST1 bin/ConvertRawToDST1_with_DQM bin/CalculatePedestals bin/ConvertDST1ToDST2 bin/ConvertCamacToROOT

bin/ConvertRawToDST1: work/ConvertRawToDST1.o $(LIB_OBJS)
	$(CC) $^ $(ROOTLIBS) -o $@ $(INC) $(ROOTCFLAGS) $(LINK_OPTIONS)

bin/ConvertRawToDST1_with_DQM: work/ConvertRawToDST1_with_DQM.o $(LIB_OBJS)
	$(CC) $^ $(ROOTLIBS) -o $@ $(INC) $(ROOTCFLAGS) $(LINK_OPTIONS)

bin/CalculatePedestals: work/CalculatePedestals.o $(LIB_OBJS)
	$(CC) $^ $(ROOTLIBS) -o $@ $(INC) $(ROOTCFLAGS) $(LINK_OPTIONS)

bin/ConvertDST1ToDST2: work/ConvertDST1ToDST2.o $(LIB_OBJS)
	$(CC) $^ $(ROOTLIBS) -o $@ $(INC) $(ROOTCFLAGS) $(LINK_OPTIONS)

bin/ConvertCamacToROOT: work/ConvertCamacToROOT.o $(LIB_OBJS)
	$(CC) $^ $(ROOTLIBS) -o $@ $(INC) $(ROOTCFLAGS) $(LINK_OPTIONS)

../acquisition/work/CAMAC.o: 
	cd ../acquisition/
	$(MAKE) work/CAMAC.o

work/ConvertRawToDST1_with_DQM.o: src/ConvertRawToDST1_with_DQM.cpp
	$(CC) $(INC) $< -c -o $@

work/ConvertRawToDST1.o: src/ConvertRawToDST1.cpp
	$(CC) $(INC) src/ConvertRawToDST1.cpp -c -o $@

work/CalculatePedestals.o: src/CalculatePedestals.cpp
	$(CC) $(INC) src/CalculatePedestals.cpp -c -o $@

work/ConvertDST1ToDST2.o: src/ConvertDST1ToDST2.cpp
	$(CC) $(INC) $< -c -o $@

work/ConvertCamacToROOT.o: src/ConvertCamacToROOT.cpp
	$(CC) $(INC) src/ConvertCamacToROOT.cpp -c -o $@

work/EventStructure.o: src/EventStructure.cpp src/EventStructure.h
	$(CC) $(INC) src/EventStructure.cpp -c -o $@

work/CamacStructure.o: src/CamacStructure.cpp src/CamacStructure.h
	$(CC) $(INC) src/CamacStructure.cpp -c -o $@

work/Utility.o: src/Utility.cpp src/Utility.h
	$(CC) $(INC) src/Utility.cpp -c -o $@

######################################################################
clean:
	rm -f work/* bin/*
######################################################################
