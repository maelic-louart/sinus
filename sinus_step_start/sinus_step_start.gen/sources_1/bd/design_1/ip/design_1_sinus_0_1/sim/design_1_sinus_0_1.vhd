-- (c) Copyright 1995-2022 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:hls:sinus:1.0
-- IP Revision: 2112281100

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY design_1_sinus_0_1 IS
  PORT (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    start_r : IN STD_LOGIC;
    debug : IN STD_LOGIC;
    step : IN STD_LOGIC;
    angle_V_TVALID : IN STD_LOGIC;
    angle_V_TREADY : OUT STD_LOGIC;
    angle_V_TDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    sinus_1_V_TVALID : OUT STD_LOGIC;
    sinus_1_V_TREADY : IN STD_LOGIC;
    sinus_1_V_TDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    sinus_2_V_TVALID : OUT STD_LOGIC;
    sinus_2_V_TREADY : IN STD_LOGIC;
    sinus_2_V_TDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END design_1_sinus_0_1;

ARCHITECTURE design_1_sinus_0_1_arch OF design_1_sinus_0_1 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_1_sinus_0_1_arch: ARCHITECTURE IS "yes";
  COMPONENT sinus IS
    PORT (
      ap_clk : IN STD_LOGIC;
      ap_rst_n : IN STD_LOGIC;
      ap_start : IN STD_LOGIC;
      ap_done : OUT STD_LOGIC;
      ap_idle : OUT STD_LOGIC;
      ap_ready : OUT STD_LOGIC;
      start_r : IN STD_LOGIC;
      debug : IN STD_LOGIC;
      step : IN STD_LOGIC;
      angle_V_TVALID : IN STD_LOGIC;
      angle_V_TREADY : OUT STD_LOGIC;
      angle_V_TDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      sinus_1_V_TVALID : OUT STD_LOGIC;
      sinus_1_V_TREADY : IN STD_LOGIC;
      sinus_1_V_TDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      sinus_2_V_TVALID : OUT STD_LOGIC;
      sinus_2_V_TREADY : IN STD_LOGIC;
      sinus_2_V_TDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
  END COMPONENT sinus;
  ATTRIBUTE SDX_KERNEL : STRING;
  ATTRIBUTE SDX_KERNEL OF sinus: COMPONENT IS "true";
  ATTRIBUTE SDX_KERNEL_TYPE : STRING;
  ATTRIBUTE SDX_KERNEL_TYPE OF sinus: COMPONENT IS "hls";
  ATTRIBUTE SDX_KERNEL_SIM_INST : STRING;
  ATTRIBUTE SDX_KERNEL_SIM_INST OF sinus: COMPONENT IS "U0";
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF design_1_sinus_0_1_arch: ARCHITECTURE IS "HLS";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF sinus_2_V_TDATA: SIGNAL IS "xilinx.com:interface:axis:1.0 sinus_2_V TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF sinus_2_V_TREADY: SIGNAL IS "xilinx.com:interface:axis:1.0 sinus_2_V TREADY";
  ATTRIBUTE X_INTERFACE_PARAMETER OF sinus_2_V_TVALID: SIGNAL IS "XIL_INTERFACENAME sinus_2_V, TDATA_NUM_BYTES 4, TUSER_WIDTH 0, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN design_1_ap_clk_0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF sinus_2_V_TVALID: SIGNAL IS "xilinx.com:interface:axis:1.0 sinus_2_V TVALID";
  ATTRIBUTE X_INTERFACE_INFO OF sinus_1_V_TDATA: SIGNAL IS "xilinx.com:interface:axis:1.0 sinus_1_V TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF sinus_1_V_TREADY: SIGNAL IS "xilinx.com:interface:axis:1.0 sinus_1_V TREADY";
  ATTRIBUTE X_INTERFACE_PARAMETER OF sinus_1_V_TVALID: SIGNAL IS "XIL_INTERFACENAME sinus_1_V, TDATA_NUM_BYTES 4, TUSER_WIDTH 0, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN design_1_ap_clk_0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF sinus_1_V_TVALID: SIGNAL IS "xilinx.com:interface:axis:1.0 sinus_1_V TVALID";
  ATTRIBUTE X_INTERFACE_INFO OF angle_V_TDATA: SIGNAL IS "xilinx.com:interface:axis:1.0 angle_V TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF angle_V_TREADY: SIGNAL IS "xilinx.com:interface:axis:1.0 angle_V TREADY";
  ATTRIBUTE X_INTERFACE_PARAMETER OF angle_V_TVALID: SIGNAL IS "XIL_INTERFACENAME angle_V, TDATA_NUM_BYTES 4, TUSER_WIDTH 0, LAYERED_METADATA undef, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN design_1_ap_clk_0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF angle_V_TVALID: SIGNAL IS "xilinx.com:interface:axis:1.0 angle_V TVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF step: SIGNAL IS "XIL_INTERFACENAME step, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF step: SIGNAL IS "xilinx.com:signal:data:1.0 step DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF debug: SIGNAL IS "XIL_INTERFACENAME debug, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF debug: SIGNAL IS "xilinx.com:signal:data:1.0 debug DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF start_r: SIGNAL IS "XIL_INTERFACENAME start_r, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF start_r: SIGNAL IS "xilinx.com:signal:data:1.0 start_r DATA";
  ATTRIBUTE X_INTERFACE_INFO OF ap_ready: SIGNAL IS "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ready";
  ATTRIBUTE X_INTERFACE_INFO OF ap_idle: SIGNAL IS "xilinx.com:interface:acc_handshake:1.0 ap_ctrl idle";
  ATTRIBUTE X_INTERFACE_INFO OF ap_done: SIGNAL IS "xilinx.com:interface:acc_handshake:1.0 ap_ctrl done";
  ATTRIBUTE X_INTERFACE_INFO OF ap_start: SIGNAL IS "xilinx.com:interface:acc_handshake:1.0 ap_ctrl start";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ap_rst_n: SIGNAL IS "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF ap_rst_n: SIGNAL IS "xilinx.com:signal:reset:1.0 ap_rst_n RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ap_clk: SIGNAL IS "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF angle_V:sinus_1_V:sinus_2_V, ASSOCIATED_RESET ap_rst_n, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN design_1_ap_clk_0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF ap_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 ap_clk CLK";
BEGIN
  U0 : sinus
    PORT MAP (
      ap_clk => ap_clk,
      ap_rst_n => ap_rst_n,
      ap_start => ap_start,
      ap_done => ap_done,
      ap_idle => ap_idle,
      ap_ready => ap_ready,
      start_r => start_r,
      debug => debug,
      step => step,
      angle_V_TVALID => angle_V_TVALID,
      angle_V_TREADY => angle_V_TREADY,
      angle_V_TDATA => angle_V_TDATA,
      sinus_1_V_TVALID => sinus_1_V_TVALID,
      sinus_1_V_TREADY => sinus_1_V_TREADY,
      sinus_1_V_TDATA => sinus_1_V_TDATA,
      sinus_2_V_TVALID => sinus_2_V_TVALID,
      sinus_2_V_TREADY => sinus_2_V_TREADY,
      sinus_2_V_TDATA => sinus_2_V_TDATA
    );
END design_1_sinus_0_1_arch;
