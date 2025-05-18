`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2025 04:37:36 PM
// Design Name: 
// Module Name: SPM_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Updated testbench for SPM with Multiply input
// 
//////////////////////////////////////////////////////////////////////////////////

module SPM_tb();

    reg signed [7:0] X, Y;
    reg clk, R, Multiply;
    wire done;
    wire signed [15:0] P_reg;

    // Instantiate the design under test
    SPM uut (
        .X(X),
        .Y(Y),
        .R(R),
        .clk(clk),
        .Multiply(Multiply),
        .done(done),
        .P_reg(P_reg)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns clock period
    end

    // Test stimulus
    initial begin
        // Initialize inputs
        X = -5;         // 8'b11111011
        Y = -5;         // 8'b11111011
        R = 1;
        Multiply = 0;
        #20;

        // Release reset
        R = 0;

        // Wait a few cycles, then trigger Multiply
        #20;
        Multiply = 1;
        #10;  // Keep Multiply high for 1 clock cycle
        Multiply = 0;

        // Wait until multiplication is done
     

        // Display the result
        #100;  // wait a bit for P_reg to settle
        $display("X = %d, Y = %d, Product = %d", X, Y, P_reg);

        $finish;
    end

endmodule
