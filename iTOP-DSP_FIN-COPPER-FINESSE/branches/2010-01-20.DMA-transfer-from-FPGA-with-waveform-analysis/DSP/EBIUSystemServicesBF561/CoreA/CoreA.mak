# Generated by the VisualDSP++ IDDE

# Note:  Any changes made to this Makefile will be lost the next time the
# matching project file is loaded into the IDDE.  If you wish to preserve
# changes, rename this file and run it externally to the IDDE.

# The syntax of this Makefile is such that GNU Make v3.77 or higher is
# required.

# The current working directory should be the directory in which this
# Makefile resides.

# Supported targets:
#     CoreA_Debug
#     CoreA_Debug_clean

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
# Begin "CoreA_Debug" configuration
#

ifeq ($(MAKECMDGOALS),CoreA_Debug)

CoreA_Debug : ../Debug/CoreA.dlb 

../Debug/buttons_and_leds.doj :../../src/buttons_and_leds.c $(VDSP)/Blackfin/include/ccblkfn.h $(VDSP)/Blackfin/include/stdlib.h $(VDSP)/Blackfin/include/yvals.h $(VDSP)/Blackfin/include/stdlib_bf.h $(VDSP)/Blackfin/include/builtins.h $(VDSP)/Blackfin/include/sys/builtins_support.h $(VDSP)/Blackfin/include/fract_typedef.h $(VDSP)/Blackfin/include/fr2x16_typedef.h $(VDSP)/Blackfin/include/r2x16_typedef.h $(VDSP)/Blackfin/include/raw_typedef.h $(VDSP)/Blackfin/include/sys/mc_typedef.h $(VDSP)/Blackfin/include/cdefBF561.h $(VDSP)/Blackfin/include/defBF561.h $(VDSP)/Blackfin/include/def_LPBlackfin.h $(VDSP)/Blackfin/include/cdef_LPBlackfin.h ../../src/buttons_and_leds.h 
	@echo "..\..\src\buttons_and_leds.c"
	$(VDSP)/ccblkfn.exe -c ..\..\src\buttons_and_leds.c -file-attr ProjectName=CoreA -O -Ov100 -g -save-temps -path-output ..\Debug -structs-do-not-overlap -no-multiline -double-size-32 -decls-strong -warn-protos -proc ADSP-BF561 -o ..\Debug\buttons_and_leds.doj -MM

../Debug/dma.doj :../../src/dma.c $(VDSP)/Blackfin/include/cdefBF561.h $(VDSP)/Blackfin/include/defBF561.h $(VDSP)/Blackfin/include/def_LPBlackfin.h $(VDSP)/Blackfin/include/cdef_LPBlackfin.h $(VDSP)/Blackfin/include/ccblkfn.h $(VDSP)/Blackfin/include/stdlib.h $(VDSP)/Blackfin/include/yvals.h $(VDSP)/Blackfin/include/stdlib_bf.h $(VDSP)/Blackfin/include/builtins.h $(VDSP)/Blackfin/include/sys/builtins_support.h $(VDSP)/Blackfin/include/fract_typedef.h $(VDSP)/Blackfin/include/fr2x16_typedef.h $(VDSP)/Blackfin/include/r2x16_typedef.h $(VDSP)/Blackfin/include/raw_typedef.h $(VDSP)/Blackfin/include/sys/mc_typedef.h ../system.h ../../src/dsp-fin-options.h ../../src/datatypes.h ../../src/numerical-recipes-in-c/nr.h $(VDSP)/Blackfin/include/stdio.h $(VDSP)/Blackfin/include/sys/stdio_bf.h ../../src/numerical-recipes-in-c/nrutil.h ../sml2/l2.h ../sml3/sml3.h ../../src/dma.h ../../src/debug.h 
	@echo "..\..\src\dma.c"
	$(VDSP)/ccblkfn.exe -c ..\..\src\dma.c -file-attr ProjectName=CoreA -O -Ov100 -g -save-temps -path-output ..\Debug -structs-do-not-overlap -no-multiline -double-size-32 -decls-strong -warn-protos -proc ADSP-BF561 -o ..\Debug\dma.doj -MM

