----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2019/09/02 19:08:29
-- Design Name: 
-- Module Name: top_entity - Behavioral
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

entity top_entity is
--  Port (clk:IN std_logic;datain:IN std_logic;confirm:IN std_logic;back:IN std_logic;up:IN std_logic;down:IN std_logic;led1:OUT std_logic;led2:OUT std_logic;led3:OUT std_logic;led4:OUT std_logic;switch1:IN std_logic;switch2:IN std_logic;switch3:IN std_logic;switch4:IN std_logic;num1:OUT std_logic_vector(3 downto 0);num2:OUT std_logic_vector(3 downto 0);dig1:OUT std_logic_vector(7 downto 0);dig2:OUT std_logic_vector(7 downto 0));
end top_entity;

architecture Behavioral of top_entity is
type state_type is(s1,s2,s3,s4,s5,s6,s7,s8,s9,s10);
signal presentstate:state_type;
signal nextstate:state_type;
begin
  switch_to_next_state:process(clk)
begin
  if (clk'event and clk='1') then
    presentstate<=nextstate;
  end if;
end process switch_to_next_state;

end Behavioral;
