`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2022 05:05:51 AM
// Design Name: 
// Module Name: main
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


module main(input clk_100MHz, input [8:0]switches, input reset, input [3:0] out1,out2,out3,out4, output [6:0] digit_to_display, output [3:0] active_anode, output decimal_point);
//wire [3:0] digit1,digit2,digit3,digit4;
wire dot;
//wire [6:0] digit1_to_display,digit2_to_display,digit3_to_display,digit4_to_display;
wire clk;
wire [1:0] select;
wire [3:0] ONE_DIGIT;
wire [1:0] count;
//calculator c(clk_100MHz,switches, reset, out1, out2, out3, out4,dot);
clock_divider #(500000) cd1 (clk_100MHz,reset,clk);
binary_counter bc(clk,select);
anode_controller ac(select,active_anode);
BCD_Control control(out1,out2,out3,out4,select,ONE_DIGIT);
bcd_cathodes cath(ONE_DIGIT,digit_to_display);
endmodule