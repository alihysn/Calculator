`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/25/2022 02:03:17 PM
// Design Name: 
// Module Name: bcd_cathodes
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



module bcd_cathodes( 
input [3:0] digit,
output reg[6:0] cathode=0
);
    
always@(digit)
begin 
case(digit)

4'd0:
  cathode= 7'b1000000;
  
4'd1:
     cathode= 7'b1111001;
     
4'd2: 
     cathode= 7'b0100100;
     
4'd3:
 cathode= 7'b0110000;
 
4'd4:
    cathode= 7'b0011001;
4'd5:
    cathode= 7'b0010010;
    
4'd6: 
    cathode= 7'b0000010;
    
4'd7: 
     cathode= 7'b1111000;
     
4'd8:
    cathode= 7'b0000000;
    
4'd9: 
    cathode= 7'b0010000;
4'd9: 
    cathode= 7'b0010000;
4'd15:
    cathode = 7'b0111111;     
default:
cathode=7'b1000000;

endcase
end
endmodule
