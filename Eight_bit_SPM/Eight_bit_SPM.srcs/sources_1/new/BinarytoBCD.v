`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2025 11:44:04 AM
// Design Name: 
// Module Name: BinarytoBCD
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


module BinarytoBCD(input [15:0] Binary,output [4:0] d0, d1, d2, d3, d4);

reg [19:0] BCD;
integer i;
	
always @(Binary) begin
    BCD=0;		 	
    for (i=0;i<16;i=i+1) begin
        if (BCD[3:0] >= 5) BCD[3:0] = BCD[3:0] + 3;
        if (BCD[7:4] >= 5) BCD[7:4] = BCD[7:4] + 3;
        if (BCD[11:8] >= 5) BCD[11:8] = BCD[11:8] + 3;
        if (BCD[15:12] >= 5) BCD[15:12] = BCD[15:12] + 3;
        if (BCD[19:16] >= 5) BCD[19:16] = BCD[19:16] + 3;
        BCD = {BCD[18:0],Binary[15-i]};
    end
end

assign d0 = BCD[3:0];
assign d1 = BCD[7:4];
assign d2 = BCD[11:8];
assign d3 = BCD[15:12];
assign d4 = BCD[19:16];

endmodule


