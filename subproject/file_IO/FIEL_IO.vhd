----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2019/09/07 10:23:57
-- Design Name: 
-- Module Name: FIEL_IO - Behavioral
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
use IEEE.std_logic_textio.all;
use IEEE.std_logic_arith.all;
use IEEE.numeric_bit.all;
use IEEE.numeric_std.all;

library STD;
use STD.textio.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FIEL_IO is
  Port (
  clk : in std_logic;
  segg :out std_logic_vector(7 downto 0);
  an :out std_logic_vector(7 downto 0)
  
   );
end FIEL_IO;

architecture Behavioral of FIEL_IO is
component seven_segment_disp_0
port
 (
    clk :in std_logic;
    dispdata :in std_logic_vector(31 downto 0);
    seg_able :in std_logic_vector(7 downto 0);
    segg :out std_logic_vector(7 downto 0);
    an :out std_logic_vector(7 downto 0)
 );
end component;
signal disp_data_2 : std_logic_vector(31 downto 0);
signal seg_able_2 : std_logic_vector( 7 downto 0);

begin
seg_able_2 <= "11111111"; 
disp_data_2 <= x"abcdef12";
segment_disp_0 : seven_segment_disp_0
port map(
        clk => clk,
        dispdata =>  disp_data_2,
        seg_able =>  seg_able_2,
        segg => segg,
        an => an  
);
process( clk )
variable i :integer:=0;
file test_in : text;
variable line_in: line;
variable dat_in :std_logic_vector(31 downto 0);
begin
file_open(test_in,"D:\FPGArepro\FPGA_UNDERWAY_SALES_MACHINE\other\start_from_line1.txt",READ_MODE);
readline(test_in, line_in);
read(line_in, dat_in); 
disp_data_2 <= dat_in;
end process;
end Behavioral;
