#######################################################################
CC=g++
ROOT_INCDIR = $(shell root-config --incdir)
ROOTLIBS    = $(shell root-config --glibs)
ROOTCFLAGS  = $(shell root-config --cflags)
INC=-I${ROOT_INCDIR} -Isrc
#######################################################################
LIB_OBJS      =  work/EventStructure.o 
#######################################################################
default :
	if [ ! -e work    ]; then mkdir    work; fi
	if [ ! -e bin     ]; then mkdir     bin; fi
	$(MAKE) all

all: bin/ConvertRawToDST1 bin/ConvertRawToDST1_with_DQM

bin/ConvertRawToDST1: work/ConvertRawToDST1.o $(LIB_OBJS)
	$(CC) $^ $(ROOTLIBS) -o $@ $(INC) $(ROOTCFLAGS)

bin/ConvertRawToDST1_with_DQM: work/ConvertRawToDST1_with_DQM.o $(LIB_OBJS)
	$(CC) $^ $(ROOTLIBS) -o $@ $(INC) $(ROOTCFLAGS)

work/ConvertRawToDST1_with_DQM.o: src/ConvertRawToDST1_with_DQM.cpp
	$(CC) $(INC) $< -c -o $@

work/ConvertRawToDST1.o: src/ConvertRawToDST1.cpp
	$(CC) $(INC) src/ConvertRawToDST1.cpp -c -o $@

work/EventStructure.o: src/EventStructure.cpp src/EventStructure.h
	$(CC) $(INC) src/EventStructure.cpp -c -o $@

######################################################################
clean:
	rm -f work/* bin/*
######################################################################
