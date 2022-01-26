-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Version: 2020.2
-- Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sinus is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    start_r : IN STD_LOGIC;
    step : IN STD_LOGIC;
    signal_1_V_din : OUT STD_LOGIC_VECTOR (31 downto 0);
    signal_1_V_full_n : IN STD_LOGIC;
    signal_1_V_write : OUT STD_LOGIC;
    signal_2_V_din : OUT STD_LOGIC_VECTOR (31 downto 0);
    signal_2_V_full_n : IN STD_LOGIC;
    signal_2_V_write : OUT STD_LOGIC );
end;


architecture behav of sinus is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "sinus_sinus,hls_ip_2020_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcvu37p-fsvh2892-2L-e,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=2.899000,HLS_SYN_LAT=1,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=23,HLS_SYN_LUT=147,HLS_VERSION=2020_2}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv8_0 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv8_41 : STD_LOGIC_VECTOR (7 downto 0) := "01000001";
    constant ap_const_lv7_40 : STD_LOGIC_VECTOR (6 downto 0) := "1000000";
    constant ap_const_lv8_C0 : STD_LOGIC_VECTOR (7 downto 0) := "11000000";
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";
    constant ap_const_lv8_1 : STD_LOGIC_VECTOR (7 downto 0) := "00000001";

    signal ap_CS_fsm : STD_LOGIC_VECTOR (1 downto 0) := "01";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal guard_variable_for_sinus_bool_bool_stream_int_0_stream_int_0_start_tmp : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal start_tmp : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal n : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    signal sin_table_address0 : STD_LOGIC_VECTOR (6 downto 0);
    signal sin_table_ce0 : STD_LOGIC;
    signal sin_table_q0 : STD_LOGIC_VECTOR (7 downto 0);
    signal sin_table_address1 : STD_LOGIC_VECTOR (6 downto 0);
    signal sin_table_ce1 : STD_LOGIC;
    signal sin_table_q1 : STD_LOGIC_VECTOR (7 downto 0);
    signal signal_1_V_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal guard_variable_for_sinus_bool_bool_stream_int_0_stream_int_0_start_tmp_load_reg_250 : STD_LOGIC_VECTOR (0 downto 0);
    signal start_tmp_load_reg_254 : STD_LOGIC_VECTOR (0 downto 0);
    signal step_read_read_fu_54_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal start_read_read_fu_60_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal signal_2_V_blk_n : STD_LOGIC;
    signal guard_variable_for_sinus_bool_bool_stream_int_0_stream_int_0_start_tmp_load_load_fu_105_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal start_tmp_load_load_fu_121_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln13_fu_137_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln13_reg_261 : STD_LOGIC_VECTOR (0 downto 0);
    signal idxprom_i1_fu_167_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal idxprom_i4_fu_180_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal add_ln691_fu_231_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_predicate_op47_write_state2 : BOOLEAN;
    signal ap_predicate_op48_write_state2 : BOOLEAN;
    signal ap_block_state2 : BOOLEAN;
    signal sext_ln49_fu_225_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal trunc_ln5_1_fu_133_p1 : STD_LOGIC_VECTOR (5 downto 0);
    signal zext_ln18_fu_143_p1 : STD_LOGIC_VECTOR (6 downto 0);
    signal icmp_ln21_fu_153_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal idx_fu_147_p2 : STD_LOGIC_VECTOR (6 downto 0);
    signal idx_1_fu_159_p3 : STD_LOGIC_VECTOR (6 downto 0);
    signal trunc_ln5_fu_129_p1 : STD_LOGIC_VECTOR (6 downto 0);
    signal select_ln13_fu_172_p3 : STD_LOGIC_VECTOR (6 downto 0);
    signal tmp_fu_185_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal sub_ln31_fu_198_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal xor_ln17_fu_192_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln17_fu_212_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal zext_ln17_fu_208_p1 : STD_LOGIC_VECTOR (8 downto 0);
    signal sext_ln13_fu_204_p1 : STD_LOGIC_VECTOR (8 downto 0);
    signal signal_tmp_fu_217_p3 : STD_LOGIC_VECTOR (8 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_ce_reg : STD_LOGIC;

    component sinus_sin_table IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (6 downto 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR (7 downto 0);
        address1 : IN STD_LOGIC_VECTOR (6 downto 0);
        ce1 : IN STD_LOGIC;
        q1 : OUT STD_LOGIC_VECTOR (7 downto 0) );
    end component;



begin
    sin_table_U : component sinus_sin_table
    generic map (
        DataWidth => 8,
        AddressRange => 65,
        AddressWidth => 7)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => sin_table_address0,
        ce0 => sin_table_ce0,
        q0 => sin_table_q0,
        address1 => sin_table_address1,
        ce1 => sin_table_ce1,
        q1 => sin_table_q1);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_start = ap_const_logic_1) and (guard_variable_for_sinus_bool_bool_stream_int_0_stream_int_0_start_tmp_load_load_fu_105_p1 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                guard_variable_for_sinus_bool_bool_stream_int_0_stream_int_0_start_tmp <= ap_const_lv1_1;
                start_tmp <= (0=>start_r, others=>'-');
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                guard_variable_for_sinus_bool_bool_stream_int_0_stream_int_0_start_tmp_load_reg_250 <= guard_variable_for_sinus_bool_bool_stream_int_0_stream_int_0_start_tmp;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state1) and (((guard_variable_for_sinus_bool_bool_stream_int_0_stream_int_0_start_tmp_load_load_fu_105_p1 = ap_const_lv1_0) and (start_read_read_fu_60_p2 = ap_const_lv1_1) and (step_read_read_fu_54_p2 = ap_const_lv1_1)) or ((start_tmp_load_load_fu_121_p1 = ap_const_lv1_1) and (guard_variable_for_sinus_bool_bool_stream_int_0_stream_int_0_start_tmp_load_load_fu_105_p1 = ap_const_lv1_1) and (step_read_read_fu_54_p2 = ap_const_lv1_1))))) then
                icmp_ln13_reg_261 <= icmp_ln13_fu_137_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not((((signal_1_V_full_n = ap_const_logic_0) and (ap_predicate_op47_write_state2 = ap_const_boolean_1)) or ((signal_2_V_full_n = ap_const_logic_0) and (ap_predicate_op48_write_state2 = ap_const_boolean_1)))) and (ap_const_logic_1 = ap_CS_fsm_state2) and (((start_read_read_fu_60_p2 = ap_const_lv1_1) and (guard_variable_for_sinus_bool_bool_stream_int_0_stream_int_0_start_tmp_load_reg_250 = ap_const_lv1_0)) or ((start_tmp_load_reg_254 = ap_const_lv1_1) and (guard_variable_for_sinus_bool_bool_stream_int_0_stream_int_0_start_tmp_load_reg_250 = ap_const_lv1_1))))) then
                n <= add_ln691_fu_231_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((guard_variable_for_sinus_bool_bool_stream_int_0_stream_int_0_start_tmp_load_load_fu_105_p1 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                start_tmp_load_reg_254 <= start_tmp;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, signal_1_V_full_n, signal_2_V_full_n, ap_CS_fsm_state2, ap_predicate_op47_write_state2, ap_predicate_op48_write_state2)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if ((not((((signal_1_V_full_n = ap_const_logic_0) and (ap_predicate_op47_write_state2 = ap_const_boolean_1)) or ((signal_2_V_full_n = ap_const_logic_0) and (ap_predicate_op48_write_state2 = ap_const_boolean_1)))) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when others =>  
                ap_NS_fsm <= "XX";
        end case;
    end process;
    add_ln691_fu_231_p2 <= std_logic_vector(unsigned(n) + unsigned(ap_const_lv8_1));
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);

    ap_block_state2_assign_proc : process(signal_1_V_full_n, signal_2_V_full_n, ap_predicate_op47_write_state2, ap_predicate_op48_write_state2)
    begin
                ap_block_state2 <= (((signal_1_V_full_n = ap_const_logic_0) and (ap_predicate_op47_write_state2 = ap_const_boolean_1)) or ((signal_2_V_full_n = ap_const_logic_0) and (ap_predicate_op48_write_state2 = ap_const_boolean_1)));
    end process;


    ap_done_assign_proc : process(signal_1_V_full_n, signal_2_V_full_n, ap_CS_fsm_state2, ap_predicate_op47_write_state2, ap_predicate_op48_write_state2)
    begin
        if ((not((((signal_1_V_full_n = ap_const_logic_0) and (ap_predicate_op47_write_state2 = ap_const_boolean_1)) or ((signal_2_V_full_n = ap_const_logic_0) and (ap_predicate_op48_write_state2 = ap_const_boolean_1)))) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_predicate_op47_write_state2_assign_proc : process(guard_variable_for_sinus_bool_bool_stream_int_0_stream_int_0_start_tmp_load_reg_250, start_tmp_load_reg_254, step_read_read_fu_54_p2, start_read_read_fu_60_p2)
    begin
                ap_predicate_op47_write_state2 <= (((start_read_read_fu_60_p2 = ap_const_lv1_1) and (step_read_read_fu_54_p2 = ap_const_lv1_1) and (guard_variable_for_sinus_bool_bool_stream_int_0_stream_int_0_start_tmp_load_reg_250 = ap_const_lv1_0)) or ((step_read_read_fu_54_p2 = ap_const_lv1_1) and (start_tmp_load_reg_254 = ap_const_lv1_1) and (guard_variable_for_sinus_bool_bool_stream_int_0_stream_int_0_start_tmp_load_reg_250 = ap_const_lv1_1)));
    end process;


    ap_predicate_op48_write_state2_assign_proc : process(guard_variable_for_sinus_bool_bool_stream_int_0_stream_int_0_start_tmp_load_reg_250, start_tmp_load_reg_254, step_read_read_fu_54_p2, start_read_read_fu_60_p2)
    begin
                ap_predicate_op48_write_state2 <= (((start_read_read_fu_60_p2 = ap_const_lv1_1) and (step_read_read_fu_54_p2 = ap_const_lv1_1) and (guard_variable_for_sinus_bool_bool_stream_int_0_stream_int_0_start_tmp_load_reg_250 = ap_const_lv1_0)) or ((step_read_read_fu_54_p2 = ap_const_lv1_1) and (start_tmp_load_reg_254 = ap_const_lv1_1) and (guard_variable_for_sinus_bool_bool_stream_int_0_stream_int_0_start_tmp_load_reg_250 = ap_const_lv1_1)));
    end process;


    ap_ready_assign_proc : process(signal_1_V_full_n, signal_2_V_full_n, ap_CS_fsm_state2, ap_predicate_op47_write_state2, ap_predicate_op48_write_state2)
    begin
        if ((not((((signal_1_V_full_n = ap_const_logic_0) and (ap_predicate_op47_write_state2 = ap_const_boolean_1)) or ((signal_2_V_full_n = ap_const_logic_0) and (ap_predicate_op48_write_state2 = ap_const_boolean_1)))) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    guard_variable_for_sinus_bool_bool_stream_int_0_stream_int_0_start_tmp_load_load_fu_105_p1 <= guard_variable_for_sinus_bool_bool_stream_int_0_stream_int_0_start_tmp;
    icmp_ln13_fu_137_p2 <= "1" when (unsigned(n) < unsigned(ap_const_lv8_41)) else "0";
    icmp_ln21_fu_153_p2 <= "1" when (unsigned(n) < unsigned(ap_const_lv8_C0)) else "0";
    idx_1_fu_159_p3 <= 
        zext_ln18_fu_143_p1 when (icmp_ln21_fu_153_p2(0) = '1') else 
        idx_fu_147_p2;
    idx_fu_147_p2 <= std_logic_vector(signed(ap_const_lv7_40) - signed(zext_ln18_fu_143_p1));
    idxprom_i1_fu_167_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(idx_1_fu_159_p3),64));
    idxprom_i4_fu_180_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(select_ln13_fu_172_p3),64));
    or_ln17_fu_212_p2 <= (xor_ln17_fu_192_p2 or icmp_ln13_reg_261);
    select_ln13_fu_172_p3 <= 
        trunc_ln5_fu_129_p1 when (icmp_ln13_fu_137_p2(0) = '1') else 
        idx_fu_147_p2;
        sext_ln13_fu_204_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(sub_ln31_fu_198_p2),9));

        sext_ln49_fu_225_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(signal_tmp_fu_217_p3),32));


    signal_1_V_blk_n_assign_proc : process(signal_1_V_full_n, ap_CS_fsm_state2, guard_variable_for_sinus_bool_bool_stream_int_0_stream_int_0_start_tmp_load_reg_250, start_tmp_load_reg_254, step_read_read_fu_54_p2, start_read_read_fu_60_p2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) and (((start_read_read_fu_60_p2 = ap_const_lv1_1) and (step_read_read_fu_54_p2 = ap_const_lv1_1) and (guard_variable_for_sinus_bool_bool_stream_int_0_stream_int_0_start_tmp_load_reg_250 = ap_const_lv1_0)) or ((step_read_read_fu_54_p2 = ap_const_lv1_1) and (start_tmp_load_reg_254 = ap_const_lv1_1) and (guard_variable_for_sinus_bool_bool_stream_int_0_stream_int_0_start_tmp_load_reg_250 = ap_const_lv1_1))))) then 
            signal_1_V_blk_n <= signal_1_V_full_n;
        else 
            signal_1_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    signal_1_V_din <= sext_ln49_fu_225_p1;

    signal_1_V_write_assign_proc : process(signal_1_V_full_n, signal_2_V_full_n, ap_CS_fsm_state2, ap_predicate_op47_write_state2, ap_predicate_op48_write_state2)
    begin
        if ((not((((signal_1_V_full_n = ap_const_logic_0) and (ap_predicate_op47_write_state2 = ap_const_boolean_1)) or ((signal_2_V_full_n = ap_const_logic_0) and (ap_predicate_op48_write_state2 = ap_const_boolean_1)))) and (ap_const_logic_1 = ap_CS_fsm_state2) and (ap_predicate_op47_write_state2 = ap_const_boolean_1))) then 
            signal_1_V_write <= ap_const_logic_1;
        else 
            signal_1_V_write <= ap_const_logic_0;
        end if; 
    end process;


    signal_2_V_blk_n_assign_proc : process(signal_2_V_full_n, ap_CS_fsm_state2, guard_variable_for_sinus_bool_bool_stream_int_0_stream_int_0_start_tmp_load_reg_250, start_tmp_load_reg_254, step_read_read_fu_54_p2, start_read_read_fu_60_p2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) and (((start_read_read_fu_60_p2 = ap_const_lv1_1) and (step_read_read_fu_54_p2 = ap_const_lv1_1) and (guard_variable_for_sinus_bool_bool_stream_int_0_stream_int_0_start_tmp_load_reg_250 = ap_const_lv1_0)) or ((step_read_read_fu_54_p2 = ap_const_lv1_1) and (start_tmp_load_reg_254 = ap_const_lv1_1) and (guard_variable_for_sinus_bool_bool_stream_int_0_stream_int_0_start_tmp_load_reg_250 = ap_const_lv1_1))))) then 
            signal_2_V_blk_n <= signal_2_V_full_n;
        else 
            signal_2_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    signal_2_V_din <= sext_ln49_fu_225_p1;

    signal_2_V_write_assign_proc : process(signal_1_V_full_n, signal_2_V_full_n, ap_CS_fsm_state2, ap_predicate_op47_write_state2, ap_predicate_op48_write_state2)
    begin
        if ((not((((signal_1_V_full_n = ap_const_logic_0) and (ap_predicate_op47_write_state2 = ap_const_boolean_1)) or ((signal_2_V_full_n = ap_const_logic_0) and (ap_predicate_op48_write_state2 = ap_const_boolean_1)))) and (ap_const_logic_1 = ap_CS_fsm_state2) and (ap_predicate_op48_write_state2 = ap_const_boolean_1))) then 
            signal_2_V_write <= ap_const_logic_1;
        else 
            signal_2_V_write <= ap_const_logic_0;
        end if; 
    end process;

    signal_tmp_fu_217_p3 <= 
        zext_ln17_fu_208_p1 when (or_ln17_fu_212_p2(0) = '1') else 
        sext_ln13_fu_204_p1;
    sin_table_address0 <= idxprom_i4_fu_180_p1(7 - 1 downto 0);
    sin_table_address1 <= idxprom_i1_fu_167_p1(7 - 1 downto 0);

    sin_table_ce0_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            sin_table_ce0 <= ap_const_logic_1;
        else 
            sin_table_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    sin_table_ce1_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            sin_table_ce1 <= ap_const_logic_1;
        else 
            sin_table_ce1 <= ap_const_logic_0;
        end if; 
    end process;

    start_read_read_fu_60_p2 <= (0=>start_r, others=>'-');
    start_tmp_load_load_fu_121_p1 <= start_tmp;
    step_read_read_fu_54_p2 <= (0=>step, others=>'-');
    sub_ln31_fu_198_p2 <= std_logic_vector(unsigned(ap_const_lv8_0) - unsigned(sin_table_q1));
    tmp_fu_185_p3 <= n(7 downto 7);
    trunc_ln5_1_fu_133_p1 <= n(6 - 1 downto 0);
    trunc_ln5_fu_129_p1 <= n(7 - 1 downto 0);
    xor_ln17_fu_192_p2 <= (tmp_fu_185_p3 xor ap_const_lv1_1);
    zext_ln17_fu_208_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(sin_table_q0),9));
    zext_ln18_fu_143_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(trunc_ln5_1_fu_133_p1),7));
end behav;