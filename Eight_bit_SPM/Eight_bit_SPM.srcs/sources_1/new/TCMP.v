`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2025 01:39:07 PM
// Design Name: 
// Module Name: TCMP
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


module TCMP(input A,input R,input clk,output reg S);

	wire OR2, XOR1;
	reg Z;

    	assign OR2 = A | Z;
	assign XOR1 = A ^Z;
	
	//first dff
    	always @(posedge clk or posedge R) begin
        	if (R) begin
            		S <= 1'b0;
            		Z <= 1'b0;
            		end
        	else begin
            		S <= XOR1;
            		Z <= OR2; 
           end
    	end

endmodule


