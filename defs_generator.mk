export _OUTPUT_DEFINES_SV_FILE?=./def.sv
define _get_all_variables
  $(filter-out .% _% CI%, $(foreach V, $(sort ${.VARIABLES}), $(if $(filter-out environment% default automatic, $(origin $V)), $V)))
endef

_A_1:=$(call _get_all_variables)
include ${_DEFINES_PATH_MK}
_A_2:=$(call _get_all_variables)

_DEFS_VARS:=$(filter-out ${_A_1},${_A_2})
$(info _DEFS_VARS=${_DEFS_VARS})
_DEFINES_V:=$(foreach i, ${_DEFS_VARS}, \`ifndef\#$i \`define\#$i\#$($i) \`endif\#//\#$i)
$(shell echo ${_DEFINES_V} | sed -r -e 's/[[:blank:]]+/\n/g' -e 's/`define/\  `define/g' -e 's/#/ /g' -e 's/[ ]*\\\//g' > ${_OUTPUT_DEFINES_SV_FILE})
