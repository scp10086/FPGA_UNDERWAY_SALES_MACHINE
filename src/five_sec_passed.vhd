----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2019/09/09 19:30:45
-- Design Name: 
-- Module Name: five_sec_passed - Behavioral
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

entity five_sec_passed is
  Port (clk,up,down,confirm,back:in std_logic;
        up_to_5sec:out std_logic );
end five_sec_passed;

architecture Behavioral of five_sec_passed is

signal clk_1s:std_logic;
signal key:std_logic_vector(3 downto 0);
begin

--100M分频
one_sec:process(clk)
variable temp:integer range 0 to 99999999;
begin
if (rising_edge(clk)) then
  if (temp=99999999) then
    clk_1s<='1';
    temp:=0;
  else
    temp:=temp+1;
    clk_1s<='0';
  end if;   
end if;
end process one_sec;

five_sec:process(clk,up,down,confirm,back)
variable temp1:integer range 0 to 4:=0;
begin
key<=up&down&confirm&back; --有点奇怪，但是好像就是这样
if (key="0000") then
  if (rising_edge(clk)) then
    if (clk_1s='1') then temp1:=temp1+1;
    else temp1:=temp1;
    end if;
    if (temp1=4) then up_to_5sec<='1';temp1:=temp1+1;
    else up_to_5sec<='0';
    end if;

  end if;
end if;
end process five_sec;

end Behavioral;
