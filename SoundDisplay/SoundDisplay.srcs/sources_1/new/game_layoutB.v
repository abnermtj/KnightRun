`timescale 1ns / 1ps


module game_layoutB(input MID_CLK, SPECIAL_CLK, hi_done, btnC, btnU, btnD, btnL, btnR,input [3:0] miclevel, input [6:0] final_3, final_2, final_1, final_0,
                   output [3:0] an_start, output [6:0]seg_start, 
                   output reg result_pass = 0, output reg result_fail = 0);
                  

    wire [1:0] seg_pointer; 
    wire anode0, anode1, anode2, anode3;
    wire [6:0] seg_tens, seg_ones, seg_random_combi, seg_lives, an3b, an2b, an1b, an0b, final_3b, final_2b, final_1b, final_0b;
    wire [3:0] an_random_combi;
    reg [1:0] counter = 0;
    reg [3:0] scroll_disp;
    reg [6:0] seg_disp;
    reg [6:0] tries = 0;
    reg fix = 0,  corr0 = 0, corr1 = 0, corr2 = 0, corr3 = 0;
    
    assign an_start[3:0] = scroll_disp[3:0];
    assign seg_start[6:0] = seg_disp[6:0];

    
    runman_LR LR(MID_CLK, btnL, btnR, hi_done, seg_pointer[1:0]);
    anode_runman run(MID_CLK, seg_pointer[1:0], anode0, anode1, anode2, anode3);
    
    //special 7 hz
    change_letter_runman an3B(MID_CLK, SPECIAL_CLK, btnU, btnD, hi_done, corr3, anode3, an3b[6:0], final_3b[6:0]);
    change_letter_runman an2B(MID_CLK, SPECIAL_CLK, btnU, btnD, hi_done, corr2, anode2, an2b[6:0], final_2b[6:0]);
    change_letter_runman an1B(MID_CLK, SPECIAL_CLK, btnU, btnD, hi_done, corr1, anode1, an1b[6:0], final_1b[6:0]);
    change_letter_runman an0B(MID_CLK, SPECIAL_CLK, btnU, btnD, hi_done, corr0, anode0, an0b[6:0], final_0b[6:0]);
    
    always @(posedge MID_CLK) begin
        counter <=  counter + 1;  
        case(counter)
            0: begin    // anode0
                scroll_disp[3:0] <= 4'b1110;
                seg_disp[6:0] <= an0b[6:0];
                end
            1: begin   //anode1
               scroll_disp[3:0] <= 4'b1101;
               seg_disp[6:0] <= an1b[6:0];
               end
            2: begin    //anode2   
                scroll_disp[3:0] <= 4'b1011;
                seg_disp[6:0] <= an2b[6:0];
               end
            3: begin    //anode3       
                scroll_disp[3:0] <= 4'b0111;
                seg_disp[6:0] <= an3b[6:0];
              end
            endcase   
            
        if (hi_done) begin
            
            if (btnC) begin
                if (tries != 1 && result_pass == 0) begin
                      tries <= tries - 1; 
                      if(final_0b == final_0)
                        corr0 <= 1;
                      if(final_1b == final_1)
                        corr1 <= 1;
                      if(final_2b == final_2)
                        corr2 <= 1;
                      if(final_3b == final_3)
                        corr3 <= 1;
                end
                //PASS subsequently or on first try
                if (corr0 & corr1 & corr2 & corr3)
                        result_pass <= 1;
                if(final_0b == final_0 && final_1b == final_1 && final_2b == final_2 && final_3b == final_3)
                        result_pass <=1;
                if (tries == 1)    // FAIL                   
                        result_fail <= 1;
            end                
         end
       else begin
            if(miclevel < 5)
                tries <= 5;
            else if(miclevel < 10)
                tries <= 10;
            else
                tries <= 15;
            result_pass <= 0;
            result_fail <= 0; 
            corr0 <= 0;
            corr1 <= 0;
            corr2 <= 0;
            corr3 <= 0;
          end
             
    end

endmodule
