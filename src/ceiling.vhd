----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2019/09/08 19:46:16
-- Design Name: 
-- Module Name: ceiling - Behavioral
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

entity ceiling is
  Port (clk,up,down,confirm,back:in std_logic;
        led:out std_logic ); --到底输出端口是什么暂时还没想清楚
end ceiling;

architecture Behavioral of ceiling is

--模块1 按键消抖
component no_buffeting
Port (clk,up,down,confirm,back:in std_logic; 
        up0,down0,confirm0,back0:out std_logic);--不带0的都是原按键信号,带0的是消抖后的信号
end component;

--模块2 选起始线路
component choose_starting_line
Port (clk,up,down,confirm:in std_logic);
end component;

--模块3 选起始站点
component choose_starting_point
Port (clk1,up1,down1,confirm1:in std_logic);
end component;

--模块4 选终点线路
component choose_end_line
Port (clk,up,down,confirm:in std_logic);
end component;

--模块5 选终点站点
component choose_end_point
Port (clk2,up2,down2,confirm2:in std_logic);
end component;

signal sig_up0,sig_down0,sig_confirm0,sig_back0:std_logic;

begin

mux1:no_buffeting
port map(
  clk=>clk,
  up=>up,
  down=>down,
  confirm=>confirm,
  back=>back,
  up0=>sig_up0,
  down0=>sig_down0,
  confirm0=>sig_confirm0,
  back0=>sig_back0
);

mux2:choose_starting_line
port map(
  clk=>clk,
  up=>up,
  down=>down,
  confirm=>confirm
);

mux3:choose_starting_point
port map(
  clk1=>clk,
  up1=>up,
  down1=>down,
  confirm1=>confirm
);

mux4:choose_end_line
port map(
  clk=>clk,
  up=>up,
  down=>down,
  confirm=>confirm
);  
  
mux5:choose_end_point
port map(
  clk2=>clk,
  up2=>up,
  down2=>down,
  confirm2=>confirm
);  
  
end Behavioral;
