export A := PATH1
export B := PATH2
export C := PATH3
export D := PATH4
export E := ${A}.${B}.${C}.${D}

_B_NUM := 2
_D_NUM := 2
_LIST_B_IDX :=$(shell seq 0 $(shell expr ${_B_NUM} - 1))
_LIST_D_IDX :=$(shell seq 0 $(shell expr ${_D_NUM} - 1))

define _a_tmplt
a.b$(1).c.d$(2).e
endef
$(foreach i,${_LIST_B_IDX},$(foreach j,${_LIST_D_IDX},$(eval export A_$i_$j=$(call _a_tmplt,[$i],[$j]))))
export A_INDEXED:=$(call _a_tmplt,[Gi],[Gj])

_T_LIST := RED GREEN BLUE
_T_LIST_LOW:=$(shell echo ${_T_LIST} | tr A-Z a-z)
_T_NUM:=$(words ${_T_LIST})
_T_NUM_WIDX:=$(shell seq 1 $(shell expr ${_T_NUM}))
$(foreach i, ${_T_NUM_WIDX}, $(eval export A_$(word $i,${_T_LIST}):=a.b_$(word $i,${_T_LIST_LOW})))
