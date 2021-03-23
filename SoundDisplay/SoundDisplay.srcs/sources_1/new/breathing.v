`timescale 1ns / 1ps

module breathing(
    input CLOCK, 
    output [15:0] OUT
    );
    
    reg direction = 0; // 0 -up 1 - down
    reg [4:0] r = 0,b =0;
    reg [4:0] g = 0;
    //counter that goes up and down without flipping over
    always @ (posedge CLOCK) begin
        direction <= (r == 1) ? 0 : (r == 5'b11000) ? 1: direction;  // not 0 and 11111 else overflow possible
        // change upper direction early as there is no noticable brightness increase at high values
        r <= direction? r-1 : r+1;     
        g <= direction? g-1 : g+1;   
        b <= direction? b-1 : b+1;
    end
    
    assign OUT = {r,g,1'b0,b};
endmodule
