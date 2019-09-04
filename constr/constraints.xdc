# Clock signal
set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { clk }];
#SWITCH
set_property -dict { PACKAGE_PIN J15    IOSTANDARD LVCMOS33 } [get_ports { switch[0] }];
set_property -dict { PACKAGE_PIN L16    IOSTANDARD LVCMOS33 } [get_ports { switch[1] }];
set_property -dict { PACKAGE_PIN M13    IOSTANDARD LVCMOS33 } [get_ports { switch[2] }];
set_property -dict { PACKAGE_PIN R15    IOSTANDARD LVCMOS33 } [get_ports { switch[3] }];
#LED;
set_property -dict { PACKAGE_PIN H17    IOSTANDARD LVCMOS33 } [get_ports { led[0] }];
set_property -dict { PACKAGE_PIN K15    IOSTANDARD LVCMOS33 } [get_ports { led[1] }];
set_property -dict { PACKAGE_PIN J13    IOSTANDARD LVCMOS33 } [get_ports { led[2] }];
set_property -dict { PACKAGE_PIN N14    IOSTANDARD LVCMOS33 } [get_ports { led[3] }];
#KEY
set_property -dict { PACKAGE_PIN M18    IOSTANDARD LVCMOS33 } [get_ports { confirm }];
set_property -dict { PACKAGE_PIN P18    IOSTANDARD LVCMOS33 } [get_ports { back }];
set_property -dict { PACKAGE_PIN P17    IOSTANDARD LVCMOS33 } [get_ports { up }];
set_property -dict { PACKAGE_PIN M17    IOSTANDARD LVCMOS33 } [get_ports { down }];
#7 segment display
set_property -dict { PACKAGE_PIN T10    IOSTANDARD LVCMOS33 } [get_ports { dig[0] }];
set_property -dict { PACKAGE_PIN R10    IOSTANDARD LVCMOS33 } [get_ports { dig[1] }];
set_property -dict { PACKAGE_PIN K16    IOSTANDARD LVCMOS33 } [get_ports { dig[2] }];
set_property -dict { PACKAGE_PIN K13    IOSTANDARD LVCMOS33 } [get_ports { dig[3] }];
set_property -dict { PACKAGE_PIN P15    IOSTANDARD LVCMOS33 } [get_ports { dig[4] }];
set_property -dict { PACKAGE_PIN T11    IOSTANDARD LVCMOS33 } [get_ports { dig[5] }];
set_property -dict { PACKAGE_PIN L18    IOSTANDARD LVCMOS33 } [get_ports { dig[6] }];
set_property -dict { PACKAGE_PIN H15    IOSTANDARD LVCMOS33 } [get_ports { dig[7] }];

set_property -dict { PACKAGE_PIN J17    IOSTANDARD LVCMOS33 } [get_ports { num[0] }];
set_property -dict { PACKAGE_PIN J18    IOSTANDARD LVCMOS33 } [get_ports { num[1] }];
set_property -dict { PACKAGE_PIN T9    IOSTANDARD LVCMOS33 } [get_ports { num[2] }];
set_property -dict { PACKAGE_PIN J14    IOSTANDARD LVCMOS33 } [get_ports { num[3] }];
set_property -dict { PACKAGE_PIN P14    IOSTANDARD LVCMOS33 } [get_ports { num[4] }];
set_property -dict { PACKAGE_PIN T14    IOSTANDARD LVCMOS33 } [get_ports { num[5] }];
set_property -dict { PACKAGE_PIN K2    IOSTANDARD LVCMOS33 } [get_ports { num[6] }];
set_property -dict { PACKAGE_PIN U13    IOSTANDARD LVCMOS33 } [get_ports { num[7] }];
