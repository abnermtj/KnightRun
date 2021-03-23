`timescale 1ns / 1ps


module led_pop(input FAST_CLOCK, SLOW_CLOCK2,SLOOOW_CLOCK, input [3:0] mic_processing, output reg [15:0]LED_whacko = 0);

    reg [6:0] counts = 0;
    reg [3:0]int_val = 0;
    reg decide = 0;
    reg [15:0]LED_whack1, LED_whack2;
    reg counter1 = 0, counter2 = 0;
        
    always@ (posedge FAST_CLOCK) begin
        counts <= counts + 1;  
        int_val <= counts % 10;  

        if (mic_processing < 9)
             LED_whacko <= LED_whack1;
        else 
             LED_whacko <= LED_whack2;

    end

    always@(posedge SLOW_CLOCK2) begin
        counter1 <= (int_val >6) ? counter1 + 1 : 1; 
        
        case(counter1)
        0: LED_whack1 <= 16'b1111111111111111;
        1: LED_whack1 <= 16'b0;
        endcase
    end

    always@(posedge SLOOOW_CLOCK) begin
        counter2 <= counter2 + 1;
        
        case(counter2)
        0: LED_whack2 <= 16'b1111111111111111;
        1: LED_whack2 <= 16'b0;
 
        endcase
    end
    
endmodule
