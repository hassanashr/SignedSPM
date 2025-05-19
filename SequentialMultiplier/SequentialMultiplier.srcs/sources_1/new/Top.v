`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/19/2025 02:01:05 PM
// Design Name: 
// Module Name: Top
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


module Top(input clk,
    input R,
    input [7:0] X,
    input [7:0] Y,
    input Multiply,
    input btn_left,
    input btn_right,
    output [6:0] segments,
    output [3:0] digit_select,
    output done
);
    wire [15:0] product;
    SPM multiplier(
        .X(X),
        .Y(Y),
        .R(R),
        .clk(clk),
        .Multiply(Multiply),
        .done(done),
        .P_reg(product),
        .segments(segments),
        .digit_select(digit_select),
        .btn_left(btn_left),
        .btn_right(btn_right)
    );
endmodule
