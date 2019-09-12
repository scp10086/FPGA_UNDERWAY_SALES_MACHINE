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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
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
       get_ticket_price:in std_logic_vector(31 downto 0 );
       get_real_pay:in std_logic_vector(31 downto 0 );
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
  when "0001"=> dispdata<= get_starting_line + "00010000000000000000000000000000" ;
  when "0010"=> dispdata<= get_starting_point + "00100000000000000000000000000000";
  when "0011"=> dispdata<= get_ticket_price+ "00110000000000000000000000000000";
  when "0100"=> dispdata<= get_end_line+ "01000000000000000000000000000000";
  when "0101"=> dispdata<= get_end_point+ "01010000000000000000000000000000";
  when "0110"=> dispdata<= get_amount+ "01100000000000000000000000000000";
  when "0111"=> dispdata<= get_real_pay+ "01110000000000000000000000000000";
  when "1000"=> dispdata<= get_change+ "10000000000000000000000000000000";
  when "1001"=> dispdata<= get_refund+ "10010000000000000000000000000000";
  when others=>dispdata<= x"00000000";
end case;
end if;
end process;
end Behavioral;
