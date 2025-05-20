`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/19/2025 10:05:51 PM
// Design Name: 
// Module Name: BCDtoXS3_TB
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


module BCDtoXS3_TB( );
reg [3:0] BCD;
wire [3:0] Result;
BCDtoXS3 uut (BCD, Result);
integer  i;
initial begin
for(i=0;i<10;i=i+1)begin
BCD = i;#10;

end 
end
endmodule
