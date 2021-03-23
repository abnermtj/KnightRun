`timescale 1ns / 1ps


module hi_disp(input MID_CLK, SLOW_CLK, hi,  output reg [3:0] an_hi = 0, output reg [6:0] seg_hi = 0, output reg hi_done = 0);

reg[4:0] sequence = 0;
reg[6:0] s1, s2, s3,s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16, s17, s18;
reg [3:0] an_hi1, an_hi2, an_hi3, an_hi4, an_hi5, an_hi6, an_hi7, an_hi8, an_hi9,
          an_hi10, an_hi11, an_hi12, an_hi13, an_hi14, an_hi15, an_hi16, an_hi17, an_hi18;
reg [6:0] seg_hi1, seg_hi2, seg_hi3, seg_hi4, seg_hi5, seg_hi6, seg_hi7, seg_hi8, seg_hi9,
          seg_hi10, seg_hi11, seg_hi12, seg_hi13, seg_hi14, seg_hi15, seg_hi16, seg_hi17, seg_hi18;

reg[6:0] empty_char = 7'b1111111, h_char = 7'b0001001, i_char = 7'b1001111, smile_char1 = 7'b1110110, smile_char2 = 7'b1110000,
                      p_char = 7'b0001100, l_char = 7'b1000111, a_char = 7'b0001000, y_char = 7'b0010001, e_char = 7'b0000110, 
                      r_char = 7'b0101111, char_1 = 7'b1001111;               

always@ (posedge SLOW_CLK) begin

    if(hi) begin
    
        if(sequence != 5'b10010)//tbc
            sequence <= sequence + 1;
        else
            hi_done <= 1;
    end
    else begin
        sequence <= 0;
        hi_done <= 0;
    end
end

always@ (posedge MID_CLK) begin
    
    s1 <= 0;
    s2 <= (s2 == 1) ? 0 : s2 + 1;
    s3 <= (s3 == 2) ? 0 : s3 + 1;
    s4 <= (s4 == 3) ? 0 : s4 + 1;
    s5 <= (s5 == 3) ? 0 : s5 + 1;
    s6 <= (s6 == 3) ? 0 : s6 + 1;
    s7 <= (s7 == 3) ? 0 : s7 + 1;
    s8 <= 0;
    s9 <= 0;
    s10 <= (s10 == 1) ? 0 : s10 + 1;  
    s11 <= (s11 == 2) ? 0 : s11 + 1;
    s12 <= (s12 == 3) ? 0 : s12 + 1; 
    s13 <= (s13 == 3) ? 0 : s13 + 1; 
    s14 <= (s14 == 3) ? 0 : s14 + 1; 
    s15 <= (s15 == 3) ? 0 : s15 + 1; 
    s16 <= (s16 == 3) ? 0 : s16 + 1; 
    s17 <= (s17 == 3) ? 0 : s17 + 1; 
    s18 <= 0; 
    case(sequence)
    0: begin
       an_hi[3:0] <= an_hi1[3:0];
       seg_hi[6:0] <= seg_hi1[6:0]; 
       end
    1: begin
       an_hi[3:0] <= an_hi2[3:0];
       seg_hi[6:0] <= seg_hi2[6:0]; 
       end       
    2: begin
       an_hi[3:0] <= an_hi3[3:0];
       seg_hi[6:0] <= seg_hi3[6:0]; 
       end        
    3: begin
       an_hi[3:0] <= an_hi4[3:0];
       seg_hi[6:0] <= seg_hi4[6:0]; 
       end
    4: begin
       an_hi[3:0] <= an_hi5[3:0];
       seg_hi[6:0] <= seg_hi5[6:0]; 
       end  
    5: begin
       an_hi[3:0] <= an_hi6[3:0];
       seg_hi[6:0] <= seg_hi6[6:0]; 
       end               
    6: begin
       an_hi[3:0] <= an_hi7[3:0];
       seg_hi[6:0] <= seg_hi7[6:0]; 
       end     
    7: begin
       an_hi[3:0] <= an_hi8[3:0];
       seg_hi[6:0] <= seg_hi8[6:0]; 
       end                    
    8: begin
       an_hi[3:0] <= an_hi9[3:0];
       seg_hi[6:0] <= seg_hi9[6:0]; 
       end 
    9: begin
       an_hi[3:0] <= an_hi10[3:0];
       seg_hi[6:0] <= seg_hi10[6:0]; 
       end      
    10: begin
          an_hi[3:0] <= an_hi11[3:0];
          seg_hi[6:0] <= seg_hi11[6:0]; 
          end                              
    11: begin
          an_hi[3:0] <= an_hi12[3:0];
          seg_hi[6:0] <= seg_hi12[6:0]; 
          end   
    12: begin
          an_hi[3:0] <= an_hi13[3:0];
          seg_hi[6:0] <= seg_hi13[6:0]; 
           end            
    13: begin
          an_hi[3:0] <= an_hi14[3:0];
          seg_hi[6:0] <= seg_hi14[6:0]; 
          end                   
    14: begin
          an_hi[3:0] <= an_hi15[3:0];
          seg_hi[6:0] <= seg_hi15[6:0]; 
          end     
    15: begin
          an_hi[3:0] <= an_hi16[3:0];
          seg_hi[6:0] <= seg_hi16[6:0]; 
          end         
    16: begin
          an_hi[3:0] <= an_hi17[3:0];
          seg_hi[6:0] <= seg_hi17[6:0]; 
          end         
    17: begin
          an_hi[3:0] <= an_hi18[3:0];
          seg_hi[6:0] <= seg_hi18[6:0]; 
          end         
    18: begin
       an_hi[3:0] <= 4'b1111;
       seg_hi[6:0] <= 7'b1111111;  
       end      
    endcase
    
    
   case(s1) 
       0: begin
          an_hi1[3:0] <= 4'b1110; 
          seg_hi1[6:0] <= h_char; 
          end 
   endcase    
   case(s2)       
       0: begin
          seg_hi2[6:0] <= h_char; 
          an_hi2[3:0] <= 4'b1101; 
          end 
       1: begin
          seg_hi2[6:0] <= i_char; 
          an_hi2[3:0] <= 4'b1110; 
          end                        
   endcase
   case(s3)       
       0: begin
          seg_hi3[6:0] <= h_char; 
          an_hi3[3:0] <= 4'b1011; 
          end 
       1: begin
          seg_hi3[6:0] <= i_char; 
          an_hi3[3:0] <= 4'b1101; 
          end   
       2: begin
          seg_hi3[6:0] <=smile_char1; 
          an_hi3[3:0] <= 4'b1110; 
          end   
   endcase
   case(s4)       
       0: begin
          seg_hi4[6:0] <= h_char; 
          an_hi4[3:0] <= 4'b0111; 
          end 
       1: begin
          seg_hi4[6:0] <= i_char; 
          an_hi4[3:0] <= 4'b1011; 
          end   
       2: begin
          seg_hi4[6:0] <= smile_char1; 
          an_hi4[3:0] <= 4'b1101; 
          end   
       3: begin
          seg_hi4[6:0] <= smile_char2; 
          an_hi4[3:0] <= 4'b1110; 
          end            
   endcase   
   case(s5)       
       0: begin
          seg_hi5[6:0] <= i_char; 
          an_hi5[3:0] <= 4'b0111; 
          end 
       1: begin
          seg_hi5[6:0] <= smile_char1; 
          an_hi5[3:0] <= 4'b1011; 
          end   
       2: begin
          seg_hi5[6:0] <= smile_char2; 
          an_hi5[3:0] <= 4'b1101; 
          end   
       3: begin
          seg_hi5[6:0] <= empty_char; 
          an_hi5[3:0] <= 4'b1110; 
          end            
   endcase   
   case(s6)       
       0: begin
          seg_hi6[6:0] <= smile_char1; 
          an_hi6[3:0] <= 4'b0111; 
          end 
       1: begin
          seg_hi6[6:0] <= smile_char2; 
          an_hi6[3:0] <= 4'b1011; 
          end   
       2: begin
          seg_hi6[6:0] <= empty_char; 
          an_hi6[3:0] <= 4'b1101; 
          end   
       3: begin
          seg_hi6[6:0] <= empty_char; 
          an_hi6[3:0] <= 4'b1110; 
          end            
   endcase  
   case(s7)       
       0: begin
          seg_hi7[6:0] <= smile_char2; 
          an_hi7[3:0] <= 4'b0111; 
          end 
       1: begin
          seg_hi7[6:0] <= empty_char; 
          an_hi7[3:0] <= 4'b1011; 
          end   
       2: begin
          seg_hi7[6:0] <= empty_char; 
          an_hi7[3:0] <= 4'b1101; 
          end   
       3: begin
          seg_hi7[6:0] <= empty_char; 
          an_hi7[3:0] <= 4'b1110; 
          end            
   endcase     
   case(s8)       
       0: begin
          seg_hi8[6:0] <= empty_char; 
          an_hi8[3:0] <= 4'b1111; 
          end   
         
   endcase     
   case(s9)        
   0: begin
      seg_hi9[6:0] <= p_char; 
      an_hi9[3:0] <= 4'b1110; 
      end 
             
   endcase 
   case(s10)       
       0: begin
          seg_hi10[6:0] <= p_char; 
          an_hi10[3:0] <= 4'b1101; 
          end 
       1: begin
             seg_hi10[6:0] <= l_char; 
             an_hi10[3:0] <= 4'b1110; 
             end 
   endcase

   case(s11)       
       0: begin
          seg_hi11[6:0] <= p_char; 
          an_hi11[3:0] <= 4'b1011; 
          end 
       1: begin
             seg_hi11[6:0] <= l_char; 
             an_hi11[3:0] <= 4'b1101; 
             end 
       2: begin
             seg_hi11[6:0] <= a_char; 
             an_hi11[3:0] <= 4'b1110; 
             end              
   endcase
   case(s12)       
       0: begin
          seg_hi12[6:0] <= p_char; 
          an_hi12[3:0] <= 4'b0111; 
          end 
       1: begin
             seg_hi12[6:0] <= l_char; 
             an_hi12[3:0] <= 4'b1011; 
             end 
       2: begin
             seg_hi12[6:0] <= a_char; 
             an_hi12[3:0] <= 4'b1101; 
             end
       3: begin
             seg_hi12[6:0] <= y_char; 
             an_hi12[3:0] <= 4'b1110;              
             end              
   endcase
   case(s13)       
       0: begin
          seg_hi13[6:0] <= l_char; 
          an_hi13[3:0] <= 4'b0111; 
          end 
       1: begin
             seg_hi13[6:0] <= a_char; 
             an_hi13[3:0] <= 4'b1011; 
             end 
       2: begin
             seg_hi13[6:0] <= y_char; 
             an_hi13[3:0] <= 4'b1101; 
             end
       3: begin
             seg_hi13[6:0] <= e_char; 
             an_hi13[3:0] <= 4'b1110;              
             end              
   endcase   
   case(s14)       
       0: begin
          seg_hi14[6:0] <= a_char; 
          an_hi14[3:0] <= 4'b0111; 
          end 
       1: begin
             seg_hi14[6:0] <= y_char; 
             an_hi14[3:0] <= 4'b1011; 
             end 
       2: begin
             seg_hi14[6:0] <= e_char; 
             an_hi14[3:0] <= 4'b1101; 
             end
       3: begin
             seg_hi14[6:0] <= r_char; 
             an_hi14[3:0] <= 4'b1110;              
             end                          
   endcase    
   case(s15)       
       0: begin
          seg_hi15[6:0] <= y_char; 
          an_hi15[3:0] <= 4'b0111; 
          end 
       1: begin
             seg_hi15[6:0] <= e_char; 
             an_hi15[3:0] <= 4'b1011; 
             end 
       2: begin
             seg_hi15[6:0] <= r_char; 
             an_hi15[3:0] <= 4'b1101; 
             end
       3: begin
             seg_hi15[6:0] <= char_1; 
             an_hi15[3:0] <= 4'b1110;              
             end              
   endcase   
   case(s16)       
       0: begin
          seg_hi16[6:0] <= e_char; 
          an_hi16[3:0] <= 4'b0111; 
          end 
       1: begin
             seg_hi16[6:0] <= r_char; 
             an_hi16[3:0] <= 4'b1011; 
             end 
       2: begin
             seg_hi16[6:0] <= char_1; 
             an_hi16[3:0] <= 4'b1101; 
             end
       3: begin
             seg_hi16[6:0] <= empty_char; 
             an_hi16[3:0] <= 4'b1110;              
             end              
   endcase   
   case(s17)       
       0: begin
          seg_hi17[6:0] <= r_char; 
          an_hi17[3:0] <= 4'b0111; 
          end 
       1: begin
             seg_hi17[6:0] <= char_1; 
             an_hi17[3:0] <= 4'b1011; 
             end 
       2: begin
             seg_hi17[6:0] <= empty_char; 
             an_hi17[3:0] <= 4'b1101; 
             end
       3: begin
             seg_hi17[6:0] <= empty_char; 
             an_hi17[3:0] <= 4'b1110;              
             end              
   endcase 
   case(s18)       
       0: begin
          an_hi18[3:0] <= 4'b0111; 
          seg_hi18[6:0] <= char_1;
          end          
   endcase        
end   
endmodule
    

