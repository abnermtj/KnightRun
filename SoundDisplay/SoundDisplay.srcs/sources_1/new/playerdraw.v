`timescale 1ns / 1ps

module draw(
    input [6:0] playerx,
    input [5:0] playery,
    input [6:0] pixelx,
    input [5:0] pixely,
    input CLOCK100MHZ,
    input ANIMATIONCLOCK,
    input [4:0]charstate, // state of character, updated in platformer module
    output reg [15:0] oled,
    input [12:0] pixeldata,
    input [4:0]enemystate,
    input defeat,
    input victory
    );
    /* Sketched up Logic,
       Background is draw first
       ground is drawn moving at a constant speed. looping 8 frames.
       then the player is draw over it
       Enemy is draw last, with attack animation as a single sprite
        
       Used sprite sheet for animation. and have a referece pixel to mark which sprite to use in each state
       Pixel P is considered transparaent and can be overwritten
    */
     // This color is treated as transparatent
     parameter P ={5'd16,6'd18,5'd26}; 
     
     // END SCREENS
     wire [15:0] winoled, defeatoled;
     Victory Vic(pixeldata,winoled);
     Defeat Def(pixeldata,defeatoled);
     
    // BACKGROUND
    wire [15:0] bgoled;
    treesbg back(pixeldata,bgoled);
    
    // GROUND
    wire groundclock;            
    wire [15:0] groundoled;                                                
    clk_divider sclk(CLOCK100MHZ, 1428570, groundclock); //35hz
    ground grd(pixeldata,pixely,groundclock,groundoled);
    
    // PLAYER
    wire [15:0] char_run_oled, char_jump_oled;
    charrun crun(pixeldata,pixelx,pixely,charstate[2:0],char_run_oled);  /*10hz, charstate that is not running produced don't care*/ 
    charjump cjump(pixeldata,pixelx,pixely,playery,char_jump_oled);
    
                                                                  
    parameter RUNNING = 0, JUMPING = 8, ROLLING = 16;              
    parameter ENEMYRUNNING = 0,STOMPING =12, IMMAFIRINGMYLASER= 18;

    // ENEMY
    wire [15:0] enemy_run_oled,enemy_runduringlaser_oled, enemy_runlaser_oled, enemy_laser_oled, enemy_stomp_oled,enemy_stomprock_oled;
    enemyrun erun(pixeldata,pixelx,pixely,enemystate[3:0],enemy_run_oled);
    enemyrun erunlaser(pixeldata,pixelx,pixely,enemystate-IMMAFIRINGMYLASER,enemy_runduringlaser_oled);
    enemylaser elaser(pixeldata,pixelx,pixely,enemystate-IMMAFIRINGMYLASER,enemy_laser_oled);
    enemystomp estomp(pixeldata,pixelx,pixely,enemystate-STOMPING,enemy_stomp_oled);
    reg [18:0] stomprock_countdown = 0;  // goal is to change 96 times in 3 
    reg [6:0] stomprock_state = 0; // counter for how many pixels of rocks shown for stomp attack
    enemystomprock estomprock(pixeldata,pixelx,pixely,stomprock_state,enemy_stomprock_oled);
    
  
    always @ (posedge CLOCK100MHZ) begin
          if (defeat == 0 && victory == 0) begin
              // BACKGROUND
              oled = bgoled; 
              
              // GROUND
              if (pixely >= 51) // 52 had a glaring pixel imperfection
                oled=groundoled;
              // PLAYER
              if (pixelx >= 73 && pixelx <=89 && pixely<=51)begin
                    if(charstate >= RUNNING && charstate <= RUNNING +7)
                        oled=char_run_oled;
                    else if(charstate >= JUMPING && charstate <= JUMPING +7)
                        oled=char_jump_oled;
               end
              
              // ENEMY IS DRAWN HERE
              if (pixelx <=16 && pixely<=51) begin
                    if (enemystate>=ENEMYRUNNING && enemystate <= ENEMYRUNNING +11)
                        oled = enemy_run_oled;
                    else if (enemystate>=IMMAFIRINGMYLASER && enemystate <=IMMAFIRINGMYLASER+11)
                        oled = enemy_runduringlaser_oled;
              end
              
               
              // Replace transparent color with background
               if (oled == {5'd16,6'd18,5'd26})
                             oled = bgoled ;
                             
              // Enemy attacks, background also overwrites P
              if (enemystate >= IMMAFIRINGMYLASER && enemystate <= IMMAFIRINGMYLASER+11) begin
                    oled = (enemy_laser_oled == P) ? oled : enemy_laser_oled;
              end
              else if (enemystate >= STOMPING && enemystate <= STOMPING + 5) begin
                    oled = (enemy_stomprock_oled == P) ? ((enemy_stomp_oled == P) ? oled : enemy_stomp_oled) : enemy_stomprock_oled; // rocks and stomp animation separate
                    if (enemystate >= STOMPING +3) begin 
                        stomprock_countdown = stomprock_countdown +1;
                        if (stomprock_countdown == 0) 
                            stomprock_state = stomprock_state+ 1;
                    end
              end
              // add if stomping == 0 then reset  the stomp rock state
              if (enemystate == STOMPING) begin
                stomprock_state = 0;
              end
          end
          else begin
                // End screens
                if (defeat == 1)
                   oled = defeatoled;
                else if (victory == 1)
                   oled = winoled;   
          end
    end
endmodule
