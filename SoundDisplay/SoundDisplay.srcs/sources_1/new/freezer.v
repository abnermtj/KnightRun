`timescale 1ns / 1ps

module freezer(
    input [15:0] oled,
    input CLOCK,
    input freeze,
    input [12:0] pixel,
    output reg [15:0] freezeoled
    );
    // stores the 
    reg [15:0] olddata [6143:0];
    always@ (posedge CLOCK) begin
        olddata[pixel] <= freeze ? olddata[pixel] : oled;
        freezeoled <= freeze? olddata[pixel] :oled;
    end
endmodule
