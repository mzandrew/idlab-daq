# things we always need built:
FINAL_OBJECT_FILES0 = bin/prerun bin/pedestal_run bin/laser bin/beamtest

# things we occasionally need:
FINAL_OBJECT_FILES1 = bin/turn_sampling_rate_feedback_off bin/turn_up_Vbias bin/turn_down_Vbias bin/request_a_global_reset bin/tell_status_of_signals bin/camac_only bin/readout_temperature_of_all_connected_modules bin/turn_all_DACs_to_nominal bin/turn_feedback_on bin/turn_feedback_off bin/turn_off_all_DACs bin/reset_trigger_flip_flop bin/readout_all_pending_data bin/set_look_back

# needed to link all:
INTERMEDIATE_OBJECT_FILES1 = work/status_file.o work/acquisition.o work/parse_config_file.o work/stdPCI.o work/pci.o work/command_packet_builder.o work/fiber_readout.o work/read_CAMAC.o work/DebugInfoWarningError.o

COMPILE_OPTIONS = -D_FILE_OFFSET_BITS=64
LINK_OPTIONS = -L$(shell pwd)/contrib -laltix -lxx_usb -lusb -Wl,-rpath,$(shell pwd)/contrib

first_time = 0

default :
	@if [ ! -e contrib ]; then mkdir contrib; fi
	@if [ ! -e src     ]; then mkdir     src; fi
	@if [ ! -e work    ]; then mkdir    work; fi
	@if [ ! -e bin     ]; then mkdir     bin; fi
	@$(MAKE) all
	@echo; echo "Successfully compiled readout software."; echo
	@$(MAKE) config --quiet

config:
	@if [ ! -e .config ]; then cp scripts/config.default .config; echo; echo "NOTICE:  customize \".config\" to control which DSP_cPCI card # is used, the enabled channels, where to keep the raw data, etc"; echo; fi
	@if [ ! -e data    ]; then mkdir    data; fi
	@if [ ! -e data/status  ]; then cp scripts/status.dummy data/status; echo; echo "NOTICE:  customize status file \"data/status\" to control exp. #, event #, etc"; echo; fi

all : $(FINAL_OBJECT_FILES0) $(FINAL_OBJECT_FILES1)

work/%.o : src/%.cpp
	g++ -c $(COMPILE_OPTIONS) $< -o $@

work/%.o : src/%.c
	g++ -c $(COMPILE_OPTIONS) $< -o $@

# fiber:

bin/laser : work/laser.o $(INTERMEDIATE_OBJECT_FILES1) $(INTERMEDIATE_OBJECT_FILES4); g++ $^ $(LINK_OPTIONS) -o $@

bin/prerun : work/prerun.o $(INTERMEDIATE_OBJECT_FILES1) $(INTERMEDIATE_OBJECT_FILES4) ; g++ $^ $(LINK_OPTIONS) -o $@

bin/beamtest : work/beamtest.o $(INTERMEDIATE_OBJECT_FILES1) $(INTERMEDIATE_OBJECT_FILES4) ; g++ $^ $(LINK_OPTIONS) -o $@

bin/pedestal_run : work/pedestal_run.o $(INTERMEDIATE_OBJECT_FILES1) ; g++ $^ $(LINK_OPTIONS) -o $@

# other:

bin/readout_temperature_of_all_connected_modules : work/readout_temperature_of_all_connected_modules.o $(INTERMEDIATE_OBJECT_FILES1) ; g++ $^ $(LINK_OPTIONS) -o $@

bin/turn_all_DACs_to_nominal : work/turn_all_DACs_to_nominal.o $(INTERMEDIATE_OBJECT_FILES1) ; g++ $^ $(LINK_OPTIONS) -o $@

bin/turn_feedback_on  : work/turn_feedback_on.o  $(INTERMEDIATE_OBJECT_FILES1) ; g++ $^ $(LINK_OPTIONS) -o $@

bin/turn_feedback_off : work/turn_feedback_off.o $(INTERMEDIATE_OBJECT_FILES1) ; g++ $^ $(LINK_OPTIONS) -o $@

bin/turn_off_all_DACs : work/turn_off_all_DACs.o $(INTERMEDIATE_OBJECT_FILES1) ; g++ $^ $(LINK_OPTIONS) -o $@

bin/set_look_back : work/set_look_back.o $(INTERMEDIATE_OBJECT_FILES1) ; g++ $^ $(LINK_OPTIONS) -o $@

bin/readout_all_pending_data : work/readout_all_pending_data.o $(INTERMEDIATE_OBJECT_FILES1) ; g++ $^ $(LINK_OPTIONS) -o $@

bin/reset_trigger_flip_flop : work/reset_trigger_flip_flop.o $(INTERMEDIATE_OBJECT_FILES1) ; g++ $^ $(LINK_OPTIONS) -o $@

