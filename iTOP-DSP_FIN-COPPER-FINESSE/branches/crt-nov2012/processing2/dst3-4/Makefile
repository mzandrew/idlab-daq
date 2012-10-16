CC=g++
ROOT_INCDIR=$(shell root-config --incdir)
ROOTLIBS = $(shell root-config --glibs)
ROOTCFLAGS = $(shell root-config --cflags)
ROOT_ADD_LIBS = $(shell root-config --libs)
INC=-I${ROOT_INCDIR} -I.

TARGET = ConvertDST3ToDST4
OBJS = main.o DST34.o

${TARGET}: $(OBJS)
	$(CC) $(OBJS) $(ROOTLIBS) -o $@ $(INC) $(ROOTCFLAGS) $(ROOT_ADD_LIBS)

main.o: main.cc DST34.o
	$(CC) $(INC) main.cc -c

DST34.o: DST34.cc DST34.h
	$(CC) $(INC) DST34.cc -c

clean:
	rm -f ${TARGET} ${OBJS} *~

