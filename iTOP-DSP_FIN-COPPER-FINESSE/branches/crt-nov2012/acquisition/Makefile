CPPFLAGS=-g -D_FILE_OFFSET_BITS=64 -DNO_CAMAC -I$(HOME)/include \
	 -I./src/lib -I./contrib
LDFLAGS=

#LIBSRCS=$(filter-out src/lib/pci.%, $(wildcard src/lib/*.cpp))

LIBSRCS=src/lib/config_file.cpp src/lib/DebugInfoWarningError.cpp \
	src/lib/crtdaq-globals.cpp src/lib/cprdsp-fin-daq.cpp
LIBOBJS=$(patsubst src/lib/%.cpp, obj/lib/%.o, $(LIBSRCS))

EXESRCS=src/cwl_debug.cpp
EXES=$(patsubst src/%.cpp, bin/%, $(EXESRCS))

all: $(EXES)

objs: $(LIBOBJS)

obj/lib/%.o: src/lib/%.cpp src/lib/%.h
	g++ -c $(CPPFLAGS) $< -o $@

bin/%: src/%.cpp $(LIBOBJS)
	g++ $(CPPFLAGS) -o $@ $^ $(LDFLAGS)

.PHONY: all clean

clean:
	rm -f $(LIBOBJS) $(EXES)

