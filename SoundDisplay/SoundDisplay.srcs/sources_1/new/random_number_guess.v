`timescale 1ns / 1ps

module random_number(input SUPER_CLOCK,  CLOCK, sw, output [6:0]tens_random, output [6:0] ones_random);
    
    reg [6:0] count_ones = 0;
    reg update_reg_val = 0, update_reg_indiv = 0;
    reg [6:0] random_val = 0;
    reg [6:0] random_tens = 0;
    reg [6:0] random_ones = 0;
    
    display_random tens(CLOCK, random_tens[6:0], tens_random[6:0]);
    display_random ones(CLOCK, random_ones[6:0], ones_random[6:0]);

    always@(posedge SUPER_CLOCK) begin
        count_ones <= count_ones + 1;
    end
    

    always@(posedge CLOCK) begin
        if(sw & ~update_reg_val) begin 
            random_val <= count_ones % 100;
            update_reg_val <= 1;
            end
        else if ((sw & update_reg_val) &~update_reg_indiv) begin
            random_ones <= random_val % 10;
            random_tens <= (random_val - (random_val % 10)) / 10;
            update_reg_indiv <= 1;
        end
        else if(~sw) begin
            random_val <= 0;
            random_ones <= 0;
            random_tens <= 0;
            update_reg_indiv <= 0;
            update_reg_val <= 0;
        end    
    end
    
    
endmodule
