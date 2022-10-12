`timescale 1ns / 1ps

module test_bench();

reg[8:0] sw;
reg reset;
reg clk;

wire[3:0] digit1, digit2, digit3, digit4;
wire dot;


calculator c1(clk, sw, reset, digit1, digit2, digit3, digit4, dot);

integer i;
initial begin

reset = 1;
sw = 9'b000000000;
//99.99
#100;
reset = 0;
#10;
for( i=0; i<9; i=i+1) begin
    sw = 9'b100000000;
    #100;
    sw = 9'b010000000;
    #100;
    sw = 9'b001000000;
    #100;
    sw = 9'b000100000;
    #100;
end
//9801
sw = 9'b000000100;
//198
#100;
sw = 9'b000010000;
//0
#100;
sw = 9'b000001000;
//1
#100;
sw = 9'b000000010;
//99.99
#100;
sw = 9'b000000001;
//99.98
#100;
for( i=0; i<9; i=i+1) begin
    sw = 9'b000100000;
    #100;
    sw = 9'b000000000;
    #10;
end
//1
sw = 9'b000001000;
//1
#100;
sw = 9'b000000010;
//99.98
#100;
sw = 9'b000000001;
#100;
//39.98
for( i=0; i<4; i=i+1) begin
    sw = 9'b100000000;
    #100;
    sw = 9'b000000000;
    #10;
end
//32.98
for( i=0; i<3; i=i+1) begin
    sw = 9'b010000000;
    #100;
    sw = 9'b000000000;
    #10;
end
//-66
sw = 9'b000001000;
//0
#100;
sw = 9'b000000010;
//3136
#100;
sw = 9'b000000100;
//32.98
#100;
sw = 9'b000000001;
//32.18
#100;
//for( i=0; i<2; i=i+1) begin
//    sw = 9'b001000000;
//    #100;
//    sw = 9'b000000000;
//    #10;
//end
//32.10
for( i=0; i<2; i=i+1) begin
    sw = 9'b000100000;
    #100;
    sw = 9'b001000000;
    #10;
end
//0003
sw = 9'b000000010;
end
always
begin
clk = 0;
#100;
clk = 1;
#100;
end
endmodule
