`timescale 1ns / 1ps

module sim(
    );
    
    reg CLOCK100MHZ = 0;
    reg btnC =0, btnU = 0, btnD = 0,btnL = 0, btnR= 0;
    reg [6:0]x = 0;
    reg [5:0] y =0;
    reg [12:0] pixel_index = 0;
    wire [15:0] oled;
   platformer plat(
         CLOCK100MHZ, // 100MHZ expected
         btnC, btnU, btnD, btnL, btnR,
         x,
         y,
         pixel_index,
        oled 
        );
   
    // 80 41 is supposed to be colored 3920
    initial begin
          
    end
   always begin
       CLOCK100MHZ = ~CLOCK100MHZ;  #5;
    end
    
endmodule
