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


module Clock_Dvider #(parameter n = 250_000)(input clk, rst, output reg clk_out);

reg [31:0] count;

always @ (posedge clk, posedge rst) begin
    if (rst == 1'b1) // Asynchronous Reset
    count <= 32'b0;
    else if (count == n-1)
    count <= 32'b0;
    else
    count <= count + 1;
end

always @ (posedge clk, posedge rst) begin
    if (rst) // Asynchronous Reset
    clk_out <= 0;
    else if (count == n-1)
    clk_out <= ~ clk_out;
    end
    
endmodule
   
