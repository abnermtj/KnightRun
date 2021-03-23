`timescale 1ns / 1ps


module points_update(input MID_CLOCK, hello_done, input [6:0] result_win, input [3:0] lives, output[3:0] an_start, output [6:0] seg_start,
                      output reg pass = 0);

    reg[6:0] points = 0;
    reg[3:0] points_ones = 0, points_tens = 0;
    reg [3:0] an = 0;
    reg [6:0] seg = 0;
    wire[6:0] seg_tens, seg_ones, seg_lives;
    reg[1:0] counter = 0;
    
    assign an_start[3:0] = an[3:0];
    assign seg_start[6:0] = seg[6:0];
    
    translate_digit tens_d(MID_CLOCK, points_tens[3:0], seg_tens[6:0]);
    translate_digit ones_d(MID_CLOCK, points_ones[3:0], seg_ones[6:0]);
    translate_digit lives_d(MID_CLOCK, lives[3:0], seg_lives[6:0]);
    
    
    
    always@(MID_CLOCK) begin 
    if (hello_done) begin
         
        if (result_win != 50) begin
   
            points_ones <= result_win % 10;
            points_tens <= (result_win  - (result_win  % 10))/ 10;
            
        end    
        if (result_win == 50)
            pass <= 1;
    end
    else begin
        points = 0;
        pass <= 0;
        points_tens <= 0;
        points_ones <= 0;
    end
    end    
    always @(posedge MID_CLOCK) begin
        counter <= (counter == 3) ? 0 : counter + 1;  
        case(counter)
            0: begin    // anode0
                
                an[3:0] <= 4'b1110;
                seg[6:0] <= seg_ones[6:0];
                end
            1: begin    //anode1
                
                an[3:0] <= 4'b1101;
                seg[6:0] <= seg_tens[6:0];
                end
            2: begin    //L
                    
                an[3:0] <= 4'b1011;
                seg[6:0] <= 7'b1000111;
                end
            3: begin    //live np.
                        
                an[3:0] <= 4'b0111;
                seg[6:0] <= seg_lives[6:0];
                end              
            endcase 
    
end
     
endmodule
