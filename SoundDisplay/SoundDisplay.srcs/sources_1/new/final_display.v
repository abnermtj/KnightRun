`timescale 1ns / 1ps


module final_display(input MID_CLK, result1, result2, btnC, output reg[3:0] an_final = 0,output reg [6:0]seg_final = 0, output reg fail_result = 0);

reg[1:0] pass, fail;
reg[3:0] an_pass,an_fail;
reg[6:0] seg_pass, seg_fail;

reg [5:0]count_fail = 0;
// change
reg[6:0] char_P = 7'b0001100;
reg[6:0] char_A = 7'b0001000;
reg[6:0] char_S = 7'b0010010;

reg[6:0] char_F = 7'b0001110;
reg[6:0] char_I = 7'b1001111;
reg[6:0] char_L = 7'b1000111;

always@(posedge MID_CLK) begin
    if(result1) begin
    an_final <= an_pass;
    seg_final <= seg_pass;
    end
    else if(result2) begin
    an_final <= an_fail;
    seg_final <= seg_fail;
    if (btnC)
        fail_result <= 1; 
    end
    else if(~result1 & ~result2)
    fail_result <= 0;
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
       seg_pass <= char_A; 
       an_pass <= 4'b1011;
       end 
    3: begin
       seg_pass <= char_P; 
       an_pass <= 4'b0111;
       end                       
    endcase
    case(fail) 
    0: begin
       seg_fail <= char_L; 
       an_fail <= 4'b1110;
       end
    1: begin
       seg_fail <= char_I; 
       an_fail <= 4'b1101;
       end
    2: begin
       seg_fail <= char_A; 
       an_fail <= 4'b1011;
       end 
    3: begin
       seg_fail <= char_F; 
       an_fail <= 4'b0111;
       end     
    endcase
end

endmodule
