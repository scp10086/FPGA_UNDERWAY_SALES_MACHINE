`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/09/11 14:42:00
// Design Name: 
// Module Name: computeprice
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


module computeprice(
    input clk,
    input[1:0]startline,
    input[5:0]startpoint,
    input[1:0]endline,
    input[5:0]endpoint,
    output reg[18:0]price_addr
    
    );
reg[18:0]romaddra_host = 19'h0;
reg[18:0]romaddra_slave = 19'h0;
reg[6:0]set_100 = 7'd100;

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

endmodule