../Debug/dsp-fin-process-waveform.doj :../../src/dsp-fin-process-waveform.c $(VDSP)/Blackfin/include/cdefBF561.h $(VDSP)/Blackfin/include/defBF561.h $(VDSP)/Blackfin/include/def_LPBlackfin.h $(VDSP)/Blackfin/include/cdef_LPBlackfin.h $(VDSP)/Blackfin/include/ccblkfn.h $(VDSP)/Blackfin/include/stdlib.h $(VDSP)/Blackfin/include/yvals.h $(VDSP)/Blackfin/include/stdlib_bf.h $(VDSP)/Blackfin/include/builtins.h $(VDSP)/Blackfin/include/sys/builtins_support.h $(VDSP)/Blackfin/include/fract_typedef.h $(VDSP)/Blackfin/include/fr2x16_typedef.h $(VDSP)/Blackfin/include/r2x16_typedef.h $(VDSP)/Blackfin/include/raw_typedef.h $(VDSP)/Blackfin/include/sys/mc_typedef.h ../../src/../EBIUSystemServicesBF561/system.h ../../src/../EBIUSystemServicesBF561/../src/dsp-fin-options.h ../../src/../EBIUSystemServicesBF561/../src/datatypes.h ../../src/../EBIUSystemServicesBF561/../src/numerical-recipes-in-c/nr.h $(VDSP)/Blackfin/include/stdio.h $(VDSP)/Blackfin/include/sys/stdio_bf.h ../../src/../EBIUSystemServicesBF561/../src/numerical-recipes-in-c/nrutil.h ../../src/generic.h ../../src/dsp-fin-options.h ../../src/dsp-fin-waveform-processing.h ../../src/dsp-fin-process-waveform.h ../../src/../EBIUSystemServicesBF561/CoreA/SL10.h ../../src/debug.h $(VDSP)/Blackfin/include/filter.h $(VDSP)/Blackfin/include/complex.h $(VDSP)/Blackfin/include/complex_typedef.h $(VDSP)/Blackfin/include/math.h $(VDSP)/Blackfin/include/ymath.h $(VDSP)/Blackfin/include/math_bf.h $(VDSP)/Blackfin/include/fract_math.h $(VDSP)/Blackfin/include/fr2x16_math.h $(VDSP)/Blackfin/include/fr2x16_base.h $(VDSP)/Blackfin/include/r2x16_base.h $(VDSP)/Blackfin/include/math_const.h $(VDSP)/Blackfin/include/float.h 
	@echo "..\..\src\dsp-fin-process-waveform.c"
	$(VDSP)/ccblkfn.exe -c ..\..\src\dsp-fin-process-waveform.c -file-attr ProjectName=CoreA -O -Ov100 -g -save-temps -path-output ..\Debug -structs-do-not-overlap -no-multiline -double-size-32 -decls-strong -warn-protos -proc ADSP-BF561 -o ..\Debug\dsp-fin-process-waveform.doj -MM

../Debug/dsp-fin-waveform-processing.doj :../../src/dsp-fin-waveform-processing.c $(VDSP)/Blackfin/include/cdefBF561.h $(VDSP)/Blackfin/include/defBF561.h $(VDSP)/Blackfin/include/def_LPBlackfin.h $(VDSP)/Blackfin/include/cdef_LPBlackfin.h $(VDSP)/Blackfin/include/ccblkfn.h $(VDSP)/Blackfin/include/stdlib.h $(VDSP)/Blackfin/include/yvals.h $(VDSP)/Blackfin/include/stdlib_bf.h $(VDSP)/Blackfin/include/builtins.h $(VDSP)/Blackfin/include/sys/builtins_support.h $(VDSP)/Blackfin/include/fract_typedef.h $(VDSP)/Blackfin/include/fr2x16_typedef.h $(VDSP)/Blackfin/include/r2x16_typedef.h $(VDSP)/Blackfin/include/raw_typedef.h $(VDSP)/Blackfin/include/sys/mc_typedef.h ../../src/../EBIUSystemServicesBF561/system.h ../../src/../EBIUSystemServicesBF561/../src/dsp-fin-options.h ../../src/../EBIUSystemServicesBF561/../src/datatypes.h ../../src/../EBIUSystemServicesBF561/../src/numerical-recipes-in-c/nr.h $(VDSP)/Blackfin/include/stdio.h $(VDSP)/Blackfin/include/sys/stdio_bf.h ../../src/../EBIUSystemServicesBF561/../src/numerical-recipes-in-c/nrutil.h ../../src/dsp-fin-waveform-processing.h ../../src/dsp-fin-process-waveform.h ../../src/dma.h 
	@echo "..\..\src\dsp-fin-waveform-processing.c"
	$(VDSP)/ccblkfn.exe -c ..\..\src\dsp-fin-waveform-processing.c -file-attr ProjectName=CoreA -O -Ov100 -g -save-temps -path-output ..\Debug -structs-do-not-overlap -no-multiline -double-size-32 -decls-strong -warn-protos -proc ADSP-BF561 -o ..\Debug\dsp-fin-waveform-processing.doj -MM

