`timescale 1ns / 1ps

module platformer(
    input CLOCK100MHZ, // 100MHZ expected
    input btnC, btnU, btnD, btnL, btnR,
    input [6:0] x,
    input [5:0] y,
    input [12:0] pixel_index,
    output [15:0] oled,
    //output dist left here display on 7 seg
    output reg [6:0] distleft =100
    );
    /* General coordinates
        ground is at level y = 40, ie 40 pixels below the x axis;
        then player character is static with center around y= 34, and on the right  x = 80;
        the chaser is around y = 30 because it is larger, around x = 20;
    */
    
    reg victory = 0;
    reg defeat = 0;
    reg[6:0] playerx = 80;
    reg[5:0] playery = 30;
    reg[4:0] charstate = 0; 
    reg[4:0] enemystate = 0;
    
    wire animationclock;
    clk_divider animation_clock_mod(CLOCK100MHZ, 3333332, animationclock); 
    draw graphics(playerx,playery,x ,y,CLOCK100MHZ,animationclock,charstate,oled,pixel_index,enemystate,defeat,victory);

    // PLAYER
    parameter RUNNING = 0, JUMPING = 8, ROLLING = 16;
    parameter PRESSED = 1, NOTPRESSED = 0;
    parameter CDMAX= 24'b111111111111111111111111; // Count Down Max used to switch frames
    parameter DISTANCEMAX = 26'b11111111111111111111111111;  //Used to see when to decrease dist left
    
    //ENEMY
    parameter ENEMYRUNNING = 0,STOMPING =12, IMMAFIRINGMYLASER= 18;
    reg [23:0] enemy_runstate_countdown = CDMAX,
               enemy_stompstate_countdown = CDMAX,
               enemy_laserstate_countdown = CDMAX;
               
    wire [1:0] rand;
    rand_num (animationclock, rand);
    wire [4:0] rand_enemy_state;
    assign rand_enemy_state = (rand == 0) ? ENEMYRUNNING : (rand == 1)? STOMPING : IMMAFIRINGMYLASER;
    
    reg [23:0] runstate_countdown = CDMAX,  
               rollstate_countdown = CDMAX,
               jumpstate_countdown = CDMAX;

    reg [25:0] distance_countdown = DISTANCEMAX;

    // FSM TO CONTROL STATE OF PLAYER
    always @ (posedge CLOCK100MHZ) begin // Logic of the game
        if (defeat == 0 && victory ==0) begin
            if (charstate >= RUNNING && (charstate <= RUNNING + 7) && btnU == PRESSED) begin 
                charstate <= JUMPING;
                jumpstate_countdown <= CDMAX;
            end
            else if (charstate >= RUNNING && (charstate <= RUNNING + 7) && btnD == PRESSED)begin  
                charstate <= ROLLING;
                rollstate_countdown <= CDMAX;
            end
             
            else if (charstate >= RUNNING && (charstate <= RUNNING + 7)) begin
                playery <= 30;
                runstate_countdown <= (runstate_countdown == 0) ? CDMAX : runstate_countdown -1;
            end
            if (runstate_countdown == 0) begin
                 charstate <= (charstate == RUNNING + 7)? RUNNING : charstate+1;// This may triger multiple times
            end
           
            else if (charstate >= JUMPING && (charstate <= JUMPING + 7)) begin
                jumpstate_countdown <= (jumpstate_countdown == 0) ? CDMAX : jumpstate_countdown -1;
            end
            if (jumpstate_countdown == 0) begin
                 charstate <= charstate+1;
                 if (charstate >= JUMPING && charstate < JUMPING + 2) begin
                     playery <= playery -5;
                 end
                 else if (charstate == JUMPING + 2) begin
                     playery <= playery -3;
                 end
                 
                 else if (charstate == JUMPING +3) begin
                     playery <= playery - 2;
                 end
                 else if (charstate == JUMPING+4) begin 
                     playery <= playery+1;
                 end
                 else if (charstate == JUMPING+5) begin
                    playery <= playery+3;
                 end
                 else if (charstate == JUMPING+6) begin
                     playery <= playery+4;
                 end
                 else if (charstate == JUMPING + 7) begin
                     playery <= playery + 5;
                     if (charstate == JUMPING+7) begin 
                        charstate <= RUNNING;
                     end
                end
            end
            else if (charstate >= ROLLING && (charstate <= ROLLING + 4)) begin
                rollstate_countdown <= (rollstate_countdown == 0) ? CDMAX : rollstate_countdown -1;
            end
            if (rollstate_countdown == 0) begin
                 charstate <=  charstate+1;
                  if (charstate == ROLLING+4 ) begin 
                                 charstate <= RUNNING;
                  end
            end   
            
            if (charstate >=  ROLLING && charstate <= ROLLING + 4) begin
                playery <= 0; // Ceiling, no skill will touch player
            end
            
            // ENEMY 
            if (enemystate >= ENEMYRUNNING && enemystate<= ENEMYRUNNING+11) begin
                 if (enemystate == ENEMYRUNNING+11)begin
                    enemystate <= rand_enemy_state;
                 end
                else
                  enemy_runstate_countdown <= (enemy_runstate_countdown == 0) ? CDMAX : enemy_runstate_countdown -1;
            end
           else if (enemystate >= STOMPING && enemystate<= STOMPING+5) begin
                 enemy_stompstate_countdown <= (enemy_stompstate_countdown == 0) ? CDMAX : enemy_stompstate_countdown -1;
           end
           else if (enemystate >= IMMAFIRINGMYLASER && enemystate<= IMMAFIRINGMYLASER+11) begin
                  enemy_laserstate_countdown <= (enemy_laserstate_countdown == 0) ? CDMAX : enemy_laserstate_countdown -1;
           end
           
           if (enemy_runstate_countdown == 0) begin
                 enemystate <= (enemystate == ENEMYRUNNING + 11)? ENEMYRUNNING : enemystate+1;
           end
           if (enemy_laserstate_countdown == 0) begin
                 enemystate <= (enemystate == IMMAFIRINGMYLASER + 11)? IMMAFIRINGMYLASER : enemystate+1;
                 if(enemystate == IMMAFIRINGMYLASER + 11)begin
                    enemystate<=rand_enemy_state;
                 end
                    
           end
           if (enemy_stompstate_countdown == 0) begin
                 enemystate <= (enemystate == STOMPING + 5)? STOMPING : enemystate+1;
                 if(enemystate == STOMPING + 5)begin
                    enemystate<=rand_enemy_state;
                 end
           end
           // Victory countdown
           distance_countdown <= (distance_countdown == 0)?  DISTANCEMAX : distance_countdown-1;
           
           if (distance_countdown == 0) 
               distleft <= distleft-1; 
           // COLLISION DETECTION HERE
           if (enemystate == IMMAFIRINGMYLASER+5 && playery == 30 
           || enemystate == IMMAFIRINGMYLASER+7 && playery == 30
           || enemystate == STOMPING+5 && playery == 30) 
                defeat <= 1;   
           
           if (distleft == 1) 
                victory <= 1;
           
      end
      else if ((defeat == 1 || victory == 1) && btnC) begin
            defeat <= 0 ;
            victory <=0 ;
            playery <= 30;
            charstate <= RUNNING;
            enemystate <= ENEMYRUNNING;
            distleft <= 100;
            distance_countdown <= DISTANCEMAX;
            enemy_runstate_countdown <= CDMAX;
       end
   end    
endmodule
    
module rand_num (
        input CLOCK,
        output reg[1:0] num_output = 0);

        reg [6:0] counter = 0;

        always @(posedge CLOCK) begin
            counter <= counter + 1;
            num_output <= counter % 3;
        end
endmodule

