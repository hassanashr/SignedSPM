`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2025 04:29:09 PM
// Design Name: 
// Module Name: top
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


module top(input [7:0] X, Y, output [6:0] segments, input clk, R, Go, right, left, output [3:0] enable,output done);

wire [15:0] Signed_Product , Unsigned_Product;
wire [4:0] D0, D1, D2, D3, D4;
wire [4:0] S0, S1, S2;
wire left_out, right_out, sign;
wire clk_slow;
wire Go_out;

Clock_Dvider clk_out(.clk(clk), .rst(R), .clk_out(clk_slow));

PushButton BTNC (.clk(clk_slow), .rst(R), .x(Go), .Z(Go_out));
PushButton BTNL (.clk(clk_slow), .rst(R), .x(left), .Z(left_out));
PushButton BTNR (.clk(clk_slow), .rst(R), .x(right), .Z(right_out));




SPM MySPM(.X(X), .Y(Y), .R(R),.clk(clk_slow),.Go(Go_out),  .done(done), .P_reg(Signed_Product));

Sign_Producer sign_calc(.Signed_Product(Signed_Product), .clk(clk_slow) ,.load(done),.sign(sign),.Abs_Result(Unsigned_Product));


BinarytoBCD Converter(.Binary(Unsigned_Product), .d0(D0), .d1(D1), .d2(D2), .d3(D3), .d4(D4));


Digit_Selector Shifter(.D0(D0), .D1(D1), .D2(D2), .D3(D3), .D4(D4), .clk(clk_slow), .R(R), .w1(right_out), .w2(left_out), .S0(S0), .S1(S1), .S2(S2));

DigitDisplayDriver Display(.sign(sign), .clk(clk_slow), .rst(R), .BCD0(S0), .BCD1(S1), .BCD2(S2), .segments(segments), .en(enable));
endmodule
