`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////


module translate_digit(input MID_CLOCK, input [3:0] points_digit, output reg [6:0] seg_digit = 0);


reg [6:0] char0 = 7'b1000000;   // 0
reg [6:0] char1 = 7'b1111001;   // 1
reg [6:0] char2 = 7'b0100100;   // 2
reg [6:0] char3 = 7'b0110000;   // 3
reg [6:0] char4 = 7'b0011001;   // 4

reg [6:0]char5 = 7'b0010010;   // 5
reg [6:0] char6 = 7'b0000010;   // 6
reg [6:0] char7 = 7'b1111000;   // 7
reg [6:0] char8 = 7'b0000000;   // 8
reg [6:0] char9 = 7'b0010000;   // 9

reg[6:0] seg = 0;
always @(posedge MID_CLOCK) begin   //default max and min change !!


    if (points_digit == 9)
        seg_digit <= char9;
    else if (points_digit == 8)
        seg_digit <= char8;
    else if (points_digit == 7)
        seg_digit <= char7;    
    else if (points_digit == 6)
        seg_digit <= char6;
                    
    else if (points_digit == 5)
        seg_digit <= char5;
    else if (points_digit == 4)
        seg_digit <= char4;      
    else if (points_digit == 3)
        seg_digit <= char3;              
    else if (points_digit == 2)
        seg_digit <= char2;              
    else if (points_digit == 1)
        seg_digit <= char1;    
    else if (points_digit == 0)
        seg_digit <= char0;                      
end

endmodule
