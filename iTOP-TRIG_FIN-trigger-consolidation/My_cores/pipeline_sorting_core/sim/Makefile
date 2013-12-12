SRC=../src/pipeline_sorting_core.v ../../pipeline_propagation_core/src/pipeline_propagation_core.v ../../beh_lib/heap_sort/src/heap_sort.v

TEST_MODULE=test_pipeline_sorting_core
TEST_FILE=$(TEST_MODULE).v

OS_TYPE=lin64

LIB_INI=sim.libini

TCL_FILE=sim.tcl
RUN_TIME=5000ns

PRJ=sim.prj

BASH_SCRIPT=compare.sh

BASH_PATH=/bin/bash

$(LIB_INI):
	@if [ -f $(LIB_INI) ] ;\
		then [ ] ;\
	else \
		touch $(LIB_INI) ;\
		echo unisims_ver=$(XILINX)/verilog/hdp/$(OS_TYPE)/unisims_ver >> $(LIB_INI) ;\
		echo xilinxcorelib_ver=$(XILINX)/verilog/hdp/$(OS_TYPE)/xilinxcorelib_ver >> $(LIB_INI) ;\
		echo simprims_ver=$(XILINX)/verilog/hdp/$(OS_TYPE)/simprims_ver >> $(LIB_INI) ;\
		echo unimacro_ver=$(XILINX)/verilog/hdp/$(OS_TYPE)/unimacro_ver >> $(LIB_INI) ;\
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

$(BASH_SCRIPT):
	@if [ -f $(BASH_SCRIPT) ] ;\
		then [ ] ;\
	else \
		touch $(BASH_SCRIPT) ;\
		echo 'sort raw.dat > raw_sorted.dat' >> $(BASH_SCRIPT) ;\
		echo 'diff raw_sorted.dat output.dat > diff.dat' >> $(BASH_SCRIPT) ;\
		echo 'echo "**************************************"' >> $(BASH_SCRIPT) ;\
		echo 'echo ""' >> $(BASH_SCRIPT) ;\
		echo 'line=`wc -l "diff.dat"`' >> $(BASH_SCRIPT) ;\
		echo "number=\`expr match \"\$$line\" '\\([0-9]*\\)'\`" >> $(BASH_SCRIPT) ;\
		echo 'if [[ "$$number" != "0" ]]' >> $(BASH_SCRIPT) ;\
		echo 'then echo "TEST FAILED!"' >> $(BASH_SCRIPT) ;\
		echo 'else echo "TEST PASSED!"' >> $(BASH_SCRIPT) ;\
		echo 'fi' >> $(BASH_SCRIPT) ;\
		echo 'echo "**************************************"' >> $(BASH_SCRIPT) ;\
		echo 'echo ""' >> $(BASH_SCRIPT) ;\
		echo 'echo ""' >> $(BASH_SCRIPT) ;\
	fi

	


func_sim: $(TEST_FILE) $(SRC) $(PRJ) $(TCL_FILE) $(LIB_INI) $(BASH_SCRIPT)
	fuse work.$(TEST_MODULE) work.glbl -prj $(PRJ) -L work -L unisims_ver -L unimacro_ver -L xilinxcorelib_ver -o sim.exe
	sim.exe -tclbatch $(TCL_FILE)
	echo $(BASH)
	${BASH_PATH} $(BASH_SCRIPT) 
	
clean_list= $(PRJ) $(TCL_FILE) $(LIB_INI) *.log isim *.cmd *.xmsgs *.wdb *.exe *.dat *.sh

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

