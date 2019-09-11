`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/09/11 19:07:15
// Design Name: 
// Module Name: readprice
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


module readprice;
reg clk;
reg[1:0]startline = 0;
reg[5:0]startpoint = 0;
reg[1:0]endline =1;
reg[5:0]endpoint =1;
wire[7:0]segg;
wire[7:0]an;
dispram si(
clk,
startline,
startpoint,
endline,
endpoint,
segg,
an
);
initial begin
clk =0;
end
always #10 clk=~clk;
endmodule
