-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity sinus_sin_table_rom is 
    generic(
             DWIDTH     : integer := 8; 
             AWIDTH     : integer := 7; 
             MEM_SIZE    : integer := 65
    ); 
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          addr1      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce1       : in std_logic; 
          q1         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of sinus_sin_table_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
signal addr1_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000000", 1 => "00000011", 2 => "00000110", 3 => "00001001", 
    4 => "00001100", 5 => "00001111", 6 => "00010010", 7 => "00010101", 
    8 => "00011000", 9 => "00011100", 10 => "00011111", 11 => "00100010", 
    12 => "00100101", 13 => "00101000", 14 => "00101011", 15 => "00101110", 
    16 => "00110000", 17 => "00110011", 18 => "00110110", 19 => "00111001", 
    20 => "00111100", 21 => "00111111", 22 => "01000001", 23 => "01000100", 
    24 => "01000111", 25 => "01001001", 26 => "01001100", 27 => "01001110", 
    28 => "01010001", 29 => "01010011", 30 => "01010101", 31 => "01011000", 
    32 => "01011010", 33 => "01011100", 34 => "01011110", 35 => "01100000", 
    36 => "01100010", 37 => "01100100", 38 => "01100110", 39 => "01101000", 
    40 => "01101010", 41 => "01101100", 42 => "01101101", 43 => "01101111", 
    44 => "01110000", 45 => "01110010", 46 => "01110011", 47 => "01110101", 
    48 => "01110110", 49 => "01110111", 50 => "01111000", 51 => "01111001", 
    52 => "01111010", 53 => "01111011", 54 to 55=> "01111100", 56 => "01111101", 
    57 to 58=> "01111110", 59 to 63=> "01111111", 64 => "10000000" );


begin 


memory_access_guard_0: process (addr0) 
begin
      addr0_tmp <= addr0;
--synthesis translate_off
      if (CONV_INTEGER(addr0) > mem_size-1) then
           addr0_tmp <= (others => '0');
      else 
           addr0_tmp <= addr0;
      end if;
--synthesis translate_on
end process;

memory_access_guard_1: process (addr1) 
begin
      addr1_tmp <= addr1;
--synthesis translate_off
      if (CONV_INTEGER(addr1) > mem_size-1) then
           addr1_tmp <= (others => '0');
      else 
           addr1_tmp <= addr1;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(addr0_tmp)); 
        end if;
        if (ce1 = '1') then 
            q1 <= mem(CONV_INTEGER(addr1_tmp)); 
        end if;
    end if;
end process;

end rtl;

Library IEEE;
use IEEE.std_logic_1164.all;

entity sinus_sin_table is
    generic (
        DataWidth : INTEGER := 8;
        AddressRange : INTEGER := 65;
        AddressWidth : INTEGER := 7);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0);
        address1 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce1 : IN STD_LOGIC;
        q1 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of sinus_sin_table is
    component sinus_sin_table_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR;
            addr1 : IN STD_LOGIC_VECTOR;
            ce1 : IN STD_LOGIC;
            q1 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    sinus_sin_table_rom_U :  component sinus_sin_table_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0,
        addr1 => address1,
        ce1 => ce1,
        q1 => q1);

end architecture;


