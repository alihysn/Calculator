`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/25/2022 02:05:27 PM
// Design Name: 
// Module Name: bcd_sevent_segment
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

module bcd_seven_seg #(parameter n=3)(a, b);

input [n:0] a;
output reg[6:0] b;

always@(a) begin
    case(a)
        4'b0000: b= 7'b1000000;
        4'b0001: b= 7'b1111001;
        4'b0010: b= 7'b0100100;
        4'b0011: b= 7'b0110000;
        4'b0100: b= 7'b0011001;
        4'b0101: b= 7'b0010010;
        4'b0110: b= 7'b0000010;
        4'b0111: b= 7'b1111000;
        4'b1000: b= 7'b0000000;
        4'b1001: b= 7'b0010000;
    endcase
  end
endmodule