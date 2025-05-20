`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/19/2025 10:29:46 PM
// Design Name: 
// Module Name: vending_machine_TB
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


module vending_machine_TB();

reg clk,R , ten,twenty;
wire Release;
vending_machine uut (clk, R,ten,twenty,Release);
integer  i;
initial begin

forever #5 clk = ~clk;
end
initial begin
clk=1; R=1 ;
ten =1'b0;
 twenty =1'b0;
#10
R=0;
 ten =1'b0;
 twenty =1'b0;
 #10
 R=0;
 ten = 1'b1;
 twenty =1'b0;
 #10
 R=0;
 ten = 1'b0;
 twenty =1'b1;
 #10
 R=0;
  ten =1'b0;
 twenty =1'b0;
 #10
 R=0;
 ten = 1'b1;
 twenty =1'b0;
  #10
  R=0;
 ten = 1;
 twenty =0;
 #10
 R=0;
  ten =0;
 twenty =0;
 #10
 R=0;
  ten =0;
 twenty =0;
 #10
 R=0;
 ten = 0;
 twenty =1;
 #10
 R=0;
 ten = 0;
 twenty =1;
 #10
 R=0;
 ten =0;
 twenty =0;
 #10
  R=0;
 ten = 0;
 twenty =1;
 
 #10
  R=0;
 ten = 1;
 twenty =0;
 
 #10
  R=0;
 ten = 0;
 twenty =0;
 
 #10
  R=0;
 ten = 1;
 twenty =0;
 
 #10
  R=0;
 ten = 1;
 twenty =0;
 
  #10
  R=0;
 ten = 0;
 twenty =1;
 
  #10
  R=0;
 ten = 1;
 twenty =0;
 #10
$finish;
end
endmodule


