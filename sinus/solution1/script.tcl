############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project sinus
set_top sinus
add_files sinus.cpp
add_files sinus.h
add_files -tb sinus_tb.cpp
open_solution "solution1" -flow_target vivado
set_part {xcvu37p-fsvh2892-2L-e}
create_clock -period 10 -name default
#source "./sinus/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl vhdl -format ip_catalog
