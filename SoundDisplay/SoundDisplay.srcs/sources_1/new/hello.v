`timescale 1ns / 1ps

module hello_disp(input SLOW_CLK, FAST_CLK, hello, output reg [3:0]an_hello = 0, output reg [6:0]seg_hello = 0, output reg done = 0);

reg[4:0] sequence = 0;
reg[6:0] s1, s2, s3,s4, s5, s6, s7, s8, s9, s10;
reg [3:0] an_hello1, an_hello2, an_hello3, an_hello4, an_hello5, an_hello6, an_hello7, an_hello8, an_hello9,
          an_hello10;
reg [6:0] seg_hello1, seg_hello2, seg_hello3, seg_hello4, seg_hello5, seg_hello6, seg_hello7, seg_hello8, seg_hello9,
          seg_hello10;

reg[6:0] empty_char = 7'b1111111, h_char = 7'b0001001, e_char = 7'b0000110, l_char = 7'b1000111,
         o_char = 7'b1000000, smile_char1 = 7'b1110110, smile_char2 = 7'b1110000;                

always@ (posedge SLOW_CLK) begin

    if(hello) begin
    
        if(sequence != 4'b1010)//tbc
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
    s8 <= (s8 == 2) ? 0 : s8 + 1;
    s9 <= (s9 == 1) ? 0 : s9 + 1;  
    s10 <= 0; 
    case(sequence)
    0: begin
       an_hello[3:0] <= an_hello1[3:0];
       seg_hello[6:0] <= seg_hello1[6:0]; 
       end
    1: begin
       an_hello[3:0] <= an_hello2[3:0];
       seg_hello[6:0] <= seg_hello2[6:0]; 
       end       
    2: begin
       an_hello[3:0] <= an_hello3[3:0];
       seg_hello[6:0] <= seg_hello3[6:0]; 
       end        
    3: begin
       an_hello[3:0] <= an_hello4[3:0];
       seg_hello[6:0] <= seg_hello4[6:0]; 
       end
    4: begin
       an_hello[3:0] <= an_hello5[3:0];
       seg_hello[6:0] <= seg_hello5[6:0]; 
       end  
    5: begin
       an_hello[3:0] <= an_hello6[3:0];
       seg_hello[6:0] <= seg_hello6[6:0]; 
       end               
    6: begin
       an_hello[3:0] <= an_hello7[3:0];
       seg_hello[6:0] <= seg_hello7[6:0]; 
       end     
    7: begin
       an_hello[3:0] <= an_hello8[3:0];
       seg_hello[6:0] <= seg_hello8[6:0]; 
       end                    
    8: begin
       an_hello[3:0] <= an_hello9[3:0];
       seg_hello[6:0] <= seg_hello9[6:0]; 
       end 
    9: begin
       an_hello[3:0] <= an_hello10[3:0];
       seg_hello[6:0] <= seg_hello10[6:0]; 
       end                        
    10: begin
       an_hello[3:0] <= 4'b1111;
       seg_hello[6:0] <= 7'b1111111;  
       end      
    endcase
    
    
   case(s1) 
       0: begin
          seg_hello1[6:0] <= h_char; 
          an_hello1[3:0] <= 4'b1110; 
          end 
   endcase    
   case(s2)       
       0: begin
          seg_hello2[6:0] <= h_char; 
          an_hello2[3:0] <= 4'b1101; 
          end 
       1: begin
          seg_hello2[6:0] <= e_char; 
          an_hello2[3:0] <= 4'b1110; 
          end                        
   endcase
   case(s3)       
       0: begin
          seg_hello3[6:0] <= h_char; 
          an_hello3[3:0] <= 4'b1011; 
          end 
       1: begin
          seg_hello3[6:0] <= e_char; 
          an_hello3[3:0] <= 4'b1101; 
          end   
       2: begin
          seg_hello3[6:0] <= l_char; 
          an_hello3[3:0] <= 4'b1110; 
          end   
   endcase
   case(s4)       
       0: begin
          seg_hello4[6:0] <= h_char; 
          an_hello4[3:0] <= 4'b0111; 
          end 
       1: begin
          seg_hello4[6:0] <= e_char; 
          an_hello4[3:0] <= 4'b1011; 
          end   
       2: begin
          seg_hello4[6:0] <= l_char; 
          an_hello4[3:0] <= 4'b1101; 
          end   
       3: begin
          seg_hello4[6:0] <= l_char; 
          an_hello4[3:0] <= 4'b1110; 
          end            
   endcase   
   case(s5)       
       0: begin
          seg_hello5[6:0] <= e_char; 
          an_hello5[3:0] <= 4'b0111; 
          end 
       1: begin
          seg_hello5[6:0] <= l_char; 
          an_hello5[3:0] <= 4'b1011; 
          end   
       2: begin
          seg_hello5[6:0] <= l_char; 
          an_hello5[3:0] <= 4'b1101; 
          end   
       3: begin
          seg_hello5[6:0] <= o_char; 
          an_hello5[3:0] <= 4'b1110; 
          end            
   endcase   
   case(s6)       
       0: begin
          seg_hello6[6:0] <= l_char; 
          an_hello6[3:0] <= 4'b0111; 
          end 
       1: begin
          seg_hello6[6:0] <= l_char; 
          an_hello6[3:0] <= 4'b1011; 
          end   
       2: begin
          seg_hello6[6:0] <= o_char; 
          an_hello6[3:0] <= 4'b1101; 
          end   
       3: begin
          seg_hello6[6:0] <= smile_char1; 
          an_hello6[3:0] <= 4'b1110; 
          end            
   endcase  
   case(s7)       
       0: begin
          seg_hello7[6:0] <= l_char; 
          an_hello7[3:0] <= 4'b0111; 
          end 
       1: begin
          seg_hello7[6:0] <= o_char; 
          an_hello7[3:0] <= 4'b1011; 
          end   
       2: begin
          seg_hello7[6:0] <= smile_char1; 
          an_hello7[3:0] <= 4'b1101; 
          end   
       3: begin
          seg_hello7[6:0] <= smile_char2; 
          an_hello7[3:0] <= 4'b1110; 
          end            
   endcase     
   case(s8)       
       0: begin
          seg_hello8[6:0] <= o_char; 
          an_hello8[3:0] <= 4'b0111; 
          end   
       1: begin
          seg_hello8[6:0] <= smile_char1; 
          an_hello8[3:0] <= 4'b1011; 
          end   
       2: begin
          seg_hello8[6:0] <= smile_char2; 
          an_hello8[3:0] <= 4'b1101; 
          end            
   endcase     
   case(s9)        
       0: begin
          seg_hello9[6:0] <= smile_char1; 
          an_hello9[3:0] <= 4'b0111; 
          end   
       1: begin
          seg_hello9[6:0] <= smile_char2; 
          an_hello9[3:0] <= 4'b1011; 
          end            
   endcase 
   case(s10)       
       0: begin
          seg_hello10[6:0] <= smile_char2; 
          an_hello10[3:0] <= 4'b0111; 
          end 
   endcase
end   
endmodule
