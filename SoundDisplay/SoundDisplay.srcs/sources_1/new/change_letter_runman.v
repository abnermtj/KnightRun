`timescale 1ns / 1ps


module change_letter_runman(input MID_CLK, SPECIAL_CLK, btnU, btnD, hi_done, password, anode, output reg[6:0] seg_final = 0, output [6:0]final);
//check password here
reg[4:0] counter = 5'b0;    // starts at case 0
reg counter_blink = 0;
wire [6:0] seg_dLOA_final;

// CHANGE to letters
reg [6:0] charA = 7'b0001000;   // A
reg [6:0] charB = 7'b0000011;   // B
reg [6:0] charC = 7'b1000110;   // C
reg [6:0] charD = 7'b0100001;   // D
reg [6:0] charE = 7'b0000110;   // E

reg [6:0] charF = 7'b0001110;   // F
reg [6:0] charG = 7'b0010000;   // G
reg [6:0] charH = 7'b0001001;   // H
reg [6:0] charI = 7'b1001111;   // I
reg [6:0] charJ = 7'b1100001;   // J

reg [6:0] charK = 7'b0000111;   // K
reg [6:0] charL = 7'b1000111;   // L
reg [6:0] charM = 7'b1101010;   // M
reg [6:0] charN = 7'b0101011;   // N
reg [6:0] charO = 7'b1000000;   // O

reg [6:0] charP = 7'b0001100;   // P
reg [6:0] charQ = 7'b0011000;   // Q
reg [6:0] charR = 7'b0101111;   // R
reg [6:0] charS = 7'b0010010;   // S
reg [6:0] charT = 7'b0000111;   // T

reg [6:0] charU = 7'b1000001;   // U
reg [6:0] charV = 7'b1100011;   // V
reg [6:0] charW = 7'b1010101;   // W
reg [6:0] charX = 7'b0001001;   // X
reg [6:0] charY = 7'b0010001;   // Y
reg [6:0] charZ = 7'b0100100;   // Z

reg[6:0] seg = 0;

assign final[6:0] = seg[6:0];

always @(posedge MID_CLK) begin   //default max and min change !!

    if (hi_done) begin
            if(password) 
                counter <= counter;
            else if (anode & btnU) begin // increase count
                 if (counter != 5'b11001)
                    counter <= counter + 1;
                 else // case has risen to case 25 - reset from 0
                    counter <= 5'b0;
                 end
            else if (anode & btnD) begin // decrease count
                 if (counter != 5'b0)    
                    counter <= counter - 1;
                 else // case has dropped to case 0 - reset from 26
                    counter <= 5'b11001;
                end
    end
    else 
        counter <= 0;

    case(counter)
          0: seg[6:0] <= charA;  
          1: seg[6:0] <= charB; 
          2: seg[6:0] <= charC; 
          3: seg[6:0] <= charD; 
          4: seg[6:0] <= charE;
          5: seg[6:0] <= charF; 
          6: seg[6:0] <= charG; 
          7: seg[6:0] <= charH; 
          8: seg[6:0] <= charI;
          9: seg[6:0] <= charJ;

          10: seg[6:0] <= charK;  
          11: seg[6:0] <= charL; 
          12: seg[6:0] <= charM; 
          13: seg[6:0] <= charN; 
          14: seg[6:0] <= charO;
          15: seg[6:0] <= charP; 
          16: seg[6:0] <= charQ; 
          17: seg[6:0] <= charR; 
          18: seg[6:0] <= charS;
          19: seg[6:0] <= charT;

          20: seg[6:0] <= charU;  
          21: seg[6:0] <= charV; 
          22: seg[6:0] <= charW; 
          23: seg[6:0] <= charX; 
          24: seg[6:0] <= charY;
          25: seg[6:0] <= charZ;
    endcase
    
    
   end

always @(posedge SPECIAL_CLK) begin
    
    if (anode)
        counter_blink <= counter_blink + 1;
    else
        counter_blink = 0;
    case(counter_blink)
    0: seg_final <= seg;
    1: seg_final <= 7'b1111111;
    endcase
end
endmodule
