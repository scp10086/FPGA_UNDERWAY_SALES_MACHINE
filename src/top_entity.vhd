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
            num:OUT std_logic_vector( 7 downto 0 );  --数码管模块的第几位数
            dig:OUT std_logic_vector( 7 downto 0 )  --数码管模块的具体管脚     
);    
end top_entity;

architecture Behavioral of top_entity is
type state_type is ( S1, --等待
                S2, --选当前站路线
                s3, --选当前站的站点
                s4, --选票价
                s5, --选目的站路线
                s6, --选目的站站点
                s7, --选票数
                s8, --投币
                s9, --找零出票
                s10 --投币成功。
                );
signal presentstate:state_type;
signal nextstate:state_type;
begin
led <= switch;
num <= "00000000";
dig <= "00000000";
switch_to_next_state:process(clk)  --第一个process
begin
if (clk'event and clk='1') then
presentstate<=nextstate;
end if;
end process switch_to_next_state;
end Behavioral;

