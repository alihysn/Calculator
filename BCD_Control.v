`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/25/2022 02:03:38 PM
// Design Name: 
// Module Name: BCD_Control
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



module BCD_Control(
input[3:0] first_digit,
input[3:0] second_digit,
input[3:0] third_digit,
input[3:0] fourth_digit,
input[1:0] refreshcounter,
output reg [3:0] ONE_DIGIT = 0
    );
    
    always@(refreshcounter)
        begin
        case(refreshcounter)
            2'd0:
                ONE_DIGIT = first_digit;
            2'd1:
                ONE_DIGIT = second_digit;
            2'd2:
                ONE_DIGIT = third_digit;
            2'd3:
                ONE_DIGIT = fourth_digit;
endcase
end
endmodule
