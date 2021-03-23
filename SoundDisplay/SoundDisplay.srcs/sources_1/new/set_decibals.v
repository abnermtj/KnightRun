`timescale 1ns / 1ps


module set_decibels (input FAST_CLOCK, SLOW_CLOCK,input [3:0] mic_level, output [6:0] output_set3, output_set4);
    reg counter3 = 0, counter4 = 0; 
    reg[6:0] final_0 = 0, final_1 = 0;
    reg[6:0] L_char = 7'b1000111, O_char = 7'b1000000, M_char = 7'b1101010, D_char = 7'b0100001, H_char = 7'b0001001,
             I_char = 7'b1001111, B_char = 7'b0000011; 
    reg[6:0] unk_charA = 7'b1000111, unk_charB = 7'b1000000;
    
    assign output_set3[6:0] = final_0[6:0];
    assign output_set4[6:0] = final_1[6:0];
    
    always@(posedge FAST_CLOCK) begin
        if (mic_level < 5)begin
            unk_charA <= L_char;
            unk_charB <= O_char;
        end
        else if (mic_level > 4 && mic_level < 11) begin
            unk_charA <= M_char;
            unk_charB <= D_char;
        end
        else if (mic_level > 10) begin
            unk_charA <= H_char;
            unk_charB <= I_char;
        end
    end
    always@(posedge SLOW_CLOCK) begin
            counter3 <= counter3 + 1;
            counter4 <= counter4 + 1;
            case(counter3)    
            0: final_0 <= unk_charA;
            1: final_0 <= D_char;
            endcase  
            case(counter4)
            0: final_1 <= unk_charB;
            1: final_1 <= B_char;
            endcase           
    end
endmodule
