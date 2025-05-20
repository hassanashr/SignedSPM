`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2025 12:30:21 AM
// Design Name: 
// Module Name: SPM
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


module SPM(input  [7:0] X,Y , input R,clk,Go,output reg done, output reg  [15:0] P_reg);
wire [2:0] Y_count;
wire [4:0] P_count;

reg [7:0] Y_reg;
reg multiplying_Y;
reg multiplying_P;
wire enable_count_Y = multiplying_Y;
wire enable_count_P= multiplying_P;
always @(posedge clk or posedge R) begin
    if (R) begin
        multiplying_Y <= 0;
        multiplying_P<=0;
    end else if (Go) begin
        multiplying_Y <= 1;
        multiplying_P<=1;
    end else if (Y_count == 3'd7) begin
        multiplying_Y <= 0; 
        end else if(P_count == 5'd16)begin
        multiplying_P <= 0; 
        end
end
Counter#(3,8) Y_Counter( clk, R,enable_count_Y, Y_count);
  always @(posedge clk or posedge R) begin
    if (R) begin
        Y_reg <= 8'b0;  // Reset to 0
    end else if (Go) begin
        Y_reg <= Y;     // Load Y
    end else if (Y_count < 3'd7) begin
        Y_reg <= {Y_reg[7], Y_reg[7:1]};  // Arithmetic right shift
    end
end


    Counter#(5,17) P_Counter( clk, R,enable_count_P, P_count);
    wire current_Y_bit = Y_reg[0];
    
    wire current_P;
    wire signed[7:0] XY;
	wire [7:1] PP;
	
	assign XY[7] = X[7] & current_Y_bit;
	assign XY[6] = X[6] & current_Y_bit;
	assign XY[5] = X[5] & current_Y_bit;
	assign XY[4] = X[4] & current_Y_bit;
	assign XY[3] = X[3] & current_Y_bit;
	assign XY[2] = X[2] & current_Y_bit;
	assign XY[1] = X[1] & current_Y_bit;
	assign XY[0] = X[0] & current_Y_bit;

	 	
	
	TCMP TCMP1 (.A(XY[7]), .R(R), .clk(clk),.S(PP[7]));
		
	CSA CSA6(.X(XY[6]),.Y(PP[7]),.R(R),.clk(clk),.SUM(PP[6]));
	CSA CSA5(.X(XY[5]),.Y(PP[6]),.R(R),.clk(clk),.SUM(PP[5]));
	CSA CSA4(.X(XY[4]),.Y(PP[5]),.R(R),.clk(clk),.SUM(PP[4]));
	CSA CSA3(.X(XY[3]),.Y(PP[4]),.R(R),.clk(clk),.SUM(PP[3]));
	CSA CSA2(.X(XY[2]),.Y(PP[3]),.R(R),.clk(clk),.SUM(PP[2]));
	CSA CSA1(.X(XY[1]),.Y(PP[2]),.R(R),.clk(clk),.SUM(PP[1]));
	CSA CSA0(.X(XY[0]),.Y(PP[1]),.R(R),.clk(clk),.SUM(current_P));

always @(posedge clk or posedge R) begin
    if (R) begin
        P_reg <= 16'b0;
        done <= 1'b0;
    end else begin
        if (P_count < 5'd16) begin
            P_reg <= {current_P, P_reg[15:1]};  // Shift in result
            done <= 1'b0;
        end else if (P_count == 5'd16 && done == 1'b0) begin
            P_reg <= {current_P, P_reg[15:1]};  // Final shift
            done <= 1'b1;
        end
        // No else needed: P_reg holds its value after done
    end
end


   
endmodule

