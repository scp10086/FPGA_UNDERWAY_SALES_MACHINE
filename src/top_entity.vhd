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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.All;

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
            led:OUT std_logic_vector(3 downto 0);    --四个LED灯，表示1元、5元、10元、20元
            switch:IN std_logic_vector(3 downto 0);  --四个开关，投入1元、5元、10元、20元
            num1:OUT std_logic_vector(3 downto 0);  --第一个数码管模块的第几位数
            num2:OUT std_logic_vector(3 downto 0);  --第二个数码管模块的第几位数
            dig1:OUT std_logic_vector(7 downto 0);  --第一个数码管模块的具体数字
            dig2:OUT std_logic_vector(7 downto 0)   --第二个数码管模块的具体数字
            );
end top_entity;

architecture Behavioral of top_entity is
type state_type is(s1,s2,s3,s4,s5,s6,s7,s8,s9,s10);  --共十种状态，等待，选当前站线路，选当前站站点，选票价，选目的站线路，选目的站站点，选票数，投币状态，找零出票状态，退币成功
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
variable var_temp:std_logic;
begin
case presentstate is
  when s1=>  --s1等待状态
    if (confirm='1' or back='1' or up='1' or down='1') then
    nextstate<=s2;
    end if;
  when s2=>  --选当前站线路状态
    if (confirm='1') then nextstate<=s3;
    else if (back='1') then nextstate<=s1;
    end if;
  when s3=>  --选当前站站点状态
    if (up='1') then nextstate<=s4;end if;
    if (down='1') then nextstate<=s5;end if;
    if (back='1') then nextstate<=s2;
    end if;
    var_temp:='1';
  when s4=>  --选票价状态
    if (confirm='1') then nextstate<=s5;end if;
    if (back='1') then nextstate<=s3;end if;
    var_temp:='0';
  when s5=>  --选目的站线路状态
    if (confirm='1') then nextstate<=s6;end if;
    if (back='1') then
      if (var_temp='1') then nextstate<=s3;
      else if (var_temp='0') then nextstate<=s4;
      end if;
    end if;
  when s6=>  --选目的站站点状态
    if (confirm='1') then nextstate<=s7;end if;
    if (back='1') then nextstate<=s5;end if;
  when s7=>  --选票数状态
    if (confirm='1') then nextstate<=s8;end if;
    if (back='1') then nextstate<=s6;end if;
  when s8=>  --投币状态
    if (back='1') then nextstate<=s10;  --还没写如果钱够了下一个状态是s9（找零出票状态）的情况
    end if; 
    if (switch="0001") then led<="0001";end if;
    if (switch="0010") then led<="0010";end if;
    if (switch="0100") then led<="0100";end if;
    if (switch="1000") then led<="1000";end if;
  when others=>   --初始状态是s1
    nextstate<=s1;
end case; --case里还少了s9到s10（退币成功状态）和s10到s1的情况
end process change_state_mode;
end Behavioral;
