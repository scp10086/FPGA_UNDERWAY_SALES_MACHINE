----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2019/09/11 23:47:02
-- Design Name: 
-- Module Name: display - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity display is
 Port (clk:in std_logic;
       get_present_state:in std_logic_vector(3 downto 0);
       dispdata :out std_logic_vector(31 downto 0 );
       get_starting_line:in std_logic_vector(31 downto 0 );
       get_starting_point:in std_logic_vector(31 downto 0);
       get_end_line: in std_logic_vector(31 downto 0 );
       get_end_point :in std_logic_vector(31 downto 0 );
       get_price:in std_logic_vector(31 downto 0 );
       get_pay:in std_logic_vector(31 downto 0 );
       get_change:in std_logic_vector(31 downto 0 );
       get_refund:in std_logic_vector(31 downto 0 );
       get_amount:in std_logic_vector(31 downto 0 )
);
end display;

architecture Behavioral of display is

begin
process(clk,get_present_state)
begin
if (clk'event and clk='1') then

case get_present_state is

  when "0000"=> dispdata<= x"00000000";
  when "0001"=> dispdata<= get_starting_line;
  when "0010"=> dispdata<= get_starting_point;
  when "0011"=> dispdata<= get_end_line;
  when "0100"=> dispdata<= get_end_point;
  when "0001"=> dispdata<= get_starting_line;
  when "0010"=> dispdata<= get_starting_point;
  when "0011"=> dispdata<= get_end_line;
  when "0100"=> dispdata<= get_end_point;
end case;
end if;
end process;
end Behavioral;
