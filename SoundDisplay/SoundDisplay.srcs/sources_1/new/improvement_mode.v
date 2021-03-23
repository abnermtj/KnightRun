module tictac(
    input btnU, btnD, btnL, btnR, btnC, // debounce these in the module that instantiates it
    input [6:0] x,
    input [5:0] y,
    input CLOCK, //381hz expected
    output reg [15:0] oled,
    input [12:0]pixel_index
 // output done;
 /*,output [15:0] led*/
    );
    // FEATURES TIC TAC TOE
    // WINNING row/col/diag breathes
    // BACKGROUND 
    // RGB SELECTION SCREEN
    // GAMESTATE SAVED GOING INTO OTHER MODES
    // TO DO AI TO PLAY AGAINST
    integer realx, realy;

    always @(x,y) begin   // convertion to integer
        realx = x;
        realy = y;
    end
 
    //wire[15:0] background;
    //blackback bg(pixel_index, background);  // deleted to save memory in basys3
    
    wire [15:0] rgbsig;
    wire rgbCLOCK, breatheCLOCK;
    clk_divider slowgb(CLOCK, 3, rgbCLOCK); 
    clk_divider breatheclk(CLOCK,11 , breatheCLOCK); 
    rgb color(rgbCLOCK, rgbsig);  // RBG effect

    reg [1:0] board [8:0];  // saves the currently placed peices , 0 means nothing, 1 means 'O', 2 means 'X' 
                            // btnC to empty the board on game over
    reg [3:0] ptr = 0;      // 0 3 6 
                            // 1 4 7 
                            // 2 5 8 
     
    wire [1:0] win; // 1 - O won 2 - X won 0 - no winner
    wire done;   
    reg ptrstate = 0;   // used to flip between circle and cross
    wire stuck;
    wire [3:0] winstate;
    
    wire [15:0] breathled;
    // breathing effect
    breathing breate(breatheCLOCK, breathled);
    // win condition check
    gamestatus status(done, win, stuck,winstate,
    board[0],board[1],
    board[2],board[3],
    board[4],board[5],
    board[6],board[7],
    board[8]);
 
    initial begin   // start with empty board
          board[0] = 0;
          board[1] = 0;
          board[2] = 0;
          board[3] = 0;
          board[4] = 0;
          board[5] = 0;
          board[6] = 0;
          board[7] = 0;
          board[8] = 0;
    end
    
    always @ (posedge btnC) begin
        if (done == 1) begin // reset completed game
            board[0] <= 0;
            board[1] <= 0;
            board[2] <= 0;
            board[3] <= 0;
            board[4] <= 0;
            board[5] <= 0;
            board[6] <= 0;
            board[7] <= 0;
            board[8] <= 0;
        end
        else if (board[ptr] == 0) begin  // only works on empty cells ie. no overwriting
            board[ptr] = ptrstate+1;     // sets the pointer to either 'O' or 'X' ,ptr state needs to add 1
            ptrstate = ~ptrstate;
        end
    end

    always @ (posedge CLOCK) begin  // controlling selected box
        ptr <= (btnD && ptr%3 != 2)? ptr+1 :
               (btnU && ptr%3 != 0) ? ptr-1:
               (btnL && ptr > 2) ? ptr-3:
               (btnR && ptr < 6) ? ptr+3:
               ptr;
    end
