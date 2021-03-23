`timescale 1ns / 1ps

module anode_runman(input MID_CLK, input [1:0]seg_pointer, output reg anode0 = 0, output reg anode1 = 0, output reg anode2 = 0, output reg anode3 = 0);

   always@ (posedge MID_CLK) begin
        
       if(seg_pointer == 0)begin // switch anode 0 as active
         anode0 <= 1;
         anode1 <= 0;
         anode2 <= 0; 
         anode3 <= 0;
        end       
       if(seg_pointer == 1) begin // switch anode 1 as active
         anode0 <= 0;
         anode1 <= 1;
         anode2 <= 0;
         anode3 <= 0;
        end
       if(seg_pointer == 2) begin // switch anode 2 as active
          anode0 <= 0;
          anode1 <= 0;
          anode2 <= 1;
          anode3 <= 0;
         end
       if(seg_pointer == 3) begin // switch anode 3 as active
           anode0 <= 0;
           anode1 <= 0;
           anode2 <= 0;
           anode3 <= 1;
          end        
   end
endmodule
