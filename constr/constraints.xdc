# Clock signal
set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { clk }];
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {clk}];
#SWITCH
set_property -dict { PACKAGE_PIN J15    IOSTANDARD LVCMOS33 } [get_ports { switch0 }];
set_property -dict { PACKAGE_PIN L16    IOSTANDARD LVCMOS33 } [get_ports { switch1 }];
set_property -dict { PACKAGE_PIN M13    IOSTANDARD LVCMOS33 } [get_ports { switch2 }];
set_property -dict { PACKAGE_PIN R15    IOSTANDARD LVCMOS33 } [get_ports { switch3 }];
set_property -dict { PACKAGE_PIN R17   IOSTANDARD LVCMOS33 } [get_ports { switch4 }]; #IO_L12N_T1_MRCC_14 Sch=sw[4]
set_property -dict { PACKAGE_PIN T18   IOSTANDARD LVCMOS33 } [get_ports { switch5 }]; #IO_L7N_T1_D10_14 Sch=sw[5]
set_property -dict { PACKAGE_PIN U18   IOSTANDARD LVCMOS33 } [get_ports { switch6}]; #IO_L17N_T2_A13_D29_14 Sch=sw[6]
set_property -dict { PACKAGE_PIN R13   IOSTANDARD LVCMOS33 } [get_ports { switch7 }]; #IO_L5N_T0_D07_14 Sch=sw[7]
#LED;
set_property -dict { PACKAGE_PIN H17    IOSTANDARD LVCMOS33 } [get_ports { led0 }];
set_property -dict { PACKAGE_PIN K15    IOSTANDARD LVCMOS33 } [get_ports { led1 }];
set_property -dict { PACKAGE_PIN J13    IOSTANDARD LVCMOS33 } [get_ports { led2 }];
set_property -dict { PACKAGE_PIN N14    IOSTANDARD LVCMOS33 } [get_ports { led3 }];
set_property -dict { PACKAGE_PIN V11   IOSTANDARD LVCMOS33 } [get_ports { led15 }]; 
#KEY
set_property -dict { PACKAGE_PIN M18    IOSTANDARD LVCMOS33 } [get_ports { confirm }];
set_property -dict { PACKAGE_PIN P18    IOSTANDARD LVCMOS33 } [get_ports { back }];
set_property -dict { PACKAGE_PIN P17    IOSTANDARD LVCMOS33 } [get_ports { up }];
set_property -dict { PACKAGE_PIN M17    IOSTANDARD LVCMOS33 } [get_ports { down }];
#7 segment display
set_property -dict { PACKAGE_PIN T10    IOSTANDARD LVCMOS33 } [get_ports { segg[0] }];#CA
set_property -dict { PACKAGE_PIN R10    IOSTANDARD LVCMOS33 } [get_ports { segg[1] }];#CB
set_property -dict { PACKAGE_PIN K16    IOSTANDARD LVCMOS33 } [get_ports { segg[2] }];#CC
set_property -dict { PACKAGE_PIN K13    IOSTANDARD LVCMOS33 } [get_ports { segg[3] }];#CD
set_property -dict { PACKAGE_PIN P15    IOSTANDARD LVCMOS33 } [get_ports { segg[4] }];#CE
set_property -dict { PACKAGE_PIN T11    IOSTANDARD LVCMOS33 } [get_ports { segg[5] }];#CF
set_property -dict { PACKAGE_PIN L18    IOSTANDARD LVCMOS33 } [get_ports { segg[6] }];#CG
set_property -dict { PACKAGE_PIN H15    IOSTANDARD LVCMOS33 } [get_ports { segg[7] }];#DP

set_property -dict { PACKAGE_PIN J17    IOSTANDARD LVCMOS33 } [get_ports { an[0] }];
set_property -dict { PACKAGE_PIN J18    IOSTANDARD LVCMOS33 } [get_ports { an[1] }];
set_property -dict { PACKAGE_PIN T9    IOSTANDARD LVCMOS33 } [get_ports { an[2] }];
set_property -dict { PACKAGE_PIN J14    IOSTANDARD LVCMOS33 } [get_ports { an[3] }];
set_property -dict { PACKAGE_PIN P14    IOSTANDARD LVCMOS33 } [get_ports { an[4] }];
set_property -dict { PACKAGE_PIN T14    IOSTANDARD LVCMOS33 } [get_ports { an[5] }];
set_property -dict { PACKAGE_PIN K2    IOSTANDARD LVCMOS33 } [get_ports { an[6] }];
set_property -dict { PACKAGE_PIN U13    IOSTANDARD LVCMOS33 } [get_ports { an[7] }];
