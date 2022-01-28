--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
--Date        : Fri Jan 28 11:08:38 2022
--Host        : louart-Latitude-5590 running 64-bit Linux Mint 20
--Command     : generate_target design_1.bd
--Design      : design_1
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1 is
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
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of design_1 : entity is "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=1,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of design_1 : entity is "design_1.hwdef";
end design_1;

architecture STRUCTURE of design_1 is
  component design_1_sinus_0_1 is
  port (
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    start_r : in STD_LOGIC;
    debug : in STD_LOGIC;
    step : in STD_LOGIC;
    angle_V_TVALID : in STD_LOGIC;
    angle_V_TREADY : out STD_LOGIC;
    angle_V_TDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    sinus_1_V_TVALID : out STD_LOGIC;
    sinus_1_V_TREADY : in STD_LOGIC;
    sinus_1_V_TDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    sinus_2_V_TVALID : out STD_LOGIC;
    sinus_2_V_TREADY : in STD_LOGIC;
    sinus_2_V_TDATA : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_sinus_0_1;
  signal angle_V_0_1_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal angle_V_0_1_TREADY : STD_LOGIC;
  signal angle_V_0_1_TVALID : STD_LOGIC;
  signal ap_clk_0_1 : STD_LOGIC;
  signal ap_ctrl_0_1_done : STD_LOGIC;
  signal ap_ctrl_0_1_idle : STD_LOGIC;
  signal ap_ctrl_0_1_ready : STD_LOGIC;
  signal ap_ctrl_0_1_start : STD_LOGIC;
  signal ap_rst_n_0_1 : STD_LOGIC;
  signal debug_0_1 : STD_LOGIC;
  signal sinus_0_sinus_1_V_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal sinus_0_sinus_1_V_TREADY : STD_LOGIC;
  signal sinus_0_sinus_1_V_TVALID : STD_LOGIC;
  signal sinus_0_sinus_2_V_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal sinus_0_sinus_2_V_TREADY : STD_LOGIC;
  signal sinus_0_sinus_2_V_TVALID : STD_LOGIC;
  signal start_r_0_1 : STD_LOGIC;
  signal step_0_1 : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of angle_V_0_tready : signal is "xilinx.com:interface:axis:1.0 angle_V_0 TREADY";
  attribute X_INTERFACE_INFO of angle_V_0_tvalid : signal is "xilinx.com:interface:axis:1.0 angle_V_0 TVALID";
  attribute X_INTERFACE_INFO of ap_clk_0 : signal is "xilinx.com:signal:clock:1.0 CLK.AP_CLK_0 CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of ap_clk_0 : signal is "XIL_INTERFACENAME CLK.AP_CLK_0, ASSOCIATED_BUSIF sinus_1_V_0:angle_V_0:sinus_2_V_0, ASSOCIATED_RESET ap_rst_n_0, CLK_DOMAIN design_1_ap_clk_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of ap_ctrl_0_done : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl_0 done";
  attribute X_INTERFACE_INFO of ap_ctrl_0_idle : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl_0 idle";
  attribute X_INTERFACE_INFO of ap_ctrl_0_ready : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl_0 ready";
  attribute X_INTERFACE_INFO of ap_ctrl_0_start : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl_0 start";
  attribute X_INTERFACE_INFO of ap_rst_n_0 : signal is "xilinx.com:signal:reset:1.0 RST.AP_RST_N_0 RST";
  attribute X_INTERFACE_PARAMETER of ap_rst_n_0 : signal is "XIL_INTERFACENAME RST.AP_RST_N_0, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of debug_0 : signal is "xilinx.com:signal:data:1.0 DATA.DEBUG_0 DATA";
  attribute X_INTERFACE_PARAMETER of debug_0 : signal is "XIL_INTERFACENAME DATA.DEBUG_0, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of sinus_1_V_0_tready : signal is "xilinx.com:interface:axis:1.0 sinus_1_V_0 TREADY";
  attribute X_INTERFACE_INFO of sinus_1_V_0_tvalid : signal is "xilinx.com:interface:axis:1.0 sinus_1_V_0 TVALID";
  attribute X_INTERFACE_INFO of sinus_2_V_0_tready : signal is "xilinx.com:interface:axis:1.0 sinus_2_V_0 TREADY";
  attribute X_INTERFACE_INFO of sinus_2_V_0_tvalid : signal is "xilinx.com:interface:axis:1.0 sinus_2_V_0 TVALID";
  attribute X_INTERFACE_INFO of start_r_0 : signal is "xilinx.com:signal:data:1.0 DATA.START_R_0 DATA";
  attribute X_INTERFACE_PARAMETER of start_r_0 : signal is "XIL_INTERFACENAME DATA.START_R_0, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of step_0 : signal is "xilinx.com:signal:data:1.0 DATA.STEP_0 DATA";
  attribute X_INTERFACE_PARAMETER of step_0 : signal is "XIL_INTERFACENAME DATA.STEP_0, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of angle_V_0_tdata : signal is "xilinx.com:interface:axis:1.0 angle_V_0 TDATA";
  attribute X_INTERFACE_PARAMETER of angle_V_0_tdata : signal is "XIL_INTERFACENAME angle_V_0, CLK_DOMAIN design_1_ap_clk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of sinus_1_V_0_tdata : signal is "xilinx.com:interface:axis:1.0 sinus_1_V_0 TDATA";
  attribute X_INTERFACE_PARAMETER of sinus_1_V_0_tdata : signal is "XIL_INTERFACENAME sinus_1_V_0, CLK_DOMAIN design_1_ap_clk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of sinus_2_V_0_tdata : signal is "xilinx.com:interface:axis:1.0 sinus_2_V_0 TDATA";
  attribute X_INTERFACE_PARAMETER of sinus_2_V_0_tdata : signal is "XIL_INTERFACENAME sinus_2_V_0, CLK_DOMAIN design_1_ap_clk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
begin
  angle_V_0_1_TDATA(31 downto 0) <= angle_V_0_tdata(31 downto 0);
  angle_V_0_1_TVALID <= angle_V_0_tvalid;
  angle_V_0_tready <= angle_V_0_1_TREADY;
  ap_clk_0_1 <= ap_clk_0;
  ap_ctrl_0_1_start <= ap_ctrl_0_start;
  ap_ctrl_0_done <= ap_ctrl_0_1_done;
  ap_ctrl_0_idle <= ap_ctrl_0_1_idle;
  ap_ctrl_0_ready <= ap_ctrl_0_1_ready;
  ap_rst_n_0_1 <= ap_rst_n_0;
  debug_0_1 <= debug_0;
  sinus_0_sinus_1_V_TREADY <= sinus_1_V_0_tready;
  sinus_0_sinus_2_V_TREADY <= sinus_2_V_0_tready;
  sinus_1_V_0_tdata(31 downto 0) <= sinus_0_sinus_1_V_TDATA(31 downto 0);
  sinus_1_V_0_tvalid <= sinus_0_sinus_1_V_TVALID;
  sinus_2_V_0_tdata(31 downto 0) <= sinus_0_sinus_2_V_TDATA(31 downto 0);
  sinus_2_V_0_tvalid <= sinus_0_sinus_2_V_TVALID;
  start_r_0_1 <= start_r_0;
  step_0_1 <= step_0;
sinus_0: component design_1_sinus_0_1
     port map (
      angle_V_TDATA(31 downto 0) => angle_V_0_1_TDATA(31 downto 0),
      angle_V_TREADY => angle_V_0_1_TREADY,
      angle_V_TVALID => angle_V_0_1_TVALID,
      ap_clk => ap_clk_0_1,
      ap_done => ap_ctrl_0_1_done,
      ap_idle => ap_ctrl_0_1_idle,
      ap_ready => ap_ctrl_0_1_ready,
      ap_rst_n => ap_rst_n_0_1,
      ap_start => ap_ctrl_0_1_start,
      debug => debug_0_1,
      sinus_1_V_TDATA(31 downto 0) => sinus_0_sinus_1_V_TDATA(31 downto 0),
      sinus_1_V_TREADY => sinus_0_sinus_1_V_TREADY,
      sinus_1_V_TVALID => sinus_0_sinus_1_V_TVALID,
      sinus_2_V_TDATA(31 downto 0) => sinus_0_sinus_2_V_TDATA(31 downto 0),
      sinus_2_V_TREADY => sinus_0_sinus_2_V_TREADY,
      sinus_2_V_TVALID => sinus_0_sinus_2_V_TVALID,
      start_r => start_r_0_1,
      step => step_0_1
    );
end STRUCTURE;
