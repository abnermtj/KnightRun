`timescale 1ns / 1ps


module gamer_layout(input MID_CLK, SPECIAL_CLK, hi_done, btnC, btnU, btnD, btnL, btnR,
                   output [3:0] an_start, output [6:0]seg_start, output reg password = 0,
                   output [6:0] an3a_final, an2a_final, an1a_final, an0a_final);

    wire [1:0] seg_pointer; 
    wire anode0, anode1, anode2, anode3;
    wire [6:0] seg_tens, seg_ones, seg_random_combi, seg_lives, an3a, an2a, an1a, an0a;
    wire [3:0] an_random_combi;
    reg [1:0] counter = 0;
    reg [3:0] scroll_disp;
    reg [6:0] seg_disp;
    reg [3:0] tries = 0;
    reg fix = 0;
    
    assign an_start[3:0] = scroll_disp[3:0];
    assign seg_start[6:0] = seg_disp[6:0];

    
    
    
    runman_LR LR(MID_CLK, btnL, btnR, hi_done, seg_pointer[1:0]);
    anode_runman run(MID_CLK, seg_pointer[1:0], anode0, anode1, anode2, anode3);
    
    //special 7 hz
    change_letter_runman an3A(MID_CLK, SPECIAL_CLK, btnU, btnD, hi_done, password, anode3, an3a[6:0], an3a_final[6:0]);
    change_letter_runman an2A(MID_CLK, SPECIAL_CLK, btnU, btnD, hi_done, password, anode2, an2a[6:0], an2a_final[6:0]);
    change_letter_runman an1A(MID_CLK, SPECIAL_CLK, btnU, btnD, hi_done, password, anode1, an1a[6:0], an1a_final[6:0]);
    change_letter_runman an0A(MID_CLK, SPECIAL_CLK, btnU, btnD, hi_done, password, anode0, an0a[6:0], an0a_final[6:0]);
    
    always @(posedge MID_CLK) begin
        counter <=  counter + 1;  
        case(counter)
            0: begin    // anode0
                
                scroll_disp[3:0] <= 4'b1110;
                seg_disp[6:0] <= an0a[6:0];
                end
            1: begin    //anode1
                
                scroll_disp[3:0] <= 4'b1101;
                seg_disp[6:0] <= an1a[6:0];
                end
            2: begin    //L
                    
                scroll_disp[3:0] <= 4'b1011;
                seg_disp[6:0] <= an2a[6:0];
                end
            3: begin    //live np.
                        
                scroll_disp[3:0] <= 4'b0111;
                seg_disp[6:0] <= an3a[6:0];
                end              
            endcase   
            
        if (hi_done) begin
            if (btnC & ~fix) begin
                password <= 1;
                fix <= 1;
            end
        end
        else begin
            password <= 0;
            fix <= 0;
        end
                
                
    end


endmodule
