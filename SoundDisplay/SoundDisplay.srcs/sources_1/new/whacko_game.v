`timescale 1ns / 1ps


module whacko_game(input FAST_CLOCK, MID_CLOCK, SLOW_CLOCK1, CLOCK, sw, btnC, input [3:0] mic_processing,  output [15:0] LED_whacko, output [3:0]an_whacko, output [6:0]seg_whacko);

    wire  pass, fail, pivot_result;
    wire [6:0] result_win;
    wire hello_done, hello;
    wire [3:0] an_hello,result_lose;
    wire [3:0] an_final, an_start, an_start1, an_start2;
    wire [6:0] seg_final, seg_hello, seg_start, seg_start1, seg_start2, seg_tens, seg_ones;
    wire [15:0] LED_start, LED_current1, LED_current2;
    wire SLOW_CLOCK2, SLOOOW_CLOCK;
    wire [31:0] n_slowclk1;
    
    clk_divider SLOW2clk(CLOCK,  9999999, SLOW_CLOCK2);
    clk_divider SLOOOWclk(CLOCK, 33000000, SLOOOW_CLOCK);

    
    assign hello = sw ? 1 : 0;

     hello_disp sound(SLOW_CLOCK1, FAST_CLOCK, hello, an_hello[3:0], seg_hello[6:0], hello_done);
    
    led_pop pop(FAST_CLOCK, SLOW_CLOCK2, SLOOOW_CLOCK, mic_processing, LED_start[15:0]);
    
    point_catch catch(MID_CLOCK, btnC, hello_done, LED_whacko[15:0], result_win[6:0], result_lose[3:0]);
    
    points_update cash(MID_CLOCK, hello_done, result_win[6:0], result_lose[3:0], an_start[3:0], seg_start[6:0], pass);
    
    signal_change start_whack(an_hello[3:0], an_start[3:0], seg_hello[6:0], seg_start[6:0], 16'b0, LED_start[15:0], 
                                       hello_done, an_start1[3:0], seg_start1[6:0], LED_current1[15:0]);

    lives_update life(MID_CLOCK, hello_done, result_lose[3:0], fail);
    
    display_pass_fail pafa(MID_CLOCK, pass, fail, an_final[3:0], seg_final[6:0], pivot_result);
    
    signal_change end_whack(an_start1[3:0], an_final[3:0], seg_start1[6:0], seg_final[6:0], LED_current1[15:0], 16'b0,
                                           pivot_result, an_start2[3:0], seg_start2[6:0], LED_current2[15:0]);
                                           
    assign LED_whacko[15:0] = LED_current2[15:0];
    assign an_whacko[3:0] = an_start2[3:0];
    assign seg_whacko[6:0] = seg_start2[6:0];                                           
endmodule
