`timescale 1ns / 1ps

module calculator(input clk, input[8:0] sw, input reset, output reg [3:0] out_1, out_2, out_3, out_4 , output reg dot);

reg [3:0] first_tens, second_tens, first_units, second_units;
reg[7:0] a, b;
integer res;
integer display_result;
reg [13:0] r;
reg [13:0] operation_result;
wire clk_LF;
clock_divider #(50000) ddlf (clk, reset, clk_LF); 
always @(posedge(clk_LF), posedge(sw[0]), posedge(sw[1]), posedge(sw[2]), posedge(sw[3]), posedge(sw[4]), posedge(sw[5]), posedge(sw[6]), posedge(sw[7]), posedge(sw[8]) , posedge(reset))begin
    if(reset == 1'b1) begin
        first_tens = 4'b0000;
        first_units = 4'b0000;
        second_tens = 4'b0000;
        second_units = 4'b0000;
        dot = 1;
        out_1 = first_tens;
        out_2 = first_units;
        out_3 = second_tens;
        out_4 = second_units;
    end
   
    else if(sw[8] == 1'b1) begin
        if(first_tens == 9) first_tens = 0;
        else first_tens = first_tens + 1;
        first_units = first_units;
        second_tens = second_tens;
        second_units = second_units;
        dot = 1;
        out_1 = first_tens;
        out_2 = first_units;
        out_3 = second_tens;
        out_4 = second_units;
    end
    else if(sw[7] == 1'b1) begin
        if(first_units == 9) first_units = 0;
        else  first_units = first_units + 1;
        first_tens = first_tens;
        second_tens = second_tens;
        second_units = second_units;
        dot = 1;
        out_1 = first_tens;
        out_2 = first_units;
        out_3 = second_tens;
        out_4 = second_units;
    end
    else if(sw[6] == 1'b1) begin
         if(second_tens == 9) second_tens = 0;
         else second_tens = second_tens + 1;
         first_tens = first_tens;
         first_units = first_units;
         second_units = second_units;
         dot = 1;
         out_1 = first_tens;
         out_2 = first_units;
         out_3 = second_tens;
         out_4 = second_units;
    end
    else if(sw[5] == 1'b1) begin
        if(second_units == 9) second_units = 0;
        else second_units = second_units + 1;
        first_tens = first_tens;
        first_units = first_units;
        second_tens = second_tens;
        dot = 1;
        out_1 = first_tens;
        out_2 = first_units;
        out_3 = second_tens;
        out_4 = second_units;
    end
    else if(sw[4] == 1'b1) begin
        first_tens = first_tens;
        first_units = first_units;
        second_tens = second_tens;
        second_units = second_units;
        a = (first_tens * 10) + first_units;
        b = (second_tens * 10) + second_units;
        res = a + b ;
        operation_result = res;
        r = a;
        out_4 = res % 10;
        res = res / 10;
        out_3 = res % 10;
        res = res / 10;
        out_2 = res % 10;
        res = res / 10;
        out_1 = res % 10;
        res = res / 10;
    end
    else if(sw[3] == 1'b1) begin
        first_tens = first_tens;
        first_units = first_units;
        second_tens = second_tens;
        second_units = second_units;
        a = (first_tens * 10) + first_units;
        b = (second_tens * 10) + second_units;
        res =  a - b ;
        r = res;
        if(res<0) begin
          out_1 = 4'b1111;
          res = -1 * res;
          operation_result = -1 * res;
          out_4 = res % 10;
          res = res / 10;
          out_3 = res % 10;
          res = res / 10;
          out_2 = res % 10;
          dot = 0;
        end
        else begin
            operation_result = res;
            out_4 = res % 10;
            res = res / 10;
            out_3 = res % 10;
            res = res / 10;
            out_2 = res % 10;
            res = res / 10;
            out_1 = res % 10;
            res = res / 10;
            dot = 0;
        end
    end
    else if(sw[2] == 1'b1) begin
        first_tens = first_tens;
        first_units = first_units;
        second_tens = second_tens;
        second_units = second_units;
        a = (first_tens * 10) + first_units;
        b = (second_tens * 10) + second_units;
        res =  a * b ;
        operation_result = res;
        r = res;
        out_4 = res % 10;
        res = res / 10;
        out_3 = res % 10;
        res = res / 10;
        out_2 = res % 10;
        res = res / 10;
        out_1 = res % 10;
        res = res / 10;
        dot = 0;
    end
    else if(sw[1] == 1'b1) begin
        first_tens = first_tens;
        first_units = first_units;
        second_tens = second_tens;
        second_units = second_units;
        a = (first_tens * 10) + first_units;
        b = (second_tens * 10) + second_units;
        r = a%b;
        res = a / b;
        if(r*2 >= b)begin
            res = res + 1; 
            operation_result = res;
        end
        else res = res;
        operation_result = res;
        out_4 = res % 10;
        res = res / 10;
        out_3 = res % 10;
        res = res / 10;
        out_2 = res % 10;
        res = res / 10;
        out_1 = res % 10;
        res = res / 10; 
        dot = 0;
    end
    else if(sw[0] == 1'b1) begin
        first_tens = first_tens;
        first_units = first_units;
        second_tens = second_tens;
        second_units = second_units;
        out_1 = first_tens;
        out_2 = first_units;
        out_3 = second_tens;
        out_4 = second_units;
        dot = 1;
    end
    
    else begin
        first_tens = first_tens;
        first_units = first_units;
        second_tens = second_tens;
        second_units = second_units;
        dot = 1;
        operation_result = 0;
    end
end

endmodule
