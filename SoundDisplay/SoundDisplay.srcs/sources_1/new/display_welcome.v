`timescale 1ns / 1ps


module display(input SLOW_CLK, FAST_CLK, welcome, output reg[3:0] an_welcome = 0, output reg[6:0] seg_welcome = 0, output reg done = 0);

reg[4:0] sequence = 0;
reg[6:0] s1, s2, s3,s4, s5, s6, s7, s8, s9, s10, s11, s12;
reg [3:0] an_welcome1, an_welcome2, an_welcome3, an_welcome4, an_welcome5, an_welcome6, an_welcome7, an_welcome8, an_welcome9,
          an_welcome10, an_welcome11, an_welcome12;
reg [6:0] seg_welcome1, seg_welcome2, seg_welcome3, seg_welcome4, seg_welcome5, seg_welcome6, seg_welcome7, seg_welcome8, seg_welcome9,
          seg_welcome10, seg_welcome11, seg_welcome12;

reg[6:0] empty_char = 7'b1111111, w_char = 7'b1010101, e_char = 7'b0000110, l_char = 7'b1000111, c_char = 7'b1000110,
         o_char = 7'b1000000, m_char = 7'b1101010, smile_char1 = 7'b1110110, smile_char2 = 7'b1110000;                

always@ (posedge SLOW_CLK) begin

    if(welcome) begin
    
        if(sequence != 4'b1100)//tbc
            sequence <= sequence + 1;
        else
            done <= 1;
    end
    else begin
        sequence <= 0;
        done <= 0;
    end
end

always@ (posedge FAST_CLK) begin
    
    s1 <= 0;
    s2 <= (s2 == 1) ? 0 : s2 + 1;
    s3 <= (s3 == 2) ? 0 : s3 + 1;
    s4 <= (s4 == 3) ? 0 : s4 + 1;
    s5 <= (s5 == 3) ? 0 : s5 + 1;
    s6 <= (s6 == 3) ? 0 : s6 + 1;
    s7 <= (s7 == 3) ? 0 : s7 + 1;
    s8 <= (s8 == 3) ? 0 : s8 + 1;
    s9 <= (s9 == 3) ? 0 : s9 + 1;  
    s10 <= (s10 == 2) ? 0 : s10 + 1;
    s11 <= (s11 == 1) ? 0 : s11 + 1;
    s12 <= 0;   
    case(sequence)
    0: begin
       an_welcome[3:0] <= an_welcome1[3:0];
       seg_welcome[6:0] <= seg_welcome1[6:0]; 
       end
    1: begin
       an_welcome[3:0] <= an_welcome2[3:0];
       seg_welcome[6:0] <= seg_welcome2[6:0]; 
       end       
    2: begin
       an_welcome[3:0] <= an_welcome3[3:0];
       seg_welcome[6:0] <= seg_welcome3[6:0]; 
       end        
    3: begin
       an_welcome[3:0] <= an_welcome4[3:0];
       seg_welcome[6:0] <= seg_welcome4[6:0]; 
       end
    4: begin
       an_welcome[3:0] <= an_welcome5[3:0];
       seg_welcome[6:0] <= seg_welcome5[6:0]; 
       end  
    5: begin
       an_welcome[3:0] <= an_welcome6[3:0];
       seg_welcome[6:0] <= seg_welcome6[6:0]; 
       end               
    6: begin
       an_welcome[3:0] <= an_welcome7[3:0];
       seg_welcome[6:0] <= seg_welcome7[6:0]; 
       end     
    7: begin
       an_welcome[3:0] <= an_welcome8[3:0];
       seg_welcome[6:0] <= seg_welcome8[6:0]; 
       end                    
    8: begin
       an_welcome[3:0] <= an_welcome9[3:0];
       seg_welcome[6:0] <= seg_welcome9[6:0]; 
       end 
    9: begin
       an_welcome[3:0] <= an_welcome10[3:0];
       seg_welcome[6:0] <= seg_welcome10[6:0]; 
       end 
    10: begin
       an_welcome[3:0] <= an_welcome11[3:0];
       seg_welcome[6:0] <= seg_welcome11[6:0]; 
       end     
    11: begin
       an_welcome[3:0] <= an_welcome12[3:0];
       seg_welcome[6:0] <= seg_welcome12[6:0]; 
       end                        
    12: begin
       an_welcome[3:0] <= 4'b1111;
       seg_welcome[6:0] <= 7'b1111111;  
       end      
    endcase
    
    
   case(s1) 
       0: begin
          seg_welcome1[6:0] <= w_char; 
          an_welcome1[3:0] <= 4'b1110; 
          end 
   endcase    
   case(s2)       
       0: begin
          seg_welcome2[6:0] <= w_char; 
          an_welcome2[3:0] <= 4'b1101; 
          end 
       1: begin
          seg_welcome2[6:0] <= e_char; 
          an_welcome2[3:0] <= 4'b1110; 
          end                        
   endcase
   case(s3)       
       0: begin
          seg_welcome3[6:0] <= w_char; 
          an_welcome3[3:0] <= 4'b1011; 
          end 
       1: begin
          seg_welcome3[6:0] <= e_char; 
          an_welcome3[3:0] <= 4'b1101; 
          end   
       2: begin
          seg_welcome3[6:0] <= l_char; 
          an_welcome3[3:0] <= 4'b1110; 
          end   
   endcase
   case(s4)       
       0: begin
          seg_welcome4[6:0] <= w_char; 
          an_welcome4[3:0] <= 4'b0111; 
          end 
       1: begin
          seg_welcome4[6:0] <= e_char; 
          an_welcome4[3:0] <= 4'b1011; 
          end   
       2: begin
          seg_welcome4[6:0] <= l_char; 
          an_welcome4[3:0] <= 4'b1101; 
          end   
       3: begin
          seg_welcome4[6:0] <= c_char; 
          an_welcome4[3:0] <= 4'b1110; 
          end            
   endcase   
   case(s5)       
       0: begin
          seg_welcome5[6:0] <= e_char; 
          an_welcome5[3:0] <= 4'b0111; 
          end 
       1: begin
          seg_welcome5[6:0] <= l_char; 
          an_welcome5[3:0] <= 4'b1011; 
          end   
       2: begin
          seg_welcome5[6:0] <= c_char; 
          an_welcome5[3:0] <= 4'b1101; 
          end   
       3: begin
          seg_welcome5[6:0] <= o_char; 
          an_welcome5[3:0] <= 4'b1110; 
          end            
   endcase  
   case(s6)       
       0: begin
          seg_welcome6[6:0] <= l_char; 
          an_welcome6[3:0] <= 4'b0111; 
          end 
       1: begin
          seg_welcome6[6:0] <= c_char; 
          an_welcome6[3:0] <= 4'b1011; 
          end   
       2: begin
          seg_welcome6[6:0] <= o_char; 
          an_welcome6[3:0] <= 4'b1101; 
          end   
       3: begin
          seg_welcome6[6:0] <= m_char; 
          an_welcome6[3:0] <= 4'b1110; 
          end            
   endcase       
   case(s7)       
       0: begin
          seg_welcome7[6:0] <= c_char; 
          an_welcome7[3:0] <= 4'b0111; 
          end 
       1: begin
          seg_welcome7[6:0] <= o_char; 
          an_welcome7[3:0] <= 4'b1011; 
          end   
       2: begin
          seg_welcome7[6:0] <= m_char; 
          an_welcome7[3:0] <= 4'b1101; 
          end   
       3: begin
          seg_welcome7[6:0] <= e_char; 
          an_welcome7[3:0] <= 4'b1110; 
          end            
   endcase  
   case(s8)       
       0: begin
          seg_welcome8[6:0] <= o_char; 
          an_welcome8[3:0] <= 4'b0111; 
          end 
       1: begin
          seg_welcome8[6:0] <= m_char; 
          an_welcome8[3:0] <= 4'b1011; 
          end   
       2: begin
          seg_welcome8[6:0] <= e_char; 
          an_welcome8[3:0] <= 4'b1101; 
          end   
       3: begin
          seg_welcome8[6:0] <= smile_char1; 
          an_welcome8[3:0] <= 4'b1110; 
          end            
   endcase  
   case(s9)       
       0: begin
          seg_welcome9[6:0] <= m_char; 
          an_welcome9[3:0] <= 4'b0111; 
          end 
       1: begin
          seg_welcome9[6:0] <= e_char; 
          an_welcome9[3:0] <= 4'b1011; 
          end   
       2: begin
          seg_welcome9[6:0] <= smile_char1; 
          an_welcome9[3:0] <= 4'b1101; 
          end   
       3: begin
          seg_welcome9[6:0] <= smile_char2; 
          an_welcome9[3:0] <= 4'b1110; 
          end            
   endcase     
   case(s10)       
       0: begin
          seg_welcome10[6:0] <= e_char; 
          an_welcome10[3:0] <= 4'b0111; 
          end   
       1: begin
          seg_welcome10[6:0] <= smile_char1; 
          an_welcome10[3:0] <= 4'b1011; 
          end   
       2: begin
          seg_welcome10[6:0] <= smile_char2; 
          an_welcome10[3:0] <= 4'b1101; 
          end            
   endcase     
   case(s11)        
       0: begin
          seg_welcome11[6:0] <= smile_char1; 
          an_welcome11[3:0] <= 4'b0111; 
          end   
       1: begin
          seg_welcome11[6:0] <= smile_char2; 
          an_welcome11[3:0] <= 4'b1011; 
          end            
   endcase 
   case(s12)       
       0: begin
          seg_welcome12[6:0] <= smile_char2; 
          an_welcome12[3:0] <= 4'b0111; 
          end            
   endcase              
end

endmodule
