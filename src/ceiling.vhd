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
        led0:OUT std_logic;    --四个LED灯，表示1元、5元、10元、20元
        led1:OUT std_logic; 
        led2:OUT std_logic; 
        led3:OUT std_logic; 
        led15:out std_logic;--警告灯 起始终点都一样
        switch0:IN std_logic;  --四个开关，投入1元、5元、10元、20元
        switch1:IN std_logic;
        switch2:IN std_logic;
        switch3:IN std_logic;
        switch4,switch5,switch6,switch7:in std_logic; --这四个开关分别对应着快速选票价：2元、3元、5元、7元
        dispdata :in std_logic_vector(31 downto 0);
        seg_able :in std_logic_vector(7 downto 0);
        segg :out std_logic_vector(7 downto 0);
        an :out std_logic_vector(7 downto 0)  
        );  --四个开关，投入1元、5元、10元、20元 ); 
end ceiling;

architecture Behavioral of ceiling is

--模块1 按键消抖
component no_buffeting
Port (clk,up,down,confirm,back:in std_logic; 
        up0,down0,confirm0,back0:out std_logic
        );--不带0的都是原按键信号,带0的是消抖后的信号
end component;

--模块2 选起始线路
component choose_starting_line
Port (clk,up,down,confirm:in std_logic;
      get_present_state:in std_logic_vector(3 downto 0);
      starting_line:out std_logic_vector(1 downto 0);
      dispdata :in std_logic_vector(31 downto 0);
      seg_able :in std_logic_vector(7 downto 0);
      segg :out std_logic_vector(7 downto 0);
              an :out std_logic_vector(7 downto 0) 
      
      );
end component;

--模块3 选起始站点
component choose_starting_point
Port (clk1,up1,down1,confirm1:in std_logic;
get_starting_line:in std_logic_vector(1 downto 0);
starting_point:out std_logic_vector(4 downto 0);
get_present_state:in std_logic_vector(3 downto 0);
dispdata :in std_logic_vector(31 downto 0);
        seg_able :in std_logic_vector(7 downto 0);
segg :out std_logic_vector(7 downto 0);
        an :out std_logic_vector(7 downto 0)  );
end component;

--模块4 选终点线路
component choose_end_line
Port (clk,up,down,confirm:in std_logic;
      end_line:out std_logic_vector(1 downto 0);
      get_present_state:in std_logic_vector(3 downto 0);
      dispdata :in std_logic_vector(31 downto 0);
              seg_able :in std_logic_vector(7 downto 0);
      segg :out std_logic_vector(7 downto 0);
              an :out std_logic_vector(7 downto 0)  );
end component;

--模块5 选终点站点
component choose_end_point
Port (clk2,up2,down2,confirm2:in std_logic;
      led15:out std_logic;
      get_starting_line,get_end_line:in std_logic_vector(1 downto 0);
      get_starting_point:in std_logic_vector(4 downto 0);
      end_point:out std_logic_vector(4 downto 0);
      get_present_state:in std_logic_vector(3 downto 0);
      dispdata :in std_logic_vector(31 downto 0);
              seg_able :in std_logic_vector(7 downto 0);
      segg :out std_logic_vector(7 downto 0);
              an :out std_logic_vector(7 downto 0)  );
end component;

--模块6 判断过了5秒无操作
component five_sec_passed
Port (clk,up,down,confirm,back:in std_logic;
        up_to_5sec:out std_logic );
end component;

--模块7 状态机
component top_entity
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
            --switch0:IN std_logic;  --四个开关，投入1元、5元、10元、20元
            --switch1:IN std_logic;
            --switch2:IN std_logic;
            --switch3:IN std_logic;  --四个开关，投入1元、5元、10元、20元
            --num:OUT std_logic_vector( 7 downto 0 );  --数码管模块的第几位数
            --dig:OUT std_logic_vector( 7 downto 0 );  --数码管模块的具体管脚
            get_up_to_5sec:IN std_logic;
            status:out std_logic_vector(3 downto 0)     
        );   
end component;

--模块8 选票价
component choose_price
Port (clk,switch4,switch5,switch6,switch7,confirm:in std_logic; --这四个开关分别对应着快速选票价：2元、3元、5元、7元
        ticket_price:out integer;
        flag0:out std_logic;
        dispdata :in std_logic_vector(31 downto 0);
                seg_able :in std_logic_vector(7 downto 0);
        segg :out std_logic_vector(7 downto 0);
        an :out std_logic_vector(7 downto 0);
        get_present_state:in std_logic_vector(3 downto 0));
end component;

--模块9 投币
component pay
Port (clk,switch0,switch1,switch2,switch3:in std_logic;
        real_pay:out integer;
        dispdata :in std_logic_vector(31 downto 0);
                        seg_able :in std_logic_vector(7 downto 0);
                segg :out std_logic_vector(7 downto 0);
                an :out std_logic_vector(7 downto 0);
        get_present_state:in std_logic_vector(3 downto 0)
       ); 
