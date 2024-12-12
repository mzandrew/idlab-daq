# basic makefile

.LIBPATTERNS ="'lib%.so lib%.a' "

ARCH = `uname -i`
CXX   = gcc
FC		= g77
F90		= f90
RM		= rm -f
CC		= gcc-3.3

LD            = gcc-3.3
LDFLAGS       = -O
SOFLAGS       = -shared


CXXLIBDIRS	= -L./
CXXLIBS		= -lusb
INCLUDEDIRS 	= -I./../include/

CXXFLAGS      	= -Wall -fPIC -shared $(INCLUDEDIRS)

CFLAGS		+= $(INCLUDEDIRS) $(SOFLAG)
CFLAGS		+= $(CXXLIBDIRS) $(CXXLIBS)
LDFLAGS		= $(CXXFLAGS)

OBJ = libxx_usb.so

library: 
	$(CXX) $(CXXFLAGS) \
	$(CXXLIBS) $(CXXLIBDIRS) -o $(OBJ) libxxusb.c
	@echo "Done"


install:
	@cp ./../include/libxxusb.h /usr/include/.
ifeq ($(ARCH),x86_64)
	@cp $(OBJ) /usr/lib64/.
else
	@cp $(OBJ) /usr/lib/.
endif

clean:
	$(RM) $(OBJ) 

