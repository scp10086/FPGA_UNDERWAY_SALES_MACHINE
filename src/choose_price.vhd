----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2019/09/05 15:55:52
-- Design Name: 
-- Module Name: choose_price - Behavioral
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

entity choose_price is
  Port (clk,switch4,switch5,switch6,switch7,confirm:in std_logic; --这四个开关分别对应着快速选票价：2元、3元、5元、7元
        --led4,led5,led6,led7:out std_logic;
        segg :out std_logic_vector(7 downto 0);
        an :out std_logic_vector(7 downto 0);
        get_present_state:in std_logic_vector(3 downto 0);
        ticket_price:out integer;
        flag0:out std_logic);
end choose_price;

architecture Behavioral of choose_price is

component seven_segment_disp_0
port
 (
    clk :in std_logic;
    dispdata :in std_logic_vector(31 downto 0);
    seg_able :in std_logic_vector(7 downto 0);
    segg :out std_logic_vector(7 downto 0);
    an :out std_logic_vector(7 downto 0)
 );
end component;

signal disp_data_2 : std_logic_vector(31 downto 0);
signal seg_able_2 : std_logic_vector( 7 downto 0);
signal confirm0,switch40,switch50,switch60,switch70:std_logic;
begin

seg_able_2 <= "11111111"; 

segment_disp_0 : seven_segment_disp_0
port map(
        clk => clk,
        dispdata =>  disp_data_2,
        seg_able =>  seg_able_2,
        segg => segg,
        an => an  
);

process(clk)
begin
if (clk'event and clk='1') then
    confirm0<=confirm;
    switch40<=switch4;
    switch50<=switch5;
    switch60<=switch6;
    switch70<=switch7;
end if;
end process;

process(clk,confirm,switch4,switch5,switch6,switch7,get_present_state)
begin
  if (clk'event and clk='1') then
  
  if(get_present_state="0011") then
  flag0<='1'; --如果经过了选票价这个环节 那么设标志位为1
  
    if (switch4='1'and switch40='0') then 
       if(confirm='1'and confirm0='0') then ticket_price<=2;disp_data_2<=x"00000002";end if;
    end if;
    
    if (switch5='1'and switch50='0') then 
       if(confirm='1'and confirm0='0') then ticket_price<=3;disp_data_2<=x"00000003";end if;
    end if;

    if (switch6='1'and switch60='0') then 
       if(confirm='1'and confirm0='0') then ticket_price<=5;disp_data_2<=x"00000005";end if;
    end if;
    
    if (switch7='1'and switch70='0') then 
           if(confirm='1'and confirm0='0') then ticket_price<=7;disp_data_2<=x"00000007";end if;
        end if;

  end if;
  else flag0<='0';
end if;
end process;

end Behavioral;
