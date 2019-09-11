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
        get_real_pay,get_should_pay,ticket_price:in integer;
        change:out integer;
        get_present_state:in std_logic_vector(3 downto 0);
        dispdata :in std_logic_vector(31 downto 0);
                        seg_able :in std_logic_vector(7 downto 0);
                        segg :out std_logic_vector(7 downto 0);
                        an :out std_logic_vector(7 downto 0));
end give_change;

architecture Behavioral of give_change is
signal sig_change32:std_logic_vector(31 downto 0);
signal sig_change:integer;

component seven_segment_disp_0
port
 (
    clk :in std_logic;
    dispdata :in std_logic_vector(31 downto 0);
    seg_able :in std_logic_vector(7 downto 0);
    segg :out std_logic_vector(7 downto 0);
    an :out std_logic_vector(7 downto 0)
 );
end component;
signal disp_data_2 : std_logic_vector(31 downto 0);
signal seg_able_2 : std_logic_vector( 7 downto 0);

begin

seg_able_2 <= "11111111"; 

segment_disp_0 : seven_segment_disp_0
port map(
        clk => clk,
        dispdata =>  disp_data_2,
        seg_able =>  seg_able_2,
        segg => segg,
        an => an  
);

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
if(flag0='0') then
  sig_change<=get_real_pay-get_should_pay;
elsif(flag0='1') then sig_change<=get_real_pay-ticket_price;
end if;
sig_change32<=conv_std_logic_vector(sig_change,32);
disp_data_2<=sig_change32; --显示，这里是32位2进制数
end if;
end if;

--还没写找零的显示

end process;

end Behavioral;
