module clk_divider(
    input CLOCK,
    input [31:0] max,
    output reg OUT = 0  //6.25mhz
    );
    
    reg [31:0] count = 0;
    
    always @(posedge CLOCK) begin
        count <= (count == max)? 0 : count +1;  // count == m where m = (fclk/fdesire)/2 -1
        OUT <= (count == 0) ? ~OUT : OUT;
    end
endmodule   
