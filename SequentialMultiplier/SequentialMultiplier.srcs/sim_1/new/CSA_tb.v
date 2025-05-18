`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2025 02:21:38 PM
// Design Name: 
// Module Name: CSA_tb
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


module CSA_tb();
    // Inputs
    reg  R, clk;
reg signed X, Y;
    // Output
    wire SUM;

    // Internal expected signals
    reg expected_SC;
    reg expected_SUM;
    integer error = 0;

    // Instantiate the Unit Under Test (UUT)
    CSA uut (
        .X(X), 
        .Y(Y), 
        .R(R), 
        .clk(clk), 
        .SUM(SUM)
    );

    // Clock generation (10ns period)
    always #10 clk = ~clk;
    reg HSUM1, CAR1, CAR2, d1, d2;
    // Track expected behavior
    always @(posedge clk) begin
        if (R) begin
            expected_SC <= 0;
            expected_SUM <= 0;
        end else begin
            // Emulate CSA logic
        
            HSUM1 = Y ^ expected_SC;
            CAR1  = Y & expected_SC;
            d1    = X ^ HSUM1;
            CAR2  = X & HSUM1;
            d2    = CAR1 ^ CAR2;

            expected_SUM = d1;
            expected_SC = d2;

            #1;
            if (SUM !== expected_SUM) begin
                $display("❌ [ERROR] Time %0t: X=%b, Y=%b, SC=%b | Expected SUM=%b, Got=%b",
                         $time, X, Y, expected_SC, expected_SUM, SUM);
                error = error + 1;
            end else begin
                $display("✅ [OK]    Time %0t: X=%b, Y=%b, SC=%b | SUM=%b",
                         $time, X, Y, expected_SC, SUM);
            end
        end
    end
 integer i, j;
    initial begin
        clk = 0;
        R = 1;
        X = 0;
        Y = 0;
        expected_SC = 0;
        expected_SUM = 0;

        // Apply reset
        #10 R = 0;

        // Loop through all combinations of X and Y over several cycles
       
        for (i = 0; i < 4; i = i + 1) begin
            // Generate X and Y from bits of i
            X = i[1]; // MSB
            Y = i[0]; // LSB
            #10;
        end

        // Apply reset in between
        #5 R = 1;
        #10 R = 0;

        // Second pass of the same values
        for (j = 0; j < 4; j = j + 1) begin
            X = j[1];
            Y = j[0];
            #10;
        end

        #10;
        if (error == 0)
            $display("✅✅✅ TEST PASSED: No errors found.");
        else
            $display("❌❌❌ TEST FAILED: %0d errors found.", error);

        $finish;
    end

endmodule

