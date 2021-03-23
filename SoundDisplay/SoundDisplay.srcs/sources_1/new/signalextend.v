`timescale 1ns / 1ps

module signalextend(
    input in,
    input CLOCK,
    output out
    );
    
    reg [3:0] count = 4'b1111;
    always @ (posedge CLOCK) begin  
        count <= (in == 1) ? 4'b1111 : (count == 0) ? 0 : count - 1;
    end
    
    assign  out = (in == 1) ? 1 : (count == 0) ? 0 : 1;
    
endmodule
