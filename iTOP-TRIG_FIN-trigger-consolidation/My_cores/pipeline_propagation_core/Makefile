# for synthesis
FAMILY=virtex4
DEVICE=xc4vfx40
PACKAGE=ff672
SPEED=-10

# for simulation
OS_TYPE=lin64
RUN_TIME=1000ns

SYN_DIR=syn
SIM_DIR=sim

synthesis:
	$(MAKE) -C $(SYN_DIR) FAMILY=$(FAMILY) DEVICE=$(DEVICE) PACKAGE=$(PACKAGE) SPEED=$(SPEED) syn

func_simulation:
	$(MAKE) -C $(SIM_DIR) OS_TYPE=$(OS_TYPE) RUN_TIME=$(RUN_TIME) func_sim 
clean:
	$(MAKE) -C $(SYN_DIR) clean
	$(MAKE) -C $(SIM_DIR) clean

