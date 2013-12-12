FAMILY=virtex4
DEVICE=xc4vfx40
PACKAGE=ff672
SPEED=-10

TOP_MODULE=top
UCF=../src/top.ucf
XCF=../src/top.xcf

PART_NUMBER=$(DEVICE)$(SPEED)$(PACKAGE)
PRJ=syn.prj

XILINX_CORE_DIR=../../Xilinx_cores
MY_CORE_DIR= ../../My_cores

TOP_NGC=${TOP_MODULE}.ngc
TOP_NGD=${TOP_MODULE}.ngd
TOP_PCF=${TOP_MODULE}.pcf
TOP_NCD=${TOP_MODULE}.ncd

SRC=${MY_CORE_DIR}/pipeline_minmax_core/src/pipeline_minmax_core.v ${MY_CORE_DIR}/pipeline_propagation_core/src/pipeline_propagation_core.v ${MY_CORE_DIR}/LUT_core.v ${XILINX_CORE_DIR}/*.v ../../trigger/src/*.v ${MY_CORE_DIR}/pipeline_sorting_core/src/pipeline_sorting_core.v ../../sorter/src/*.v ${XILINX_CORE_DIR}/aurora/src/*.v ${XILINX_CORE_DIR}/aurora/cc_manager/*.v ../../Aurora/src/*.v ../src/*.v

TMP_DIR=./tmp
TCLSH=syn.tclsh
SCR=syn.xst

WORK_DIR=./work

partgen: 
	partgen -intstyle silent -p $(PART_NUMBER)

$(TMP_DIR):
	@if [ -d $(TMP_DIR) ] ;\
                then echo "directory $(TMP_DIR) already exits" ;\
        else \
                echo "creating directory $(TMP_DIR)" ;\
                mkdir $(TMP_DIR) ;\
        fi
$(WORK_DIR):
	@if [ -d $(WORK_DIR) ] ;\
                then echo "directory $(WORK_DIR) already exits" ;\
        else \
                echo "creating directory $(WORK_DIR)" ;\
                mkdir $(WORK_DIR) ;\
        fi

$(PRJ): 
	@touch $(PRJ)
	@for FILE in $(SRC) ;\
	do \
	echo verilog work $$FILE >> $(PRJ) ;\
	done


$(SCR): $(PRJ) $(WORK_DIR) $(TMP_DIR)
	@if [ -f $(SCR) ] ;\
                then rm $(SCR) ;\
        fi
	@touch $(SCR)
	#
	@echo set >> $(SCR)
	@echo -tmpdir $(TMP_DIR) >> $(SCR)
	@echo -xsthdpdir $(WORK_DIR) >> $(SCR)
	#
	@echo elaborate >> $(SCR)
	@echo -ifn $(PRJ) >> $(SCR)
	@echo -ifmt mixed >> $(SCR)
	@echo -work_lib $(WORK_DIR) >> $(SCR)
	#
	@echo run >> $(SCR)
	@echo -ifn $(PRJ) >> $(SCR)
	@echo -ifmt mixed >> $(SCR)
	@echo -sd ${XILINX_CORE_DIR} >> $(SCR)
	@echo -read_cores optimize >> $(SCR) 
	@echo -top $(TOP_MODULE) >> $(SCR)
	@echo -ofn $(TOP_MODULE).ngc >> $(SCR)
	@echo -rtlview yes >> $(SCR)
	@echo -keep_hierarchy soft >> $(SCR)
	@echo -ofmt NGC >> $(SCR)
	@echo -p $(PART_NUMBER) >> $(SCR)
	@echo -opt_mode Speed >> $(SCR)
	@echo -opt_level 1 >> $(SCR)
	#


${TOP_NGC}: $(SCR) $(SRC)
	xst -ifn $(SCR)
	netgen -w -ofmt verilog ${TOP_NGC}

physical_design: ${TOP_NGC} 
	ngdbuild -uc ${UCF} ${TOP_NGC}
	map -cm balanced -logic_opt on -ol high -timing -w -xe n ${TOP_NGD}
	par -w -ol high -xe n ${TOP_NCD} ${TOP_MODULE}_route.ncd ${TOP_PCF}
	trce -e 10 -u 10 ${TOP_MODULE}_route.ncd ${TOP_PCF}
	@echo "*********************************************************************"
	@echo 
	@echo "Please check "${TOP_MODULE}_route.twr" for timing report ..."
	@echo "File "${TOP_MODULE}_route.ncd" is the final ncd file for bitgen ..."
	@echo
	@echo "*********************************************************************"
	
clean_list = $(TMP_DIR) $(WORK_DIR) _xmsgs $(SCR) $(PRJ) *.ngc *.lso *.srp *.xrpt *.xct *.xml *.pkg *.ngd *.ncd *.nlf *.pcf *.bld *.pad *.lst *.map *.mrp *.ngm *.ngr *.csv *.txt *.par *.ptwx *.twr *.twx *.unroutes *.xpi *.v xlnx_auto_0_xdb

clean:
	@for FILE in $(clean_list) ;\
        do \
        if [ -d $$FILE ] ;\
                then rm -f -r $$FILE ;\
                echo deleting dir $$FILE ;\
        fi ;\
        if [ -f $$FILE ] ;\
                then rm $$FILE ;\
                echo deleting file $$FILE ;\
        fi ;\
	done

