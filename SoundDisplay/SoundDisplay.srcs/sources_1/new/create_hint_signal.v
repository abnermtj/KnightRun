`timescale 1ns / 1ps

module create_hint(input MID_CLOCK, input [6:0] ones_random, output reg [3:0]an_hint = 0, output reg[6:0]seg_hint = 0);

    reg count = 0;
    wire [6:0] num_disp ;
        
    always @(posedge MID_CLOCK) begin
    count <= count + 1;
    
    case(count)
        0:begin
            an_hint <= 4'b1110;
            seg_hint <= ones_random;        
        end

        1: begin
            an_hint <= 4'b1111;
            seg_hint <= 7'b1111111;
        end
     endcase
    end
endmodule