../Debug/fit.doj :../../src/numerical-recipes-in-c/fit.c $(VDSP)/Blackfin/include/math.h $(VDSP)/Blackfin/include/yvals.h $(VDSP)/Blackfin/include/ymath.h $(VDSP)/Blackfin/include/math_bf.h $(VDSP)/Blackfin/include/fract_typedef.h $(VDSP)/Blackfin/include/fract_math.h $(VDSP)/Blackfin/include/ccblkfn.h $(VDSP)/Blackfin/include/stdlib.h $(VDSP)/Blackfin/include/stdlib_bf.h $(VDSP)/Blackfin/include/builtins.h $(VDSP)/Blackfin/include/sys/builtins_support.h $(VDSP)/Blackfin/include/fr2x16_typedef.h $(VDSP)/Blackfin/include/r2x16_typedef.h $(VDSP)/Blackfin/include/raw_typedef.h $(VDSP)/Blackfin/include/sys/mc_typedef.h $(VDSP)/Blackfin/include/cdefBF561.h $(VDSP)/Blackfin/include/defBF561.h $(VDSP)/Blackfin/include/def_LPBlackfin.h $(VDSP)/Blackfin/include/cdef_LPBlackfin.h $(VDSP)/Blackfin/include/fr2x16_math.h $(VDSP)/Blackfin/include/fr2x16_base.h $(VDSP)/Blackfin/include/r2x16_base.h ../../src/numerical-recipes-in-c/nrutil.h ../../src/numerical-recipes-in-c/../datatypes.h 
	@echo "..\..\src\numerical-recipes-in-c\fit.c"
	$(VDSP)/ccblkfn.exe -c ..\..\src\numerical-recipes-in-c\fit.c -file-attr ProjectName=CoreA -O -Ov100 -g -save-temps -path-output ..\Debug -structs-do-not-overlap -no-multiline -double-size-32 -decls-strong -warn-protos -proc ADSP-BF561 -o ..\Debug\fit.doj -MM

../Debug/four1.doj :../../src/numerical-recipes-in-c/four1.c $(VDSP)/Blackfin/include/math.h $(VDSP)/Blackfin/include/yvals.h $(VDSP)/Blackfin/include/ymath.h $(VDSP)/Blackfin/include/math_bf.h $(VDSP)/Blackfin/include/fract_typedef.h $(VDSP)/Blackfin/include/fract_math.h $(VDSP)/Blackfin/include/ccblkfn.h $(VDSP)/Blackfin/include/stdlib.h $(VDSP)/Blackfin/include/stdlib_bf.h $(VDSP)/Blackfin/include/builtins.h $(VDSP)/Blackfin/include/sys/builtins_support.h $(VDSP)/Blackfin/include/fr2x16_typedef.h $(VDSP)/Blackfin/include/r2x16_typedef.h $(VDSP)/Blackfin/include/raw_typedef.h $(VDSP)/Blackfin/include/sys/mc_typedef.h $(VDSP)/Blackfin/include/cdefBF561.h $(VDSP)/Blackfin/include/defBF561.h $(VDSP)/Blackfin/include/def_LPBlackfin.h $(VDSP)/Blackfin/include/cdef_LPBlackfin.h $(VDSP)/Blackfin/include/fr2x16_math.h $(VDSP)/Blackfin/include/fr2x16_base.h $(VDSP)/Blackfin/include/r2x16_base.h 
	@echo "..\..\src\numerical-recipes-in-c\four1.c"
	$(VDSP)/ccblkfn.exe -c ..\..\src\numerical-recipes-in-c\four1.c -file-attr ProjectName=CoreA -O -Ov100 -g -save-temps -path-output ..\Debug -structs-do-not-overlap -no-multiline -double-size-32 -decls-strong -warn-protos -proc ADSP-BF561 -o ..\Debug\four1.doj -MM

../Debug/gammln.doj :../../src/numerical-recipes-in-c/gammln.c $(VDSP)/Blackfin/include/math.h $(VDSP)/Blackfin/include/yvals.h $(VDSP)/Blackfin/include/ymath.h $(VDSP)/Blackfin/include/math_bf.h $(VDSP)/Blackfin/include/fract_typedef.h $(VDSP)/Blackfin/include/fract_math.h $(VDSP)/Blackfin/include/ccblkfn.h $(VDSP)/Blackfin/include/stdlib.h $(VDSP)/Blackfin/include/stdlib_bf.h $(VDSP)/Blackfin/include/builtins.h $(VDSP)/Blackfin/include/sys/builtins_support.h $(VDSP)/Blackfin/include/fr2x16_typedef.h $(VDSP)/Blackfin/include/r2x16_typedef.h $(VDSP)/Blackfin/include/raw_typedef.h $(VDSP)/Blackfin/include/sys/mc_typedef.h $(VDSP)/Blackfin/include/cdefBF561.h $(VDSP)/Blackfin/include/defBF561.h $(VDSP)/Blackfin/include/def_LPBlackfin.h $(VDSP)/Blackfin/include/cdef_LPBlackfin.h $(VDSP)/Blackfin/include/fr2x16_math.h $(VDSP)/Blackfin/include/fr2x16_base.h $(VDSP)/Blackfin/include/r2x16_base.h 
	@echo "..\..\src\numerical-recipes-in-c\gammln.c"
	$(VDSP)/ccblkfn.exe -c ..\..\src\numerical-recipes-in-c\gammln.c -file-attr ProjectName=CoreA -O -Ov100 -g -save-temps -path-output ..\Debug -structs-do-not-overlap -no-multiline -double-size-32 -decls-strong -warn-protos -proc ADSP-BF561 -o ..\Debug\gammln.doj -MM

