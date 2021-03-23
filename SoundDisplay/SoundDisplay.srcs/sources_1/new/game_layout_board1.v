`timescale 1ns / 1ps


module game_layout(input MID_CLK, SPECIAL_CLK, welcome_done, btnC, btnU, btnD, btnL, btnR, input [6:0] tens_random, ones_random,
                   output [3:0] an_start, output [6:0]seg_start,output reg result = 0, output reg result1 = 0, output reg result2 = 0);

    wire seg_pointer; 
    wire anode0, anode1,result_tens, result_ones;
    wire [6:0] seg_tens, seg_ones, seg_random_combi, seg_lives;
    wire [3:0] an_random_combi;
    reg [1:0] counter = 0;
    reg [3:0] scroll_disp;
    reg [6:0] seg_disp;
    reg [3:0] tries = 0;
    
    assign an_start[3:0] = scroll_disp[3:0];
    assign seg_start[6:0] = seg_disp[6:0];
    
    button_LR_push LR_push(MID_CLK, btnL, btnR,welcome_done, seg_pointer);
    check_anode anode(MID_CLK, seg_pointer, anode0, anode1);
    
    change_digit tens(MID_CLK, SPECIAL_CLK, btnU, btnD, welcome_done, anode1, tens_random[6:0], seg_tens[6:0], result_tens);
    change_digit ones(MID_CLK, SPECIAL_CLK, btnU, btnD, welcome_done, anode0, ones_random[6:0], seg_ones[6:0], result_ones);
    display_lives(MID_CLK, tries[3:0], seg_lives[6:0]);
    
    
    always @(posedge MID_CLK) begin
        counter <= (counter == 3) ? 0 : counter + 1;  
        case(counter)
            0: begin    // anode0
                
                scroll_disp[3:0] <= 4'b1110;
                seg_disp[6:0] <= seg_ones[6:0];
                end
            1: begin    //anode1
                
                scroll_disp[3:0] <= 4'b1101;
                seg_disp[6:0] <= seg_tens[6:0];
                end
            2: begin    //L
                    
                scroll_disp[3:0] <= 4'b1011;
                seg_disp[6:0] <= 7'b1000111;
                end
            3: begin    //live np.
                        
                scroll_disp[3:0] <= 4'b0111;
                seg_disp[6:0] <= seg_lives[6:0];
                end              
            endcase   

          if(btnC) begin
             if (tries != 1 && result == 0)
                tries <= tries - 1; 
             if (result_tens & result_ones) begin  //PASS - 08
                result <= 1;
                result1 <= 1;
                end
             else if (tries == 1) begin   // FAIL
                result <= 1;
                result2 <= 1;
                end          
          end
                  
           if(~welcome_done) begin
            tries <= 9;
            result <= 0;
            result1 <= 0;
            result2 <= 0; 
            end
    end

endmodule

