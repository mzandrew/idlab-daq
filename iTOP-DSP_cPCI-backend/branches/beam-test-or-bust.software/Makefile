OBJS = bin/cosmic bin/reset_trigger_flip_flop bin/readout_all_pending_data
CXXFLAGS = -D_FILE_OFFSET_BITS=64

default :
	if [ ! -e logdir  ]; then mkdir  logdir; fi
	if [ ! -e contrib ]; then mkdir contrib; fi
	if [ ! -e src     ]; then mkdir     src; fi
	if [ ! -e work    ]; then mkdir    work; fi
	if [ ! -e bin     ]; then mkdir     bin; fi
	$(MAKE) all

all : $(OBJS)

work/%.o : src/%.cpp
	g++ -c $< -o $@

bin/readout_all_pending_data : work/readout_all_pending_data.o contrib/stdPCI.o contrib/libaltix.so
	g++ -o $@ -L$(shell pwd)/contrib -laltix -Wl,-rpath,contrib work/readout_all_pending_data.o contrib/stdPCI.o

bin/cosmic: work/cosmic.o contrib/stdPCI.o contrib/libaltix.so
	g++  -o $@ -L$(shell pwd)/contrib -laltix -Wl,-rpath,contrib work/cosmic.o contrib/stdPCI.o

bin/reset_trigger_flip_flop : work/reset_trigger_flip_flop.o contrib/stdPCI.o contrib/libaltix.so
	g++ -o $@ -L$(shell pwd)/contrib -laltix -Wl,-rpath,contrib work/reset_trigger_flip_flop.o contrib/stdPCI.o

#contrib/libaltix.so:
#	cp ${HOME}/ku/libaltix/libaltix.so work/

#contrib/altix_userland.h:
#	cp ../libaltix/altix_userland.h contrib/

#contrib/libaltix.h:
#	cp ../libaltix/libaltix.h contrib/

clean: 
	-rm -rf work bin

