`timescale 1ns / 1ps

module peak_generator(input CLOCK, input[11:0] mic_in, output [11:0] mic_val);
    
    reg [14:0] count_change = 15'b1111111111111111;
    reg [11:0] max = 0;
    always@(posedge CLOCK) begin
         max <= (count_change == 0) ? 0  : ((mic_in>max) ? mic_in : max);
          count_change <= count_change-1;
    end
    assign mic_val = (count_change == 1)? max : mic_val;
//        end
//        else if ((mic_val - mic_in) > 12'd50) 
//            count_change <= count_change + 2;
           
        
//        else if((mic_val - mic_in) < 12'd51) begin
//           if(count_change > 0)
//                count_change <= count_change - 1;
//        end  
  
//        if(count_change >= 6'd27) begin //stable 23
//            mic_val <= mic_in;
//            count_change <= 0;
//        end
    
endmodule
