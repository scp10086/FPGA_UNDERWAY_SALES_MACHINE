----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2019/09/02 19:08:29
-- Design Name: 
-- Module Name: top_entity - Behavioral
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

entity top_entity is
      Port (clk:IN std_logic;      --时钟信号
            datain:IN std_logic;
            confirm:IN std_logic;  --按钮“确定”
            back:IN std_logic;     --按钮“返回”
            up:IN std_logic;       --按钮“加一”
            down:IN std_logic;     --按钮“减一”
            led1:OUT std_logic;    --四个LED灯，表示1元、5元、10元、20元
            led2:OUT std_logic;
            led3:OUT std_logic;
            led4:OUT std_logic;
            switch1:IN std_logic;  --四个开关，投入1元、5元、10元、20元
            switch2:IN std_logic;
            switch3:IN std_logic;
            switch4:IN std_logic;
            num1:OUT std_logic_vector(3 downto 0);  --第一个数码管模块的第几位数
            num2:OUT std_logic_vector(3 downto 0);  --第二个数码管模块的第几位数
            dig1:OUT std_logic_vector(7 downto 0);  --第一个数码管模块的具体数字
            dig2:OUT std_logic_vector(7 downto 0)   --第二个数码管模块的具体数字
            );
end top_entity;

architecture Behavioral of top_entity is
type state_type is(s1,s2,s3,s4,s5,s6,s7,s8,s9,s10);  --共十种状态，等待，选当前站线路，选当前站站点，选票价，选目的站线路，选目的站站点，选票数，投币状态，找零成功，退币成功
signal presentstate:state_type;
signal nextstate:state_type;
begin

switch_to_next_state:process(clk)  --第一个process
begin
if (clk'event and clk='1') then
presentstate<=nextstate;
end if;
end process switch_to_next_state;

change_state_mode:process(confirm,back,up,down,presentstate)  --第二个process
begin
case presentstate is
  when s1=>
    if (confirm='1' or back='1' or up='1' or down='1') then
    nextstate<=s2;
    end if;
  when s2=>
    if (confirm='1') then
    nextstate<=s3;
    else if (back='1') then
    nextstate<=s1;
    end if;
  when s3=>
    if (up='1') then nextstate<=s4;
    else if (down='1') then nextstate<=s5;
    else if (back='1') then nextstate<=s2;
    end if;
  when s4=>
    if (confirm='1') then nextstate<=s5;
    else if (back='1') then nextstate<=s3;
    end if;
  
end Behavioral;
