`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2025 12:35:19 AM
// Design Name: 
// Module Name: PushButton
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


module PushButton(input clk,rst,x,output Z);
wire t1, t2;
debouncer Deb(.clk(clk), .rst(rst), .in(x), .out(t1));
synchronizer Sync(.clk(clk), .R(rst), .sig(t1), .sig1(t2)); 
Meelay_RisingEdge_Detector posedgedet(.clock(clk), .reset(rst), .w(t2), .z(Z));
endmodule
