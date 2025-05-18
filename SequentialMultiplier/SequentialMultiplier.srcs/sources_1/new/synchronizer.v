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


module synchronizer(input clk, input sig, output sig1);

    reg meta;
    reg sig1_reg;
    
    assign sig1 = sig1_reg;
    
    always @(posedge clk) begin
        meta <= sig;
        sig1_reg <= meta;
    end

endmodule 
