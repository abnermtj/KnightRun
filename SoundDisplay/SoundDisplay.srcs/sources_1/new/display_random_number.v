`timescale 1ns / 1ps

module display_random(input FAST_CLOCK, input [6:0] num, output reg[6:0] num_disp = 0);

    reg[6:0]char_0 = 7'b1000000;
    reg[6:0]char_1 = 7'b1111001;
    reg[6:0]char_2 = 7'b0100100;
    reg[6:0]char_3 = 7'b0110000; 
    reg[6:0]char_4 = 7'b0011001;
    reg[6:0]char_5 = 7'b0010010;
    reg[6:0]char_6 = 7'b0000010;
    reg[6:0]char_7 = 7'b1111000; 
    reg[6:0]char_8 = 7'b0;
    reg[6:0]char_9 = 7'b0010000;


    always @(posedge FAST_CLOCK) begin
            if (num == 7'd0)
                num_disp <= char_0;
            else if (num == 7'd1)
                num_disp <= char_1;
            else if (num == 7'd2)
                num_disp <= char_2;
             else if (num == 7'd3)
                num_disp <= char_3;                                
            else if (num == 7'd4)
                num_disp <= char_4;        
            else if (num == 7'd5)
                num_disp <= char_5;        
            else if (num == 7'd6)
                num_disp <= char_6;
            else if (num == 7'd7)
                num_disp <= char_7;                                            
            else if (num == 7'd8)
                num_disp <= char_8;        
            else if (num == 7'd9)
                num_disp <= char_9;        
    end

endmodule
