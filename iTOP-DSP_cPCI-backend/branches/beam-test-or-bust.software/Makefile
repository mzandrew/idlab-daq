FINAL_OBJECT_FILES = bin/turn_off_all_DACs bin/window_profiler bin/cosmic bin/reset_trigger_flip_flop bin/readout_all_pending_data bin/trigger_a_quarter_event_from_all_connected_modules work/fiber_readout_swigwrapper.so 
INTERMEDIATE_OBJECT_FILES = contrib/stdPCI.o work/pci.o work/command_packet_builder.o work/fiber_readout.o
CXXFLAGS = -D_FILE_OFFSET_BITS=64

default :
	if [ ! -e logdir  ]; then mkdir  logdir; fi
	if [ ! -e contrib ]; then mkdir contrib; fi
	if [ ! -e src     ]; then mkdir     src; fi
	if [ ! -e work    ]; then mkdir    work; fi
	if [ ! -e bin     ]; then mkdir     bin; fi
	$(MAKE) all

all : $(FINAL_OBJECT_FILES)

work/%.o : src/%.cpp
	g++ -c $< -o $@

bin/turn_off_all_DACs : work/turn_off_all_DACs.o $(INTERMEDIATE_OBJECT_FILES) ; g++ -L$(shell pwd)/contrib -laltix -Wl,-rpath,contrib $^ -o $@

bin/window_profiler : work/window_profiler.o $(INTERMEDIATE_OBJECT_FILES) ; g++ -L$(shell pwd)/contrib -laltix -Wl,-rpath,contrib $^ -o $@

#bin/% : $(@:bin/%=work/%.o) $(INTERMEDIATE_OBJECT_FILES) ; g++ -L$(shell pwd)/contrib -laltix -Wl,-rpath,contrib $^ $(@:bin/%=work/%.o) -o $@


bin/cosmic                                             : work/cosmic.o                                             contrib/stdPCI.o work/pci.o work/command_packet_builder.o work/fiber_readout.o
	g++ -L$(shell pwd)/contrib -laltix -Wl,-rpath,contrib $^ -o $@

bin/readout_all_pending_data                           : work/readout_all_pending_data.o                           contrib/stdPCI.o work/pci.o work/command_packet_builder.o work/fiber_readout.o
	g++ -L$(shell pwd)/contrib -laltix -Wl,-rpath,contrib $^ -o $@

bin/reset_trigger_flip_flop                            : work/reset_trigger_flip_flop.o                            contrib/stdPCI.o work/pci.o work/command_packet_builder.o work/fiber_readout.o
	g++ -L$(shell pwd)/contrib -laltix -Wl,-rpath,contrib $^ -o $@

bin/trigger_a_quarter_event_from_all_connected_modules : work/trigger_a_quarter_event_from_all_connected_modules.o contrib/stdPCI.o work/pci.o work/command_packet_builder.o work/fiber_readout.o
	g++ -L$(shell pwd)/contrib -laltix -Wl,-rpath,contrib $^ -o $@

work/fiber_readout_swigwrapper.o work/fiber_readout_swigwrapper.so : scripts/fiberscope.swig-config work/pci.o work/fiber_readout.o work/command_packet_builder.o
	./scripts/fiberscope.swig-build

#contrib/libaltix.so:
#	cp ${HOME}/ku/libaltix/libaltix.so work/

#contrib/altix_userland.h:
#	cp ../libaltix/altix_userland.h contrib/

#contrib/libaltix.h:
#	cp ../libaltix/libaltix.h contrib/

clean: 
	-rm -rf work bin

