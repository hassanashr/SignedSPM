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


module PushButton(input clk,rst,X,output Z);
wire t1, t2;
Debouncer Deb(.clk(clk), .rst(rst), .in(w), .out(t1));
Synchronizer Sync(.clk(clk), .rst(rst), .sig(t1), .sig1(t2)); 
Meelay_RisingEdge_Detector posedgedet(.clock(clk), .reset(rst), .w(t2), .z(z));
endmodule
