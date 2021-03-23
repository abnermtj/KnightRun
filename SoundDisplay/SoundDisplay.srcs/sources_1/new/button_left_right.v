`timescale 1ns / 1ps


module button_LR_push(input MED_CLK, btnL, btnR, welcome_done, output reg  seg_pointer = 0);
    reg reset = 0;
   always@(posedge MED_CLK) begin
       if (welcome_done && reset == 0) begin
            seg_pointer <= 0;
            reset <= 1;
       end
       else if (welcome_done) begin

            if (btnL) begin
                if(seg_pointer == 0)
                    seg_pointer <= 1;
            end
            if (btnR) begin
                if (seg_pointer == 1)
                    seg_pointer <= 0;
            end
       end
       else
            reset <= 0;
    end
endmodule
