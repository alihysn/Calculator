`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/25/2022 02:03:55 PM
// Design Name: 
// Module Name: clock_divider
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

module clock_divider#(parameter n = 5000)(input clk, reset, output reg clk_out);
reg [31:0] count; // Big enough to hold the maximum possible value
// Increment count
always @ (posedge(clk), posedge(reset)) begin // Asynchronous Reset
if (reset == 1'b1)
count <= 32'b0;
else if (count == n-1)
count <= 32'b0;
else
count <= count + 1;
end
// Handle the output clock
always @ (posedge(clk), posedge(reset)) begin // Asynchronous Reset
if (reset == 1'b1)
clk_out <= 1'b0;
else if (count == n-1)
clk_out <= ~clk_out;
else
clk_out <= clk_out;
end

endmodule