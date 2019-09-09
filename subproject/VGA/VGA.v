`timescale 1s / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/09/03 15:19:56
// Design Name: 
// Module Name: VGA
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


module VGA(
    input clk,
    output hsync,
    output vsync,
    output[3:0]vgared,
    output[3:0]vgagreen,
    output[3:0]vgablue
    );
parameter ta = 96,tb = 48,tc = 640,td = 16,te = 800,to = 2,tp = 33, tq = 480,tr = 10, ts = 525;
reg[10:0]x_counter = 0;
reg[10:0]y_counter = 0;
reg[18:0]addr = 9999;
wire[11:0]colour;
wire clk_vga;

clk_wiz_0 uut_tim(
.clk_in1(clk),
.clk_out1(clk_vga)

);
dispram uut_disp(
.clk(clk_vga),
.ramaddrb(addr),
.ramdoutb(colour)
);

always @(negedge clk_vga) 
begin
if(x_counter == te - 1)
    begin
    x_counter = 0;
    if(y_counter == ts - 1)
        y_counter = 0;
    else
        y_counter = y_counter + 1;
    end
else
    begin
        x_counter = x_counter + 1;
    end
if((y_counter >= (to+tp))&&(y_counter < to+tp+ tq))
begin
    if((x_counter >= ta +tb -2)&&(x_counter<(ta+tb+tc -2)))
    begin
    addr = addr + 1;
    end
end
else
begin
addr = 9999;
end
end
assign    vgared  = colour[11:8];
assign    vgagreen  = colour[7:4];
assign    vgablue  = colour[3:0];
assign hsync = ! (x_counter < ta);
assign vsync = ! (y_counter < to);
endmodule


