`timescale 1ns / 1ps


module determine_hint(input MID_CLOCK, high_hz, med_hz, slow_hz, welcome_done, input [11:0]mic_process, output reg state = 0);

reg low = 0, med = 0, high = 0;
reg [3:0] counter_low = 0, counter_med = 0, counter_high = 0;
reg data0 = 0, data1 = 0, data2 = 0;

    always @(posedge MID_CLOCK) begin
    if(welcome_done) begin
        state <= (data0 | data1 | data2) ? 1 : 0;
        if (mic_process > 2583 && mic_process < 3120)begin // Case 4 - 8 -use fastclock
        low <= 1;
        med <= 0;
        high <= 0;
        end
        else if (mic_process > 3119 && mic_process < 3122)begin // Cases 9 - 11 - use medclock
        low <= 0;
        med <= 1;
        high <= 0;        
        end
        else if (mic_process > 3121)begin // Cases 12-15 - use slowclock
        low <= 0;
        med <= 0;
        high <= 1;        
        end
        else begin    // Cases 0 - 3 
        low <= 0;
        med <= 0;
        high <= 0;  
        end
    end 
    else begin
    low <= 0;
    med <= 0;
    high <= 0;
    state <= 0;
    end
    end
    
    always @(posedge high_hz) begin
        if (low) begin
            if(counter_low != 4'b1010) begin
                counter_low <= counter_low + 1;
                data0 <= 1;
            end
            else
                data0 <= 0;
        end
        else begin
            counter_low <= 0;
            data0 <= 0;
        end
    end  

    always @(posedge med_hz) begin
        if (med) begin
            if(counter_med != 4'b1010) begin
                counter_med <= counter_med + 1;
                data1 <= 1;
            end
            else
                data1 <= 0;
        end
        else begin
            counter_med <= 0;
            data1 <= 0;
        end
    end     
    
    always @(posedge slow_hz) begin
        if (high) begin
            if(counter_high != 4'b1010) begin
                counter_high <= counter_high + 1;
                data2 <= 1;
            end
            else
                data2 <= 0;
        end
        else begin
            counter_high <= 0;
            data2 <= 0;
        end
    end  
    
endmodule
