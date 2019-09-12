----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2019/09/09 20:59:24
-- Design Name: 
-- Module Name: pay - Behavioral
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

entity pay is
  Port (clk,switch0,switch1,switch2,switch3,confirm:in std_logic;
        real_pay:out std_logic_vector(31 downto 0);
        get_present_state:in std_logic_vector(3 downto 0)
        --dispdata :out std_logic_vector(31 downto 0)
       ); 
end pay;

architecture Behavioral of pay is
signal sig_pay:std_logic_vector(31 downto 0);
signal sig_pay32:std_logic_vector(31 downto 0);
signal confirm0,switch00,switch10,switch20,switch30:std_logic;

begin

process(clk)
begin
if (clk'event and clk='1') then
    confirm0<=confirm;
    switch00<=switch0;
    switch10<=switch1;
    switch20<=switch2;
    switch30<=switch3;
    real_pay<=sig_pay;
end if;
end process;

process(clk,confirm,switch0,switch1,switch2,switch3,get_present_state)
variable temp:integer:=0;
begin
if (clk'event and clk='1') then
if (get_present_state="0111") then
  if (switch0='1'and switch00='0') then temp:=temp+1;end if; --拨动第一个开关上下一次算投入1元，下同
  if (switch1='1'and switch10='0') then temp:=temp+5;end if;
  if (switch2='1'and switch20='0') then temp:=temp+10;end if;
  if (switch3='1'and switch30='0') then temp:=temp+20;end if;
end if;
if(confirm='1' and confirm0='0') then --按确认则投币完毕
sig_pay<=conv_std_logic_vector(temp,32);
sig_pay32<=conv_std_logic_vector(temp,32);
--dispdata<=sig_pay32; --显示，这里是32位2进制数
end if;
end if;
end process;

end Behavioral;