bin/tell_status_of_signals : work/tell_status_of_signals.o $(INTERMEDIATE_OBJECT_FILES1) ; g++ $^ $(LINK_OPTIONS) -o $@

bin/request_a_global_reset : work/request_a_global_reset.o $(INTERMEDIATE_OBJECT_FILES1) ; g++ $^ $(LINK_OPTIONS) -o $@

bin/turn_down_Vbias : work/turn_down_Vbias.o $(INTERMEDIATE_OBJECT_FILES1) ; g++ $^ $(LINK_OPTIONS) -o $@

bin/turn_up_Vbias : work/turn_up_Vbias.o $(INTERMEDIATE_OBJECT_FILES1) ; g++ $^ $(LINK_OPTIONS) -o $@

bin/turn_sampling_rate_feedback_off : work/turn_sampling_rate_feedback_off.o $(INTERMEDIATE_OBJECT_FILES1); g++ $^ $(LINK_OPTIONS) -o $@

# camac:

bin/camac_only : work/camac_only.o $(INTERMEDIATE_OBJECT_FILES1) work/read_CAMAC.o ; g++ $^ $(LINK_OPTIONS) -o $@

# other:

bin/dual_readout : $(INTERMEDIATE_OBJECT_FILES2) work/fiber_readout.o ; g++ $^ $(LINK_OPTIONS) -o $@

bin/cosmic : work/cosmic.o $(INTERMEDIATE_OBJECT_FILES1) work/read_CAMAC.o ; g++ $^ $(LINK_OPTIONS) -o $@

bin/window_profiler : work/window_profiler.o $(INTERMEDIATE_OBJECT_FILES1) ; g++ $^ $(LINK_OPTIONS) -o $@

bin/threshold_tester : work/threshold_tester.o $(INTERMEDIATE_OBJECT_FILES1) ; g++ $^ $(LINK_OPTIONS) -o $@

bin/trigger_a_quarter_event_from_all_connected_modules : work/trigger_a_quarter_event_from_all_connected_modules.o $(INTERMEDIATE_OBJECT_FILES1) ; g++ $^ $(LINK_OPTIONS) -o $@

bin/shennanigans : work/shennanigans.o $(INTERMEDIATE_OBJECT_FILES1) $(INTERMEDIATE_OBJECT_FILES4) ; g++ $^ $(LINK_OPTIONS) -o $@

#bin/% : $(@:bin/%=work/%.o) $(INTERMEDIATE_OBJECT_FILES) ; g++ $^ $(@:bin/%=work/%.o) $(LINK_OPTIONS) -o $@

LOCATION_OF_ALTIX_SVN_ROOT=/root/altix2/

#contrib/libaltix.so:
#contrib/libaltix.h:
#contrib/altix_userland.h:

get_new_library_files:
	cp -a $(LOCATION_OF_ALTIX_SVN_ROOT)/uland/libaltix/altix_userland.h contrib/
	cp -a $(LOCATION_OF_ALTIX_SVN_ROOT)/uland/libaltix/libaltix.h contrib/
	cp -a $(LOCATION_OF_ALTIX_SVN_ROOT)/uland/libaltix/libaltix.so contrib/

clean: 
	-rm -rf work bin

# things we rarely use anymore:
FINAL_OBJECT_FILES5 = bin/threshold_tester bin/trigger_a_quarter_event_from_all_connected_modules bin/shennanigans bin/window_profiler bin/cosmic
INTERMEDIATE_OBJECT_FILES2 = work/stdPCI.o work/read_fiber.o work/read_CAMAC.o work/dual_readout.o work/acquisition.o
FINAL_OBJECT_FILES2 = bin/dual_readout
INTERMEDIATE_OBJECT_FILES4 = work/read_CAMAC.o
# work/camac.o
# for fiberscope:
FINAL_OBJECT_FILES3 = work/fiber_readout_swigwrapper.so 
#CXXFLAGS = -D_FILE_OFFSET_BITS=64
#LINK_OPTIONS = -L$(shell pwd)/contrib -laltix -lxxusb -Wl,-rpath,contrib 
# for Matsuoka-san's camac code:
#INC = -Icontrib
#CXXFLAGS = -O3 -Wall -fPIC -g $(INC)
#LIBDIR = /usr/lib/
#LIBS = -Wl,-rpath,$(LIBDIR) -L$(LIBDIR) -lxx_usb -lusb -lm
# Matsuoka-san's camac code:
#work/camac.o : src/camac.cc
#	g++ $(CXXFLAGS) -o $@ $< -c
#bin/camac : work/camac.o
#	g++ $(CXXFLAGS) -o $@ $< $(LIBS)
# other:
work/fiber_readout_swigwrapper.o work/fiber_readout_swigwrapper.so : scripts/fiberscope.swig-config $(INTERMEDIATE_OBJECT_FILES1) ; ./scripts/fiberscope.swig-build

