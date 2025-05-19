`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/19/2025 02:20:59 PM
// Design Name: 
// Module Name: SevenSeg
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

module SevenSeg(
    input clk,
    input reset,
    input [15:0] product,
    input btn_left,
    input btn_right,
    output reg [6:0] segments,
    output reg [3:0] digit_select
);
    wire [19:0] bcd;
    reg [2:0] digit_position;
    wire sign;
    reg [3:0] current_digit;
    reg [16:0] refresh_counter;
    wire left_btn_pulse, right_btn_pulse;
    reg [1:0] display_state; 
    
    Binary_to_BCD bcd_converter(
        .binary(product[15] ? (~product + 1'b1) : product),
        .bcd(bcd)
    );
    
    assign sign = product[15];
    
    Push_Button_Detector left_btn_detect(
        .clk(clk),
        .rst(reset),
        .X(btn_left),
        .Z(left_btn_pulse)
    );
    
    Push_Button_Detector right_btn_detect(
        .clk(clk),
        .rst(reset),
        .X(btn_right),
        .Z(right_btn_pulse)
    );
    
    always @(posedge clk or posedge reset) begin
        if (reset)
            refresh_counter <= 0;
        else
            refresh_counter <= refresh_counter + 1;
    end
    
    always @(posedge clk or posedge reset) begin
        if (reset)
            digit_position <= 0;
        else begin
            if (left_btn_pulse && digit_position > 0)
                digit_position <= digit_position - 1;
            else if (right_btn_pulse && digit_position < 4)
                digit_position <= digit_position + 1;
        end
    end
    
    always @(posedge clk or posedge reset) begin
        if (reset)
            display_state <= 0;
        else if (refresh_counter[16:15] == 2'b11) 
            display_state <= display_state + 1;
    end
    
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            digit_select <= 4'b1110; 
            current_digit <= 4'b0000;
        end
        else begin
            case (display_state)
                2'b00: begin
                    digit_select <= 4'b1110; 
                    case (digit_position)
                        3'd0: current_digit <= sign ? 4'b1010 : 4'b1111; 
                        3'd1: current_digit <= bcd[19:16];
                        3'd2: current_digit <= bcd[15:12];
                        3'd3: current_digit <= bcd[11:8];
                        3'd4: current_digit <= bcd[7:4];
                        default: current_digit <= 4'b0000;
                    endcase
                end
                2'b01: begin
                    digit_select <= 4'b1101; 
                    case (digit_position)
                        3'd0: current_digit <= bcd[19:16];
                        3'd1: current_digit <= bcd[15:12];
                        3'd2: current_digit <= bcd[11:8];
                        3'd3: current_digit <= bcd[7:4];
                        3'd4: current_digit <= bcd[3:0];
                        default: current_digit <= 4'b0000;
                    endcase
                end
                2'b10: begin
                    digit_select <= 4'b1011; 
                    case (digit_position)
                        3'd0: current_digit <= bcd[15:12];
                        3'd1: current_digit <= bcd[11:8];
                        3'd2: current_digit <= bcd[7:4];
                        3'd3: current_digit <= bcd[3:0];
                        3'd4: current_digit <= 4'b0000;
                        default: current_digit <= 4'b0000;
                    endcase
                end
                2'b11: begin
                    digit_select <= 4'b0111; 
                    case (digit_position)
                        3'd0: current_digit <= bcd[11:8];
                        3'd1: current_digit <= bcd[7:4];
                        3'd2: current_digit <= bcd[3:0];
                        3'd3: current_digit <= 4'b0000;
                        3'd4: current_digit <= 4'b0000;
                        default: current_digit <= 4'b0000;
                    endcase
                end
            endcase
        end
    end
        always @(*) begin
        case (current_digit)
            4'b0000: segments = 7'b1000000;
            4'b0001: segments = 7'b1111001; 
            4'b0010: segments = 7'b0100100;
            4'b0011: segments = 7'b0110000; 
            4'b0100: segments = 7'b0011001; 
            4'b0101: segments = 7'b0010010; 
            4'b0110: segments = 7'b0000010; 
            4'b0111: segments = 7'b1111000; 
            4'b1000: segments = 7'b0000000; 
            4'b1001: segments = 7'b0010000; 
            4'b1010: segments = 7'b0101011; 
            4'b1111: segments = 7'b1111111; 
            default: segments = 7'b1111111; 
        endcase
    end
endmodule