////////////////////////////DEBUG/////////////////////////
 //  assign led[8:0] = 1 << ptr;// to check ptr
 //  assign led [12:9] = {done,win,stuck}; // checking game status
 /////////////////////////////////////////////////////////
 
   always @(*) begin
       if (realx == 31 || realx == 63 || realy == 21 || realy == 42) // horizontal stripes and vertical stripes to create boxes
            oled = 16'b1111111111111111;
       else if (realx > 0 && realx < 31  && realy > 0 && realy < 20) begin // topleft
            
            if (board[0] == 1 && (((realy-10)*(realy-10) + (realx-15)*(realx-15)) < 90 )) begin //O
                if (win !=0 && ( winstate == 0 || winstate == 3 || winstate == 6)) 
                            oled = breathled;
                 else
                 oled = 16'b1111111111111111;             
            end
            else if (board[0] == 2 && (realy == realx - 5 || realy == -realx +26)) begin// X 
                if (win !=0 && ( winstate == 0 || winstate == 3 || winstate == 6)) 
                            oled = breathled;
                else
                    oled = 16'b1111111111111111;
            end    
            else begin// empty
                oled = 0; // backgroundb4
            end    
       end
       else if (realx > 0 && realx < 31  && realy > 22 && realy < 41) begin // middlleleft
                 
                 if (board[1] == 1 && (((realy-31)*(realy-31) + (realx-15)*(realx-15)) < 90 )) begin //O
                     if (win !=0 && ( winstate == 0 || winstate == 4)) 
                                        oled = breathled;
                     else
                        oled = 16'b1111111111111111;     
                             
                 end
                 else if (board[1] == 2 && (realy == realx + 16 || realy == -realx +47)) begin// X
                     if (win !=0 && ( winstate == 0 || winstate == 4)) 
                          oled = breathled;
                      else
                        oled = 16'b1111111111111111;
                 end    
                 else begin// empty
                     oled = 0; // backgroundb4
                 end    
       end
       else if (realx > 0 && realx < 31  && realy > 43 && realy < 63) begin // bottomleft
                 
                 if (board[2] == 1 && (((realy-53)*(realy-53) + (realx-15)*(realx-15)) < 90 )) begin //O
                     if (win !=0 && ( winstate == 0 || winstate == 5 || winstate == 7)) 
                                      oled = breathled;
                      else
                         oled = 16'b1111111111111111;             
                 end
                 else if (board[2] == 2 && (realy == realx + 37 || realy == -realx +68)) begin// X
                 if (win !=0 && ( winstate == 0 || winstate == 5 || winstate == 7)) 
                      oled = breathled;    
                  else
                      oled = 16'b1111111111111111;
                 end    
                 else begin// empty
                     oled = 0; //bbackgroundb4
                 end    
       end
       else if (realx > 32 && realx < 62  && realy > 0 && realy < 20) begin // middletop
                
                if (board[3] == 1 && (((realy-10)*(realy-10) + (realx-48)*(realx-48)) < 90 )) begin //O
                     if (win !=0 && ( winstate == 1 || winstate == 3 )) 
                                     oled = breathled;
                     else
                                   oled = 16'b1111111111111111;             
                 end
                 else if (board[3] == 2 && (realy == realx - 36 || realy == -realx +57)) begin// X
                     if (win !=0 && ( winstate == 1 || winstate == 3 )) 
                          oled = breathled;
                     else
                     
                     oled = 16'b1111111111111111;
                 end    
                 else begin// empty
                     oled = 0; //background b4
                 end    
       end
       else if (realx > 32 && realx < 62  && realy > 22 && realy < 41) begin // middlemiddle
                 
                  if (board[4] == 1 && (((realy-31)*(realy-31) + (realx-48)*(realx-48)) < 90 )) begin //O
                     if (win !=0 && ( winstate == 1 || winstate == 4 || winstate == 6 || winstate == 7)) 
                                        oled = breathled;
                                  else 
                                  oled = 16'b1111111111111111;             
                 end
                 else if (board[4] == 2 && (realy == realx -15 || realy == -realx +78)) begin// X
                     if (win !=0 && ( winstate == 1 || winstate == 4 || winstate == 6 || winstate == 7)) 
                                        oled = breathled;
                                  else 
                                  oled = 16'b1111111111111111;
                 end    
                 else begin// empty
                     oled = 0; // bacground b4
                 end    
       end
       else if (realx > 32 && realx < 62  && realy > 43 && realy < 63) begin // middlebottom
                
                           if (board[5] == 1 && (((realy-53)*(realy-53) + (realx-48)*(realx-48)) < 90 )) begin //O
                     if (win !=0 && ( winstate == 1 || winstate == 5)) 
                                                        oled = breathled;
                                                 else 
                                                 oled = 16'b1111111111111111;             
                 end
                 else if (board[5] == 2 && (realy == realx + 6 || realy == -realx +99)) begin// X
                     if (win !=0 && ( winstate == 1 || winstate == 5)) 
                                               oled = breathled;
                                        else 
                                        oled = 16'b1111111111111111;
                 end    
                 else begin// empty
                     oled = 0; //background b4
                 end        
       end
       else if (realx > 64 && realx < 95  && y > 0 && y < 20) begin // topright
                 
                  if (board[6] == 1 && (((y-10)*(y-10) + (realx-79)*(realx-79)) < 90 )) begin //O
                     
                     if (win !=0 && ( winstate == 2 || winstate == 3 || winstate == 7)) 
                                        oled = breathled;
                                        else
                                        oled = 16'b1111111111111111;             
                 end
                 else if (board[6] == 2 && (realy == realx - 71 || realy == -realx + 90 )) begin// X
                     
                     if (win !=0 && ( winstate == 2 || winstate == 3 || winstate == 7)) 
                                       oled = breathled;
                                       else
                                       oled = 16'b1111111111111111;
                 end    
                 else begin// empty
                     oled = 0; //background b4
                 end    
       end
       else if (realx > 64 && realx < 95  && y > 22 && y < 41) begin // middleright
                 
                 if (board[7] == 1 && (((y-31)*(y-31) + (realx-79)*(realx-79)) < 90 )) begin //O
                     if (win !=0 && ( winstate == 2 || winstate == 4)) 
                                       oled = breathled;
                                       else
                                       oled = 16'b1111111111111111;             
                 end
                 else if (board[7] == 2 && (realy == realx - 47|| realy == -realx +111)) begin// X
                     if (win !=0 && ( winstate == 2 || winstate == 4)) 
                                       oled = breathled;
                                       else
                                       oled = 16'b1111111111111111;
                 end    
                 else begin// empty
                     oled = 0; //background b4
                 end    
       end
       else if (realx > 64 && realx < 95  && y > 43 && y < 63) begin // bottomright
                
                  if (board[8] == 1 && (((y-53)*(y-53) + (realx-79)*(realx-79)) < 90 )) begin //O
                     if (win !=0 && ( winstate == 2 || winstate == 5 || winstate == 6)) 
                                        oled = breathled;
                                        else
                                        oled = 16'b1111111111111111;             
                 end
                 else if (board[8] == 2 && (realy == realx - 26|| realy == -realx +132)) begin// X
                     if (win !=0 && ( winstate == 2 || winstate == 5 || winstate == 6)) 
                                        oled = breathled;
                                        else
                                        oled = 16'b1111111111111111;
                 end    
                 else begin// empty
                     oled = 0; //background b4
                 end    
       end 
       
       // this outline the current selction box      
       else if( ptr == 0 &&((realx < 31 && realy == 0) ||  // TOP
           (realx < 31 && realy == 20) || // BOTTOM
           (realy < 21 && realx == 0) ||  // LEFT
           (realy < 21 && realx == 29)))   // RIGHT
             oled = rgbsig; 
       else if(ptr == 1 &&((realx < 31 && realy == 22) ||  // TOP
           (realx < 31 && realy == 41) || // BOTTOM
           (realy >= 22 && realy < 42 && realx == 0) ||  // LEFT
           (realy >= 22 && realy < 42 && realx == 29)))   // RIGHT
            oled = rgbsig; 
       else if(ptr == 2 &&((realx < 31 && realy == 43) ||  // TOP
           (realx < 31 && realy == 63) || // BOTTOM
           (realy >= 43  && realx == 0) ||  // LEFT
           (realy >= 43  && realx == 29)))   // RIGHT
            oled = rgbsig; 
       else if(ptr == 3 &&((realx >= 32 && realx < 63 && realy == 0) ||  // TOP
           (realx >= 32 && realx < 63 && realy == 20) || // BOTTOM
           (realy < 21 && realx == 32) ||  // LEFT
           (realy < 21 && realx == 62)))   // RIGHT
            oled = rgbsig; 
       else if(ptr == 4 &&((realx >= 32 && realx < 63 && realy == 22) ||  // TOP
           (realx >= 32 && realx < 63 && realy == 41) || // BOTTOM
           (realy >= 22 && realy < 42 && realx ==32) ||  // LEFT
           (realy >= 22 && realy < 42 && realx == 62)))   // RIGHT
            oled = rgbsig; 
       else if(ptr == 5 &&((realx >= 32 && realx < 63 && realy == 43) ||  // TOP
           (realx >= 32 && realx < 63 && realy == 63) || // BOTTOM
           (realy >= 43 && realx == 32) ||  // LEFT
           (realy >= 43 && realx == 62)))   // RIGHT
            oled = rgbsig; 
       else if(ptr == 6 &&((realx >= 64 && realy == 0) ||  // TOP
           (realx >= 64 && realy == 20) || // BOTTOM
           (realy < 21 && realx == 64) ||  // LEFT
           (realy < 21 && realx == 95)))   // RIGHT
            oled = rgbsig; 
       else if(ptr == 7 &&((realx >= 64 && realy == 22) ||  // TOP
           (realx >= 64 && realy == 41) || // BOTTOM
           (realy >= 22 && realy < 42 && realx == 64) ||  // LEFT
           (realy >= 22 && realy < 42 && realx == 95)))   // RIGHT
            oled = rgbsig; 
       else if(ptr == 8 &&((realx >= 64  && realy == 43) ||  // TOP
           (realx >= 64  && realy == 63) || // BOTTOM
           (realy >= 43  && realx == 64) ||  // LEFT
           (realy >= 43  && realx == 95)))   // RIGHT
            oled = rgbsig;  
       else
             oled = 0; //background b4
      end
endmodule
