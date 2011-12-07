INTERMEDIATE_OBJECT_FILES1 = contrib/stdPCI.o work/pci.o work/command_packet_builder.o work/fiber_readout.o
FINAL_OBJECT_FILES1 = bin/camac_only bin/readout_temperature_of_all_connected_modules bin/turn_all_DACs_to_nominal bin/turn_feedback_on bin/turn_feedback_off bin/turn_off_all_DACs bin/window_profiler bin/cosmic bin/reset_trigger_flip_flop bin/readout_all_pending_data bin/trigger_a_quarter_event_from_all_connected_modules bin/threshold_tester bin/set_look_back

INTERMEDIATE_OBJECT_FILES2 = contrib/stdPCI.o work/read_fiber.o work/read_CAMAC.o work/dual_readout.o
FINAL_OBJECT_FILES2 = bin/dual_readout

FINAL_OBJECT_FILES3 = work/fiber_readout_swigwrapper.so 

#CXXFLAGS = -D_FILE_OFFSET_BITS=64
LINK_OPTIONS = -L$(shell pwd)/contrib -laltix -lxxusb -Wl,-rpath,contrib 

default :
	if [ ! -e logdir  ]; then mkdir  logdir; fi
	if [ ! -e contrib ]; then mkdir contrib; fi
	if [ ! -e src     ]; then mkdir     src; fi
	if [ ! -e work    ]; then mkdir    work; fi
	if [ ! -e bin     ]; then mkdir     bin; fi
	if [ ! -e .config ]; then cp scripts/config.default .config; fi
	$(MAKE) all

all : $(FINAL_OBJECT_FILES1) $(FINAL_OBJECT_FILES2) $(FINAL_OBJECT_FILES3)

work/%.o : src/%.cpp
	g++ -c $< -o $@

work/%.o : src/%.c
	g++ -c $< -o $@

# fiber:

bin/cosmic : work/cosmic.o $(INTERMEDIATE_OBJECT_FILES1) work/read_CAMAC.o ; g++ $^ $(LINK_OPTIONS) -o $@

bin/readout_temperature_of_all_connected_modules : work/readout_temperature_of_all_connected_modules.o $(INTERMEDIATE_OBJECT_FILES1) ; g++ $^ $(LINK_OPTIONS) -o $@

bin/turn_all_DACs_to_nominal : work/turn_all_DACs_to_nominal.o $(INTERMEDIATE_OBJECT_FILES1) ; g++ $^ $(LINK_OPTIONS) -o $@

bin/turn_feedback_on  : work/turn_feedback_on.o  $(INTERMEDIATE_OBJECT_FILES1) ; g++ $^ $(LINK_OPTIONS) -o $@

bin/turn_feedback_off : work/turn_feedback_off.o $(INTERMEDIATE_OBJECT_FILES1) ; g++ $^ $(LINK_OPTIONS) -o $@

bin/turn_off_all_DACs : work/turn_off_all_DACs.o $(INTERMEDIATE_OBJECT_FILES1) ; g++ $^ $(LINK_OPTIONS) -o $@

bin/window_profiler : work/window_profiler.o $(INTERMEDIATE_OBJECT_FILES1) ; g++ $^ $(LINK_OPTIONS) -o $@

bin/threshold_tester : work/threshold_tester.o $(INTERMEDIATE_OBJECT_FILES1) ; g++ $^ $(LINK_OPTIONS) -o $@

bin/set_look_back : work/set_look_back.o $(INTERMEDIATE_OBJECT_FILES1) ; g++ $^ $(LINK_OPTIONS) -o $@

bin/readout_all_pending_data : work/readout_all_pending_data.o $(INTERMEDIATE_OBJECT_FILES1) ; g++ $^ $(LINK_OPTIONS) -o $@

bin/reset_trigger_flip_flop : work/reset_trigger_flip_flop.o $(INTERMEDIATE_OBJECT_FILES1) ; g++ $^ $(LINK_OPTIONS) -o $@

bin/trigger_a_quarter_event_from_all_connected_modules : work/trigger_a_quarter_event_from_all_connected_modules.o $(INTERMEDIATE_OBJECT_FILES1) ; g++ $^ $(LINK_OPTIONS) -o $@

# camac:

bin/dual_readout : $(INTERMEDIATE_OBJECT_FILES2) ; g++ $^ $(LINK_OPTIONS) -o $@

bin/camac_only : work/camac_only.o $(INTERMEDIATE_OBJECT_FILES1) work/read_CAMAC.o ; g++ $^ $(LINK_OPTIONS) -o $@

# other:

work/fiber_readout_swigwrapper.o work/fiber_readout_swigwrapper.so : scripts/fiberscope.swig-config $(INTERMEDIATE_OBJECT_FILES1) ; ./scripts/fiberscope.swig-build

#bin/% : $(@:bin/%=work/%.o) $(INTERMEDIATE_OBJECT_FILES) ; g++ $^ $(@:bin/%=work/%.o) $(LINK_OPTIONS) -o $@

#contrib/libaltix.so:
#	cp ${HOME}/ku/libaltix/libaltix.so work/

#contrib/altix_userland.h:
#	cp ../libaltix/altix_userland.h contrib/

#contrib/libaltix.h:
#	cp ../libaltix/libaltix.h contrib/

clean: 
	-rm -rf work bin

