`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2025 12:58:32 PM
// Design Name: 
// Module Name: ex2
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


module Push_Button_Detector(input clk,rst,X,output Z);
wire clk_out;
wire z1,z2;
Clock_Dvider #(250_000)f( clk, rst, clk_out);
debouncer A(clk, rst, X,  z1);
synchronizer B( clk,  z1, z2);
Rising_Edge_Detector C (clk,rst,z2,Z);
endmodule


