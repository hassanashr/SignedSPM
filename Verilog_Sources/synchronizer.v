`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2025 01:04:57 PM
// Design Name: 
// Module Name: synchronizer
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


module synchronizer(input clk,R, input sig, output reg sig1);

  reg META;
always @(posedge clk or posedge R) begin
    if (R) begin
        META <= 1'b0;
        sig1 <= 1'b0;
    end
    else begin
        META <= sig;
        sig1 <= META;
    end
end
endmodule 
