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
    input clk,
    input[31:0]startline,
    input[31:0]startpoint,
    input[31:0]endline,
    input[31:0]endpoint,
    output[31:0]price
    );
wire clk_disp;
wire[18:0]ramaddra ;

wire[11:0]ramdouta ;

reg[18:0]ramaddrb = 19'd10000;
wire[11:0]ramdoutb ;

begin 
clk_wiz_0 uut_tim(
.clk_in1(clk),
.clk_out1(clk_disp)

);

reg[18:0]romaddra_host = 19'h0;
reg[18:0]romaddra_slave = 19'h0;
reg[6:0]set_100 = 7'd100;
reg[18:0]price_addr;
assign price[3:0] = ramdouta[3:0];
always @(negedge clk)
begin
    case(startline)
        2'b00:
        begin
            romaddra_host = (startpoint + 0 )*set_100;  
        end
        2'b01:
        begin
            romaddra_host = (startpoint + 27 )*set_100;  
        end
        2'b10:
        begin
            romaddra_host = (startpoint + 53 )*set_100;  
        end
        2'b11:
        begin
            romaddra_host = (startpoint + 82 )*set_100;  
        end
endcase;
    case(endline)
        2'b00:
        begin
            romaddra_slave = (endpoint + 0 );  
        end
        2'b01:
        begin
            romaddra_slave = (endpoint + 27 );  
        end
        2'b10:
        begin
            romaddra_slave = (endpoint + 53 );  
        end
        2'b11:
        begin
            romaddra_slave = (endpoint + 82 );  
        end
endcase;
price_addr = romaddra_slave + romaddra_host;

end

//computeprice cp(
//.clk(clk_disp),
//.startline(startline),
//.startpoint(startpoint),
//.endline(endline),
//.endpoint(endpoint),
//.price_addr(ramaddra)
//);


//VGA vga(
//.clk_vga(clk_disp),
//.colour(ramdoutb),
//    output hsync,
//    output vsync,
//    output[3:0]vgared,
//    output[3:0]vgagreen,
//    output[3:0]vgablue,
//    output[18:0]addrb
//    );

blk_mem_gen_0 uut_ram(
    .clka(clk_disp),
    .ena(1),
    .wea(0),
    .addra(price_addr),
    .dina(0),
    .douta(ramdouta),
    .clkb(clk),
    .enb(1),
    .web(0),
    .addrb(ramaddrb),
    .dinb(0),
    .doutb(ramdoutb)
    ); 
 end

endmodule
