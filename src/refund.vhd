----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2019/09/09 20:54:03
-- Design Name: 
-- Module Name: refund - Behavioral
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

entity refund is
  Port (clk:in std_logic;
        get_real_pay:in std_logic_vector(4 downto 0);
        get_present_state:in std_logic_vector(3 downto 0);
        dispdata :out std_logic_vector(31 downto 0));
end refund;

architecture Behavioral of refund is
signal sig_real_pay:std_logic_vector(4 downto 0);
signal sig_refund:std_logic_vector(31 downto 0);

begin

process(clk,get_present_state)
begin
if(clk'event and clk='1') then
if(get_present_state="1001") then
--显示退款即可，refund就是get_real_pay
  sig_real_pay<=get_real_pay;
  sig_refund<=sig_real_pay;
  dispdata<=sig_refund; --显示，这里是32位2进制数
end if;
end if;
end process;

end Behavioral;
