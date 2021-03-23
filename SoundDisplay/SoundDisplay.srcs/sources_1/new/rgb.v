`timescale 1ns / 1ps
module rgb(
    input CLOCK,
    output [15:0] rgbsig
    );
    
    reg [4:0] r = 31; // 0 to 31
    reg [5:0] g = 0; // 0 to 63
    reg [4:0] b = 0; // 0 to 31
    
    always @ (posedge CLOCK) begin
        b <= (r == 31 && g == 0 && b < 31) ?  b+1 : (g == 62 && r == 0 && b > 0) ? b-1 :  b;
        r <=  (b == 31 && r > 0 && g==0) ? r-1: (g == 62 && b == 0 && r< 31) ? r+1 : r;
        g <= (r == 0 && b == 31 && g < 62) ? g+2 : (r == 31 && b == 0 && g > 0 ) ? g-2  : g;  //stop at 62 since its width is greater        
    end
    
    assign rgbsig = {r,g,b};
endmodule
