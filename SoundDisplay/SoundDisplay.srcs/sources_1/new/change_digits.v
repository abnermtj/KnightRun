`timescale 1ns / 1ps

module change_digit(input MID_CLK, SPECIAL_CLK, btnU, btnD, welcome_done, anode, input [6:0] random,  output reg[6:0] seg_final = 0,
                    output reg result_digit = 0);
//check password here
reg[3:0] counter = 4'b0;    // starts at case 5
reg counter_blink = 0;
reg reset = 0;
wire [6:0] seg_dLOA_final;

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
always @(posedge MID_CLK) begin   //default max and min change !!
    if (welcome_done) begin
            if (reset == 0) begin
                counter <= 4'b0;
                reset <= 1;
            end
       
            else if (anode & btnU) begin // increase count
                 if (counter != 4'b1001)
                    counter <= counter + 1;
                 else // case has risen to case 9 - reset from 0
                    counter <= 4'b0;
                 end
            else if (anode & btnD) begin // decrease count
                 if (counter != 4'b0)    
                    counter <= counter - 1;
                 else // case has dropped to case 0 - reset from 9
                    counter <= 4'b1001;
                end
  
    case(counter)
          0: seg[6:0] <= char0;  
          1: seg[6:0] <= char1; 
          2: seg[6:0] <= char2; 
          3: seg[6:0] <= char3; 
          4: seg[6:0] <= char4;
          5: seg[6:0] <= char5; 
          6: seg[6:0] <= char6; 
          7: seg[6:0] <= char7; 
          8: seg[6:0] <= char8;
          9: seg[6:0] <= char9;  
           
    endcase
    if (seg == random)
        result_digit <= 1;
    else
        result_digit <= 0;
   end
   else 
        reset<= 0;
   end

always @(posedge SPECIAL_CLK) begin
    
    if (anode)
        counter_blink <= counter_blink + 1;
    else
        counter_blink = 1;
    case(counter_blink)
    0: seg_final <= 7'b1111111;
    1: seg_final <= seg;
    endcase
end

endmodule
