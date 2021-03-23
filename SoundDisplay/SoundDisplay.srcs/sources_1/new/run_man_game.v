`timescale 1ns / 1ps

module run_man(input MID_CLK, SLOW_CLK, SPECIAL_CLK, sw, btnC, btnU, btnD, btnL, btnR, input[3:0] miclevel, output [3:0]an_runman, output [6:0]seg_runman, output [15:0] led_runman);

    wire hi, hi_done, prompt, prompt_done, result_pass, result_fail;
    wire [3:0] an_hi, an_prompt, an_playerA, an_current1,an_current2, an_playerB, an_current3, an_pass, an_fail, an_current4, an_current5;
    wire [6:0] seg_hi, seg_prompt, seg_playerA, seg_current1, seg_current2, seg_current3, seg_pass, seg_fail, seg_current4, seg_current5, 
                final_3a, final_2a, final_1a, final_0a, seg_playerB;

    assign hi = sw ? 1 : 0;
    
    hi_disp hello(MID_CLK, SLOW_CLK, hi, an_hi[3:0], seg_hi[6:0], hi_done);
    
    gamer_layout runout(MID_CLK, SPECIAL_CLK, hi_done, btnC, btnU, btnD, btnL, btnR, 
                      an_playerA[3:0], seg_playerA[6:0], prompt, final_3a[6:0], final_2a[6:0], final_1a[6:0], final_0a[6:0]);//remove the 4 aouts also
                      
    signal_change pingA(an_hi[3:0], an_playerA[3:0], seg_hi[6:0], seg_playerA[6:0], 15'b0, 15'b0, 
                         hi_done, an_current1[3:0], seg_current1[6:0], 15'b0);                  

    prompt_player2 start(MID_CLK, SLOW_CLK, prompt, an_prompt[3:0], seg_prompt[6:0], prompt_done);

    signal_change promptB(an_current1[3:0], an_prompt[3:0], seg_current1[6:0], seg_prompt[6:0], 15'b0, 15'b0, 
                         prompt, an_current2[3:0], seg_current2[6:0], 15'b0); 
    
    game_layoutB showdown(MID_CLK, SPECIAL_CLK, prompt_done, btnC, btnU, btnD, btnL, btnR, miclevel, final_3a[6:0], final_2a[6:0], final_1a[6:0], final_0a[6:0],
                          an_playerB[3:0], seg_playerB[6:0], result_pass, result_fail);

    signal_change promptC(an_current2[3:0], an_playerB[3:0], seg_current2[6:0], seg_playerB[6:0], 15'b0, 15'b0, 
                         prompt_done, an_current3[3:0], seg_current3[6:0], 15'b0);      
                         
    pass_test pass(MID_CLK, an_pass[3:0], seg_pass[6:0]);                     
    shout_help help(MID_CLK, an_fail[3:0], seg_fail[6:0]);  
    
     signal_change endA(an_current3[3:0], an_pass[3:0], seg_current3[6:0], seg_pass[6:0], 15'b0, 15'b0, 
                         result_pass, an_current4[3:0], seg_current4[6:0], 15'b0);                                                             
    
    signal_change endB(an_current4[3:0], an_fail[3:0], seg_current4[6:0], seg_fail[6:0], 15'b0, 15'b0, 
                        result_fail, an_current5[3:0], seg_current5[6:0], 15'b0);    
                        
    assign an_runman[3:0] = an_current5[3:0];
    assign seg_runman[6:0] = seg_current5[6:0];
    

endmodule
