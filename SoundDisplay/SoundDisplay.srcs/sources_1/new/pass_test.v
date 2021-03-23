`timescale 1ns / 1ps


module pass_test(input MID_CLK, output reg [3:0] an_pass = 0, output reg [6:0] seg_pass = 0);

    reg [6:0]M_char = 7'b1101010;
    reg [6:0]O_char = 7'b1000000;
    reg [6:0]B_char = 7'b0000011;
    reg[1:0] counter = 0;

    always@(posedge MID_CLK) begin
        counter <= counter + 1;
        case(counter)
        0: begin
           seg_pass <= M_char;
           an_pass <= 4'b1110;
           end
        1: begin
           seg_pass <= O_char;
           an_pass <= 4'b1101;
           end
        2: begin
           seg_pass <= O_char;
           an_pass <= 4'b1011;
           end           
        3: begin
           seg_pass <= B_char;
           an_pass <= 4'b0111;
           end  
        endcase
    end
    
endmodule
