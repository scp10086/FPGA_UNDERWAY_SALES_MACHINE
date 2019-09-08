----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2019/09/04 21:40:38
-- Design Name: 
-- Module Name: choose_starting_line - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;--使用函数conv_std_logic_vector(m,n)的前提

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity choose_starting_line is
  Port (clk,up,down,confirm:in std_logic
        --starting_line:out std_logic_vector(3 downto 0)
        );
end choose_starting_line;

architecture Behavioral of choose_starting_line is
signal sig_starting_line:integer range 4 downto 1;--把信号sig_starting_line定义成一个1~4的整数
begin
choosing:process(clk,up,down,confirm)
variable temp:integer range 4 downto 1;--把变量starting_line定义成一个1~4的整数，定义变量主要是为了在进程中实时更新线路数值
begin
temp:=1;
if (clk'event and clk='1') then 
if (up='1') then temp:=temp+1;end if;
if (down='1') then temp:=temp-1;end if;
if (confirm='1') then sig_starting_line<=temp;end if;
end if;
--starting_line<=conv_std_logic_vector(sig_starting_line,4);--把线路的1、2、3、4转换成4位二进制数
end process choosing;
end Behavioral;
