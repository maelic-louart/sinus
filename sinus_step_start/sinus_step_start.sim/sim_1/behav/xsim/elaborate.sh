#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2020.2 (64-bit)
#
# Filename    : elaborate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for elaborating the compiled design
#
# Generated by Vivado on Fri Jan 28 11:42:20 CET 2022
# SW Build 3064766 on Wed Nov 18 09:12:47 MST 2020
#
# Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
#
# usage: elaborate.sh
#
# ****************************************************************************
set -Eeuo pipefail
# elaborate design
echo "xelab -wto ac84847c4f51486095338b9ee11130ab --incr --debug typical --relax --mt 8 -L xil_defaultlib -L secureip -L xpm --snapshot design_1_tb_behav xil_defaultlib.design_1_tb -log elaborate.log"
xelab -wto ac84847c4f51486095338b9ee11130ab --incr --debug typical --relax --mt 8 -L xil_defaultlib -L secureip -L xpm --snapshot design_1_tb_behav xil_defaultlib.design_1_tb -log elaborate.log

