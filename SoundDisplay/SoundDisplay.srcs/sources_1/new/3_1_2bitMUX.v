`timescale 1ns / 1ps

module _3_1_16bitMUX(output[15:0] out, input [15:0] inA, inB, inC, input [1:0] mode);
        assign out = (mode == 2)? inC : (mode == 1)? inB : (mode == 0) ? inA : 0;
endmodule
