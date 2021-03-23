`timescale 1ns / 1ps
// ZERO INDEXED first row is y =0 to 63
// firs col is x =0 to 95
module ToPixel(
    input [12:0] pixeldata,
    output [6:0] x,
    output [5:0] y
    );
    
    assign x = pixeldata%96;
    assign y = pixeldata/96;
endmodule
