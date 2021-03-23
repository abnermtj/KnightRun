`timescale 1ns / 1ps

module display_mul_random(input FAST_CLOCK, sw, input [6:0] output_set1, output_set2,output[3:0] an, output [6:0] seg);

reg counter = 0;
reg [6:0] seg_data0;
reg [3:0] an_data0;

assign an[3:0] = an_data0[3:0];
assign seg[6:0] = seg_data0[6:0];
always@(posedge FAST_CLOCK) begin
   
   if(sw) begin     
        counter <= counter + 1;         
                  case(counter)               
                  
                      0:  begin
                             seg_data0[6:0] <= output_set1;
                             an_data0[3:0] <= 4'b1101; 
                          end
                      1:  begin
                             seg_data0[6:0] <= output_set2;
                             an_data0[3:0] <= 4'b1110; 
                          end
                         
                  endcase
   end
   else 
        an_data0[3:0] <= 4'b1111;   
 
end
endmodule
