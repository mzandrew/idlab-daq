# Generated by the VisualDSP++ IDDE

# Note:  Any changes made to this Makefile will be lost the next time the
# matching project file is loaded into the IDDE.  If you wish to preserve
# changes, rename this file and run it externally to the IDDE.

# The syntax of this Makefile is such that GNU Make v3.77 or higher is
# required.

# The current working directory should be the directory in which this
# Makefile resides.

# Supported targets:
#     CoreB_Debug
#     CoreB_Debug_clean

# Define this variable if you wish to run this Makefile on a host
# other than the host that created it and VisualDSP++ may be installed
# in a different directory.

ADI_DSP=C:\Program Files\Analog Devices\VisualDSP 5.0


# $VDSP is a gmake-friendly version of ADI_DIR

empty:=
space:= $(empty) $(empty)
VDSP_INTERMEDIATE=$(subst \,/,$(ADI_DSP))
VDSP=$(subst $(space),\$(space),$(VDSP_INTERMEDIATE))

RM=cmd /C del /F /Q

#
# Begin "CoreB_Debug" configuration
#

ifeq ($(MAKECMDGOALS),CoreB_Debug)

CoreB_Debug : ../Debug/CoreB.dlb 

../Debug/CoreB.doj :CoreB.c $(VDSP)/Blackfin/include/cdefBf561.h $(VDSP)/Blackfin/include/defBF561.h $(VDSP)/Blackfin/include/def_LPBlackfin.h $(VDSP)/Blackfin/include/cdef_LPBlackfin.h $(VDSP)/Blackfin/include/ccblkfn.h $(VDSP)/Blackfin/include/stdlib.h $(VDSP)/Blackfin/include/yvals.h $(VDSP)/Blackfin/include/stdlib_bf.h $(VDSP)/Blackfin/include/builtins.h $(VDSP)/Blackfin/include/sys/builtins_support.h $(VDSP)/Blackfin/include/fract_typedef.h $(VDSP)/Blackfin/include/fr2x16_typedef.h $(VDSP)/Blackfin/include/r2x16_typedef.h $(VDSP)/Blackfin/include/raw_typedef.h $(VDSP)/Blackfin/include/sys/mc_typedef.h ../sml3/sml3.h ../sml3/../system.h ../sml3/../../src/dsp-fin-options.h ../sml3/../../src/datatypes.h ../sml3/../../src/numerical-recipes-in-c/nr.h $(VDSP)/Blackfin/include/stdio.h $(VDSP)/Blackfin/include/sys/stdio_bf.h ../sml3/../../src/numerical-recipes-in-c/nrutil.h ../sml2/l2.h 
	@echo ".\CoreB.c"
	$(VDSP)/ccblkfn.exe -c .\CoreB.c -file-attr ProjectName=CoreB -g -structs-do-not-overlap -no-multiline -double-size-32 -decls-strong -warn-protos -proc ADSP-BF561 -o ..\Debug\CoreB.doj -MM

../Debug/CoreB.dlb :../Debug/CoreB.doj 
	@echo "Creating library..."
	$(VDSP)/ccblkfn.exe -proc ADSP-BF561 -build-lib -o ..\Debug\CoreB.dlb ..\Debug\CoreB.doj -MM

endif

ifeq ($(MAKECMDGOALS),CoreB_Debug_clean)

CoreB_Debug_clean:
	-$(RM) "..\Debug\CoreB.doj"
	-$(RM) "..\Debug\CoreB.dlb"
	-$(RM) "..\Debug\*.ipa"
	-$(RM) "..\Debug\*.opa"
	-$(RM) "..\Debug\*.ti"
	-$(RM) "..\Debug\*.pgi"
	-$(RM) ".\*.rbld"

endif


