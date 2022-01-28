--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
--Date        : Fri Jan 28 11:08:38 2022
--Host        : louart-Latitude-5590 running 64-bit Linux Mint 20
--Command     : generate_target design_1_wrapper.bd
--Design      : design_1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_wrapper is
  port (
    angle_V_0_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    angle_V_0_tready : out STD_LOGIC;
    angle_V_0_tvalid : in STD_LOGIC;
    ap_clk_0 : in STD_LOGIC;
    ap_ctrl_0_done : out STD_LOGIC;
    ap_ctrl_0_idle : out STD_LOGIC;
    ap_ctrl_0_ready : out STD_LOGIC;
    ap_ctrl_0_start : in STD_LOGIC;
    ap_rst_n_0 : in STD_LOGIC;
    debug_0 : in STD_LOGIC;
    sinus_1_V_0_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    sinus_1_V_0_tready : in STD_LOGIC;
    sinus_1_V_0_tvalid : out STD_LOGIC;
    sinus_2_V_0_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    sinus_2_V_0_tready : in STD_LOGIC;
    sinus_2_V_0_tvalid : out STD_LOGIC;
    start_r_0 : in STD_LOGIC;
    step_0 : in STD_LOGIC
  );
end design_1_wrapper;

architecture STRUCTURE of design_1_wrapper is
  component design_1 is
  port (
    debug_0 : in STD_LOGIC;
    step_0 : in STD_LOGIC;
    ap_clk_0 : in STD_LOGIC;
    ap_rst_n_0 : in STD_LOGIC;
    start_r_0 : in STD_LOGIC;
    ap_ctrl_0_start : in STD_LOGIC;
    ap_ctrl_0_done : out STD_LOGIC;
    ap_ctrl_0_idle : out STD_LOGIC;
    ap_ctrl_0_ready : out STD_LOGIC;
    sinus_1_V_0_tvalid : out STD_LOGIC;
    sinus_1_V_0_tready : in STD_LOGIC;
    sinus_1_V_0_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    angle_V_0_tvalid : in STD_LOGIC;
    angle_V_0_tready : out STD_LOGIC;
    angle_V_0_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    sinus_2_V_0_tvalid : out STD_LOGIC;
    sinus_2_V_0_tready : in STD_LOGIC;
    sinus_2_V_0_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1;
begin
design_1_i: component design_1
     port map (
      angle_V_0_tdata(31 downto 0) => angle_V_0_tdata(31 downto 0),
      angle_V_0_tready => angle_V_0_tready,
      angle_V_0_tvalid => angle_V_0_tvalid,
      ap_clk_0 => ap_clk_0,
      ap_ctrl_0_done => ap_ctrl_0_done,
      ap_ctrl_0_idle => ap_ctrl_0_idle,
      ap_ctrl_0_ready => ap_ctrl_0_ready,
      ap_ctrl_0_start => ap_ctrl_0_start,
      ap_rst_n_0 => ap_rst_n_0,
      debug_0 => debug_0,
      sinus_1_V_0_tdata(31 downto 0) => sinus_1_V_0_tdata(31 downto 0),
      sinus_1_V_0_tready => sinus_1_V_0_tready,
      sinus_1_V_0_tvalid => sinus_1_V_0_tvalid,
      sinus_2_V_0_tdata(31 downto 0) => sinus_2_V_0_tdata(31 downto 0),
      sinus_2_V_0_tready => sinus_2_V_0_tready,
      sinus_2_V_0_tvalid => sinus_2_V_0_tvalid,
      start_r_0 => start_r_0,
      step_0 => step_0
    );
end STRUCTURE;
