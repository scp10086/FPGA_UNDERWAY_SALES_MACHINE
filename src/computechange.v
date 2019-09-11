`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/09/11 22:14:11
// Design Name: 
// Module Name: computechange
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


module computechange(
    input clk,
    input flag0,
    input[1:0]get_amount,
    input[3:0]ticket_price,
    input[4:0]get_real_pay,
    input[3:0]get_price,
    input[3:0]get_present_state,
    output[4:0]change,
    output[4:0]total,
    output[31:0]dispdata
    );
reg [4:0] total_price = 0;
reg [31:0] rest_money = 0;
assign  dispdata = rest_money;
assign  change = rest_money[4:0];
assign total = total_price;
always @(posedge clk )
begin
    if (get_present_state == 4'b1000)
    begin
        total_price = get_price * get_amount;
        if(flag0 == 0)
            rest_money = get_real_pay - total_price;
        else rest_money = get_real_pay - ticket_price;
    end
   
end
endmodule
