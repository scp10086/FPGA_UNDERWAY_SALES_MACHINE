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
  Port (clk2,up2,down2,confirm2:in std_logic
        --end_point:out std_logic_vector(4 downto 0) 
        );
end choose_end_point;

architecture Behavioral of choose_end_point is

component choose_end_line
  Port (clk,up,down,confirm:in std_logic;
        end_line:out std_logic_vector(3 downto 0));
end component;

component choose_starting_point
Port (clk1,up1,down1,confirm1:in std_logic;
        starting_point:out std_logic_vector(4 downto 0));
end component;

component choose_starting_line
  Port (clk,up,down,confirm:in std_logic;
        starting_line:out std_logic_vector(3 downto 0));
end component;

signal sig_sl:std_logic_vector(3 downto 0);
signal sig_el:std_logic_vector(3 downto 0);
signal sig_sp:std_logic_vector(4 downto 0);
signal sig_ep:std_logic_vector(4 downto 0);
signal warning:std_logic;  --警告，起始站和终点站一致，在顶层模块里可以调用它并亮灯...

signal sig_end_1_point:integer range 27 downto 1;--把信号sig_starting_1_point(即1号线的站点)定义成一个1~27的整数
signal sig_end_2_point:integer range 26 downto 1;--把信号sig_starting_2_point(即1号线的站点)定义成一个1~26的整数
signal sig_end_3_point:integer range 29 downto 1;--把信号sig_starting_3_point(即1号线的站点)定义成一个1~29的整数
signal sig_end_4_point:integer range 18 downto 1;--把信号sig_starting_4_point(即1号线的站点)定义成一个1~18的整数

begin

--例化模块
u1:choose_end_line port map(clk=>clk2,up=>up2,down=>down2,confirm=>confirm2,end_line=>sig_el);
u2:choose_starting_point port map(clk1=>clk2,up1=>up2,down1=>down2,confirm1=>confirm2,starting_point=>sig_sp);
u3:choose_starting_line port map(clk=>clk2,up=>up2,down=>down2,confirm=>confirm2,starting_line=>sig_sl);

choosing:process(clk2,up2,down2,confirm2)
variable temp1:integer range 27 downto 1;
variable temp2:integer range 26 downto 1;
variable temp3:integer range 29 downto 1;
variable temp4:integer range 18 downto 1;
begin

temp1:=8;  --地铁一号线默认初始站为新街口
temp2:=12; --地铁二号线默认初始站为大行宫
temp3:=22; --地铁三号线默认初始站为南京南
temp4:=5;  --地铁四号线默认初始站为鸡鸣寺

case sig_el is --不同的线路
when "0001"=>
 if (clk2'event and clk2='1') then
   if (up2='1') then temp1:=temp1+1;end if;
   if (down2='1') then temp1:=temp1-1;end if;
   if (confirm2='1') then sig_end_1_point<=temp1;end if;
   --end_point<=conv_std_logic_vector(sig_end_1_point,5);--把整数站点转换成5位二进制数
 end if;
 
 when "0010"=>
  if (clk2'event and clk2='1') then
    if (up2='1') then temp2:=temp2+1;end if;
    if (down2='1') then temp2:=temp2-1;end if;
    if (confirm2='1') then sig_end_2_point<=temp2;end if;
    --end_point<=conv_std_logic_vector(sig_end_2_point,5);--把整数站点转换成5位二进制数
  end if;
  
  when "0011"=>
    if (clk2'event and clk2='1') then
      if (up2='1') then temp3:=temp3+1;end if;
      if (down2='1') then temp3:=temp3-1;end if;
      if (confirm2='1') then sig_end_3_point<=temp3;end if;
      --end_point<=conv_std_logic_vector(sig_end_3_point,5);--把整数站点转换成5位二进制数
    end if;
    
    when "0100"=>
      if (clk2'event and clk2='1') then
        if (up2='1') then temp4:=temp4+1;end if;
        if (down2='1') then temp2:=temp4-1;end if;
        if (confirm2='1') then sig_end_4_point<=temp4;end if;
        --end_point<=conv_std_logic_vector(sig_end_4_point,5);--把整数站点转换成5位二进制数
      end if;
      
 end case;
 
if (sig_sl=sig_el and sig_sp=sig_ep) then warning<='1';end if;  --如果（起始线=终点线）且（起始站=终点站）那就发出警告
 
end process choosing;

end Behavioral;
