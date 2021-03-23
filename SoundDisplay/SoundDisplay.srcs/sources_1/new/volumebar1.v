`timescale 1ns / 1ps

module volumebar1(
    input [1:0] bordermode,
    input volumebarmode,
    input[6:0] x,
    input[5:0]y,
    output reg [15:0] oled,
    input[3:0] volumelevel
    );
    
    parameter BORDER = 16'b1111111111100000, TOP = 16'b0000000001111111,
              MID = 16'b0000011111111111, LOW =16'b0001011110000010,
              BACK = 16'b1001011110110010;
    always @(*) begin  
        if (volumebarmode == 1) begin
               
         if (bordermode == 1 &&(x == 0 || x == 95 || y == 0 || y == 63) )begin
               oled = BORDER;
         end
         else if ( bordermode == 2 && ( x <= 2 || x >= 93 || y <= 2 || y >= 61)) begin
               oled = BORDER; 
         end                 
         else if (x >= 40  && x <= 53 && y >= 1 && y<=3 && volumelevel >= 15) begin// 16- highest vol
             oled = TOP; 
         end
         else if (x >= 40  && x <= 53 && y >= 5 && y<=7 && volumelevel >= 14) begin// 15
                     oled = TOP;
         end
         else if (x >= 40  && x <= 53 && y >= 9 && y<=11 && volumelevel >= 13) begin//14
                     oled = TOP;    
         end                                          
         else if (x >= 40  && x <= 53 && y >= 13 && y<=15 && volumelevel >= 12) begin//13
                     oled = TOP;    
         end                                          
         else if (x >= 40  && x <= 53 && y >= 17 && y<=19 && volumelevel >= 11) begin//12
                     oled = TOP;    
         end                                          
         else if (x >= 40  && x <= 53 && y >= 21 && y<=23 && volumelevel >= 10) begin//11
                     oled = MID;    
         end    
         else if (x >= 40  && x <= 53 && y >= 25 && y<=27 && volumelevel >= 9) begin//10
                     oled = MID;    
         end                                          
         else if (x >= 40  && x <= 53 && y >= 29 && y<=31 && volumelevel >= 8) begin//9
                     oled = MID;    
         end                                          
         else if (x >= 40  && x <= 53 && y >= 33 && y<=35 && volumelevel >= 7) begin//8
                     oled = MID;    
         end                                          
         else if (x >= 40  && x <= 53 && y >= 37 && y<=39 && volumelevel >= 6) begin//7
                     oled = MID;    
         end                                          
         else if (x >= 40  && x <= 53 && y >= 41 && y<=43 && volumelevel >= 5) begin//6
                     oled = LOW;    
         end                                          
         else if (x >= 40  && x <= 53 && y >= 45 && y<=47 && volumelevel >= 4) begin//5
                     oled = LOW;    
         end                                          
         else if (x >= 40  && x <= 53 && y >= 49 && y<=51 && volumelevel >= 3) begin//4
                     oled = LOW;    
         end                                          
         else if (x >= 40  && x <= 53 && y >= 53 && y<=55 && volumelevel >= 2) begin//3
                     oled = LOW;    
         end                                          
         else if (x >= 40  && x <= 53 && y >= 57 && y<=59 && volumelevel >= 1) begin//2
                     oled = LOW;    
         end                                          
         else if (x >= 40  && x <= 53 && y >= 61 && y<=63 && volumelevel >= 0) begin//1
                     oled = LOW;    
         end               
         else begin 
             oled = BACK;
         end                            
       end
       else begin // volume bar mode = 0
         if (bordermode == 1 &&(x == 0 || x == 95 || y == 0 || y == 63) )begin
               oled = BORDER;
         end
         else if ( bordermode == 2 && ( x <= 2 || x >= 93 || y <= 2 || y >= 61)) begin
               oled = BORDER; 
         end      
         else begin  
               oled = BACK;
         end
       end   
     end
endmodule
