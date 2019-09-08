`timescale 1ms / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/09/08 16:16:04
// Design Name: 
// Module Name: mem_gen
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


module mem_gen;
reg clk =0;
reg rst = 0;
reg we = 0;
reg en =1;
reg[15:0]din=0;
reg[9:0]addr=0;
wire[15:0]dout;
reg[9:0]cnt1 = 0;
reg[9:0]cnt2 = 0;
VGA ss(clk,rst,en,we,din,addr,dout);
always #10 clk = ~clk;
always @(posedge clk)
begin
    if(cnt1 == 8)
    begin
        cnt1 = 0;
        cnt2 = cnt2 + 1;
    end
else
begin
        cnt1 = cnt1+1;
end
end
always @(negedge clk)
begin
    din = cnt1;
        addr = cnt1;
    if(cnt2[0] == 0) we = 0;
    else we = 1;
end

endmodule
