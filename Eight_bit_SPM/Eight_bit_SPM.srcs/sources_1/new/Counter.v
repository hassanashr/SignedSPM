`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2025 12:39:22 AM
// Design Name: 
// Module Name: Counter
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


module Counter#( parameter x = 3, n = 6) (input clk, reset,input en, output reg [x-1:0] count);  
    always @(posedge clk, posedge reset) begin
        if (reset == 1)
            count <= 0; // non-blocking assignment
        else if (en) begin 
            if (count == n-1)
                   count <= n-1; // non-blocking assignment

            else count <= count + 1; // non-blocking assignment
        end 
      
     
    end
endmodule
  