../Debug/gammq.doj :../../src/numerical-recipes-in-c/gammq.c 
	@echo "..\..\src\numerical-recipes-in-c\gammq.c"
	$(VDSP)/ccblkfn.exe -c ..\..\src\numerical-recipes-in-c\gammq.c -file-attr ProjectName=CoreA -O -Ov100 -g -save-temps -path-output ..\Debug -structs-do-not-overlap -no-multiline -double-size-32 -decls-strong -warn-protos -proc ADSP-BF561 -o ..\Debug\gammq.doj -MM

../Debug/gcf.doj :../../src/numerical-recipes-in-c/gcf.c $(VDSP)/Blackfin/include/math.h $(VDSP)/Blackfin/include/yvals.h $(VDSP)/Blackfin/include/ymath.h $(VDSP)/Blackfin/include/math_bf.h $(VDSP)/Blackfin/include/fract_typedef.h $(VDSP)/Blackfin/include/fract_math.h $(VDSP)/Blackfin/include/ccblkfn.h $(VDSP)/Blackfin/include/stdlib.h $(VDSP)/Blackfin/include/stdlib_bf.h $(VDSP)/Blackfin/include/builtins.h $(VDSP)/Blackfin/include/sys/builtins_support.h $(VDSP)/Blackfin/include/fr2x16_typedef.h $(VDSP)/Blackfin/include/r2x16_typedef.h $(VDSP)/Blackfin/include/raw_typedef.h $(VDSP)/Blackfin/include/sys/mc_typedef.h $(VDSP)/Blackfin/include/cdefBF561.h $(VDSP)/Blackfin/include/defBF561.h $(VDSP)/Blackfin/include/def_LPBlackfin.h $(VDSP)/Blackfin/include/cdef_LPBlackfin.h $(VDSP)/Blackfin/include/fr2x16_math.h $(VDSP)/Blackfin/include/fr2x16_base.h $(VDSP)/Blackfin/include/r2x16_base.h 
	@echo "..\..\src\numerical-recipes-in-c\gcf.c"
	$(VDSP)/ccblkfn.exe -c ..\..\src\numerical-recipes-in-c\gcf.c -file-attr ProjectName=CoreA -O -Ov100 -g -save-temps -path-output ..\Debug -structs-do-not-overlap -no-multiline -double-size-32 -decls-strong -warn-protos -proc ADSP-BF561 -o ..\Debug\gcf.doj -MM

../Debug/generic.doj :../../src/generic.c $(VDSP)/Blackfin/include/cdefBF561.h $(VDSP)/Blackfin/include/defBF561.h $(VDSP)/Blackfin/include/def_LPBlackfin.h $(VDSP)/Blackfin/include/cdef_LPBlackfin.h ../../src/generic.h 
	@echo "..\..\src\generic.c"
	$(VDSP)/ccblkfn.exe -c ..\..\src\generic.c -file-attr ProjectName=CoreA -O -Ov100 -g -save-temps -path-output ..\Debug -structs-do-not-overlap -no-multiline -double-size-32 -decls-strong -warn-protos -proc ADSP-BF561 -o ..\Debug\generic.doj -MM

../Debug/gser.doj :../../src/numerical-recipes-in-c/gser.c $(VDSP)/Blackfin/include/math.h $(VDSP)/Blackfin/include/yvals.h $(VDSP)/Blackfin/include/ymath.h $(VDSP)/Blackfin/include/math_bf.h $(VDSP)/Blackfin/include/fract_typedef.h $(VDSP)/Blackfin/include/fract_math.h $(VDSP)/Blackfin/include/ccblkfn.h $(VDSP)/Blackfin/include/stdlib.h $(VDSP)/Blackfin/include/stdlib_bf.h $(VDSP)/Blackfin/include/builtins.h $(VDSP)/Blackfin/include/sys/builtins_support.h $(VDSP)/Blackfin/include/fr2x16_typedef.h $(VDSP)/Blackfin/include/r2x16_typedef.h $(VDSP)/Blackfin/include/raw_typedef.h $(VDSP)/Blackfin/include/sys/mc_typedef.h $(VDSP)/Blackfin/include/cdefBF561.h $(VDSP)/Blackfin/include/defBF561.h $(VDSP)/Blackfin/include/def_LPBlackfin.h $(VDSP)/Blackfin/include/cdef_LPBlackfin.h $(VDSP)/Blackfin/include/fr2x16_math.h $(VDSP)/Blackfin/include/fr2x16_base.h $(VDSP)/Blackfin/include/r2x16_base.h 
	@echo "..\..\src\numerical-recipes-in-c\gser.c"
	$(VDSP)/ccblkfn.exe -c ..\..\src\numerical-recipes-in-c\gser.c -file-attr ProjectName=CoreA -O -Ov100 -g -save-temps -path-output ..\Debug -structs-do-not-overlap -no-multiline -double-size-32 -decls-strong -warn-protos -proc ADSP-BF561 -o ..\Debug\gser.doj -MM

