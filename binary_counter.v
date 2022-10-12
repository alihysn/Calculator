`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/25/2022 02:04:44 PM
// Design Name: 
// Module Name: binary_counter
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


module binary_counter #(parameter n=2)(input refresh_clock, 
output reg[n-1:0] refresh_counter=0,input reset
);

always@(posedge refresh_clock,posedge reset) begin
if(reset)
refresh_counter<=0;
else
refresh_counter<= refresh_counter + 1;
end
endmodule
