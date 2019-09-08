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
    input rst,
    input en,
    input we,
    input [15:0] din,
    input [9:0] addr,
    output[15:0]dout
//    input[11:0]switch
//    output hsync,
//    output vsync,
//    output[3:0]vgared,
//    output[3:0]vgagreen,
//    output[3:0]vgablue
    );
    
blk_mem_gen_0 uut
(
.clka(clk),
.rsta(rst),
.ena(en),
.wea(we),
.addra(addr),
.dina(din),
.douta(dout)
);    
    
//parameter ta = 80,tb = 160,tc = 800,td = 16,te = 1056,to = 3,tp = 21, tq = 600,tr = 1, ts = 625;
//reg[10:0]x_counter = 0;
//reg[10:0]y_counter = 0;
//reg [2:0]colour;
//wire clk_vga;    
//clk_wiz_0 uut_clk
//(
//    .clk_in1(clk),
//    .clk_out1(clk_vga)
//);    
//always @(posedge clk_vga) 
//begin
//if(x_counter == te - 1)
//    begin
//    x_counter = 0;
//    if(y_counter == ts - 1)
//        y_counter = 0;
//    else
//        y_counter = y_counter + 1;
//    end
//else
//    begin
//        x_counter = x_counter + 1;
//    end
//end
//always @(x_counter or y_counter)
//begin
//    if(x_counter < 340) colour <=3'b001;
//        else if(x_counter < 440) colour <= 3'b010;
//        else if(x_counter < 540) colour <= 3'b011;
//        else if(x_counter < 640) colour <= 3'b100;
//        else if(x_counter < 740) colour <= 3'b101;
//        else if(x_counter < 840) colour <= 3'b110;
//        else if(x_counter < 940) colour <= 3'b111;
//        else colour<=3'b000;
//end

//assign vgared = {4{colour[2]}};
//assign vgagreen = {4{colour[1]}};
//assign vgablue = {4{colour[0]}};
//assign hsync = ! (x_counter < ta);
//assign vsync = ! (y_counter < to);
endmodule


