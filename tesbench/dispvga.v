`timescale 1s / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/09/10 00:31:29
// Design Name: 
// Module Name: dispvga
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module dispvga;
reg clk2 = 0;
wire HSYNC,VSYNC;
wire[3:0]VGARED;
wire[3:0]VGAGREEN;
wire[3:0]VGABLUE;
VGA v_vga(
.clk(clk2),
.hsync(HSYNC),
.vsync(VSYNC),
.vgared(VGARED),
.vgagreen(VGAGREEN),
.vgablue(VGABLUE)
);
always #10 clk2 =~clk2;
endmodule
