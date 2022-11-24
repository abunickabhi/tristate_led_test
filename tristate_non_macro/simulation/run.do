quietly set ACTELLIBNAME ProASIC3E
quietly set PROJECT_DIR "D:/Codes_MEB/All_programs/A3PE1500/tristate_evalboard"

if {[file exists presynth/_info]} {
   echo "INFO: Simulation library presynth already exists"
} else {
   file delete -force presynth 
   vlib presynth
}
vmap presynth presynth
vmap proasic3e "D:/Microsemi/Designer/lib/modelsim/precompiled/vlog/proasic3e"

vlog -vlog01compat -work presynth "${PROJECT_DIR}/hdl/control_signal.v"
vlog -vlog01compat -work presynth "${PROJECT_DIR}/component/work/tristate_buff_led/tristate_buff_led.v"
vlog "+incdir+${PROJECT_DIR}/stimulus" -vlog01compat -work presynth "${PROJECT_DIR}/stimulus/tristate_testbench.v"

vsim -L proasic3e -L presynth  -t 1ps presynth.tristate_testbench
add wave /tristate_testbench/*
run 1000ns