end component;

--模块10 找零出票
component give_change
Port (clk,flag0:in std_logic;
        get_real_pay,get_should_pay,ticket_price:in integer;
        change:out integer;
        dispdata :in std_logic_vector(31 downto 0);
                        seg_able :in std_logic_vector(7 downto 0);
                segg :out std_logic_vector(7 downto 0);
                an :out std_logic_vector(7 downto 0);
        get_present_state:in std_logic_vector(3 downto 0));
end component;

--模块11 退币
component refund
Port (clk:in std_logic;
        get_real_pay:in integer;
        get_present_state:in std_logic_vector(3 downto 0);
        segg :out std_logic_vector(7 downto 0);
        an :out std_logic_vector(7 downto 0);
        dispdata :in std_logic_vector(31 downto 0);
                seg_able :in std_logic_vector(7 downto 0)
        );
end component;

signal sig_up0,sig_down0,sig_confirm0,sig_back0:std_logic;

signal starting_line,end_line: std_logic_vector(1 downto 0);
signal real_pay,should_pay,change,ticket_price:integer;
signal starting_point,end_point:std_logic_vector(4 downto 0);
signal up_to_5sec,flag0:std_logic;
signal present_state:std_logic_vector(3 downto 0);

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
  up=>sig_up0,
  down=>sig_down0,
  confirm=>sig_confirm0,
  starting_line=>starting_line,
  get_present_state=>present_state,
  dispdata=>dispdata,
  seg_able=>seg_able,
  segg=>segg,
  an=>an
);

mux3:choose_starting_point
port map(
  clk1=>clk,
  up1=>sig_up0,
  down1=>sig_down0,
  confirm1=>sig_confirm0,
  get_starting_line=>starting_line,
  starting_point=>starting_point,
  get_present_state=>present_state,
  dispdata=>dispdata,
    seg_able=>seg_able,
  segg=>segg,
    an=>an
);

mux4:choose_end_line
port map(
  clk=>clk,
  up=>sig_up0,
  down=>sig_down0,
  confirm=>sig_confirm0,
  end_line=>end_line,
  get_present_state=>present_state,
  dispdata=>dispdata,
    seg_able=>seg_able,
  segg=>segg,
    an=>an
);  
  
mux5:choose_end_point
port map(
  clk2=>clk,
  led15=>led15,
  up2=>sig_up0,
  down2=>sig_down0,
  confirm2=>sig_confirm0,
  get_starting_line=>starting_line,
  get_starting_point=>starting_point,
  get_end_line=>end_line,
  end_point=>end_point,
  get_present_state=>present_state,
  dispdata=>dispdata,
    seg_able=>seg_able,
  segg=>segg,
    an=>an
);  
  
mux6:five_sec_passed
port map(
clk=>clk,
up=>sig_up0,
down=>sig_down0,
confirm=>sig_confirm0,
back=>sig_back0,
up_to_5sec=>up_to_5sec
);

mux7:top_entity
port map(
clk=>clk,
up=>sig_up0,
down=>sig_down0,
confirm=>sig_confirm0,
back=>sig_back0,
led0=>led0,
led1=>led1,
led2=>led2,
led3=>led3,
--switch0=>switch0,
--switch1=>switch1,
--switch2=>switch2,
--switch3=>switch3,
get_up_to_5sec=>up_to_5sec,
status=>present_state
);

mux8:choose_price
port map(
clk=>clk,
confirm=>sig_confirm0,
switch4=>switch4,
switch5=>switch5,
switch6=>switch6,
switch7=>switch7,
dispdata=>dispdata,
  seg_able=>seg_able,
segg=>segg,
an=>an,
flag0=>flag0,
ticket_price=>ticket_price,
get_present_state=>present_state
);

mux9:pay
port map(
clk=>clk,
switch0=>switch0,
switch1=>switch1,
switch2=>switch2,
switch3=>switch3,
real_pay=>real_pay,
dispdata=>dispdata,
  seg_able=>seg_able,
segg=>segg,
an=>an,
get_present_state=>present_state
);

mux10:give_change
port map(
clk=>clk,
flag0=>flag0,
ticket_price=>ticket_price,
get_real_pay=>real_pay,
get_should_pay=>should_pay,
change=>change,
dispdata=>dispdata,
  seg_able=>seg_able,
segg=>segg,
an=>an,
get_present_state=>present_state
);

mux11:refund
port map(
clk=>clk,
get_real_pay=>real_pay,
dispdata=>dispdata,
  seg_able=>seg_able,
  segg=>segg,
  an=>an,
get_present_state=>present_state
);

end Behavioral;
