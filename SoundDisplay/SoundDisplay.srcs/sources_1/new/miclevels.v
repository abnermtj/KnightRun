`timescale 1ns / 1ps

module miclevels(input [11:0] peak_intensity, input CLOCK, output reg [3:0] discrete_levels = 0);
	always@(posedge CLOCK) begin
	         if (peak_intensity[11:0] < 12'd2200) begin // Case0
	         discrete_levels <= 0;
              end
            else if (peak_intensity[11:0] < 12'd2280) begin  // Case1
	         discrete_levels <= 1;     
               end
            else if (peak_intensity[11:0] < 12'd2360) begin  // Case2
              discrete_levels <= 2;
               end
            else if (peak_intensity[11:0] < 12'd2440) begin  // Case3
              discrete_levels <= 3;
               end
               
            else if (peak_intensity[11:0] < 12'd2520) begin  // Case4
              discrete_levels <= 4;
               end
            else if (peak_intensity[11:0] < 12'd2600) begin  // Case5
              discrete_levels <= 5;
               end                         
            else if (peak_intensity[11:0] < 12'd2680) begin  // Case6
              discrete_levels <= 6;
               end  
               
            else if (peak_intensity[11:0] < 12'd2760) begin  // Case7
              discrete_levels <= 7;
               end      
                                                                                                            
            else if (peak_intensity[11:0] < 12'd2840) begin  // Case8
             discrete_levels <= 8;
    
               end  
            else if (peak_intensity[11:0] < 12'd2920) begin  // Case9
              discrete_levels <= 9;
    
              end  
            else if (peak_intensity[11:0] < 12'd3000) begin  // Case10
              discrete_levels <= 10;
    
              end  
               
            else if (peak_intensity[11:0] < 12'd3080) begin  // Case11
              discrete_levels <= 11;
    
              end
            else if (peak_intensity[11:0] < 12'd3160) begin// Case12
              discrete_levels <= 12;
    
              end 
            else if (peak_intensity[11:0] < 12'd3240) begin// Case13
              discrete_levels <= 13;
    
              end 
            else if (peak_intensity[11:0] < 12'd3320) begin// Case14
              discrete_levels <= 14;
    
              end                   
            else if (peak_intensity[11:0] > 12'd3400) begin// Case15
              discrete_levels <= 15;
              end                 
	end

endmodule
