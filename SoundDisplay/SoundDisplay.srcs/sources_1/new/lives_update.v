`timescale 1ns / 1ps


module lives_update(input MID_CLOCK, hello_done, input [3:0]result_lose, output reg fail = 0);

    reg reset = 0;

    always@(posedge MID_CLOCK) begin
        
      if (hello_done) begin
        if (result_lose == 0)
            fail <= 1;
        else
            fail <= 0;
      end
      else begin

            fail <= 0;
        end
   
    end
endmodule
