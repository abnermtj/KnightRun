`timescale 1ns / 1ps

module point_catch(input MID_CLOCK, btnC, hello_done, input [15:0]LED_whacko, output reg [6:0]result_win = 0, output reg[3:0] result_lose = 0);


reg reset = 0;
    always@(posedge MID_CLOCK) begin
        if(hello_done) begin
            if (~reset) begin
                result_lose <= 9;
                reset <= 1;
            end
                     
            if(btnC) begin 
                if(LED_whacko[15:0] == 16'b0 & result_lose != 0) 
                    result_lose <= result_lose - 1;   
   
                else if(LED_whacko[15:0] == 16'b1111111111111111) 
                    result_win <= result_win + 1;                 

            end     
        end        
        else begin
            result_win <= 0;
            result_lose <= 0;
            reset<= 0;
        end
    
    end
    
endmodule
