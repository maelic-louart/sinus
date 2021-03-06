
log_wave -r /
set designtopgroup [add_wave_group "Design Top Signals"]
set coutputgroup [add_wave_group "C Outputs" -into $designtopgroup]
set sinus_2_group [add_wave_group sinus_2(axis) -into $coutputgroup]
add_wave /apatb_sinus_top/AESL_inst_sinus/sinus_2_V_TREADY -into $sinus_2_group -color #ffff00 -radix hex
add_wave /apatb_sinus_top/AESL_inst_sinus/sinus_2_V_TVALID -into $sinus_2_group -color #ffff00 -radix hex
add_wave /apatb_sinus_top/AESL_inst_sinus/sinus_2_V_TDATA -into $sinus_2_group -radix hex
set sinus_1_group [add_wave_group sinus_1(axis) -into $coutputgroup]
add_wave /apatb_sinus_top/AESL_inst_sinus/sinus_1_V_TREADY -into $sinus_1_group -color #ffff00 -radix hex
add_wave /apatb_sinus_top/AESL_inst_sinus/sinus_1_V_TVALID -into $sinus_1_group -color #ffff00 -radix hex
add_wave /apatb_sinus_top/AESL_inst_sinus/sinus_1_V_TDATA -into $sinus_1_group -radix hex
set cinputgroup [add_wave_group "C Inputs" -into $designtopgroup]
set angle_group [add_wave_group angle(axis) -into $cinputgroup]
add_wave /apatb_sinus_top/AESL_inst_sinus/angle_V_TREADY -into $angle_group -color #ffff00 -radix hex
add_wave /apatb_sinus_top/AESL_inst_sinus/angle_V_TVALID -into $angle_group -color #ffff00 -radix hex
add_wave /apatb_sinus_top/AESL_inst_sinus/angle_V_TDATA -into $angle_group -radix hex
set step_group [add_wave_group step(wire) -into $cinputgroup]
add_wave /apatb_sinus_top/AESL_inst_sinus/step -into $step_group -radix hex
set debug_group [add_wave_group debug(wire) -into $cinputgroup]
add_wave /apatb_sinus_top/AESL_inst_sinus/debug -into $debug_group -radix hex
set start_group [add_wave_group start(wire) -into $cinputgroup]
add_wave /apatb_sinus_top/AESL_inst_sinus/start_r -into $start_group -radix hex
set blocksiggroup [add_wave_group "Block-level IO Handshake" -into $designtopgroup]
add_wave /apatb_sinus_top/AESL_inst_sinus/ap_start -into $blocksiggroup
add_wave /apatb_sinus_top/AESL_inst_sinus/ap_done -into $blocksiggroup
add_wave /apatb_sinus_top/AESL_inst_sinus/ap_idle -into $blocksiggroup
add_wave /apatb_sinus_top/AESL_inst_sinus/ap_ready -into $blocksiggroup
set resetgroup [add_wave_group "Reset" -into $designtopgroup]
add_wave /apatb_sinus_top/AESL_inst_sinus/ap_rst_n -into $resetgroup
set clockgroup [add_wave_group "Clock" -into $designtopgroup]
add_wave /apatb_sinus_top/AESL_inst_sinus/ap_clk -into $clockgroup
set testbenchgroup [add_wave_group "Test Bench Signals"]
set tbinternalsiggroup [add_wave_group "Internal Signals" -into $testbenchgroup]
set tb_simstatus_group [add_wave_group "Simulation Status" -into $tbinternalsiggroup]
set tb_portdepth_group [add_wave_group "Port Depth" -into $tbinternalsiggroup]
add_wave /apatb_sinus_top/AUTOTB_TRANSACTION_NUM -into $tb_simstatus_group -radix hex
add_wave /apatb_sinus_top/ready_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_sinus_top/done_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_sinus_top/LENGTH_start_r -into $tb_portdepth_group -radix hex
add_wave /apatb_sinus_top/LENGTH_debug -into $tb_portdepth_group -radix hex
add_wave /apatb_sinus_top/LENGTH_step -into $tb_portdepth_group -radix hex
add_wave /apatb_sinus_top/LENGTH_angle_V -into $tb_portdepth_group -radix hex
add_wave /apatb_sinus_top/LENGTH_sinus_1_V -into $tb_portdepth_group -radix hex
add_wave /apatb_sinus_top/LENGTH_sinus_2_V -into $tb_portdepth_group -radix hex
set tbcoutputgroup [add_wave_group "C Outputs" -into $testbenchgroup]
set tb_sinus_2_group [add_wave_group sinus_2(axis) -into $tbcoutputgroup]
add_wave /apatb_sinus_top/sinus_2_V_TREADY -into $tb_sinus_2_group -color #ffff00 -radix hex
add_wave /apatb_sinus_top/sinus_2_V_TVALID -into $tb_sinus_2_group -color #ffff00 -radix hex
add_wave /apatb_sinus_top/sinus_2_V_TDATA -into $tb_sinus_2_group -radix hex
set tb_sinus_1_group [add_wave_group sinus_1(axis) -into $tbcoutputgroup]
add_wave /apatb_sinus_top/sinus_1_V_TREADY -into $tb_sinus_1_group -color #ffff00 -radix hex
add_wave /apatb_sinus_top/sinus_1_V_TVALID -into $tb_sinus_1_group -color #ffff00 -radix hex
add_wave /apatb_sinus_top/sinus_1_V_TDATA -into $tb_sinus_1_group -radix hex
set tbcinputgroup [add_wave_group "C Inputs" -into $testbenchgroup]
set tb_angle_group [add_wave_group angle(axis) -into $tbcinputgroup]
add_wave /apatb_sinus_top/angle_V_TREADY -into $tb_angle_group -color #ffff00 -radix hex
add_wave /apatb_sinus_top/angle_V_TVALID -into $tb_angle_group -color #ffff00 -radix hex
add_wave /apatb_sinus_top/angle_V_TDATA -into $tb_angle_group -radix hex
set tb_step_group [add_wave_group step(wire) -into $tbcinputgroup]
add_wave /apatb_sinus_top/step -into $tb_step_group -radix hex
set tb_debug_group [add_wave_group debug(wire) -into $tbcinputgroup]
add_wave /apatb_sinus_top/debug -into $tb_debug_group -radix hex
set tb_start_group [add_wave_group start(wire) -into $tbcinputgroup]
add_wave /apatb_sinus_top/start_r -into $tb_start_group -radix hex
save_wave_config sinus.wcfg
run all
quit

