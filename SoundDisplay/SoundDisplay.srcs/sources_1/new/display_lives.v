`timescale 1ns / 1ps

module display_lives(input MID_CLK, input [3:0] counter, output reg [6:0]seg_lives = 0);

reg [6:0] char0 = 7'b1000000;   // 0
reg [6:0] char1 = 7'b1111001;   // 1
reg [6:0] char2 = 7'b0100100;   // 2
reg [6:0] char3 = 7'b0110000;   // 3
reg [6:0] char4 = 7'b0011001;   // 4

reg [6:0]char5 = 7'b0010010;   // 5
reg [6:0] char6 = 7'b0000010;   // 6
reg [6:0] char7 = 7'b1111000;   // 7
reg [6:0] char8 = 7'b0;   // 8
reg [6:0] char9 = 7'b0010000;   // 9


always @(posedge MID_CLK) begin

    if (counter == 9)
        seg_lives <= char9;
    else if (counter == 8)
        seg_lives <= char8;
    else if (counter == 7)
        seg_lives <= char7;    
    else if (counter == 6)
        seg_lives <= char6;
                    
    else if (counter == 5)
        seg_lives <= char5;
    else if (counter == 4)
        seg_lives <= char4;      
    else if (counter == 3)
        seg_lives <= char3;              
    else if (counter == 2)
        seg_lives <= char2;              
    else if (counter == 1)
        seg_lives <= char1;    
    else if (counter == 0)
        seg_lives <= char0;                      
end
endmodule
