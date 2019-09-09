`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/09/09 19:47:38
// Design Name: 
// Module Name: dispram
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


module dispram(
    input clk,  //clk
    //input wea, //write enable
    //input[18:0]ramaddra, 
    //input[15:0]ramdina, 
    //input enb, 
    input[18:0]ramaddrb,
    //output[11:0]ramdouta,
    output[11:0]ramdoutb
    );
wire[11:0] k; 
blk_mem_gen_0 uut_ram(
    .clka(0),
    .ena(0),
    .wea(0),
    .addra(0),
    .dina(0),
    .douta(k),
    .clkb(clk),
    .enb(1),
    .web(0),
    .addrb(ramaddrb),
    .dinb(0),
    .doutb(ramdoutb)
    );    
endmodule
