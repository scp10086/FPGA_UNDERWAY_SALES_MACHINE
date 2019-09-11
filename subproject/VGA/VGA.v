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
    input clk_vga,
    input[11:0] colour,
    output hsync,
    output vsync,
    output[3:0]vgared,
    output[3:0]vgagreen,
    output[3:0]vgablue,
    output[18:0]addrb
    );
parameter ta = 64,tb = 120,tc = 640,td = 16,te = 840,to = 3,tp = 16, tq = 480,tr = 1, ts = 500;
reg[10:0]x_counter = 0;
reg[10:0]y_counter = 0;
reg[18:0]addr = 9999;
reg hs,vs;



assign    vgared  = colour[11:8];
assign    vgagreen  = colour[7:4];
assign    vgablue  = colour[3:0];
assign hsync = hs;
assign vsync = vs;
always @(posedge clk_vga)
begin
    if(x_counter == te-1)
        x_counter = 0;
    else x_counter = x_counter + 1;
end
always @(posedge clk_vga)
begin
    if((x_counter == te-1)&&(y_counter == ts-1))
        y_counter = 0;
    else if(x_counter == te-1) y_counter = y_counter +1;
end
always @(posedge clk_vga)
begin
    if((x_counter > (tc + td -1))&&(x_counter <= (tc + td + ta -1)))
        hs = 0;
    else hs =1;
end
always @(posedge clk_vga)
begin
    if((y_counter >= (tq + tr -1))&&(y_counter < (tq + tr + to -1)))
        hs = 0;
    else hs =1;
end   

always@(negedge clk_vga)
begin

end 
endmodule


