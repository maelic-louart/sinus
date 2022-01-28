vlib work
vlib riviera

vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/sim/design_1.vhd" \
"../../../../sinus_step_start.gen/sources_1/bd/design_1/ipshared/8bfc/hdl/vhdl/sinus_regslice_both.vhd" \
"../../../../sinus_step_start.gen/sources_1/bd/design_1/ipshared/8bfc/hdl/vhdl/sinus_sin_table.vhd" \
"../../../../sinus_step_start.gen/sources_1/bd/design_1/ipshared/8bfc/hdl/vhdl/sinus.vhd" \
"../../../bd/design_1/ip/design_1_sinus_0_1/sim/design_1_sinus_0_1.vhd" \


