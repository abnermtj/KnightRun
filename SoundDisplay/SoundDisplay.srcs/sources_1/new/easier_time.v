`timescale 1ns / 1ps

module easier_time(input MID_CLK, hello_done, input [31:0] original_n, input [3:0] mic_process, output reg [31:0] n_val = 0);

    always@(posedge MID_CLK) begin
        if(hello_done) begin
            if (mic_process < 4)
                n_val <= original_n;   
           
            else if (mic_process > 3 && mic_process < 9) // Case 4 - 8 - 4x slow
                n_val <= original_n + (original_n / 4);   

            else if (mic_process > 8 && mic_process < 12) // Cases 9 - 11 3x slow
                n_val <= original_n + (original_n / 3);          

            else if (mic_process > 11) // Cases 12-15 - 2x slow
                n_val <= original_n + (original_n / 2);   
 

        end
        else
            n_val <= original_n;
    end

endmodule
