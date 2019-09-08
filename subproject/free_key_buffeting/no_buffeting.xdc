# Clock signal
set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { clk }]; #IO_L12P_T1_MRCC_35 Sch=clk100mhz

set_property -dict { PACKAGE_PIN N17   IOSTANDARD LVCMOS33 } [get_ports { keyin }]; #IO_L9P_T1_DQS_14 Sch=btnc

set_property -dict { PACKAGE_PIN H17   IOSTANDARD LVCMOS33 } [get_ports { keyout }]; #IO_L18P_T2_A24_15 Sch=led[0]