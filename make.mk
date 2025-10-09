export BUILD_DIR?=./
export PRJ_DIR?=
ifeq (${PRJ_DIR},)
  $(error Yuo Must Set PRJ_DIR)
endif
export OUTPUT_DEFINES_SV_FILE_NAME?=defs.sv
export _OUTPUT_DEFINES_SV_FILE_DIR?=${BUILD_DIR}
export _OUTPUT_DEFINES_SV_FILE?=${_OUTPUT_DEFINES_SV_FILE_DIR}/${OUTPUT_DEFINES_SV_FILE_NAME}
export _DEFINES_PATH_MK?=${PRJ_DIR}/defines.mk
export _DEFS_GEN_MK?=${PRJ_DIR}/defs_generator.mk

include ${_DEFS_GEN_MK}
 
run:
	vlog +incdir+${_OUTPUT_DEFINES_SV_FILE_DIR} +define+DEFS_SRC=${OUTPUT_DEFINES_SV_FILE_NAME} ${PRJ_DIR}/top_tb.sv
	vsim top_tb -c -do ${PRJ_DIR}/commands.tcl