----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2019/09/07 19:46:04
-- Design Name: 
-- Module Name: no_buffeting - Behavioral
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

entity no_buffeting is
  Port (clk,keyin:in std_logic;
          keyout:out std_logic );
end no_buffeting;

architecture Behavioral of no_buffeting is

begin
process(clk,keyin)
variable count:integer range 0 to 500000; --1MHz对应1us，100MHz对应0.01us，按键是1一个脉冲，一个脉冲约5ms，也就是100000*5=500000
begin
if (keyin='0') then
  if (clk'event and clk='1') then
    if count<500000 then count:=count+1;
    else count:=count;
    end if;
    if count<=499999 then keyout<='0';
    else keyout<='1';
    end if;
  end if;
else count:=0;keyout<='0';
end if;
  
end process;

end Behavioral;
