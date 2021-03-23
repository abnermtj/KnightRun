`timescale 1ns / 1ps

module shout_help(input MID_CLK, output reg [3:0] an_fail = 0, output reg [6:0] seg_fail = 0);

    reg [6:0]B_char = 7'b0000011;
    reg [6:0]A_char = 7'b0001000;
    reg [6:0]I_char = 7'b1001111;
    reg [6:0]L_char = 7'b1000111;
    reg[1:0] counter = 0;

    always@(posedge MID_CLK) begin
        counter <= counter + 1;
        case(counter)
        0: begin
           seg_fail <= L_char;
           an_fail <= 4'b1110;
           end
        1: begin
           seg_fail <= I_char;
           an_fail <= 4'b1101;
           end
        2: begin
           seg_fail <= A_char;
           an_fail <= 4'b1011;
           end           
        3: begin
              seg_fail <= B_char;
              an_fail <= 4'b0111;
              end   
        endcase
    end


endmodule
