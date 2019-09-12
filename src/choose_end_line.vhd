----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2019/09/05 15:58:33
-- Design Name: 
-- Module Name: choose_end_line - Behavioral
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

entity choose_end_line is
  Port (clk,up,down,confirm:in std_logic;
        --end_line:out std_logic_vector(3 downto 0) 
        end_line:out std_logic_vector(31 downto 0);
        get_present_state:in std_logic_vector(3 downto 0)
        --dispdata :out std_logic_vector(31 downto 0)
        );
end choose_end_line;

architecture Behavioral of choose_end_line is
signal end_line32:std_logic_vector(31 downto 0);
signal sig_end_line:integer range 3 downto 0;--把信号sig_end_line定义成一个1~4的整数
signal confirm0,up0,down0:std_logic;

begin

process(clk)
begin
if (clk'event and clk='1') then
end_line32<=conv_std_logic_vector(sig_end_line,32);
    end_line<=end_line32;
    confirm0<=confirm;
    up0<=up;
    down0<=down;
end if;
end process;

choosing:process(clk,up,down,confirm,get_present_state)
variable temp:integer range 3 downto 0:=0;--把变量starting_line定义成一个1~4的整数，定义变量主要是为了在进程中实时更新线路数值
begin

if (clk'event and clk='1') then 
if (get_present_state="0100") then
temp:=0;sig_end_line<=temp;
if (up='1'and up0='0') then temp:=temp+1;sig_end_line<=temp;end if;
if (down='1'and down0='0') then temp:=temp-1;sig_end_line<=temp;end if;
--if (confirm='1'and confirm0='0') then sig_end_line<=temp;end if;
end if;
end if;
--end_line<=conv_std_logic_vector(sig_end_line,32);--把线路的1、2、3、4转换成4位二进制数
--end_line32<=conv_std_logic_vector(sig_end_line,32);
--dispdata<=end_line32; --显示，这里是32位2进制数
end process choosing;

end Behavioral;
