`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2025 01:07:26 PM
// Design Name: 
// Module Name: Clock_Dvider
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


module Clock_Dvider #(parameter n = 50_000_000)(input clk, rst, output reg clk_out);
wire [31:0] count;
// Big enough to hold the maximum possible value
// Increment count
Binary_Counter #(32,n) counterMod
            (.clk(clk), .reset(rst), .count(count), .en(1'b1));
// Handle the output clock
always @ (posedge clk, posedge rst) begin
    if (rst) // Asynchronous Reset
        clk_out <= 0;
    else if (count == n-1)
        clk_out <= ~ clk_out;
end
endmodule
   