../Debug/initialize_pll.doj :../../src/initialize_pll.c $(VDSP)/Blackfin/include/ccblkfn.h $(VDSP)/Blackfin/include/stdlib.h $(VDSP)/Blackfin/include/yvals.h $(VDSP)/Blackfin/include/stdlib_bf.h $(VDSP)/Blackfin/include/builtins.h $(VDSP)/Blackfin/include/sys/builtins_support.h $(VDSP)/Blackfin/include/fract_typedef.h $(VDSP)/Blackfin/include/fr2x16_typedef.h $(VDSP)/Blackfin/include/r2x16_typedef.h $(VDSP)/Blackfin/include/raw_typedef.h $(VDSP)/Blackfin/include/sys/mc_typedef.h $(VDSP)/Blackfin/include/cdefBF561.h $(VDSP)/Blackfin/include/defBF561.h $(VDSP)/Blackfin/include/def_LPBlackfin.h $(VDSP)/Blackfin/include/cdef_LPBlackfin.h ../../src/initialize_pll.h 
	@echo "..\..\src\initialize_pll.c"
	$(VDSP)/ccblkfn.exe -c ..\..\src\initialize_pll.c -file-attr ProjectName=CoreA -O -Ov100 -g -save-temps -path-output ..\Debug -structs-do-not-overlap -no-multiline -double-size-32 -decls-strong -warn-protos -proc ADSP-BF561 -o ..\Debug\initialize_pll.doj -MM

../Debug/initialize_ppi.doj :../../src/initialize_ppi.c $(VDSP)/Blackfin/include/ccblkfn.h $(VDSP)/Blackfin/include/stdlib.h $(VDSP)/Blackfin/include/yvals.h $(VDSP)/Blackfin/include/stdlib_bf.h $(VDSP)/Blackfin/include/builtins.h $(VDSP)/Blackfin/include/sys/builtins_support.h $(VDSP)/Blackfin/include/fract_typedef.h $(VDSP)/Blackfin/include/fr2x16_typedef.h $(VDSP)/Blackfin/include/r2x16_typedef.h $(VDSP)/Blackfin/include/raw_typedef.h $(VDSP)/Blackfin/include/sys/mc_typedef.h $(VDSP)/Blackfin/include/cdefBF561.h $(VDSP)/Blackfin/include/defBF561.h $(VDSP)/Blackfin/include/def_LPBlackfin.h $(VDSP)/Blackfin/include/cdef_LPBlackfin.h ../../src/initialize_ppi.h 
	@echo "..\..\src\initialize_ppi.c"
	$(VDSP)/ccblkfn.exe -c ..\..\src\initialize_ppi.c -file-attr ProjectName=CoreA -O -Ov100 -g -save-temps -path-output ..\Debug -structs-do-not-overlap -no-multiline -double-size-32 -decls-strong -warn-protos -proc ADSP-BF561 -o ..\Debug\initialize_ppi.doj -MM

