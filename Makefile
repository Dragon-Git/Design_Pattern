all: simulate

NPROC := $(shell if command -v nproc >/dev/null 2>&1; then echo $$((`nproc`-1)); else echo 4; fi)

# -------------------------------------
# Testbench setup
# -------------------------------------
VERILATOR := verilator
ifdef VERILATOR_ROOT
VERILATOR := $(VERILATOR_ROOT)/bin/verilator
endif


SRC_FILES ?= src/creational_pattern/singleton.sv

# -------------------------------------
# Compilation/simulation configuration
# -------------------------------------
SIM_NAME = $(shell basename $(SRC_FILES) .sv)
SIM_DIR := $(SIM_NAME)-sim
COMPILE_ARGS += -DUVM_NO_DPI
COMPILE_ARGS += --prefix $(SIM_NAME) -o $(SIM_NAME)
EXTRA_ARGS += --timescale 1ns/1ps --error-limit 100
WARNING_ARGS += -Wno-lint \
	-Wno-style \
	-Wno-SYMRSVDWORD \
	-Wno-IGNOREDRETURN \
	-Wno-CONSTRAINTIGN \
	-Wno-ZERODLY

# -------------------------------------
# Make UVM test with Verilator
# -------------------------------------
$(SIM_DIR)/$(SIM_NAME).mk: $(wildcard hdl/*.sv)
	$(VERILATOR) --cc --exe --main --timing -Mdir $(SIM_DIR) \
	${COMPILE_ARGS} ${EXTRA_ARGS} \
	${SRC_FILES} \
	${WARNING_ARGS}

$(SIM_DIR)/$(SIM_NAME): $(SIM_DIR)/$(SIM_NAME).mk
	$(MAKE) -j${NPROC} -C $(SIM_DIR) $(BUILD_ARGS) -f $(SIM_NAME).mk

simulate: $(SIM_DIR)/$(SIM_NAME).mk $(SIM_DIR)/$(SIM_NAME)
	$(SIM_DIR)/$(SIM_NAME)

clean:
	rm -rf simv*.daidir csrc
	rm -rf csrc* simv*
	rm -rf *-sim


.PHONY: simulate clean