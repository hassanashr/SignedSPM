`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2025 04:09:42 PM
// Design Name: 
// Module Name: DigitDisplayDriver
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


module DigitDisplayDriver(input sign, clk, rst,input [3:0] BCD0, BCD1, BCD2,output [6:0] segments,output [3:0] en);
wire Clk_Out;
wire [1:0] toggleEnable;
reg[3:0] in1;

Clock_Dvider #(.n(250_000)) toggleClock(.clk(clk), .rst(rst), .clk_out(Clk_Out));
Binary_Counter #(.x(2), .n(4)) toggler(.clk(Clk_Out), .reset(rst), .en(1'b1), .count(toggleEnable));
Seven_Segment_Display segmentor(.toggle(toggleEnable), .in(in1), .segments(segments), .anode_active(en));

always @(*) begin
    case(toggleEnable)
        0: in1 = BCD0;
        1: in1 = BCD1;
        2: in1 = BCD2;
        3: in1 = (sign == 1)?4'd10:4'd11;
    endcase
   end
endmodule

