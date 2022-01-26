# This script segment is generated automatically by AutoPilot

# Memory (RAM/ROM)  definition:
set ID 1
set hasByteEnable 0
set MemName sinus_sin_table
set CoreName ap_simcore_mem
set PortList { 1 1 }
set DataWd 8
set AddrRange 65
set AddrWd 7
set impl_style auto
set TrueReset 0
set IsROM 1
set ROMData { "00000000" "00000011" "00000110" "00001001" "00001100" "00001111" "00010010" "00010101" "00011000" "00011100" "00011111" "00100010" "00100101" "00101000" "00101011" "00101110" "00110000" "00110011" "00110110" "00111001" "00111100" "00111111" "01000001" "01000100" "01000111" "01001001" "01001100" "01001110" "01010001" "01010011" "01010101" "01011000" "01011010" "01011100" "01011110" "01100000" "01100010" "01100100" "01100110" "01101000" "01101010" "01101100" "01101101" "01101111" "01110000" "01110010" "01110011" "01110101" "01110110" "01110111" "01111000" "01111001" "01111010" "01111011" "01111100" "01111100" "01111101" "01111110" "01111110" "01111111" "01111111" "01111111" "01111111" "01111111" "10000000" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set MaxLatency -1
set DelayBudget 0.569
set ClkPeriod 10
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 2 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    style ${impl_style} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName ROM
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 2 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    style ${impl_style} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

set axilite_register_dict [dict create]
# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2 \
    name start_r \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_start_r \
    op interface \
    ports { start_r { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3 \
    name step \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_step \
    op interface \
    ports { step { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4 \
    name signal_1_V \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_signal_1_V \
    op interface \
    ports { signal_1_V_din { O 32 vector } signal_1_V_full_n { I 1 bit } signal_1_V_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5 \
    name signal_2_V \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_signal_2_V \
    op interface \
    ports { signal_2_V_din { O 32 vector } signal_2_V_full_n { I 1 bit } signal_2_V_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


