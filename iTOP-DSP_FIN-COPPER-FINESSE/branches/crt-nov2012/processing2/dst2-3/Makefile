CC=g++
ROOT_INCDIR=$(shell root-config --incdir)
ROOTLIBS = $(shell root-config --glibs)
ROOTCFLAGS = $(shell root-config --cflags)
ROOT_ADD_LIBS = $(shell root-config --libs)
INC=-I${ROOT_INCDIR} -I.

TARGET = ConvertDST2ToDST3
OBJS = main.o DST23.o

${TARGET}: $(OBJS)
	$(CC) $(OBJS) $(ROOTLIBS) -o $@ $(INC) $(ROOTCFLAGS) $(ROOT_ADD_LIBS)

main.o: main.cc DST23.o
	$(CC) $(INC) main.cc -c

DST23.o: DST23.cc DST23.h
	$(CC) $(INC) DST23.cc -c

clean:
	rm -f ${TARGET} ${OBJS} *~

