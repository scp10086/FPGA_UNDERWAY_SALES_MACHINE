
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


set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { clk }];
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {clk}];







