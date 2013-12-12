MY_CORE_DIR=../../My_cores
XILINX_CORE_DIR=../../Xilinx_cores
SRC=${XILINX_CORE_DIR}/aurora/src/*.v ${XILINX_CORE_DIR}/aurora/cc_manager/*.v ../src/*.v 

TEST_MODULE=test_aurora
TEST_FILE=$(TEST_MODULE).v

OS_TYPE=lin64

LIB_INI=sim.libini

TCL_FILE=sim.tcl
RUN_TIME= all #10000ns

PRJ=sim.prj


$(LIB_INI):
	@if [ -f $(LIB_INI) ] ;\
		then [ ] ;\
	else \
		touch $(LIB_INI) ;\
		echo unisims_ver=$(XILINX)/verilog/hdp/$(OS_TYPE)/unisims_ver >> $(LIB_INI) ;\
		echo xilinxcorelib_ver=$(XILINX)/verilog/hdp/$(OS_TYPE)/xilinxcorelib_ver >> $(LIB_INI) ;\
		echo simprims_ver=$(XILINX)/verilog/hdp/$(OS_TYPE)/simprims_ver >> $(LIB_INI) ;\
		echo unimacro_ver=$(XILINX)/verilog/hdp/$(OS_TYPE)/unimacro_ver >> $(LIB_INI) ;\
		echo uni9000_ver=$(XILINX)/verilog/hdp/$(OS_TYPE)/uni9000_ver >> $(LIB_INI) ;\
		echo secureip=$(XILINX)/verilog/hdp/$(OS_TYPE)/xip/secureip >> $(LIB_INI) ;\
		echo work=./work >> $(LIB_INI) ;\
	fi

$(TCL_FILE):
	@if [ -f $(TCL_FILE) ] ;\
		then [ ] ;\
	else \
		touch $(TCL_FILE) ;\
		echo run $(RUN_TIME)>> $(TCL_FILE) ;\
		echo quit >> $(TCL_FILE) ;\
	fi 
	
$(PRJ):
	@if [ -f $(PRJ) ] ;\
		then [ ] ;\
	else \
		touch $(PRJ) ;\
		echo verilog work "$(XILINX)/verilog/src/glbl.v" >> $(PRJ) ;\
		for FILE in ${SRC} ;\
		do \
        		echo verilog work $$FILE >> $(PRJ) ;\
        	done ;\
		echo verilog work "./$(TEST_FILE)" >> $(PRJ) ;\
	fi

func_sim: $(TEST_FILE) $(SRC) $(PRJ) $(TCL_FILE) $(LIB_INI) 
	fuse work.$(TEST_MODULE) work.glbl -prj $(PRJ) -L work -L unisims_ver -L unimacro_ver -L xilinxcorelib_ver -L uni9000_ver -L secureip -incremental -o sim.exe
	sim.exe -tclbatch $(TCL_FILE)
	
clean_list= $(PRJ) $(TCL_FILE) $(LIB_INI) *.log isim *.cmd *.xmsgs *.wdb *.exe *.dat

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