../Debug/initialize_sdram.doj :../../src/initialize_sdram.c $(VDSP)/Blackfin/include/ccblkfn.h $(VDSP)/Blackfin/include/stdlib.h $(VDSP)/Blackfin/include/yvals.h $(VDSP)/Blackfin/include/stdlib_bf.h $(VDSP)/Blackfin/include/builtins.h $(VDSP)/Blackfin/include/sys/builtins_support.h $(VDSP)/Blackfin/include/fract_typedef.h $(VDSP)/Blackfin/include/fr2x16_typedef.h $(VDSP)/Blackfin/include/r2x16_typedef.h $(VDSP)/Blackfin/include/raw_typedef.h $(VDSP)/Blackfin/include/sys/mc_typedef.h $(VDSP)/Blackfin/include/cdefBF561.h $(VDSP)/Blackfin/include/defBF561.h $(VDSP)/Blackfin/include/def_LPBlackfin.h $(VDSP)/Blackfin/include/cdef_LPBlackfin.h ../../src/initialize_sdram.h ../../src/generic.h ../../src/../EBIUSystemServicesBF561/sml3/sml3.h ../../src/../EBIUSystemServicesBF561/sml3/../system.h ../../src/../EBIUSystemServicesBF561/sml3/../../src/dsp-fin-options.h ../../src/../EBIUSystemServicesBF561/sml3/../../src/datatypes.h ../../src/../EBIUSystemServicesBF561/sml3/../../src/numerical-recipes-in-c/nr.h $(VDSP)/Blackfin/include/stdio.h $(VDSP)/Blackfin/include/sys/stdio_bf.h ../../src/../EBIUSystemServicesBF561/sml3/../../src/numerical-recipes-in-c/nrutil.h 
	@echo "..\..\src\initialize_sdram.c"
	$(VDSP)/ccblkfn.exe -c ..\..\src\initialize_sdram.c -file-attr ProjectName=CoreA -O -Ov100 -g -save-temps -path-output ..\Debug -structs-do-not-overlap -no-multiline -double-size-32 -decls-strong -warn-protos -proc ADSP-BF561 -o ..\Debug\initialize_sdram.doj -MM

../Debug/main_core_a.doj :main_core_a.c $(VDSP)/Blackfin/include/stdlib.h $(VDSP)/Blackfin/include/yvals.h $(VDSP)/Blackfin/include/stdlib_bf.h $(VDSP)/Blackfin/include/stdio.h $(VDSP)/Blackfin/include/sys/stdio_bf.h $(VDSP)/Blackfin/include/sys/exception.h $(VDSP)/Blackfin/include/cdefBF561.h $(VDSP)/Blackfin/include/defBF561.h $(VDSP)/Blackfin/include/def_LPBlackfin.h $(VDSP)/Blackfin/include/cdef_LPBlackfin.h $(VDSP)/Blackfin/include/ccblkfn.h $(VDSP)/Blackfin/include/builtins.h $(VDSP)/Blackfin/include/sys/builtins_support.h $(VDSP)/Blackfin/include/fract_typedef.h $(VDSP)/Blackfin/include/fr2x16_typedef.h $(VDSP)/Blackfin/include/r2x16_typedef.h $(VDSP)/Blackfin/include/raw_typedef.h $(VDSP)/Blackfin/include/sys/mc_typedef.h $(VDSP)/Blackfin/include/signal.h $(VDSP)/Blackfin/include/sys/signal_bf.h ../system.h ../../src/dsp-fin-options.h ../../src/datatypes.h ../../src/numerical-recipes-in-c/nr.h ../../src/numerical-recipes-in-c/nrutil.h ../sml3/sml3.h ../sml2/l2.h ../../src/initialize_sdram.h ../../src/initialize_pll.h ../../src/initialize_ppi.h ../../src/buttons_and_leds.h ../../src/generic.h ../../src/dma.h ../../src/dsp-fin-waveform-processing.h 
	@echo ".\main_core_a.c"
	$(VDSP)/ccblkfn.exe -c .\main_core_a.c -file-attr ProjectName=CoreA -O -Ov100 -g -save-temps -path-output ..\Debug -structs-do-not-overlap -no-multiline -double-size-32 -decls-strong -warn-protos -proc ADSP-BF561 -o ..\Debug\main_core_a.doj -MM

../Debug/nrutil.doj :../../src/numerical-recipes-in-c/nrutil.c $(VDSP)/Blackfin/include/stdio.h $(VDSP)/Blackfin/include/yvals.h $(VDSP)/Blackfin/include/sys/stdio_bf.h $(VDSP)/Blackfin/include/stddef.h $(VDSP)/Blackfin/include/stdlib.h $(VDSP)/Blackfin/include/stdlib_bf.h 
	@echo "..\..\src\numerical-recipes-in-c\nrutil.c"
	$(VDSP)/ccblkfn.exe -c ..\..\src\numerical-recipes-in-c\nrutil.c -file-attr ProjectName=CoreA -O -Ov100 -g -save-temps -path-output ..\Debug -structs-do-not-overlap -no-multiline -double-size-32 -decls-strong -warn-protos -proc ADSP-BF561 -o ..\Debug\nrutil.doj -MM

