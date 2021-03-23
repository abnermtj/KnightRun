`timescale 1ns / 1ps


module runman_LR(input MED_CLK, btnL, btnR, hi_done, output reg [1:0]  seg_pointer = 0);

   reg reset = 0;
   always@(posedge MED_CLK) begin
       if (hi_done && reset == 0) begin
            seg_pointer <= 0;
            reset <= 1;
       end
       else if (hi_done) begin
            if (btnL) begin
                if(seg_pointer != 3)
                    seg_pointer <= seg_pointer + 1;
            end
            if (btnR) begin
                if (seg_pointer != 0)
                    seg_pointer <= seg_pointer - 1;
            end
       end
       else
            reset <= 0;
    end
endmodule
