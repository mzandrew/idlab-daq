PACKET_FMT_VERSION=0


CPPFLAGS=-g -D_FILE_OFFSET_BITS=64 -DNO_CAMAC \
	-DPACKET_FMT_VERSION=$(PACKET_FMT_VERSION) -I$(HOME)/include \
	-I./src/lib -I./contrib

LDFLAGS=




#LIBSRCS=$(filter-out src/lib/pci.%, $(wildcard src/lib/*.cpp))

#ARCH=$(shell uname -p)-$(shell uname -r)
ARCH=
OBJDIR=obj/$(ARCH)/lib

LIBSRCS=src/lib/config_file.cpp src/lib/DebugInfoWarningError.cpp \
	src/lib/crtdaq-globals.cpp src/lib/cprdaq.cpp \
	src/lib/status_file.cpp src/lib/generic.cpp src/lib/logfile.cpp \
	src/lib/run_control.cpp src/lib/commands.cpp

ifeq "$(PACKET_FMT_VERSION)"  "0"
	LIBSRCS+=src/lib/packet_builder.cpp
else
	LIBSRCS+=src/lib/packet_interface.cpp
endif


LIBOBJS=$(patsubst src/lib/%.cpp, $(OBJDIR)/%.o, $(LIBSRCS))

EXEDIR=bin/$(ARCH)
EXESRCS=src/cwl_debug.cpp src/prerun_debug.cpp
EXES=$(patsubst src/%.cpp, $(EXEDIR)/%, $(EXESRCS))

all: $(EXES)

objs: $(LIBOBJS)

$(OBJDIR)/%.o: src/lib/%.cpp src/lib/%.h
	mkdir -p $(OBJDIR)
	g++ -c $(CPPFLAGS) $< -o $@

$(EXEDIR)/%: src/%.cpp $(LIBOBJS)
	mkdir -p $(EXEDIR)
	g++ $(CPPFLAGS) -o $@ $^ $(LDFLAGS)

.PHONY: all clean

clean:
	rm -f $(LIBOBJS) $(EXES)

