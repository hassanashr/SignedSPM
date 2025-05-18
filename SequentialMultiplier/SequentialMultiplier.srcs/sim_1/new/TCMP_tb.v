`timescale 1ns / 1ps

module TCMP_tb;

    // Inputs
    reg A;
    reg R;
    reg clk;

    // Output
    wire S;

    // Internal expected signals
    reg expected_S;
    reg expected_Z;

    // Error tracking
    integer error = 0;

    // Instantiate the Unit Under Test (UUT)
    TCMP uut (
        .A(A), 
        .R(R), 
        .clk(clk), 
        .S(S)
    );

    // Clock generation (10ns period)
    always #10 clk = ~clk;

    // Check logic on rising edge
    always @(posedge clk) begin
        if (R) begin
            expected_Z <= 0;
            expected_S <= 0;
        end else begin
            expected_S <= A | expected_Z;
            expected_Z <= A ^ expected_Z;
        end

        #1; // small delay to allow S to settle

        if (S !== expected_S) begin
            $display("❌ [ERROR] Time %0t: A=%b, Z=%b, Expected S=%b, Got S=%b", 
                      $time, A, expected_Z, expected_S, S);
            error = error + 1;
        end else begin
            $display("✅ [OK]    Time %0t: A=%b, Z=%b, S=%b", 
                      $time, A, expected_Z, S);
        end
    end

    initial begin
        // Initialize Inputs
        clk = 0;
        R = 1;
        A = 0;
        expected_S = 0;
        expected_Z = 0;

        // Apply reset
        #10 R = 0;

        // Test pattern
        #10 A = 0;  // Cycle 1
        #10 A = 1;  // Cycle 2
        #10 A = 1;  // Cycle 3
        #10 A = 0;  // Cycle 4

        // Apply reset again
        #5 R = 1;
        #10 R = 0;

        // Continue test
        #10 A = 1;  // Cycle 5
        #10 A = 0;  // Cycle 6

        #10;
        if (error == 0)
            $display("✅✅✅ TEST PASSED: No errors found.");
        else
            $display("❌❌❌ TEST FAILED: %0d errors found.", error);

        $finish;
    end

endmodule
