`timescale 1ns / 1ps
module acceleration(
    input [3:0]miclevel,
    input CLOCK,
    output notclosetozero, // tells when the mic data is zero when 1 means > 2000 and enable. probably change name to be more apt
    output reg [3:0] count = 0  // count goes  0 to 5 where the speed that it changes  depends on the data of the mic
    );
    
    wire speed1,speed2,speed3,speed4,speed5,speed6,speed7,speed8,speeddoff;
    wire speed;
    wire enable;
    // CHANGE MIC DATA AND MIC LEVEL
    // After every peak on mic reading, this variable will be used to slowly lower it down to zero
    reg [3:0] micdata = 0;
    reg [5:0] countdown = 6'b111111;
//    parameter THRESHOLD = 1; // defines how HIGH the raw mic data need to be to overwrite used math data
   
    assign enable = (miclevel > 7); 
    
    clk_divider speeddropoff(CLOCK, 1 , speeddoff);
    clk_divider speedval1(CLOCK, 7 , speed1);
    clk_divider speedval2(CLOCK, 8 , speed2);
    clk_divider speedval3(CLOCK, 10 , speed3);
    clk_divider speedval4(CLOCK, 23 , speed4);
    clk_divider speedval5(CLOCK, 46 , speed5);
    clk_divider speedval6(CLOCK, 75 , speed6);
    clk_divider speedval7(CLOCK, 126 , speed7);
    clk_divider speedval8(CLOCK, 190 , speed8);
   always @(posedge speeddoff) begin 
       if (miclevel > micdata  && enable == 1) 
           micdata <= miclevel;
       else begin
           countdown <= countdown-1; // will loop by itself overflow
           if (countdown == 0) 
                micdata <= (micdata > 1)? micdata-1 : micdata;
       end
   end
          
   assign speed = (micdata >= 14)? speed1:
          (micdata ==13)? speed2:
          (micdata ==12)? speed3:
          (micdata ==11) ? speed4:
          (micdata == 10)? speed5:
          (micdata >= 8 && micdata <=9)?speed6:
          (micdata >= 6 && micdata <=7)?speed7:
          0; // change from speed 8 to 0
    // count used to loop through the different text displays
    always @ (posedge speed) begin 
        count <= (count == 4) ? 0 : count +1;
    end
    
    assign notclosetozero = (micdata < 5) ? 0 : 1; // 2 instead of 5
endmodule

