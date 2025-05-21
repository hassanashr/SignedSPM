`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2025 03:37:32 PM
// Design Name: 
// Module Name: Sign_Producer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:0
// 
//////////////////////////////////////////////////////////////////////////////////


module Sign_Producer(input [15:0] Signed_Product, input clk, load,output reg sign ,output reg [15:0]Abs_Result);
//output reg [7:0] num1_abs, num2_abs
always @ (posedge clk) begin
    if(load) sign <= Signed_Product[15];
    else sign <= 1'b0;
    Abs_Result <= (Signed_Product[15])? (~Signed_Product+1):Signed_Product;
//    Abs_Result <= (A[7] == 0)? A: ~A + 1;
//    num2_abs <= (B[7] == 0)? B: ~B + 1;
end
endmodule
