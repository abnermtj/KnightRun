`timescale 1ns / 1ps

module random_game(input [11:0] mic_processing, input FAST_CLK, MID_CLK, SLOW_CLK, SPECIAL_CLK, CLK_FAST, CLK_MED, CLK_SLOW, btnC, btnU, btnD, btnL, btnR, sw, output [3:0]an_random, output [6:0]seg_random);

    wire[6:0] tens_random, ones_random;
    wire welcome, random_info, welcome_done, state;
    wire[6:0]  seg_welcome, seg_start1, seg_reveal,seg_start, seg_random_combi, seg_final, seg_final1, seg_final2, seg_hint;
    wire[3:0]  an_welcome, an_start1, an_reveal, an_start,an_random_combi, an_final, an_final1, an_final2, an_hint;
    wire [1:0] result, result1, result2, fail_result;
    
    assign welcome = (sw) ? 1 : 0;
    
    random_number random(FAST_CLK, MID_CLK, sw, tens_random[6:0], ones_random[6:0]);
    
    display welcome_random(SLOW_CLK, MID_CLK, welcome, an_welcome[3:0], seg_welcome[6:0], welcome_done);
    
    create_hint hint(MID_CLK, ones_random[6:0], an_hint[3:0], seg_hint[6:0]);
    determine_hint guess (MID_CLK, CLK_FAST, CLK_MED, CLK_SLOW, welcome_done, mic_processing[11:0],state);
    
    game_layout play1(MID_CLK, SPECIAL_CLK, welcome_done, btnC, btnU, btnD, btnL, btnR, tens_random[6:0], ones_random[6:0], an_start[3:0], seg_start[6:0],result, result1, result2);
    
    display_mul_random random_x(MID_CLK, fail_result, tens_random[6:0], ones_random[6:0], an_random_combi[3:0], seg_random_combi[6:0]);
    
    signal_change random_start(an_welcome[3:0], an_start[3:0], seg_welcome[6:0], seg_start[6:0], 16'b0, 16'b0, 
                                    welcome_done, an_start1[3:0], seg_start1[6:0], 16'b0);
    
     signal_change hint_start(an_start1[3:0], an_hint[3:0], seg_start1[6:0], seg_hint[6:0], 16'b0, 16'b0, 
                              state, an_reveal[3:0], seg_reveal[6:0], 16'b0);
                                       
    
    final_display print(MID_CLK, result1, result2, btnC, an_final[3:0], seg_final[6:0], fail_result);
    // finalize results.
    signal_change random_end(an_reveal[3:0], an_final[3:0], seg_reveal[6:0], seg_final[6:0], 16'b0, 16'b0, 
                                        result, an_final1[3:0], seg_final1[6:0], 16'b0);
    
    signal_change random_reveal(an_final1[3:0], an_random_combi[3:0], seg_final1[6:0], seg_random_combi[6:0], 16'b0, 16'b0, 
                                        fail_result, an_final2[3:0], seg_final2[6:0], 16'b0);
    
    assign an_random[3:0] = an_final2[3:0];
    assign seg_random[6:0] = seg_final2[6:0];
    
endmodule
