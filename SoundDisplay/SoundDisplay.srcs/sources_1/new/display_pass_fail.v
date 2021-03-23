`timescale 1ns / 1ps


module display_pass_fail(input MID_CLK, res_pass, res_fail, output reg[3:0] an_final = 0,output reg [6:0]seg_final = 0, output reg pivot_result = 0);

reg[1:0] pass, fail;
reg[3:0] an_pass,an_fail;
reg[6:0] seg_pass, seg_fail;

reg [5:0]count_fail = 0;
// change


reg[6:0] char_B = 7'b0000011;
reg[6:0] char_O = 7'b1000000;
reg[6:0] char_S = 7'b0010010;


reg[6:0] char_L = 7'b1000111;

always@(posedge MID_CLK) begin

    if(res_pass) begin
    an_final <= an_pass;
    seg_final <= seg_pass;
    end
    else if(res_fail) begin
    an_final <= an_fail;
    seg_final <= seg_fail;
    end
   
    if(~res_pass & ~res_fail)
        pivot_result <= 0;
    else
        pivot_result <= 1;
end 


always@(posedge MID_CLK) begin
    pass <= pass + 1;
    fail <= fail + 1;
    
    case(pass) 
    0: begin
       seg_pass <= char_S; 
       an_pass <= 4'b1110;
       end
    1: begin
       seg_pass <= char_S; 
       an_pass <= 4'b1101;
       end
    2: begin
       seg_pass <= char_O; 
       an_pass <= 4'b1011;
       end 
    3: begin
       seg_pass <= char_B; 
       an_pass <= 4'b0111;
       end                       
    endcase
    case(fail) 
    0: begin
       seg_fail <= char_S; 
       an_fail <= 4'b1110;
       end
    1: begin
       seg_fail <= char_S; 
       an_fail <= 4'b1101;
       end
    2: begin
       seg_fail <= char_O; 
       an_fail <= 4'b1011;
       end 
    3: begin
       seg_fail <= char_L; 
       an_fail <= 4'b0111;
       end     
    endcase
end

endmodule
