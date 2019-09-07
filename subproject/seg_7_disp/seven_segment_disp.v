`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/09/05 13:50:31
// Design Name: 
// Module Name: seven_segment_disp
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


module seven_segment_disp(
    input clk,
    input [31:0]dispdata,
    input [7:0] seg_able, 
    output reg [7:0]segg,
    output reg [7:0]an
    );
reg [31:0] divclk_cnt = 0;
reg divclk = 0;
reg [2:0] loop_bit = 3'b000;
reg [3:0] loop_data ;

parameter maxcnt = 25000;
always@(posedge clk)
begin
if(divclk_cnt == maxcnt)
begin
    divclk = ~divclk;
    divclk_cnt = 0;
end
else
begin
    divclk_cnt = divclk_cnt + 1'b1;
    end
end
always@(posedge divclk)
begin
case(loop_bit)
        3'b000:
        begin
        if(seg_able[0])
        begin
        an = 8'b11111110;
        end
        else
        begin
        an = 8'b11111111;
        end
        loop_data[3:0] = dispdata [3:0]; 
        end
        3'b001:
        begin
        if(seg_able[1])
        begin
        an = 8'b11111101;
        end
        else
        begin
        an = 8'b11111111;
        end
        loop_data[3:0] = dispdata [7:4]; 
        end
        3'b010:
        begin
        if(seg_able[2])
        begin
        an = 8'b11111011;
        end
        else
        begin
        an = 8'b11111111;
        end
        loop_data[3:0] = dispdata [11:8]; 
        end
        3'b011:
        begin
        if(seg_able[3])
        begin
        an = 8'b11110111;
        end
        else
        begin
        an = 8'b11111111;
        end
        loop_data[3:0] = dispdata [15:12]; 
        end
        3'b100:
        begin
        if(seg_able[4])
        begin
        an = 8'b11101111;
        end
        else
        begin
        an = 8'b11111111;
        end
        loop_data[3:0] = dispdata [19:16]; 
        end
        3'b101:
        begin
        if(seg_able[5])
        begin
        an = 8'b11011111;
        end
        else
        begin
        an = 8'b11111111;
        end
        loop_data[3:0] = dispdata [23:20]; 
        end
        3'b110:
        begin
        if(seg_able[6])
        begin
        an = 8'b10111111;
        end
        else
        begin
        an = 8'b11111111;
        end
        loop_data[3:0] = dispdata [27:24]; 
        end
        3'b111:
        begin
        if(seg_able[7])
        begin
        an = 8'b01111111;
        end
        else
        begin
        an = 8'b11111111;
        end
        loop_data[3:0] = dispdata [31:28]; 
        end                                                            
    endcase
loop_bit = loop_bit + 1'b1;

end
always@(loop_data)
begin
case(loop_data)
4'h0:segg=8'hc0;
4'h1:segg=8'hf9;
4'h2:segg=8'ha4;
4'h3:segg=8'hb0;
4'h4:segg=8'h99;
4'h5:segg=8'h92;
4'h6:segg=8'h82;
4'h7:segg=8'hf8;
4'h8:segg=8'h80;
4'h9:segg=8'h90;
4'ha:segg=8'h88;
4'hb:segg=8'h83;
4'hc:segg=8'hc6;
4'hd:segg=8'ha1;
4'he:segg=8'h86;
4'hf:segg=8'h8e;
endcase
end
endmodule