../Debug/realft.doj :../../src/numerical-recipes-in-c/realft.c $(VDSP)/Blackfin/include/math.h $(VDSP)/Blackfin/include/yvals.h $(VDSP)/Blackfin/include/ymath.h $(VDSP)/Blackfin/include/math_bf.h $(VDSP)/Blackfin/include/fract_typedef.h $(VDSP)/Blackfin/include/fract_math.h $(VDSP)/Blackfin/include/ccblkfn.h $(VDSP)/Blackfin/include/stdlib.h $(VDSP)/Blackfin/include/stdlib_bf.h $(VDSP)/Blackfin/include/builtins.h $(VDSP)/Blackfin/include/sys/builtins_support.h $(VDSP)/Blackfin/include/fr2x16_typedef.h $(VDSP)/Blackfin/include/r2x16_typedef.h $(VDSP)/Blackfin/include/raw_typedef.h $(VDSP)/Blackfin/include/sys/mc_typedef.h $(VDSP)/Blackfin/include/cdefBF561.h $(VDSP)/Blackfin/include/defBF561.h $(VDSP)/Blackfin/include/def_LPBlackfin.h $(VDSP)/Blackfin/include/cdef_LPBlackfin.h $(VDSP)/Blackfin/include/fr2x16_math.h $(VDSP)/Blackfin/include/fr2x16_base.h $(VDSP)/Blackfin/include/r2x16_base.h 
	@echo "..\..\src\numerical-recipes-in-c\realft.c"
	$(VDSP)/ccblkfn.exe -c ..\..\src\numerical-recipes-in-c\realft.c -file-attr ProjectName=CoreA -O -Ov100 -g -save-temps -path-output ..\Debug -structs-do-not-overlap -no-multiline -double-size-32 -decls-strong -warn-protos -proc ADSP-BF561 -o ..\Debug\realft.doj -MM

../Debug/SL10.doj :SL10.c SL10.h ../system.h ../../src/dsp-fin-options.h ../../src/datatypes.h ../../src/numerical-recipes-in-c/nr.h $(VDSP)/Blackfin/include/stdio.h $(VDSP)/Blackfin/include/yvals.h $(VDSP)/Blackfin/include/sys/stdio_bf.h ../../src/numerical-recipes-in-c/nrutil.h 
	@echo ".\SL10.c"
	$(VDSP)/ccblkfn.exe -c .\SL10.c -file-attr ProjectName=CoreA -O -Ov100 -g -save-temps -path-output ..\Debug -structs-do-not-overlap -no-multiline -double-size-32 -decls-strong -warn-protos -proc ADSP-BF561 -o ..\Debug\SL10.doj -MM

../Debug/waveform0.doj :waveform0.c 
	@echo ".\waveform0.c"
	$(VDSP)/ccblkfn.exe -c .\waveform0.c -file-attr ProjectName=CoreA -O -Ov100 -g -save-temps -path-output ..\Debug -structs-do-not-overlap -no-multiline -double-size-32 -decls-strong -warn-protos -proc ADSP-BF561 -o ..\Debug\waveform0.doj -MM

../Debug/xfit.doj :../../src/numerical-recipes-in-c/xfit.c ../../src/numerical-recipes-in-c/nr.h $(VDSP)/Blackfin/include/stdio.h $(VDSP)/Blackfin/include/yvals.h $(VDSP)/Blackfin/include/sys/stdio_bf.h ../../src/numerical-recipes-in-c/nrutil.h ../../src/numerical-recipes-in-c/../../EBIUSystemServicesBF561/system.h ../../src/numerical-recipes-in-c/../../EBIUSystemServicesBF561/../src/dsp-fin-options.h ../../src/numerical-recipes-in-c/../../EBIUSystemServicesBF561/../src/datatypes.h ../../src/numerical-recipes-in-c/../dsp-fin-waveform-processing.h ../../src/numerical-recipes-in-c/../dsp-fin-process-waveform.h 
	@echo "..\..\src\numerical-recipes-in-c\xfit.c"
	$(VDSP)/ccblkfn.exe -c ..\..\src\numerical-recipes-in-c\xfit.c -file-attr ProjectName=CoreA -O -Ov100 -g -save-temps -path-output ..\Debug -structs-do-not-overlap -no-multiline -double-size-32 -decls-strong -warn-protos -proc ADSP-BF561 -o ..\Debug\xfit.doj -MM

