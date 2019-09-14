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
            led0:OUT std_logic;    --四个LED灯，表示1元、5元、10元、20元
            led1:OUT std_logic; 
            led2:OUT std_logic; 
            led3:OUT std_logic; 
            led4:OUT std_logic; 
            led5:OUT std_logic; 
            led6:OUT std_logic; 
            led7:OUT std_logic; 
            led8:OUT std_logic; 
            led9:OUT std_logic; 
            get_total,get_ticket_price:IN std_logic_vector(31 downto 0);    
            get_real_pay:IN std_logic_vector(31 downto 0);         
            --switch0:IN std_logic;  --四个开关，投入1元、5元、10元、20元
            --switch1:IN std_logic;
            --switch2:IN std_logic;
            --switch3:IN std_logic;
            --num:OUT std_logic_vector( 7 downto 0 );  --数码管模块的第几位数
            --dig:OUT std_logic_vector( 7 downto 0 );  --数码管模块的具体管脚
            get_up_to_5sec,get_flag0:IN std_logic;
            status:out std_logic_vector(3 downto 0)
        );    
end top_entity;

architecture Behavioral of top_entity is
signal flag:std_logic;
signal present_state:std_logic_vector(3 downto 0);
signal confirm0,back0,up0,down0:std_logic;

begin

process(clk)
begin
if (clk'event and clk='1') then
    status<=present_state;
    confirm0<=confirm;
    back0<=back;
    up0<=up;
    down0<=up;
end if;
end process;


process(clk,confirm,back,up,down,present_state)  

begin
if (clk'event and clk='1') then

case present_state is

  when "0000"=>  --s1等待状态
  
    if (confirm0='0' and confirm='1') then  --按确认进入选起始线状态
    present_state<="0001";
    end if;

  when "0001"=>  --选当前站线路状态
    
    if (confirm0='0' and confirm='1') then present_state<="0010";end if;
    if (back0='0' and back='1') then present_state<="0000";end if;

  when "0010"=>  --选当前站站点状态
    
   -- if (up0='0' and up='1') then present_state<="0011";end if; --按“上”跳到选票价状态
    if (confirm0='0' and confirm='1') then present_state<="1010";end if;  --按确定跳到状态10
   -- if (down0='0' and down='1') then present_state<="0100";end if; --按“下”跳到选目的线路状态
    if (back0='0' and back='1') then present_state<="0001";end if;


  when "0011"=>  --选票价状态
  
    if (confirm0='0' and confirm='1') then present_state<="0111";end if;  --选票价确认后直接投币
    if (back0='0' and back='1') then present_state<="0010";end if;
    --flag<='0';

  when"0100"=>  --选目的站线路状态
  
    if (confirm0='0' and confirm='1') then present_state<="0101";end if;
    if (back0='0' and back='1') then present_state<="0010";

    end if;

  when "0101"=>  --选目的站站点状态
 
    if (confirm0='0' and confirm='1') then present_state<="1011";end if; --按确认 去显示单价
    if (back0='0' and back='1') then present_state<="0100";end if;

  when "0110"=>  --选票数状态

    if (confirm0='0' and confirm='1') then present_state<="1100";end if; --按确认 去显示总价
    if (back0='0' and back='1') then present_state<="0101";end if; --按返回 去重选终点站
    --flag<='1';

  when "0111"=>  --投币状态

    if (confirm0='0' and confirm='1') then --按下确定键
     if (get_flag0='0') then
      if (get_real_pay>=get_ticket_price) then present_state<="1000"; 
      elsif(get_real_pay<get_total) then present_state<="1001";
      end if;
     elsif (get_flag0='1') then
      if (get_real_pay>=get_total) then present_state<="1000";  --如果付的钱比应付的多，就跳到找零出票状态
      elsif(get_real_pay<get_total) then present_state<="1001"; --钱不够跳到退币状态
      end if;
     end if;
    end if;

    if (back0='0' and back='1') then
       present_state<="1001";   --按返回就到退币状态，即一次性退出钱币
      --else present_state<="0110";
      --end if;
    end if; 

  when "1000"=>  --找零出票状态
    if (confirm0='0' and confirm='1') then present_state<="0000";end if;
    --if (get_up_to_5sec='1') then present_state<="0000";end if;  --如果过了5秒没操作，跳到等待状态

  when "1001"=>  --退币状态
    if (confirm0='0' and confirm='1') then present_state<="0000";end if;
   -- if (get_up_to_5sec='1') then present_state<="0000";end if;  --如果过了5秒没操作，跳到等待状态
 
 when "1010"=>  --状态10 判断进入选票价还是选终点线
  if (up0='0' and up='1') then present_state<="0011";end if; --按上 去选票价
   if (down0='0' and down='1') then present_state<="0100";end if; --按下 去选终点线
 
  when "1011"=>  --显示起始站到终点站的单价
    if (confirm0='0' and confirm='1') then present_state<="0110";end if; --按确认 去选票数
     if (back0='0' and back='1') then present_state<="0101";end if; --按返回 去选终点站
     
  when "1100"=>  --显示总价（单价*票数）
         if (confirm0='0' and confirm='1') then present_state<="0111";end if; --按确认 去投币
         if (back0='0' and back='1') then present_state<="0110";end if; --按返回 去重选票数
         
  when others=>   --初始状态是s1
    present_state<="0000";

end case; 
end if;
end process;

end Behavioral;

