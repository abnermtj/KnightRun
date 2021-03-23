`timescale 1ns / 1ps

module signal_change(input [3:0]seg_display_old, seg_display_new,input [6:0] seg_old, seg_new, input [15:0] led_old, led_new, input status,
                        output [3:0] seg_combo, output [6:0] seg_combination, output [15:0] led_combo);
       
       assign seg_combination[6:0] = (status) ? seg_new[6:0] : seg_old[6:0];                 
       assign seg_combo[3:0] = (status) ? seg_display_new[3:0] : seg_display_old[3:0];
       assign led_combo[15:0] = (status) ? led_new[15:0] : led_old[15:0];

endmodule
