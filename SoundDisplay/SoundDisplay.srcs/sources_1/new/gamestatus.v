`timescale 1ns / 1ps

module gamestatus(
    output done,
    output [1:0] win,
    output reg stuck,
    output reg [3:0] winstate, 
    input [1:0] board0, 
    input [1:0] board1, 
    input [1:0] board2, // 0 3 6
    input [1:0] board3, // 1 4 7
    input [1:0] board4, // 2 5 8
    input [1:0] board5, 
    input [1:0] board6, 
    input [1:0] board7, 
    input [1:0] board8
    );
    
    reg [1:0] winner = 0;
    always @ (*) begin  //  ASYNC 
        // vertical
        if (board0 == board1 && board0 == board2 && board0 != 0)  // |xx
             begin 
             winner= board0;
             winstate = 0;
             end
        else if (board3 == board4 && board3 == board5 && board3 != 0) // x|x
            begin 
            winner= board3;
            winstate = 1;
            end
        else if (board6 == board7 && board6 == board8 && board6 != 0) // |xx
            begin 
            winner= board6;
            winstate = 2;
            end
            
         // horizontal
        else if (board0 == board3 && board0 == board6 && board0 != 0) // top row
            begin 
            winner= board0;
            winstate = 3;
            end
        else if (board1 == board4 && board1 == board7 && board1 != 0) // middle row
            begin 
            winner= board1;
            winstate = 4;
            end
        else if (board2 == board5 && board2 == board8 && board2 != 0) // bottom row
            begin 
            winner= board2;
            winstate = 5;
            end
            
         //diagonal
        else if (board0 == board4 && board0 == board8 && board0 != 0)  // \
            begin 
            winner= board0;
            winstate = 6;
            end
        else if (board2 == board4 && board2 == board6 && board2 != 0) // /
             begin
             winner = board2;
             winstate = 7;
             end
        else if (board0  != 0 && board1 != 0 && board2 != 0 && board3 != 0 // fully filled but not won
          && board4 != 0 && board5 != 0 && board6 != 0 && board7 != 0 && board8 != 0)
              stuck = 1;  
        else 
            winner = 0;
        
    end
    
    assign win = (winner != 0)? winner : 0;
    assign done = (win != 0) || stuck;
endmodule
