`timescale 1ns / 1ps

module intensity_analysis(input SET_CLOCK, input [11:0] peak_intensity,  output reg [6:0] number_tens = 0,
                          output reg [6:0] number_ones = 0, output reg [15:0] led = 0);
    

    
    reg[6:0]char_0 = 7'b1000000;
    reg[6:0]char_1 = 7'b1111001;
    reg[6:0]char_2 = 7'b0100100;
    reg[6:0]char_3 = 7'b0110000; 
    reg[6:0]char_4 = 7'b0011001;
    reg[6:0]char_5 = 7'b0010010;
    reg[6:0]char_6 = 7'b0000010;
    reg[6:0]char_7 = 7'b1111000; 
    reg[6:0]char_8 = 7'b0;
    reg[6:0]char_9 = 7'b0010000;
   
  
        always@(posedge SET_CLOCK) begin
               
                        if (peak_intensity[11:0] < 12'd2048) begin // Case0
                          number_tens[6:0] <= char_0[6:0];
                          number_ones[6:0] <= char_0[6:0];
                          led <= 16'b0000000000000001;
                          end
                        else if (peak_intensity[11:0] < 12'd2182) begin  // Case1
                          number_tens[6:0] <= char_0[6:0];
                          number_ones[6:0] <= char_1[6:0];    
                          led <= 16'b0000000000000011;          
                           end
                        else if (peak_intensity[11:0] < 12'd2316) begin  // Case2
                          number_tens[6:0] <= char_0[6:0];
                          number_ones[6:0] <= char_2[6:0];
                          led <= 16'b0000000000000111;
                           end
                        else if (peak_intensity[11:0] < 12'd2450) begin  // Case3
                          number_tens[6:0] <= char_0[6:0];
                          number_ones[6:0] <= char_3[6:0];
                          led <= 16'b000000000001111;
                           end
                           
                        else if (peak_intensity[11:0] < 12'd2584) begin  // Case4
                          number_tens[6:0] <= char_0[6:0];
                          number_ones[6:0] <= char_4[6:0];
                          led <= 16'b0000000000011111;
                           end
                        else if (peak_intensity[11:0] < 12'd2718) begin  // Case5
                          number_tens[6:0] <= char_0[6:0];
                          number_ones[6:0] <= char_5[6:0];
                          led <= 16'b0000000000111111;
                           end                         
                        else if (peak_intensity[11:0] < 12'd2852) begin  // Case6
                          number_tens[6:0] <= char_0[6:0];
                          number_ones[6:0] <= char_6[6:0];
                          led <= 16'b0000000001111111;
                           end  
                           
                        else if (peak_intensity[11:0] < 12'd2986) begin  // Case7
                          number_tens[6:0] <= char_0[6:0];
                          number_ones[6:0] <= char_7[6:0];
                          led <= 16'b0000000011111111;
                           end      
                                                                                                                        
                        else if (peak_intensity[11:0] < 12'd3120) begin  // Case8
                          number_tens[6:0] <= char_0[6:0];
                          number_ones[6:0] <= char_8[6:0];
                          led <= 16'b0000000111111111;
          
                           end  
                        else if (peak_intensity[11:0] < 12'd3254) begin  // Case9
                          number_tens[6:0] <= char_0[6:0];
                          number_ones[6:0] <= char_9[6:0];
                          led <= 16'b0000001111111111;
          
                          end  
                        else if (peak_intensity[11:0] < 12'd3388) begin  // Case10
                          number_tens[6:0] <= char_1[6:0];
                          number_ones[6:0] <= char_0[6:0];
                          led <= 16'b0000011111111111;
          
                          end  
                           
                        else if (peak_intensity[11:0] < 12'd3522) begin  // Case11
                          number_tens[6:0] <= char_1[6:0];
                          number_ones[6:0] <= char_1[6:0];
                          led <= 16'b0000111111111111;
          
                          end
                        else if (peak_intensity[11:0] < 12'd3656) begin// Case12
                          number_tens[6:0] <= char_1[6:0];
                          number_ones[6:0] <= char_2[6:0];
                          led <= 16'b0001111111111111;
          
                          end 
                        else if (peak_intensity[11:0] < 12'd3790) begin// Case13
                          number_tens[6:0] <= char_1[6:0];
                          number_ones[6:0] <= char_3[6:0];
                          led <= 16'b0011111111111111;
          
                          end 
                        else if (peak_intensity[11:0] < 12'd3924) begin// Case14
                          number_tens[6:0] <= char_1[6:0];
                          number_ones[6:0] <= char_4[6:0];
                          led <= 16'b0111111111111111;
          
                          end                   
                        else if (peak_intensity[11:0] > 12'd3923) begin// Case15
                           number_tens[6:0] <= char_1[6:0];
                          number_ones[6:0] <= char_5[6:0];
                          led <= 16'b1111111111111111; 
                          end                                                                    
              
            end    
endmodule
