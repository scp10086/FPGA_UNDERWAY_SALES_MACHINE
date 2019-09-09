library IEEE;
use IEEE.STD_LOGIC_1164.ALL;--可以使用STD_LOGIC,STD_LOGIC_VECTOR
use IEEE.STD_LOGIC_ARITH.ALL;--数据类型转换
use IEEE.STD_LOGIC_UNSIGNED.All;--数据类型转换

entity top_entity is
    Port(
            clk:IN std_logic;      --时钟信号
            confirm:IN std_logic;  --按钮"确定"
            back:IN std_logic;     --按钮"返回"
            up:IN std_logic;       --按钮"加一"
            down:IN std_logic;     --按钮"减一"
            led:OUT std_logic_vector(3 downto 0);    --四个LED灯，表示1元、5元、10元、20元
            switch:IN std_logic_vector(3 downto 0);  --四个开关，投入1元、5元、10元、20元
            --num:OUT std_logic_vector( 7 downto 0 );  --数码管模块的第几位数
            --dig:OUT std_logic_vector( 7 downto 0 );  --数码管模块的具体管脚
            get_up_to_5sec:IN std_logic     
        );    
end top_entity;

architecture Behavioral of top_entity is

type state_type is ( s1, --等待
                s2, --选当前站路线
                s3, --选当前站的站点
                s4, --选票价
                s5, --选目的站路线
                s6, --选目的站站点
                s7, --选票数
                s8, --投币
                s9, --找零出票
                s10 --退币
                );
signal presentstate:state_type;
signal nextstate:state_type;
begin
led <= switch;
--num <= "00000000";
--dig <= "00000000";

switch_to_next_state:process(clk)  --第一个process
begin
if (clk'event and clk='1') then
presentstate<=nextstate;
end if;
end process switch_to_next_state;

change_state_mode:process(confirm,back,up,down,presentstate)  --第二个process

begin

case presentstate is

  when s1=>  --s1等待状态
    if (rising_edge(confirm) or rising_edge(back) or rising_edge(up) or rising_edge(down)) then
    nextstate<=s2;
    end if;

  when s2=>  --选当前站线路状态
    if (rising_edge(confirm)) then nextstate<=s3;end if;
    if (rising_edge(back)) then nextstate<=s1;end if;

  when s3=>  --选当前站站点状态
    if (rising_edge(up)) then nextstate<=s4;end if;
    if (rising_edge(down)) then nextstate<=s5;end if;
    if (rising_edge(back)) then nextstate<=s2;
    end if;

    --flag1<='1';

  when s4=>  --选票价状态
    if (rising_edge(confirm)) then nextstate<=s9;end if;  --选票价确认后直接找零出票
    if (rising_edge(back)) then nextstate<=s3;end if;
    --flag1<='0';

  when s5=>  --选目的站线路状态
    if (rising_edge(confirm)) then nextstate<=s6;end if;
    if (rising_edge(back)) then nextstate<=s3;
      --if (flag1='1') then nextstate<=s3;
      --else if (flag1='0') then nextstate<=s4;
      --end if;
      --end if;
    end if;

  when s6=>  --选目的站站点状态
    if (rising_edge(confirm)) then nextstate<=s7;end if;
    if (rising_edge(back)) then nextstate<=s5;end if;

  when s7=>  --选票数状态
    if (rising_edge(confirm)) then nextstate<=s8;end if;
    if (rising_edge(back)) then nextstate<=s6;end if;
    
  when s8=>  --投币状态
    if (rising_edge(confirm)) then 
      if (real_pay>=should_pay) then nextstate<=s9; 
      else nextstate<=s10;
      end if;
    end if;
    if (rising_edge(back)) then nextstate<=s10;  
    end if; 

  when s9=>  --找零出票状态
    if (get_up_to_5sec='1') then nextstate<=s1;end if;  --如果过了5秒没操作，跳到等待状态

  when s10=>  --退币状态
    if (get_up_to_5sec='1') then nextstate<=s1;end if;  --如果过了5秒没操作，跳到等待状态

  when others=>   --初始状态是s1
    nextstate<=s1;

end case; 

end process change_state_mode;

end Behavioral;

