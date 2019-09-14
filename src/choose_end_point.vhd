----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2019/09/05 16:14:30
-- Design Name: 
-- Module Name: choose_end_point - Behavioral
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

entity choose_end_point is
  Port (clk2,up2,down2,confirm2:in std_logic;
        led15:out std_logic;
        get_starting_line,get_end_line:in std_logic_vector(31 downto 0);
        get_starting_point:in std_logic_vector(31 downto 0);
        end_point:out std_logic_vector(31 downto 0);
        get_present_state:in std_logic_vector(3 downto 0)
        --dispdata :out std_logic_vector(31 downto 0)
        );
end choose_end_point;

architecture Behavioral of choose_end_point is

signal end_point32:std_logic_vector(31 downto 0);
signal confirm0,up0,down0:std_logic;
signal warning:std_logic;  --警告，起始站和终点站一致，在顶层模块里可以调用它并亮灯...
signal sig_end_point:integer;

--signal sig_end_1_point:integer range 27 downto 1;--把信号sig_starting_1_point(即1号线的站点)定义成一个1~27的整数
--signal sig_end_2_point:integer range 26 downto 1;--把信号sig_starting_2_point(即1号线的站点)定义成一个1~26的整数
--signal sig_end_3_point:integer range 29 downto 1;--把信号sig_starting_3_point(即1号线的站点)定义成一个1~29的整数
--signal sig_end_4_point:integer range 18 downto 1;--把信号sig_starting_4_point(即1号线的站点)定义成一个1~18的整数

begin


--例化模块
--u1:choose_end_line port map(clk=>clk2,up=>up2,down=>down2,confirm=>confirm2,end_line=>sig_el);
--u2:choose_starting_point port map(clk1=>clk2,up1=>up2,down1=>down2,confirm1=>confirm2,starting_point=>sig_sp);
--u3:choose_starting_line port map(clk=>clk2,up=>up2,down=>down2,confirm=>confirm2,starting_line=>sig_sl);

process(clk2)
begin
if (clk2'event and clk2='1') then
    end_point32<=conv_std_logic_vector(sig_end_point,32);
    end_point<=end_point32;
    confirm0<=confirm2;
    up0<=up2;
    down0<=down2;
    led15<=warning;
end if;
end process;

choosing:process(clk2,up2,down2,confirm2,get_present_state)

variable temp1:integer range 28 downto 0:=0;
--variable temp2:integer range 25 downto 0:=11;
--variable temp3:integer range 28 downto 0:=21;
--variable temp4:integer range 17 downto 0:=4;
begin

 if (clk2'event and clk2='1') then
 if (get_present_state="0000") then
  temp1:=0;sig_end_point<=temp1;
  warning<='0';
  end if;
 if (get_present_state="0101") then
   if (up2='1'and up0='0') then temp1:=temp1+1;sig_end_point<=temp1;end if;
   if (down2='1'and down0='0') then temp1:=temp1-1;sig_end_point<=temp1;end if;
 --  if (confirm2='1'and confirm0='0') then sig_end_point<=temp1;end if;
   --end_point<=conv_std_logic_vector(sig_end_1_point,5);--把整数站点转换成5位二进制数
 end if;
 
 
-- if (get_starting_line=get_end_line and get_starting_point=sig_end_point) then warning<='1';
-- sig_end_point<=sig_end_point+1;
-- end if;  --如果（起始线=终点线）且（起始站=终点站）那就发出警告，默认终点站加一站

 --end_point<=conv_std_logic_vector(sig_end_point,32);
 --end_point32<=conv_std_logic_vector(sig_end_point,32);
 --dispdata<=end_point32; --显示
 

end if;
end process choosing;

end Behavioral;