../Debug/xrealft.doj :../../src/numerical-recipes-in-c/xrealft.c $(VDSP)/Blackfin/include/stdio.h $(VDSP)/Blackfin/include/yvals.h $(VDSP)/Blackfin/include/sys/stdio_bf.h $(VDSP)/Blackfin/include/math.h $(VDSP)/Blackfin/include/ymath.h $(VDSP)/Blackfin/include/math_bf.h $(VDSP)/Blackfin/include/fract_typedef.h $(VDSP)/Blackfin/include/fract_math.h $(VDSP)/Blackfin/include/ccblkfn.h $(VDSP)/Blackfin/include/stdlib.h $(VDSP)/Blackfin/include/stdlib_bf.h $(VDSP)/Blackfin/include/builtins.h $(VDSP)/Blackfin/include/sys/builtins_support.h $(VDSP)/Blackfin/include/fr2x16_typedef.h $(VDSP)/Blackfin/include/r2x16_typedef.h $(VDSP)/Blackfin/include/raw_typedef.h $(VDSP)/Blackfin/include/sys/mc_typedef.h $(VDSP)/Blackfin/include/cdefBF561.h $(VDSP)/Blackfin/include/defBF561.h $(VDSP)/Blackfin/include/def_LPBlackfin.h $(VDSP)/Blackfin/include/cdef_LPBlackfin.h $(VDSP)/Blackfin/include/fr2x16_math.h $(VDSP)/Blackfin/include/fr2x16_base.h $(VDSP)/Blackfin/include/r2x16_base.h ../../src/numerical-recipes-in-c/nr.h ../../src/numerical-recipes-in-c/nrutil.h ../system.h ../../src/dsp-fin-options.h ../../src/datatypes.h 
	@echo "..\..\src\numerical-recipes-in-c\xrealft.c"
	$(VDSP)/ccblkfn.exe -c ..\..\src\numerical-recipes-in-c\xrealft.c -file-attr ProjectName=CoreA -O -Ov100 -g -save-temps -path-output ..\Debug -structs-do-not-overlap -no-multiline -double-size-32 -decls-strong -warn-protos -proc ADSP-BF561 -o ..\Debug\xrealft.doj -MM

../Debug/CoreA.dlb :../Debug/buttons_and_leds.doj ../Debug/dma.doj ../Debug/dsp-fin-process-waveform.doj ../Debug/dsp-fin-waveform-processing.doj ../Debug/fit.doj ../Debug/four1.doj ../Debug/gammln.doj ../Debug/gammq.doj ../Debug/gcf.doj ../Debug/generic.doj ../Debug/gser.doj ../Debug/initialize_pll.doj ../Debug/initialize_ppi.doj ../Debug/initialize_sdram.doj ../Debug/main_core_a.doj ../Debug/nrutil.doj ../Debug/realft.doj ../Debug/SL10.doj ../Debug/waveform0.doj ../Debug/xfit.doj ../Debug/xrealft.doj 
	@echo "Creating library..."
	$(VDSP)/ccblkfn.exe -proc ADSP-BF561 -build-lib -o ..\Debug\CoreA.dlb ..\Debug\buttons_and_leds.doj ..\Debug\dma.doj ..\Debug\dsp-fin-process-waveform.doj ..\Debug\dsp-fin-waveform-processing.doj ..\Debug\fit.doj ..\Debug\four1.doj ..\Debug\gammln.doj ..\Debug\gammq.doj ..\Debug\gcf.doj ..\Debug\generic.doj ..\Debug\gser.doj ..\Debug\initialize_pll.doj ..\Debug\initialize_ppi.doj ..\Debug\initialize_sdram.doj ..\Debug\main_core_a.doj ..\Debug\nrutil.doj ..\Debug\realft.doj ..\Debug\SL10.doj ..\Debug\waveform0.doj ..\Debug\xfit.doj ..\Debug\xrealft.doj -MM

endif

ifeq ($(MAKECMDGOALS),CoreA_Debug_clean)

CoreA_Debug_clean:
	-$(RM) "..\Debug\buttons_and_leds.doj"
	-$(RM) "..\Debug\dma.doj"
	-$(RM) "..\Debug\dsp-fin-process-waveform.doj"
	-$(RM) "..\Debug\dsp-fin-waveform-processing.doj"
	-$(RM) "..\Debug\fit.doj"
	-$(RM) "..\Debug\four1.doj"
	-$(RM) "..\Debug\gammln.doj"
	-$(RM) "..\Debug\gammq.doj"
	-$(RM) "..\Debug\gcf.doj"
	-$(RM) "..\Debug\generic.doj"
	-$(RM) "..\Debug\gser.doj"
	-$(RM) "..\Debug\initialize_pll.doj"
	-$(RM) "..\Debug\initialize_ppi.doj"
	-$(RM) "..\Debug\initialize_sdram.doj"
	-$(RM) "..\Debug\main_core_a.doj"
	-$(RM) "..\Debug\nrutil.doj"
	-$(RM) "..\Debug\realft.doj"
	-$(RM) "..\Debug\SL10.doj"
	-$(RM) "..\Debug\waveform0.doj"
	-$(RM) "..\Debug\xfit.doj"
	-$(RM) "..\Debug\xrealft.doj"
	-$(RM) "..\Debug\CoreA.dlb"
	-$(RM) "..\Debug\*.ipa"
	-$(RM) "..\Debug\*.opa"
	-$(RM) "..\Debug\*.ti"
	-$(RM) "..\Debug\*.pgi"
	-$(RM) ".\*.rbld"

endif


