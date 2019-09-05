----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2019/09/03 15:24:50
-- Design Name: 
-- Module Name: choose_starting_point - Behavioral
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

entity choose_starting_point is
  Port (clk1,up1,down1,confirm1,back:in std_logic;
        starting_point:out std_logic_vector(4 downto 0));
end choose_starting_point;

--地铁一号线27站，二号线26站，三号线29站，四号线18站
architecture Behavioral of choose_starting_point is

--声明选当前线路的模块，注意位置，在architecture里声明
component choose_starting_line
  Port (clk,up,down,confirm:in std_logic;
        starting_line:out std_logic_vector(3 downto 0));
end component;

signal sig_sl:std_logic_vector(3 downto 0);

signal sig_starting_1_point:integer range 27 downto 1;--把信号sig_starting_1_point(即1号线的站点)定义成一个1~27的整数
signal sig_starting_2_point:integer range 26 downto 1;--把信号sig_starting_2_point(即1号线的站点)定义成一个1~26的整数
signal sig_starting_3_point:integer range 29 downto 1;--把信号sig_starting_3_point(即1号线的站点)定义成一个1~29的整数
signal sig_starting_4_point:integer range 18 downto 1;--把信号sig_starting_4_point(即1号线的站点)定义成一个1~18的整数

begin
u1:choose_starting_line port map(clk=>clk1,up=>up1,down=>down1,confirm=>confirm1,starting_line=>sig_sl);
choosing:process(clk1,up1,down1,confirm1)
variable temp1:integer range 27 downto 1;
variable temp2:integer range 26 downto 1;
variable temp3:integer range 29 downto 1;
variable temp4:integer range 18 downto 1;
begin

temp1:=8;  --地铁一号线默认初始站为新街口
temp2:=12; --地铁二号线默认初始站为大行宫
temp3:=22; --地铁三号线默认初始站为南京南
temp4:=5;  --地铁四号线默认初始站为鸡鸣寺

case sig_sl is --不同的线路
when "0001"=>
 if (clk1'event and clk1='1') then
   if (up1='1') then temp1:=temp1+1;end if;
   if (down1='1') then temp1:=temp1-1;end if;
   if (confirm1='1') then sig_starting_1_point<=temp1;end if;
   starting_point<=conv_std_logic_vector(sig_starting_1_point,5);--把整数站点转换成5位二进制数
 end if;
 
 when "0010"=>
  if (clk1'event and clk1='1') then
    if (up1='1') then temp2:=temp2+1;end if;
    if (down1='1') then temp2:=temp2-1;end if;
    if (confirm1='1') then sig_starting_2_point<=temp2;end if;
    starting_point<=conv_std_logic_vector(sig_starting_2_point,5);--把整数站点转换成5位二进制数
  end if;
  
  when "0011"=>
    if (clk1'event and clk1='1') then
      if (up1='1') then temp3:=temp3+1;end if;
      if (down1='1') then temp3:=temp3-1;end if;
      if (confirm1='1') then sig_starting_3_point<=temp3;end if;
      starting_point<=conv_std_logic_vector(sig_starting_3_point,5);--把整数站点转换成5位二进制数
    end if;
    
    when "0100"=>
      if (clk1'event and clk1='1') then
        if (up1='1') then temp4:=temp4+1;end if;
        if (down1='1') then temp2:=temp4-1;end if;
        if (confirm1='1') then sig_starting_4_point<=temp4;end if;
        starting_point<=conv_std_logic_vector(sig_starting_4_point,5);--把整数站点转换成5位二进制数
      end if;
      
 end case;
 
end process choosing;
end Behavioral;
