`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2025 10:42:06 AM
// Design Name: 
// Module Name: SPM_Tb
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


module SPM_Tb();


    // Inputs
    reg [7:0] X, Y;
    reg clk, R, Go;

    // Outputs
    wire done;
    wire [15:0] P_reg;

    // Instantiate the Unit Under Test (UUT)
    SPM uut (
        .X(X),
        .Y(Y),
        .R(R),
        .clk(clk),
        .Go(Go),
        .done(done),
        .P_reg(P_reg)
    );

    // Clock Generation: 10ns period (100MHz)
    always #5 clk = ~clk;

    initial begin
        // Initialize Inputs
        clk = 0;
        R = 1;
        Go = 0;
        X = 0;
        Y = 0;

        // Hold reset for some time
        #20;
        R = 0;

        // Load values and start multiplication
        #10;
        X = 8'd255;  // Example: -13 (signed)
        Y = 8'd255;    // Example: 3 (signed)
        Go = 1;

        #10;
        Go = 0;      // Remove Go pulse

        // Wait until done
        wait(done);

        // Display result
        $display("X = %d, Y = %d, P = %d (0x%h)", X, Y, $signed(P_reg), P_reg);

        // Finish simulation
        #20;
        $finish;
    end


endmodule
