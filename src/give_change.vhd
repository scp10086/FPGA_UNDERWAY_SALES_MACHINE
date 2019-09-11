----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2019/09/09 20:40:48
-- Design Name: 
-- Module Name: give_change - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;--数据类型转换
use IEEE.STD_LOGIC_UNSIGNED.All;--数据类型转换
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity give_change is
  Port (clk,flag0:in std_logic;
        get_real_pay,ticket_price,get_amount:in integer; --ticket_price是选的票价
        change:out integer; --get_price是票价表里的票价
        get_price:in std_logic_vector(3 downto 0);
        get_present_state:in std_logic_vector(3 downto 0);
        dispdata :out std_logic_vector(31 downto 0));
end give_change;

architecture Behavioral of give_change is
signal sig_change32,sig_real_pay,sig_should_pay,sig_ticket_price:std_logic_vector(31 downto 0);
signal sig_change:integer;


begin

process(clk)
begin
if (clk'event and clk='1') then
    change<=sig_change;
end if;
end process;

process(clk,get_present_state)
begin

if (clk'event and clk='1') then
if(get_present_state="1000") then
sig_should_pay<=get_amount*get_price;
sig_real_pay<=conv_std_logic_vector(get_real_pay,32);
sig_ticket_price<=conv_std_logic_vector(ticket_price,32);

if(flag0='0') then
  sig_change32<=sig_real_pay-sig_should_pay;
elsif(flag0='1') then sig_change32<=sig_real_pay-sig_ticket_price;
end if;
--sig_change32<=conv_std_logic_vector(sig_change,32);
dispdata<=sig_change32; --显示，这里是32位2进制数
end if;
end if;

--还没写找零的显示

end process;

end Behavioral;
