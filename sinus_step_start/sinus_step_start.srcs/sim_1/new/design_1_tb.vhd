----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.01.2022 08:47:14
-- Design Name: 
-- Module Name: design_1_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity design_1_tb is
--  Port ( );
end design_1_tb;

architecture Behavioral of design_1_tb is
component design_1_wrapper is
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
--    step_ap_vld_0 : in STD_LOGIC
  );
  end component;
  
  signal angle_V_0_tdata_s : STD_LOGIC_VECTOR ( 31 downto 0 );
signal angle_V_0_tready_s : STD_LOGIC;
signal angle_V_0_tvalid_s : STD_LOGIC:='0';
signal ap_clk_0_s : STD_LOGIC:='0';
signal ap_ctrl_0_done_s : STD_LOGIC;
signal ap_ctrl_0_idle_s : STD_LOGIC;
signal ap_ctrl_0_ready_s : STD_LOGIC;
signal ap_ctrl_0_start_s : STD_LOGIC:='0';
signal ap_rst_n_0_s : STD_LOGIC;
signal debug_0_s : STD_LOGIC:='0';
signal sinus_1_V_0_tdata_s : STD_LOGIC_VECTOR ( 31 downto 0 );
signal sinus_1_V_0_tready_s : STD_LOGIC:='0';
signal sinus_1_V_0_tvalid_s : STD_LOGIC;
signal sinus_2_V_0_tdata_s : STD_LOGIC_VECTOR ( 31 downto 0 );
signal sinus_2_V_0_tready_s : STD_LOGIC:='0';
signal sinus_2_V_0_tvalid_s : STD_LOGIC;
signal start_r_0_s : STD_LOGIC:='0';
signal step_0_s : STD_LOGIC;
--signal step_ap_vld_0_s : STD_LOGIC:='0';

 constant HALF_PERIOD : time := 10 ns;
   signal running : boolean := true;
   
    begin
UUT : design_1_wrapper
port map(
angle_V_0_tdata=>angle_V_0_tdata_s,
angle_V_0_tready=>angle_V_0_tready_s,
angle_V_0_tvalid=>angle_V_0_tvalid_s,
ap_clk_0=>ap_clk_0_s,
ap_ctrl_0_done=>ap_ctrl_0_done_s,
ap_ctrl_0_idle=>ap_ctrl_0_idle_s,
ap_ctrl_0_ready=>ap_ctrl_0_ready_s,
ap_ctrl_0_start=>ap_ctrl_0_start_s,
ap_rst_n_0=>ap_rst_n_0_s,
debug_0=>debug_0_s,
sinus_1_V_0_tdata=>sinus_1_V_0_tdata_s,
sinus_1_V_0_tready=>sinus_1_V_0_tready_s,
sinus_1_V_0_tvalid=>sinus_1_V_0_tvalid_s,
sinus_2_V_0_tdata=>sinus_2_V_0_tdata_s,
sinus_2_V_0_tready=>sinus_2_V_0_tready_s,
sinus_2_V_0_tvalid=>sinus_2_V_0_tvalid_s,
start_r_0=>start_r_0_s,
step_0=>step_0_s
--step_ap_vld_0=>step_ap_vld_0_s
);

 ap_clk_0_s <= not(ap_clk_0_s) after HALF_PERIOD when running else '0' ;
     ap_rst_n_0_s <= '0', '1' after 100 ns;
     
     design_2_tb : process
      begin
      wait until ap_rst_n_0_s='0';
     wait until ap_rst_n_0_s='1';
     wait until(rising_edge(ap_clk_0_s));
     
       ap_ctrl_0_start_s <= '1';
       sinus_1_V_0_tready_s <= '1';
       sinus_2_V_0_tready_s <= '1';
--       step_ap_vld_0_s  <='1';
       
        wait until(rising_edge(ap_clk_0_s));
        
        wait for 500 ns;
        
        wait until(rising_edge(ap_clk_0_s));
       
       start_r_0_s <='1';
       
       wait until(rising_edge(ap_clk_0_s));
       
       angle_V_0_tvalid_s<='1';
       angle_V_0_tdata_s<=std_logic_vector(to_unsigned(2,32));
       
       wait until(rising_edge(ap_clk_0_s));
       angle_V_0_tvalid_s<='0';
       
--       wait for 100 ns;
--       sinus_2_V_0_tready_s <= '1';
       
        wait until(rising_edge(ap_ctrl_0_done_s));
       
        loop1 : FOR i IN 2 TO 10 LOOP
       wait until(rising_edge(ap_clk_0_s));
       
           angle_V_0_tvalid_s<='1';
       angle_V_0_tdata_s<=std_logic_vector(to_unsigned(i,32));
       
       wait until(rising_edge(ap_clk_0_s));
       angle_V_0_tvalid_s<='0';
       
         if (i=5) then
        wait until(rising_edge(ap_clk_0_s));
        sinus_2_V_0_tready_s <= '0';
        wait for 100 ns;
--        wait until(rising_edge(ap_clk_0_s));
--        signal_sinus_V_0_tready_s <= '1';
       end if;
       
        if (i=6) then
        wait until(rising_edge(ap_clk_0_s));
        sinus_2_V_0_tready_s <= '1';
        wait for 100 ns;
        end if;
        
        if(i=7) then
        wait until(rising_edge(ap_clk_0_s));
        debug_0_s <='1';
         wait for 100 ns;
         wait until(rising_edge(ap_clk_0_s));
         step_0_s <='1';
         
         
         wait until(rising_edge(ap_clk_0_s));
         step_0_s <='0';
         end if;
         
         if(i>7) then
         wait until(rising_edge(ap_clk_0_s));
         step_0_s <='1';
         wait until(rising_edge(ap_clk_0_s));
         step_0_s <='0';
         end if;
         
        
        

--        wait until(rising_edge(ap_clk_0_s));
--        signal_sinus_V_0_tready_s <= '1';
   
       
       
       
        end loop loop1;
       
       
      wait for 300 ms;
      running <= false;
      wait ;
     
end process;

end behavioral;
