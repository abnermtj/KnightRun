`timescale 1ns / 1ps
module distancetoled(
    input [6:0] distance,
    output reg [15:0] led
    );
    
    reg [6:0]dist_traveled;
    always @(*) begin
        dist_traveled = 100 - distance;
        led = 16'b1111111111111111 >> dist_traveled/6;
    end
endmodule
