`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2025 11:29:09 PM
// Design Name: 
// Module Name: CSA
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



module CSA ( input X,input Y,input R,input clk,output reg SUM);

	wire d1,d2,HSUM1,CAR1,CAR2;
	reg SC; 
	HA myHA (Y,SC,HSUM1,CAR1);
	
	assign d1 = X ^ HSUM1;
	assign d2 = CAR1 ^ CAR2;
	assign CAR2 = X & HSUM1;
	
	always@(posedge clk or posedge R) begin
		if (R) begin 
			SUM <= 1'b0;
			SC <= 1'b0;
		end
		else begin	
			SUM <= d1;
			SC  <= d2;
		end
	end
endmodule